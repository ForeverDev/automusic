local Net = {}
local Neuron = {}
local Axon = {}

function Axon:new(start, finish, weight)

    local self = setmetatable({}, {__index = Axon})
    self.start = start
    self.finish = finish
    self.weight = weight

    return self

end

function Neuron:new()

    local self = setmetatable({}, {__index = Neuron})
    self.incoming = {}
    self.outgoing = {}
    self.charge = math.random()

    return self

end

function Net:new(inputs, outputs, hiddens, nperh)
    
    local self = setmetatable({}, {__index = Net})
    self.rows = {}
    self.inputs = inputs
    self.outputs = outputs
    self.hiddens = hiddens
    self.nperh = nperh
    
    -- make neurons and stick into tables, dont link yet
    for i = 1, hiddens + 2 do
        local col = (i == 1 and inputs or i == hiddens + 2 and outputs or nperh)
        local col_ins = {}
        for j = 1, col do
            table.insert(col_ins, Neuron:new())
        end
        table.insert(self.rows, col_ins)
    end
    
    -- link neurons w axons
    for i = 2, hiddens + 2 do
        local at_row = self.rows[i]
        local pv_row = self.rows[i - 1]
        for j, v in ipairs(at_row) do
            for j, q in ipairs(pv_row) do
                local axon = Axon:new(q, v, (math.random() - 0.5) * 2)
                table.insert(v.outgoing, axon)
                table.insert(q.incoming, axon)
            end
        end 
    end

    return self

end

function Net:print()
    local IGNORE_PRINT = 42
    local max_itr = 0
    local prints = {}
    for i, v in ipairs(self.rows) do
        if #v > max_itr then
            max_itr = #v
        end
    end
    for i = 1, max_itr do
        local ins = {}
        for k, v in ipairs(self.rows) do
            if v[i] then
                table.insert(ins, v[i].charge)          
            else
                table.insert(ins, IGNORE_PRINT)
            end
        end
        table.insert(prints, ins)
    end
    for i, v in ipairs(prints) do
        for j, k in ipairs(v) do
            if k == IGNORE_PRINT then
                io.write("     \t")
            else
                io.write(string.format("%.3f", k) .. "\t")
            end
        end
        print("\n")
    end
        
end

function Net:draw(x, y)
    for i, v in ipairs(
end

function Net:feed_forward(input_data)

end

return Net
