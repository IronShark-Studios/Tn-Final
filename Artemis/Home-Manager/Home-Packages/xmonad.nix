{ inputs, outputs, lib, config, pkgs, ... }: {

  home.file."xmonad.hs" = {
    target = ".config/xmonad/xmonad.hs";
    force = true;
    text = ''
import XMonad
import XMonad.Util.Ungrab
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce (spawnOnce)

main = xmonad $ defaultConfig
    { modMask            = mod4Mask
    , borderWidth        = 0
    , normalBorderColor  = "#000000"
    , focusedBorderColor = "#000000"
    , startupHook = do
        spawnOnce "firefox"
    }
    `additionalKeys`
    [ ((mod4Mask, xK_x), spawn "dmenu_run")
    , ((mod4Mask, xK_c), kill)
    , ((xK_<XF86AudioRaiseVolume>), raiseVolume 5)
    , ((xK_<XF86AudioLowerVolume>), lowerVolume 5)
    , ((xK_<XF86AudioMute>), toggleMute)
    , ((mod4Mask, xK_Escape), spawn "sudo slock")]
    '';
  };
}
