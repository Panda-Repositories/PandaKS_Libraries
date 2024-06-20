local VanguardCore = {}

local function stringToBytes(str)
    local bytes = {}
    for i = 1, #str do
        table.insert(bytes, string.byte(str, i))
    end
    return bytes
end

local function bytesToString(bytes)
    local chars = {}
    for i = 1, #bytes do
        table.insert(chars, string.char(bytes[i]))
    end
    return table.concat(chars)
end

local function bytesToHex(bytes)
    local hex = {}
    for i = 1, #bytes do
        table.insert(hex, string.format("%02x", bytes[i]))
    end
    return table.concat(hex)
end

local function hexToBytes(hex)
    local bytes = {}
    for i = 1, #hex, 2 do
        table.insert(bytes, tonumber(hex:sub(i, i+1), 16))
    end
    return bytes
end

local function vigenereEncryptBytes(bytes, key)
    key = key:upper()
    local keyBytes = stringToBytes(key)
    local encryptedBytes = {}
    for i = 1, #bytes do
        local byte = bytes[i]
        local keyByte = keyBytes[(i-1) % #keyBytes + 1]
        table.insert(encryptedBytes, (byte + keyByte) % 256)
    end
    return encryptedBytes
end

local function vigenereDecryptBytes(bytes, key)
    key = key:upper()
    local keyBytes = stringToBytes(key)
    local decryptedBytes = {}
    for i = 1, #bytes do
        local byte = bytes[i]
        local keyByte = keyBytes[(i-1) % #keyBytes + 1]
        table.insert(decryptedBytes, (byte - keyByte + 256) % 256)
    end
    return decryptedBytes
end


function VanguardCore:VTec_Encrypt(plaintext, authentication_key)
    local plaintextBytes = stringToBytes(plaintext)
    local encryptedBytes = vigenereEncryptBytes(plaintextBytes, authentication_key)
    local encryptedText = bytesToHex(encryptedBytes)
    return encryptedText;
end

function VanguardCore:VTec_Decrypt(encryptedText, authentication_key)
    local decryptedBytes = vigenereDecryptBytes(hexToBytes(encryptedText), authentication_key)
    local finalDecryptedText = bytesToString(decryptedBytes)
    return finalDecryptedText;
end


return VanguardCore
