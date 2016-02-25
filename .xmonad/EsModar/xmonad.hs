import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeys)
import System.IO
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import qualified GHC.IO.Handle.Types as H

asuhLogHook h = do
	dynamicLogWithPP $ tryPP h

tryPP :: Handle -> PP
tryPP h = defaultPP
	{ ppOutput = hPutStrLn h
    , ppLayout = wrap "^bg(#0BA0AB)^ca(1,xdotool key alt+space)" "^ca()^bg()" . pad . wrap space space .
    ( \l -> case l of
    "Spacing 10 Grid"       -> dir_icon ++ "grid.xbm)"
    "Spacing 10 Tall"       -> dir_icon ++ "sptall.xbm)"
    "Mirror Spacing 10 Tall"    -> dir_icon ++ "mptall.xbm)"
    "Full"              -> dir_icon ++ "full.xbm)"
    )
	, ppOrder  = \(ws:l:t:_) -> [l,t]
	}


asuhLogHook2 h = do
	dynamicLogWithPP $ tryPP2 h
tryPP2 :: Handle -> PP
tryPP2 h = defaultPP
	{ ppOutput = hPutStrLn h
	, ppCurrent	    = wrap "^fg(#ffffff)" "^fg()"
	, ppVisible	    = wrap "^fg(#FFFFFF)" "^fg()"
	, ppHidden	    = wrap "^fg(#ffffff)" "^fg()"
	, ppHiddenNoWindows = wrap "^fg(#C6C1C1)" "^fg()"
	, ppWsSep	    = ""
	, ppSep	    	= ""	
	, ppTitle		= \t -> "^fg(#0BA0AB)" ++ lay_end ++ "^fg(#FFFFFF) " ++ prev ++ " " ++ play ++ " " ++ stop ++ " " ++ next ++ "  ^fg()"			
	, ppOrder  		= \(ws:l:t:_) -> [ws,t]
	}

asuhWorkspace :: [String]
asuhWorkspace = clickable $ [ "^bg(#0BA0AB)"++ space ++"^i(/home/kaze/.xmonad/icon/code.xbm) TERM ^bg()"
	, "^bg(#0BA0AB)^bg(#0BA0AB)"++ space ++"^i(/home/kaze/.xmonad/icon/Globe.xbm) NET ^bg()"
	, "^bg(#0BA0AB)^bg(#0BA0AB)"++ space ++"^i(/home/kaze/.xmonad/icon/art.xbm) NSFW ^bg()"
--	, "^bg(#18C269)"++ space ++" WORK  "++ space ++"^bg()"
	]
	where clickable l = [ "^ca(1,xdotool key alt+" ++ show (n) ++ ")" ++ ws ++ "^ca()" |
		(i,ws) <- zip [1..] l,
		let n = i ]

asuhKeys = [ ((mod1Mask, xK_p), spawn dmenu_suh)
	, ((mod1Mask, xK_q), spawn "killall dzen2; xmonad --recompile; xmonad --restart")
	, ((mod1Mask, xK_d), spawn dmenu)
	, ((mod1Mask, xK_e), spawn "pkill xmonad")]
--	, ((mod4Mask .|. shiftMask, xK_q), spawn powermenu)

asuhLayout = avoidStruts $ smartBorders (  sTall ||| Mirror sTall ||| sGrid ||| Full )
	where
	 sTall = gaps [(U,20), (D,20), (L,40), (R,40)] $ spacing 10 $ Tall 1 (3/100) (1/2)
	 sGrid = spacing 10 $ Grid

asuhDocks = composeAll
	[ className =? "Gimp" --> doFloat
	, className =? "mpv" --> doFullFloat
	, className =? "feh" --> doFullFloat
	]

main = do
	bgPanel <- spawnPipe bgBar
	workspacePanel <- spawnPipe wBar
	barAtas <- spawnPipe bar1
	infoPanel <- spawnPipe iBar
	xmonad $ defaultConfig
	 { manageHook = asuhDocks <+> manageDocks <+> manageHook defaultConfig
	 , layoutHook = asuhLayout
	 , modMask = mod1Mask
	 , workspaces = asuhWorkspace
	 , terminal = "urxvt"
	 , focusedBorderColor = "#0BA0AB"
	 , normalBorderColor = "#0BA0AB"
	 , borderWidth = 2
	 , startupHook = spawnOnce "sh /home/kaze/.xmonad/bin/autostart.sh" <+> setWMName "LG3D"
	 , logHook = asuhLogHook workspacePanel  <+> asuhLogHook2 barAtas 
	 } `additionalKeys` asuhKeys

play		= "^ca(1,mpc toggle)^i(/home/kaze/.xmonad/icon/play.xbm)^ca()"
next		= "^ca(1,mpc next)^i(/home/kaze/.xmonad/icon/fwd.xbm)^ca()"
prev		= "^ca(1,mpc prev)^i(/home/kaze/.xmonad/icon/rwd.xbm)^ca()"
stop		= "^ca(1,mpc stop)^i(/home/kaze/.xmonad/icon/stop.xbm)^ca()"

width="1366"
height="768"
space = " "
dzenArgs = "-p -e 'button3=' -fn 'Helvetica-8'"
col1 = "#efefef"
col2 = "#1A1A1A"
col3 = "#1188aa"
sWidth  = "1366"
hg	 = "20"
wBar = "sleep 0.1;dzen2 -p -ta l -e 'button3=' -fg '" ++ col1 ++ "' -bg '" ++ col2 ++ "' -h "++ hg ++" -w `expr 32`"
bgBar= "echo '^fg(#0BA0AB)^p(;+10)^r(1366x20)' | dzen2 "++dzenArgs++" -ta l -fg '" ++ col1 ++ "' -bg '#2d2d2d'  -h 25  -w "++sWidth
iBar = "sh /home/kaze/.xmonad/bin/panel-info.sh "
bar1 = "sleep 0.2;dzen2 -p -ta l -e 'button3=' -fn 'aqui-10' -fg '" ++ col1 ++ "' -bg '" ++ col2 ++ "' -h 20 -w 580 -y 0 -x 27"
dir_icon = "^ca(1,xdotool key alt+space)^i(/home/kaze/.xmonad/icon/"
dmenu_suh = "sh /home/kaze/.xmonad/bin/dmenu_suh.sh '"++ width ++"' '"++ height ++"' '"++ col2 ++"' '"++ col3 ++"'"
dmenu = "sh /home/kaze/.xmonad/bin/dmenu.sh"
-- powermenu = "sh /home/kaze/.xmonad/bin/powermenu.sh '"++ width ++"' '"++ height ++"' '"++ col2 ++"' '"++ col3 ++"'"
lay_end = "^ca()^bg()^fg(#0BA0AB)^i(/home/kaze/.xmonad/icon/mr1.xbm)^fg()"
