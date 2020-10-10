------------------------------------------------------------------------------
-- Lua INI tests
-- Sledmine
-- Tests for lua ini functionality
------------------------------------------------------------------------------
local lu = require "luaunit"
local ini = require "lua-ini"

testLuaIni = {}

function testLuaIni:setUp()
    self.decoded = {
        testSection = {
            testNumber = 10,
            testString = "Look at me",
            testBoolean = true
        },
        testSection2 = {
            testNumber = 35,
            testString = "Another string",
            testBoolean = false
        }
    }
    self.encoded = [[
[testSection2]
testNumber=35
testBoolean=false
testString=Another string

[testSection]
testNumber=10
testBoolean=true
testString=Look at me

]]
end

-- Test correct file decoding
function testLuaIni:testDecode()
    local testValue = ini.decode(self.encoded)
    lu.assertEquals(testValue, self.decoded)
end

-- Test correct file encoding
function testLuaIni:testEncode()
    local testValue = ini.encode(self.decoded)
    lu.assertEquals(testValue, self.encoded)
end

local function runTests()
    local runner = lu.LuaUnit.new()
    runner:runSuite()
end

if (not arg) then
    return runTests
else
    runTests()
end
