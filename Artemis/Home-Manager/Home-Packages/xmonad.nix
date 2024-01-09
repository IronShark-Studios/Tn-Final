{ inputs, outputs, lib, config, pkgs, ... }: {

  home.file."xmonad.hs" = {
    target = ".config/xmonad/xmonad.hs";
    force = true;
    text = ''
import XMonad
import XMonad.Util.Ungrab
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce (spawnOnce)
import Graphics.X11.ExtraTypes.XF86
import XMonad.Layout.Hidden


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
    , ((mod4Mask .|. shiftMask, xK_period), spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5.0%+")
    , ((mod4Mask .|. shiftMask, xK_comma), spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5.0%-")
    , ((mod4Mask .|. shiftMask, xK_h), spawn "wpctl set-mute @DEFAULT_SINK@ toggle")
    , ((0, xF86XK_AudioRaiseVolume), spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5.0%+")
    , ((0, xF86XK_AudioLowerVolume), spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5.0%-")
    , ((0, xF86XK_AudioMute), spawn "wpctl set-mute @DEFAULT_SINK@ toggle")
    , ((mod4Mask, xK_Escape), spawn "sudo slock")]
    '';
  };
}
