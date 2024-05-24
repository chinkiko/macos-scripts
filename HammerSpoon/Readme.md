### 参考
 https://github.com/sugood/hammerspoon
 
 https://github.com/zuorn/hammerspoon_config


----
sugood配置更改
- commons.lua
```
{ title = "Reload config", fn = function() hs.reload()   end },
        { title = "Open console", fn = function() hs.openConsole() end },
        { title = "Relaunch", fn = function() hs.relaunch() end },
-- 添加退出按钮
        { title = "Exit", fn = function() os.exit() end },
        { title = "-" },
        { title = "系统状态：" .. config[1].showSysInfo, fn = function()
            switchSysInfo()
        end },

-- 注释,不用  { title = "翻译平台：" .. config[1].dictEngine, fn = function()
-- 注释,不用  { title = "输入appSecret", fn = function()
-- 注释,不用  { title = "时间同步：" .. config[1].isSyncTime, fn = function()
```

- dict.lua
```
function initData()
-- disable ALL function, 特别是对CMD+Opt+V键的绑定
-- 注释掉整个函数   hs.eventtap.keyStroke({ "cmd" }, "V")
end
```

- systeminfo.lua
```
--  local canvas = hs.canvas.new{x = 0, y = 0, h = 24, w = 30+30+30+60}
    local canvas = hs.canvas.new{x = 0, y = 0, h = 24, w = 30+30+60}
-- 删除硬盘读写
--        {
--        type = "text",
--        text = obj.display_disk_text,
--        -- withShadow = true,
--        trackMouseEnterExit = true,
--        frame = { x = 30, y = "0", h = "1", w = "1", }
--        },

-- 改掉位置 frame = { x = 60, y = "0", h = "1", w = "1", }
        frame = { x = 30, y = "0", h = "1", w = "1", }
-- 改掉位置 frame = { x = 90, y = "0", h = "1", w = "1", }
        frame = { x = 60, y = "0", h = "1", w = "1", }

```
