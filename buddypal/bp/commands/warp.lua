--------------------------------------------------------------------------------
-- Warp commands: Controls all Warp helper commands.
--------------------------------------------------------------------------------
local warp = {}
function warp.run()
    local self = {}
    
    -- Private variables.
    local player = windower.ffxi.get_mob_by_target("me")
    
    self.execute = function(commands)
        local name = commands[2] or false
        
        if name and name ~= "index" and name ~= "ring" and tostring(name) ~= nil then
            helpers["warp"].find(name)
            
        elseif name and name == "index" then
            local index = commands[3] or false
            
            if index then
                helpers["warp"].findIndex(index)
            end
            
        
        elseif commands[2] and commands[2]:lower() == "ring" then
            helpers["actions"].tryWarping()
        
        elseif not name then
            helpers["warp"].clearAll()
            
        end    
    
    end
    
    return self 

end
return warp.run()
