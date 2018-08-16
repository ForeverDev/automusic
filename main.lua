local notes = {
    ["A"]  = love.audio.newSource("A.mp3", "static");
    ["A#"] = love.audio.newSource("A#.mp3", "static");
    ["B"]  = love.audio.newSource("B.mp3", "static");
    ["C"]  = love.audio.newSource("C.mp3", "static");
    ["C#"] = love.audio.newSource("C#.mp3", "static");
    ["D"]  = love.audio.newSource("D.mp3", "static");
    ["D#"] = love.audio.newSource("D#.mp3", "static");
    ["E"]  = love.audio.newSource("E.mp3", "static");
    ["F"]  = love.audio.newSource("F.mp3", "static");
    ["F#"] = love.audio.newSource("F#.mp3", "static");
    ["G"]  = love.audio.newSource("G.mp3", "static");
    ["G#"] = love.audio.newSource("G#.mp3", "static");
}

math.randomseed(os.time())
local t = love.timer.getTime()
local network = dofile("net.lua"):new(5, 5, 5, 3)

local function note(name, octave) 
    if not notes[name] then
        return
    end
    notes[name]:setPitch(octave)
    notes[name]:stop()
    notes[name]:play()
end

function love.load()
    network:print()
end

function love.update(dt)
    if love.timer.getTime() - t > 1 then
        t = love.timer.getTime()
        note("A", math.random() > 0.5 and 1 or 2)
    end
end

function love.draw()

end
