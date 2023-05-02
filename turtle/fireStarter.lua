
redstone.setOutput("back", true)

while true do
    local has_block, data = turtle.inspect()

    if not has_block then
        redstone.setOutput("back", false)
        sleep(0.5)
        redstone.setOutput("back", true)        
    end

    sleep(1)
end