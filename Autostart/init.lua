
-- build picom from source oo prevent memory leak and suspend bugs
awful.util.spawn_with_shell("/home/niko/apps/picom/picom/build/src/picom -b")
awful.util.spawn_with_shell("nitrogen --restore")
awful.util.spawn_with_shell("setxkbmap pl")

awful.util.spawn_with_shell("discord")
-- awful.util.spawn_with_shell("caprine")
