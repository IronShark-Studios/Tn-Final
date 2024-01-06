{ inputs, outputs, lib, config, pkgs, ... }: {

  home.file."xmonad.hs" = {
    target = ".config/xmonad/xmonad.hs";
    force = true;
    text = ''
import XMonad
import XMonad.Util.Ungrab
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce (spawnOnce)

myStartupHook :: X ()
myStartupHook = do
         spawnOnce "firefox"

myConfig = def
         { modMask = mod4Mask
         , startupHook = myStartupHook
         , focusedBorderColor = "#000000" }
       `additionalKeysP`
         [ ("M-x" , spawn "dmenu")]

main = xmonad myConfig
    '';
  };
}
