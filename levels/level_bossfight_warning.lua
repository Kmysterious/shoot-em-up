local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local GameObject = require("GameObject")
local sfx = require("sfx")

local sublevel = Sublevel.new("9999999-010", "", "", {duration = 4000})
function sublevel:show(options)
    local count = 0
    --warnnig text
    self.game:showScore(false)
    local warning = GameObject.new()
    if options.author then
        local authorText = display.newText(options.author, gameConfig.contentWidth/2, gameConfig.contentHeight/2+120, "kenvector_future_thin", 30)
        warning:insert(authorText)
        authorText:setFillColor(1, 204/255, 0)
    end
    if options.name then
        local nameText = display.newText(options.name, gameConfig.contentWidth/2, gameConfig.contentHeight/2+150, "kenvector_future_thin", 30)
        warning:insert(nameText)
    end
    local warnigText1 = display.newText("==========================", gameConfig.contentWidth/2, gameConfig.contentHeight/2-60, "kenvector_future_thin", 80)
    local warnigText2 = display.newText("Warning!", gameConfig.contentWidth/2, gameConfig.contentHeight/2, "kenvector_future_thin", 80)
    local warnigText3 = display.newText("==========================", gameConfig.contentWidth/2, gameConfig.contentHeight/2+60, "kenvector_future_thin", 80)
    warnigText2:setFillColor( 1, 0, 0 ) 
    warning:insert(warnigText1)
    warning:insert(warnigText2)
    warning:insert(warnigText3)
    self.warningChannel = sfx:play("warning", {loops = -1})
    transition.blink(warning, {time = 2000, onRepeat = 
        function (event)
        -- body
            count = count + 1
            if count == 4 then
            warning:removeSelf()
            end
    end})
    self.view:insert(warning)
end

function sublevel:finish()
    print("warning level complete")
    sfx:stop(self.warningChannel)
end

return sublevel