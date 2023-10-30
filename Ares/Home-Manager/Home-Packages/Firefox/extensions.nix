{ inputs, outputs, lib, config, pkgs, ... }: {

  home.file = {
    "ytEnhancer.txt" = {
    target = ".mozilla/firefox/extensions/ytEnhancer.txt";
    text = ''
{"version":"2.0.121","settings":{"blur":0,"brightness":100,"contrast":100,"grayscale":0,"huerotate":0,"invert":0,"saturate":100,"sepia":0,"applyvideofilters":false,"backgroundcolor":"#000000","backgroundopacity":90,"blackbars":false,"blockads":false,"blockadsexceptforsubs":false,"blockautoplay":true,"blockhfrformats":false,"blockwebmformats":false,"boostvolume":false,"cinemamode":true,"cinemamodewideplayer":true,"controlbar":{"active":true,"autohide":false,"centered":true,"position":"absolute"},"controls":["loop","reverse-playlist","volume-booster","whitelist","not-interested","cards-end-screens","cinema-mode","size","pop-up-player","speed","video-filters","screenshot","keyboard-shortcuts","options"],"controlsvisible":false,"controlspeed":false,"controlspeedmousebutton":false,"controlvolume":false,"controlvolumemousebutton":false,"convertshorts":false,"customcolors":{"--main-color":"#00adee","--main-background":"#111111","--second-background":"#181818","--hover-background":"#232323","--main-text":"#eff0f1","--dimmer-text":"#cccccc","--shadow":"#000000"},"customcssrules":"","customscript":"","customtheme":false,"darktheme":true,"date":1697149932257,"defaultvolume":true,"disableautoplay":false,"executescript":false,"expanddescription":true,"filter":"none","hidecardsendscreens":false,"hidechat":false,"hidecomments":false,"hiderelated":false,"hideshorts":false,"ignoreplaylists":true,"ignorepopupplayer":true,"localecode":"en_US","localedir":"ltr","message":false,"miniplayer":true,"miniplayerposition":"_top-left","miniplayersize":"_400x225","newestcomments":false,"overridespeeds":true,"pauseforegroundtab":false,"pausevideos":true,"popuplayersize":"640x360","qualityembeds":"hd720","qualityembedsfullscreen":"hd1080","qualityplaylists":"hd1080","qualityplaylistsfullscreen":"hd1080","qualityvideos":"hd1080","qualityvideosfullscreen":"hd1080","reload":false,"reversemousewheeldirection":false,"selectquality":true,"selectqualityfullscreenoff":false,"selectqualityfullscreenon":false,"speed":1,"speedvariation":0.1,"stopvideos":false,"theatermode":true,"theme":"default-dark","themevariant":"youtube-deep-dark.css","update":0,"volume":100,"volumemultiplier":3,"volumevariation":5,"whitelist":"","wideplayer":true,"wideplayerviewport":true}}
    '';
    };
  };
}
