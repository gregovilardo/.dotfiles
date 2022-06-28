--IMPORTS
import XMonad
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutModifier
import XMonad.Layout.NoBorders
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.CustomKeys 
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Util.Loggers
import XMonad.Util.Font


import qualified XMonad.StackSet as W
import qualified Data.Map        as M

---------------------------------------------------------------------- 

 -- MAIN
 
main = do
    xmproc <- spawnPipe "xmobar -x 0 /home/gregovilardo/.config/xmobar/xmobarrc"
    
    xmonad $ docks  defaultConfig 
        { terminal    = myTerminal
        , modMask     = myModMask 
        , borderWidth = myBorderWidth
        , layoutHook  = myLayoutHook
        , startupHook = myStartupHook
        , manageHook  = myManageHook 
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , logHook            = dynamicLogWithPP $ xmobarPP
                                    { ppOutput = hPutStrLn xmproc
                                    , ppCurrent = xmobarColor "#e6af2e" "" . wrap "[" "]" 
                                    , ppTitle  = xmobarColor "#e6af2e" "" . shorten 100
                                    , ppOrder = \(x:y:z:xs) -> [x,z] ++ xs}
                                    
        , workspaces         = [ "1", "2", "3", "4", "5" ] 
        }
        `additionalKeys` 
            [ ((0, xF86XK_AudioLowerVolume           ), spawn "amixer set Master 200-")
            , ((0, xF86XK_AudioRaiseVolume           ), spawn "amixer set Master 200+ && /bin/scripts/volume.sh")
            , ((myModMask, xF86XK_AudioLowerVolume   ), spawn "amixer set Master 1000-")
            , ((myModMask, xF86XK_AudioRaiseVolume   ), spawn "amixer set Master 1000+ && /bin/scripts/volume.sh")
            , ((0, xF86XK_AudioMute                  ), spawn "amixer set Master toggle")
            , ((myModMask, xK_s                      ), spawn "ksnip")
            , ((myModMask, xK_p                      ), spawn "rofi -show run")
            , ((myModMask, xK_f                      ), spawn "firefox")
            , ((myModMask, xK_n                      ), spawn "nautilus")
            , ((myModMask, xK_o                      ), spawn "obsidian")
            , ((myModMask, xK_semicolon              ), spawn "/bin/scripts/key_layout.sh")
            , ((myModMask, xK_ntilde                 ), spawn "/bin/scripts/key_layout.sh")
            ]  

myTerminal    = "alacritty"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 2
myNormalBorderColor  = "#191716" --Almost Black
myFocusedBorderColor = "#f2f2f2" --Grey Blue


----------------------------------------------------------------------
-- HOOKS
----------------------------------------------------------------------
-- Layout
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True


tall = smartBorders $ mySpacing 2 $ ResizableTall 1 (3/100) (1/2) []
fullLayout = smartBorders $ Full

myLayoutHook = avoidStruts (myDefaultLayout) ||| fullLayout 
  where
     myDefaultLayout = tall ||| Mirror tall ||| fullLayout 


----------------------------------------------------------------------
-- Start up

myStartupHook = do
    spawnOnce "nitrogen --restore &"
    spawnOnce "compton &"

-- Manage

myManageHook = manageHook defaultConfig <+> manageDocks
--composeAll
 --   [ className =? "gpick"        --> doFloat
  --   ]
