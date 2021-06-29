while true do
    redstone.setOutput("left", true)
    sleep(0.1)
    redstone.setOutput("left", false)
    for i=1,5 do
        sleep(60)
        print("waited for "..i.." minutes out of 5")
    end
end
