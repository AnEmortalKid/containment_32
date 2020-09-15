-- known set of primary to moons
-- https://en.wikipedia.org/wiki/List_of_natural_satellites#Moons_by_primary
moons_by_primary = { mercury={}, venus={}, earth={"moon"},mars={"phobos","deimos"}, jupiter={"callisto","io","europa","ganymede"} }

-- map moon to who it belongs to, unpacking inner arrays, hope no dupes!
primary_by_moon = {}
for i,v in pairs(moons_by_primary) do
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
        s = s .. v .. " " -- concatenate values with space
    end
    return s
end

-- is it a planet ?
if moons_by_primary[arg[1]] ~= nil then 
    print(string.format("%s has moons: [%s]", arg[1], printArray(moons_by_primary[arg[1]])))
-- is it a moon ?
elseif primary_by_moon[arg[1]] ~= nil then
    print(string.format("%s belongs to %s", arg[1], primary_by_moon[arg[1]]))
else
    print(string.format("%s is not a moon or a planet I know :(", arg[1]))
end
