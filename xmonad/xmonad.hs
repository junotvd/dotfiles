import XMonad
import XMonad.Hooks.EwhmDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.BinarySpacePartition
import XMonad.Util.EZConfig

main :: IO ()
main = xmonad $ ewmh $ docks myConfig

myConfig = def
    { modMask = mod1Mask
    , layoutHook = myLayout
    , manageHook = myManageHook
    , startupHook =
    , myStartupHook
}
`additionalKeysP` myKeys


myTerminal :: String
myTerminal = "wezterm"

myBrowser :: String
myBrowser = "firefox"

myKeys :: [(Char, X ())]
myKeys =
[ ("M-t", spawn myTerminal),
  ("M-b", spawn myBrowser)
]

myManageHook :: ManageHook
myManageHook =
composeAll
[ className =? "Gimp" --> doFloat,
    isDialog --> doFloat
]

myLayout = tiled ||| Mirror tiled ||| full ||| threeCol
    where
    tiled = Tall 1 (3 / 100) (1 / 2)
threeCol = ThreeColMid 1 (3 / 100) (1 / 2)

    myStartupHook = do
    spawm "nm-applet"
