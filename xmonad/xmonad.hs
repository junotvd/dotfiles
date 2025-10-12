import System.IO (hPutStrLn)
import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (spawnPipe)

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $
    docks
      desktopConfig
        { modMask = mod1Mask
        , terminal = "wezterm"
        , borderWidth = 2
        , normalBorderColor = "#282c34"
        , focusedBorderColor = "#61afef"
        , layoutHook = avoidStruts $ layoutHook desktopConfig
        , manageHook = manageDocks <+> manageHook desktopConfig
        , logHook =
            dynamicLogWithPP
              xmobarPP
                { ppOutput = hPutStrLn xmproc
                , ppTitle = xmobarColor "#98c379" "" . shorten 60
                }
        }
      `additionalKeysP` [ ("M-t", spawn "wezterm")
                        , ("M-d", spawn "dmenu_run")
                        , ("M-S-q", kill)
                        , ("M-<Left>", windows W.focusLeft)
                        , ("M-<Right>", windows W.focusRight)
                        , ("M-<Up>", windows W.focusUp)
                        , ("M-<Down>", windows W.focusDown)
                        , ("M-S-<Left>", windows W.swapLeft)
                        , ("M-S-<Right>", windows W.swapRight)
                        , ("M-S-<Up>", windows W.swapUp)
                        , ("M-S-<Down>", windows W.swapDown)
                        ]
