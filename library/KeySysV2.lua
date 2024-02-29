local Alphabet = {}
local Indexes = {}

for Index = 65, 90 do
	table.insert(Alphabet, Index)
end

for Index = 97, 122 do
	table.insert(Alphabet, Index)
end

for Index = 48, 57 do
	table.insert(Alphabet, Index)
end

table.insert(Alphabet, 43)
table.insert(Alphabet, 47)

for Index, Character in ipairs(Alphabet) do
	Indexes[Character] = Index
end

local bit32_band = bit32.band
local bit32_bxor = bit32.bxor
local bit32_lshift = bit32.lshift
local bit32_rshift = bit32.rshift

local sha2_K_lo, sha2_K_hi, sha2_H_lo, sha2_H_hi = {}, {}, {}, {}
local sha2_H_ext256 = {
	[224] = {},
	[256] = sha2_H_hi,
}

local sha2_H_ext512_lo, sha2_H_ext512_hi = {
	[384] = {},
	[512] = sha2_H_lo,
}, {
	[384] = {},
	[512] = sha2_H_hi,
}

local HEX64, XOR64A5
local common_W = {}
local K_lo_modulo, hi_factor = 4294967296, 0

local TWO_POW_NEG_56 = 2 ^ -56
local TWO_POW_NEG_17 = 2 ^ -17

local TWO_POW_24 = 2 ^ 24
local TWO_POW_40 = 2 ^ 40

local TWO56_POW_7 = 256 ^ 7

local function sha512_feed_128(H_lo, H_hi, str, offs, size)
	-- offs >= 0, size >= 0, size is multiple of 128
	-- W1_hi, W1_lo, W2_hi, W2_lo, ...   Wk_hi = W[2*k-1], Wk_lo = W[2*k]
	local W, K_lo, K_hi = common_W, sha2_K_lo, sha2_K_hi
	local h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo =
		H_lo[1], H_lo[2], H_lo[3], H_lo[4], H_lo[5], H_lo[6], H_lo[7], H_lo[8]
	local h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi =
		H_hi[1], H_hi[2], H_hi[3], H_hi[4], H_hi[5], H_hi[6], H_hi[7], H_hi[8]
	for pos = offs, offs + size - 1, 128 do
		for j = 1, 16 * 2 do
			pos = pos + 4
			local a, b, c, d = string.byte(str, pos - 3, pos)
			W[j] = ((a * 256 + b) * 256 + c) * 256 + d
		end

		for jj = 34, 160, 2 do
			local a_lo, a_hi, b_lo, b_hi = W[jj - 30], W[jj - 31], W[jj - 4], W[jj - 5]
			local tmp1 = bit32_bxor(
				bit32_rshift(a_lo, 1) + bit32_lshift(a_hi, 31),
				bit32_rshift(a_lo, 8) + bit32_lshift(a_hi, 24),
				bit32_rshift(a_lo, 7) + bit32_lshift(a_hi, 25)
			) % 4294967296 + bit32_bxor(
				bit32_rshift(b_lo, 19) + bit32_lshift(b_hi, 13),
				bit32_lshift(b_lo, 3) + bit32_rshift(b_hi, 29),
				bit32_rshift(b_lo, 6) + bit32_lshift(b_hi, 26)
			) % 4294967296 + W[jj - 14] + W[jj - 32]

			local tmp2 = tmp1 % 4294967296
			W[jj - 1] = bit32_bxor(
				bit32_rshift(a_hi, 1) + bit32_lshift(a_lo, 31),
				bit32_rshift(a_hi, 8) + bit32_lshift(a_lo, 24),
				bit32_rshift(a_hi, 7)
			) + bit32_bxor(
				bit32_rshift(b_hi, 19) + bit32_lshift(b_lo, 13),
				bit32_lshift(b_hi, 3) + bit32_rshift(b_lo, 29),
				bit32_rshift(b_hi, 6)
			) + W[jj - 15] + W[jj - 33] + (tmp1 - tmp2) / 4294967296

			W[jj] = tmp2
		end

		local a_lo, b_lo, c_lo, d_lo, e_lo, f_lo, g_lo, h_lo = h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo
		local a_hi, b_hi, c_hi, d_hi, e_hi, f_hi, g_hi, h_hi = h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi
		for j = 1, 80 do
			local jj = 2 * j
			local tmp1 = bit32_bxor(
				bit32_rshift(e_lo, 14) + bit32_lshift(e_hi, 18),
				bit32_rshift(e_lo, 18) + bit32_lshift(e_hi, 14),
				bit32_lshift(e_lo, 23) + bit32_rshift(e_hi, 9)
			) % 4294967296 + (bit32_band(e_lo, f_lo) + bit32_band(-1 - e_lo, g_lo)) % 4294967296 + h_lo + K_lo[j] + W[jj]

			local z_lo = tmp1 % 4294967296
			local z_hi = bit32_bxor(
				bit32_rshift(e_hi, 14) + bit32_lshift(e_lo, 18),
				bit32_rshift(e_hi, 18) + bit32_lshift(e_lo, 14),
				bit32_lshift(e_hi, 23) + bit32_rshift(e_lo, 9)
			) + bit32_band(e_hi, f_hi) + bit32_band(-1 - e_hi, g_hi) + h_hi + K_hi[j] + W[jj - 1] + (tmp1 - z_lo) / 4294967296

			h_lo = g_lo
			h_hi = g_hi
			g_lo = f_lo
			g_hi = f_hi
			f_lo = e_lo
			f_hi = e_hi
			tmp1 = z_lo + d_lo
			e_lo = tmp1 % 4294967296
			e_hi = z_hi + d_hi + (tmp1 - e_lo) / 4294967296
			d_lo = c_lo
			d_hi = c_hi
			c_lo = b_lo
			c_hi = b_hi
			b_lo = a_lo
			b_hi = a_hi
			tmp1 = z_lo
				+ (bit32_band(d_lo, c_lo) + bit32_band(b_lo, bit32_bxor(d_lo, c_lo))) % 4294967296
				+ bit32_bxor(
						bit32_rshift(b_lo, 28) + bit32_lshift(b_hi, 4),
						bit32_lshift(b_lo, 30) + bit32_rshift(b_hi, 2),
						bit32_lshift(b_lo, 25) + bit32_rshift(b_hi, 7)
					)
					% 4294967296
			a_lo = tmp1 % 4294967296
			a_hi = z_hi
				+ (bit32_band(d_hi, c_hi) + bit32_band(b_hi, bit32_bxor(d_hi, c_hi)))
				+ bit32_bxor(
					bit32_rshift(b_hi, 28) + bit32_lshift(b_lo, 4),
					bit32_lshift(b_hi, 30) + bit32_rshift(b_lo, 2),
					bit32_lshift(b_hi, 25) + bit32_rshift(b_lo, 7)
				)
				+ (tmp1 - a_lo) / 4294967296
		end

		a_lo = h1_lo + a_lo
		h1_lo = a_lo % 4294967296
		h1_hi = (h1_hi + a_hi + (a_lo - h1_lo) / 4294967296) % 4294967296
		a_lo = h2_lo + b_lo
		h2_lo = a_lo % 4294967296
		h2_hi = (h2_hi + b_hi + (a_lo - h2_lo) / 4294967296) % 4294967296
		a_lo = h3_lo + c_lo
		h3_lo = a_lo % 4294967296
		h3_hi = (h3_hi + c_hi + (a_lo - h3_lo) / 4294967296) % 4294967296
		a_lo = h4_lo + d_lo
		h4_lo = a_lo % 4294967296
		h4_hi = (h4_hi + d_hi + (a_lo - h4_lo) / 4294967296) % 4294967296
		a_lo = h5_lo + e_lo
		h5_lo = a_lo % 4294967296
		h5_hi = (h5_hi + e_hi + (a_lo - h5_lo) / 4294967296) % 4294967296
		a_lo = h6_lo + f_lo
		h6_lo = a_lo % 4294967296
		h6_hi = (h6_hi + f_hi + (a_lo - h6_lo) / 4294967296) % 4294967296
		a_lo = h7_lo + g_lo
		h7_lo = a_lo % 4294967296
		h7_hi = (h7_hi + g_hi + (a_lo - h7_lo) / 4294967296) % 4294967296
		a_lo = h8_lo + h_lo
		h8_lo = a_lo % 4294967296
		h8_hi = (h8_hi + h_hi + (a_lo - h8_lo) / 4294967296) % 4294967296
	end

	H_lo[1], H_lo[2], H_lo[3], H_lo[4], H_lo[5], H_lo[6], H_lo[7], H_lo[8] =
		h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo
	H_hi[1], H_hi[2], H_hi[3], H_hi[4], H_hi[5], H_hi[6], H_hi[7], H_hi[8] =
		h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi
end

do
	local function mul(src1, src2, factor, result_length)
		local result, carry, value, weight = table.create(result_length), 0, 0, 1
		for j = 1, result_length do
			for k = math.max(1, j + 1 - #src2), math.min(j, #src1) do
				carry = carry + factor * src1[k] * src2[j + 1 - k]
			end

			local digit = carry % TWO_POW_24
			result[j] = math.floor(digit)
			carry = (carry - digit) / TWO_POW_24
			value = value + digit * weight
			weight = weight * TWO_POW_24
		end

		return result, value
	end

	local idx, step, p, one, sqrt_hi, sqrt_lo = 0, { 4, 1, 2, -2, 2 }, 4, { 1 }, sha2_H_hi, sha2_H_lo
	repeat
		p = p + step[p % 6]
		local d = 1
		repeat
			d = d + step[d % 6]
			if d * d > p then
				local root = p ^ (1 / 3)
				local R = root * TWO_POW_40
				R = mul(table.create(1, math.floor(R)), one, 1, 2)
				local _, delta = mul(R, mul(R, R, 1, 4), -1, 4)
				local hi = R[2] % 65536 * 65536 + math.floor(R[1] / 256)
				local lo = R[1] % 256 * 16777216 + math.floor(delta * (TWO_POW_NEG_56 / 3) * root / p)

				if idx < 16 then
					root = math.sqrt(p)
					R = root * TWO_POW_40
					R = mul(table.create(1, math.floor(R)), one, 1, 2)
					_, delta = mul(R, R, -1, 2)
					local hi = R[2] % 65536 * 65536 + math.floor(R[1] / 256)
					local lo = R[1] % 256 * 16777216 + math.floor(delta * TWO_POW_NEG_17 / root)
					local idx = idx % 8 + 1
					sha2_H_ext256[224][idx] = lo
					sqrt_hi[idx], sqrt_lo[idx] = hi, lo + hi * hi_factor
					if idx > 7 then
						sqrt_hi, sqrt_lo = sha2_H_ext512_hi[384], sha2_H_ext512_lo[384]
					end
				end

				idx = idx + 1
				sha2_K_hi[idx], sha2_K_lo[idx] = hi, lo % K_lo_modulo + hi * hi_factor
				break
			end
		until p % d == 0
	until idx > 79
end

for width = 224, 256, 32 do
	local H_lo, H_hi = {}, nil
	if XOR64A5 then
		for j = 1, 8 do
			H_lo[j] = XOR64A5(sha2_H_lo[j])
		end
	else
		H_hi = {}
		for j = 1, 8 do
			H_lo[j] = bit32_bxor(sha2_H_lo[j], 0xA5A5A5A5) % 4294967296
			H_hi[j] = bit32_bxor(sha2_H_hi[j], 0xA5A5A5A5) % 4294967296
		end
	end

	sha512_feed_128(H_lo, H_hi, "SHA-512/" .. tostring(width) .. "\128" .. string.rep("\0", 115) .. "\88", 0, 128)
	sha2_H_ext512_lo[width] = H_lo
	sha2_H_ext512_hi[width] = H_hi
end

local function sha512ext(width, message)
	local length, tail, H_lo, H_hi =
		0,
		"",
		table.pack(table.unpack(sha2_H_ext512_lo[width])),
		not HEX64 and table.pack(table.unpack(sha2_H_ext512_hi[width]))

	local function partial(message_part)
		if message_part then
			local partLength = #message_part
			if tail then
				length = length + partLength
				local offs = 0
				if tail ~= "" and #tail + partLength >= 128 then
					offs = 128 - #tail
					sha512_feed_128(H_lo, H_hi, tail .. string.sub(message_part, 1, offs), 0, 128)
					tail = ""
				end

				local size = partLength - offs
				local size_tail = size % 128
				sha512_feed_128(H_lo, H_hi, message_part, offs, size - size_tail)
				tail = tail .. string.sub(message_part, partLength + 1 - size_tail)
				return partial
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if tail then
				local final_blocks = table.create(3)
				final_blocks[1] = tail
				final_blocks[2] = "\128"
				final_blocks[3] = string.rep("\0", (-17 - length) % 128 + 9)

				tail = nil

				length = length * (8 / TWO56_POW_7)
				for j = 4, 10 do
					length = length % 1 * 256
					final_blocks[j] = string.char(math.floor(length))
				end

				final_blocks = table.concat(final_blocks)
				sha512_feed_128(H_lo, H_hi, final_blocks, 0, #final_blocks)
				local max_reg = math.ceil(width / 64)

				if HEX64 then
					for j = 1, max_reg do
						H_lo[j] = HEX64(H_lo[j])
					end
				else
					for j = 1, max_reg do
						H_lo[j] = string.format("%08x", H_hi[j] % 4294967296)
							.. string.format("%08x", H_lo[j] % 4294967296)
					end

					H_hi = nil
				end

				H_lo = string.sub(table.concat(H_lo, "", 1, max_reg), 1, width / 4)
			end

			return H_lo
		end
	end

	if message then
		return partial(message)()
	else
		return partial
	end
end

local function HexToBinFunction(hh)
	return string.char(tonumber(hh, 16))
end

local block_size_for_HMAC

local BinaryStringMap = {}
for Index = 0, 255 do
	BinaryStringMap[string.format("%02x", Index)] = string.char(Index)
end

local function hmac(hash_func, key, message, AsBinary)
	local block_size = block_size_for_HMAC[hash_func]
	if not block_size then
		error("Unknown hash function", 2)
	end

	local KeyLength = #key
	if KeyLength > block_size then
		key = string.gsub(hash_func(key), "%x%x", HexToBinFunction)
		KeyLength = #key
	end

	local append = hash_func()(string.gsub(key, ".", function(c)
		return string.char(bit32_bxor(string.byte(c), 0x36))
	end) .. string.rep("6", block_size - KeyLength))

	local result

	local function partial(message_part)
		if not message_part then
			result = result
				or hash_func(
					string.gsub(key, ".", function(c)
						return string.char(bit32_bxor(string.byte(c), 0x5c))
					end)
						.. string.rep("\\", block_size - KeyLength)
						.. (string.gsub(append(), "%x%x", HexToBinFunction))
				)

			return result
		elseif result then
			error("Adding more chunks is not allowed after receiving the result", 2)
		else
			append(message_part)
			return partial
		end
	end

	if message then
		local FinalMessage = partial(message)()
		return AsBinary and (string.gsub(FinalMessage, "%x%x", BinaryStringMap)) or FinalMessage
	else
		return partial
	end
end

local HashLibKeySystem = {
	sha512 = function(message)
		return sha512ext(512, message)
	end,
	hmac = hmac,
}

block_size_for_HMAC = {
	[HashLibKeySystem.sha512] = 128,
}

getgenv().setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

local HttpService = game:GetService("HttpService")
local clientId

if identifyexecutor and 'Delta, Android' == identifyexecutor() then
    clientId = gethwid()
else
	clientId = game:GetService("RbxAnalyticsService"):GetClientId()
end

clientId = string.gsub(clientId, "-", "")

local data = HttpService:JSONDecode(
	game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/data.json")
)

local __SECRET_KEY = "981523495843963209324"
local __SECRET_DEFAULT_KEY = "17826318276412637812"
local __SECRET_PREMIUM_KEY = "1297319287472165312"

local function replaceTableToEmpty(tbl)
	local oldTbl = tbl
	local newTbl = setmetatable({}, {
		__index = function(tbl, idx)
			return oldTbl[idx]
		end,
	})
	return newTbl
end

JSONParse = function(path)
	local result = nil
	pcall(function()
		result = HttpService:JSONDecode(game:HttpGet(path))
	end)
	return result
end

LuaParse = function(path)
	return loadstring(game:HttpGet(path))()
end

local hashIP = nil
local function getHwidByType(hwidType)
	if hwidType == nil then
		return clientId
	end

	if type(hwidType) == "string" then
		local hwidType = string.lower(hwidType)
		if hwidType == "ip" then
			if not hashIP then
				hashIP = game:HttpGet("https://api.keyrblx.com/utils/get_ip_hash")
			end
			return hashIP
		elseif hwidType == "clientid" then
			return clientId
		end
	end
end

local APIService = {}
do
	function APIService:urlKeyData(name, key, hwid)
		local key_query = key and "&key=" .. key or ""
		return data.api_url .. "/key/me?name=" .. name .. "&hwid=" .. hwid .. "&verify=true" .. key_query
	end

	function APIService:urlPremiumKeyData(name, key, hwid)
		return data.api_url .. "/premium_key/me?name=" .. name .. "&key=" .. key .. "&hwid=" .. hwid
	end

	function APIService:getKeyURL(name, hwid)
		return data.url_root .. "/getkey/" .. name .. "?hwid=" .. hwid
	end

	function APIService:premiumKeyData(name, key, hwid)
		local data = JSONParse(self:urlPremiumKeyData(name, key, hwid))
		return data
	end

	function APIService:keyData(name, key, hwid)
		return JSONParse(self:urlKeyData(name, key, hwid))
	end

	function APIService:applicationData(name)
		return JSONParse(data.api_url .. "/application/get?name=" .. name)
	end
end

local function debug_print(...)
	if _G.DEBUG_MODE then
		print("DEBUG LOG -> ", ...)
	end
end

local KeyLibrary = {}
do
	KeyLibrary.__index = KeyLibrary

	function KeyLibrary.new(name, options)
		local options = options or {}
		self = setmetatable({}, KeyLibrary)
		self.name = name
		self.authType = options.authType or "clientid"
		return replaceTableToEmpty(self)
	end

	function KeyLibrary:copyGetKeyURL()
		if setclipboard then
			local url = self:getKeyURL()
			setclipboard(url)
		else
			warn("Not supported setclipboard")
		end
	end

	function KeyLibrary:getKeyURL()
		return APIService:getKeyURL(self.name, getHwidByType(self.authType))
	end

	function KeyLibrary:key(key)
		return APIService:keyData(self.name, key, getHwidByType(self.authType))
	end

	function KeyLibrary:premiumKey(key)
		return APIService:premiumKeyData(self.name, key, getHwidByType(self.authType))
	end

	function KeyLibrary:verifyPremiumKey(keyString)
		local hwid = getHwidByType(self.authType)

		local mac_hash_key = HashLibKeySystem.hmac(HashLibKeySystem.sha512, __SECRET_PREMIUM_KEY, keyString .. hwid)

		local result
		pcall(function()
			result = game:HttpGet(
				data.api_url
					.. "/key/premium_key_protected?key="
					.. keyString
					.. "&name="
					.. self.name
					.. "&hwid="
					.. hwid
			)
		end)

		if result == mac_hash_key then
			debug_print("Valid Key")
			return true
		end

		debug_print("Different Key")
		return false
	end

	function KeyLibrary:verifyDefaultKey(keyString)
		local hwid = getHwidByType(self.authType)

		local mac_hash_key = HashLibKeySystem.hmac(HashLibKeySystem.sha512, __SECRET_DEFAULT_KEY, keyString .. hwid)

		local result
		pcall(function()
			result = game:HttpGet(
				data.api_url
					.. "/key/default_key_protected?key="
					.. keyString
					.. "&name="
					.. self.name
					.. "&hwid="
					.. hwid
			)
		end)

		if result == mac_hash_key then
			debug_print("Valid Key")
			return true
		end

		debug_print("Different Key")
		return false
	end

	function KeyLibrary:verifyKey(keyString)
		local hwid = getHwidByType(self.authType)

		mac_hash_key = HashLibKeySystem.hmac(HashLibKeySystem.sha512, __SECRET_KEY, keyString .. hwid)

		local result
		pcall(function()
			result = game:HttpGet(
				data.api_url .. "/key/protected?key=" .. keyString .. "&name=" .. self.name .. "&hwid=" .. hwid
			)
		end)

		if result == mac_hash_key then
			debug_print("Valid Key")
			return true
		end

		debug_print("Different Key")
		return false
	end
end

return KeyLibrary
