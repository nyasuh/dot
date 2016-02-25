import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeys)
import System.IO
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import qualified GHC.IO.Handle.Types as H

crLogHook h = do
	dynamicLogWithPP $ tryPP h

tryPP :: Handle -> PP
tryPP h = defaultPP
	{ ppOutput = hPutStrLn h
	, ppCurrent	    = dzenColor col1 col2 . pad . wrap space space
	, ppVisible	    = dzenColor col6 col2 . pad . wrap space space
	, ppHidden	    = dzenColor col6 col2 . pad . wrap space space
	, ppHiddenNoWindows = dzenColor col6 col2 . pad . wrap space space
	, ppWsSep	    = ""
	, ppSep		    = ""
	, ppLayout = wrap "^ca(1,xdotool key alt+space)" "^ca()" . dzenColor col1 col4 . pad . wrap space space .
	( \t -> case t of
	"Spacing 3 Grid"		-> dir_icon ++ "grid.xbm)"
	"Spacing 3 Tall"		-> dir_icon ++ "sptall.xbm)"
	"Mirror Spacing 3 Tall"	-> dir_icon ++ "mptall.xbm)"
	"Full"				-> dir_icon ++ "full.xbm)"
	)					
	, ppOrder  = \(ws:l:t:_) -> [l,ws]
	}

crWorkspace :: [String]
crWorkspace = clickable . (map dzenEscape) $ [ "Term"
	, "Web"
	, "File"
	, "Work"
	]
	where clickable l = [ "^ca(1,xdotool key alt+" ++ show (n) ++ ")" ++ ws ++ "^ca()" |
		(i,ws) <- zip [1..] l,
		let n = i ]

crKeys = [ ((mod1Mask, xK_p), spawn dmenu_cr) 
	, ((mod1Mask, xK_b), spawn "firefox")
	, ((mod1Mask, xK_f), spawn "thunar")
	, ((mod1Mask, xK_q), spawn "killall dzen2; xmonad --recompile; xmonad --restart")]

crLayout = avoidStruts $ smartBorders (  sTall ||| Mirror sTall ||| sGrid ||| Full )
	where 
	 sTall = spacing 3 $ Tall 1 (1/2) (1/2)
	 sGrid = spacing 3 $ Grid

crDocks = composeAll 
	[ className =? "thunar" --> doFloat
	, className =? "firefox" --> doFullFloat 
	, className =? "Oblogout" --> doFullFloat
	, className =? "Gpicview" --> doFullFloat 
	, className =? "feh" --> doFullFloat 
	]

main = do
	barAtas <- spawnPipe bar1
	barAtasKanan <- spawnPipe bar2
	bottom <- spawnPipe bar3
	embuh <- spawnPipe bar4
	raruh <- spawnPipe bar5
	xmonad $ defaultConfig
	 { manageHook = crDocks <+> manageDocks <+> manageHook defaultConfig
	 , layoutHook = crLayout
	 , modMask = mod1Mask
	 , workspaces = crWorkspace
	 , terminal = "urxvt"
	 , focusedBorderColor = "#FFFFFF"
	 , normalBorderColor = col2
	 , borderWidth = 1
	 , startupHook = spawnOnce "sh /home/kaze/.xmonad/scripts/autostart.sh" <+> setWMName "LG3D"
	 , logHook = crLogHook barAtas
	 } `additionalKeys` crKeys

space = "   "
col1 = "#fcfcfc"
col2 = "#101010"
col3 = "#d2d2d2"
col4 = "#FF172D"
col5 = "#010101"
col6 = "#7d7d7d"
bar1 = "dzen2 -p -ta l -e 'button3=' -fn 'ohsnap' -fg '" ++ col1 ++ "' -bg '" ++ col2 ++ "' -h 21 -w 750"
bar2 = "sh /home/kaze/.xmonad/scripts/status.sh"
bar3 = "/home/kaze/.xmonad/scripts/dzen2info.sh"
bar4 = "sh /home/kaze/.xmonad/scripts/menu.sh"
bar5 = "sh /home/kaze/.xmonad/scripts/dzen2infoo.sh"
dir_icon = "^ca(1,xdotool key alt+space)^i(/home/kaze/.xmonad/icons/"
dmenu_cr = "dmenu_run -b -h 24 -l 10 -w 500 -x 433 -y 234 -nb '#101010' -sb '" ++ col4 ++ "'"
