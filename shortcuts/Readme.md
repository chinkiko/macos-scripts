```
pin to dock, and shortcus will be copy as an standalone application to ~/Applications
```

- Resize window.app ;调整当前程序的第一个窗口大小
- TodayIs.app ;复制今天的日期和时间到剪切板
- Snip-and-OCR.app; 截屏文字识别
- PauseVMware.app; 捷径Pause暂停⌽所有VMware虚拟机

----
```
vmrun list | tail -n +2 | while read vm; do vmrun pause "$vm"; done
```
```
on run {input, parameters}
	#(* Your script goes here *)
	tell application "System Events"
		set frontmostProcess to first process whose frontmost is true
		set frontmostApp to name of frontmostProcess
		# set frontmostWin to title of frontmostProcess
	end tell
	#(* Your script ends here *)
	return frontmostApp
end run
# Add another Shortcuts actions
# Find All Windows where App Name is this return
# Windows INDEX in Find ALL WINDOWS of Mission Control
# Using Index of windows to find current active one
```

