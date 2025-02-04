import XMonad
import XMonad.Util.EZConfig


main :: IO ()
main = xmonad $ def
    { modMask = mod1Mask
    }
  `additionalKeysP`
    [ ("M-S-z", spawn "xscreensaver-command -lock"),
      ("M-C-s", unGrab *> spawn "scrot -s"),
      ("M-b", spawn "firefox")
    ]
