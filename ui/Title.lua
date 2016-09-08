local Title = {}
local Sprite = require("Sprite")
local gameConfig = require("gameConfig")

Title.new = function(options)
    local title = display.newGroup()
    local iconOptions = options and options.icon
    local textOptions = options and options.text

    local width = 0
    local gap = 15
    if textOptions then
        local textValue = textOptions.value or ""
        local font = textOptions.font or gameConfig.defaultFont
        local fontSize = textOptions.fontSize or 40
        local text = display.newText(textValue, 0, 0, font, fontSize)
        width = width + text.contentWidth
        title:insert(text)
        title.text = text
    end

    if iconOptions and iconOptions.name and iconOptions.name ~= "" then
        local icon = Sprite.new(iconOptions.name)
        icon.xScale = iconOptions.scale or 1
        icon.yScale = iconOptions.scale or 1
        width = width + icon.contentWidth
        title:insert(icon)
        title.icon = icon
    end

    function title:setText(text)
      self.text.text = text
      self:resize()
    end

    function title:resize()
      local left = - width / 2
      if self.icon then
          self.icon.x = left + self.icon.contentWidth / 2
          left = self.icon.x + self.icon.contentWidth / 2
      end

      if self.text then
          if not self.icon then
            gap = 0
          end
          self.text.x = left + self.text.contentWidth / 2 + gap
      end
    end

    title:resize()

    return title
end

return Title
