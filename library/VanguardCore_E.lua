-- VigenereCipher Module
local VigenereCipher = {}
VigenereCipher.__index = VigenereCipher

function VigenereCipher:new()
    local instance = setmetatable({}, VigenereCipher)
    return instance
end

function VigenereCipher:stringToBytes(str)
    local bytes = {}
    for i = 1, #str do
        table.insert(bytes, string.byte(str, i))
    end
    return bytes
end

function VigenereCipher:bytesToString(bytes)
    local chars = {}
    for i = 1, #bytes do
        table.insert(chars, string.char(bytes[i]))
    end
    return table.concat(chars)
end

function VigenereCipher:bytesToHex(bytes)
    local hex = {}
    for i = 1, #bytes do
        table.insert(hex, string.format("%02x", bytes[i]))
    end
    return table.concat(hex)
end

function VigenereCipher:hexToBytes(hex)
    local bytes = {}
    for i = 1, #hex, 2 do
        table.insert(bytes, tonumber(hex:sub(i, i+1), 16))
    end
    return bytes
end

function VigenereCipher:vigenereEncryptBytes(bytes, key)
    key = key:upper()
    local keyBytes = self:stringToBytes(key)
    local encryptedBytes = {}
    for i = 1, #bytes do
        local byte = bytes[i]
        local keyByte = keyBytes[(i-1) % #keyBytes + 1]
        table.insert(encryptedBytes, (byte + keyByte) % 256)
    end
    return encryptedBytes
end

function VigenereCipher:vigenereDecryptBytes(bytes, key)
    key = key:upper()
    local keyBytes = self:stringToBytes(key)
    local decryptedBytes = {}
    for i = 1, #bytes do
        local byte = bytes[i]
        local keyByte = keyBytes[(i-1) % #keyBytes + 1]
        table.insert(decryptedBytes, (byte - keyByte + 256) % 256)
    end
    return decryptedBytes
end

return VigenereCipher
