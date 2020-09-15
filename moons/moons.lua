-- cerner_2^5_2020
-- known set of primary to moons
-- https://en.wikipedia.org/wiki/List_of_natural_satellites#Moons_by_primary
moons_by_primary = { mercury={}, venus={}, earth={"moon"},mars={"phobos","deimos"}, 
jupiter={"callisto","io","europa","ganymede"}, saturn={"enceladus","titan"},
uranus={"bianca"},neptune={"triton"},pluto={"charon"},eris={"dysnomia"} }

-- map moon to who it belongs to, unpacking inner arrays, hope no dupes!
primary_by_moon = {}
for i,v in pairs(moons_by_primary) do
    -- unpack table if need be
    if(type(v) == "table") then
        for ik, iv in pairs(v) do
            primary_by_moon[iv] = i
        end
    else
        primary_by_moon[v] = i
    end
end

function printArray(t)
    s = "" 
    for k, v in pairs(t) do
        -- concatenate values with space
        s = s .. v .. " " 
    end
    return s
end

input=arg[1]
-- is it a planet ?
if moons_by_primary[input] ~= nil then 
    print(string.format("%s has moons: [%s]", input, printArray(moons_by_primary[input])))
-- is it a moon ?
elseif primary_by_moon[input] ~= nil then
    print(string.format("%s belongs to %s", input, primary_by_moon[input]))
else
    print(string.format("%s is not a moon or a planet I know :(", input))
end
