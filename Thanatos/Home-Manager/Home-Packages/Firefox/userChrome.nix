{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.firefox.profiles.xin.userChrome = ''
#titlebar-minbutton, #titlebar-maxbutton, #titlebar-closebutton {
  display: none !important;
}

/* DISABLE BOTTOM LEFT MESSAGES */
#statuspanel[type="overLink"] {
  display: none !important;
}

#statuspanel[type="overLink"] #statuspanel-label
#statuspanel[type="status"] #statuspanel-label[value^="Look"],
#statuspanel[type="status"] #statuspanel-label[value^="Connect"],
#statuspanel[type="status"] #statuspanel-label[value^="Send"],
#statuspanel[type="status"] #statuspanel-label[value^="Transfer"],
#statuspanel[type="status"] #statuspanel-label[value^="Read"],
#statuspanel[type="status"] #statuspanel-label[value^="Wrote"],
#statuspanel[type="status"] #statuspanel-label[value^="Wait"],
#statuspanel[type="status"] #statuspanel-label[value*="TLS handshake"],
#statuspanel[type="status"] #statuspanel-label[value*="FTP transaction"] {
display:none!important;
}
/* END BOTTOM LEFT MESSAGES */


/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/dark_additional_windows.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Dark library, page-info and bookmark-properties */
/* Color scheme matches default dark theme */

/* If you are going to open Library in the (places.xhtml) in a tab then this file should also be imported in userContent.css */

@namespace xul url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

@-moz-document url(chrome://browser/content/places/places.xhtml),
  url(chrome://browser/content/places/bookmarkProperties.xhtml),
  url(chrome://global/content/commonDialog.xhtml),
  url-prefix(chrome://browser/content/preferences/dialogs/),
  url("chrome://mozapps/content/handling/dialog.xhtml"),
  url-prefix(chrome://browser/content/pageinfo/),
  url-prefix(chrome://browser/content/sanitize.xhtml),
  url-prefix("chrome://mozapps/content/downloads"){
  :root{
    background-color: #2b2a33 !important;
    --in-content-box-background: #23222b !important;
  }
  #placesToolbox,
  #placesView,
  #placesToolbar,
  #main-window,
  #topBar,
  dialog,
  tree{
    -moz-appearance: none !important;
    color: rgb(249,249,250) !important;
  }

  #placesToolbar,
  tree{
    background: transparent !important;
  }

  #imagecontainerbox{ background: url("chrome://global/skin/media/imagedoc-darknoise.png") !important }

  search-textbox,
  #searchFilter,
  menulist,
  input,
  textbox,
  richlistbox,
  treecol,
  treecolpicker,
  button,
  menu,
  #permList{
    -moz-appearance: none !important;
    color: inherit !important;
  }

  menulist{ border: 1px solid graytext; padding-inline-end: 4px }
  dropmarker{ filter: invert(1) }
  menulist:hover{ border-color: highlight; background-color: rgba(255,255,255,0.1) }

  .menubar-left{ fill: currentColor; -moz-context-properties: fill; }
  #topBar,#searchFilter,search-textbox,input,textbox,richlistbox{ background-color: rgba(0,0,0,0.2) !important; }
  input[mozactionhint="search"],input[readonly],td > input{ background-color: transparent !important; }

  treecol:not([hideheader]){ height: 24px; }
  treecol:hover{ filter: brightness(160%) }
  treechildren::-moz-tree-row(multicol, odd), #permList{ background-color: rgba(0,0,0,0.2) !important; }

  radiogroup > radio[selected],
  radiogroup > radio:hover,
  #permList > .permission:hover,
  treechildren::-moz-tree-row(hover),
  button:hover{ background-color: rgba(255,255,255,0.1) !important; color: inherit !important;}

  treechildren::-moz-tree-row(selected){ background-color: Highlight !important; }
  button{ padding: 3px }
  #placesMenu > menu{ border: none !important; }

  search-textbox,input,button{ border: 1px solid graytext; border-radius: 3px }
  search-textbox,input{ padding: 2px }

}

/* modal prompts (alert() & friends) */

xul|vbox.paymentDialogContainerFrame,
xul|vbox.tabmodalprompt-mainContainer{
  background-color: var(--toolbar-bgcolor) !important;
  color: var(--lwt-text-color,-moz-dialogtext) !important;
}
/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/blank_page_background.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Set blank page background-color */
/* Uses color from theme_colors if available */

#tabbrowser-tabpanels{
  background-color: var(--uc-light-bkgnd-color,rgb(46,54,69)) !important;
}
/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/dark_checkboxes_and_radios.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Change the appearance of natively styled widgets including radios, checkboxes, buttons and expender "dropdown" arrows */
/* Their background will be transparent instead of white so they will appear fitting to whatever is on the background */
/* As such, this might cause a small issue if the background happens to be same color as the border of these buttons or the checkbox-image */

/* In short, these native widgets will be dark on dark theme and light on light theme */

@namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

#editBMPanel_tagsSelector > richlistitem > image,
radio > .radio-check,
checkbox > .checkbox-check{
  -moz-appearance: none !important;
  border: 1px solid graytext;
  border-radius: 2px;
  height: 1.3em;
  width: 1.3em;
  padding: 1px;
}

#editBMPanel_tagsSelector > richlistitem > image{
  background-color: var(--toolbar-bgcolor,rgb(50,50,52)) !important;
  margin: 1px !important;
  border-color: graytext !important;
  border-radius: 2px !important;
}

#editBMPanel_tagsSelector > richlistitem:not([disabled]):hover > image,
radio:not([disabled]):hover > .radio-check,
checkbox:not([disabled]):hover > .checkbox-check{ border-color: highlight !important; }

radio > .radio-check{ padding: 0; border-radius: 20px }

#editBMPanel_tagsSelector > richlistitem[checked] > image,
radio[selected] > .radio-check,
checkbox[checked] > .checkbox-check{
  list-style-image: url("chrome://global/skin/icons/check.svg");
  -moz-context-properties: fill;
  fill: highlight;
}

radio[selected] > .radio-check{ list-style-image: url("chrome://global/skin/in-content/radio.svg"); }

#editBMPanel_tagsSelector > richlistitem[disabled] > image,
radio[disabled] > .radio-check,
checkbox[disabled] > .checkbox-check{ fill: graytext !important; }

/*Buttons*/
/* This only applies to natively-ish styled buttons, not the buttons in toolbars */

button{
  -moz-appearance: none !important;
  color: inherit !important;
  background-color: rgba(127,127,127,0.1) !important;
  border: 1px solid graytext;
}

button[disabled]{ opacity: 0.8 }


button:not([disabled]):hover{ border-color: highlight; background-color: rgba(0,0,0,0.1) !important; box-shadow: inset 0 0 2px highlight }
button:not([disabled]):active{ box-shadow: inset 0 0 3px 0px black }
button.searchbar-engine-one-off-item,
.panel-footer > button{ border-width: 1px 0 0 0; }

button.panel-button{ padding: 2px 2px 1px 2px !important; }

#customization-done-button{ background-color: #0a84ff !important; }
#customization-done-button:hover{ background-color: #0a64df !important; }
/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/dark_context_menus.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Makes context menus dark. Also affects some portions of menu popups */
/* Uses dark theme colors but does not respect dark theme variables (they wouldn't work on sidebar context menu) */

:root{
  --uc-menu-bkgnd: rgb(74,74,79);
  --uc-menu-color: rgb(230,230,230);
  --uc-menu-dimmed: rgba(255,255,255,0.1);
  --uc-menu-disabled: rgb(50,50,50);
}
panel richlistbox,
panel tree,
panel button,
panel menulist,
panel textbox,
panel input,
menupopup,
menu,
menuitem{ -moz-appearance: none !important; }

menulist,
menuitem,
menu{ min-height: 1.8em }

panel menulist{ border: 1px solid transparent }

panel richlistbox,
panel tree,
panel button,
panel menulist,
panel textbox,
panel input,
panel #searchbar,
menupopup:not(#BMB_bookmarksPopup),
#main-menubar > menu > menupopup,
#context-navigation{
  color: var(--uc-menu-color) !important;
  padding: 2px;
  background-color: var(--uc-menu-bkgnd) !important;
  border-color: var(--uc-menu-disabled) !important;
}

panel textbox input{ padding: 2px !important; }

panel input{ border-width: 1px; border-style: solid; background-color: rgba(0,0,0,0.1) !important; }
panel #searchbar{ background-color: rgba(0,0,0,0.1) !important; padding: 0 !important; }
panel #searchbar input{ background-color: transparent !important; }

panel menulist:hover,
panel menulist[open]{ border-color: Highlight !important; }

#editBMPanel_folderMenuList > menupopup > menuitem{ color: var(--uc-menu-color) !important; }

panel treechildren::-moz-tree-row(selected),
panel button:hover,
menu:hover,
menu[_moz-menuactive],
menu[open],
menuitem:hover,
menuitem[_moz-menuactive]{ background-color: var(--uc-menu-dimmed) !important; color: inherit !important; }

menu[disabled="true"],
menuitem[disabled="true"]{ color: var(--uc-menu-disabled) !important; }

menu:not(.subviewbutton) > .menu-right{ filter: invert(1) }

/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/dark_date_picker_panel.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Makes the HTML <input type="date"> picker panel dark IF you use dark colored theme. It does not affect the input element on the page, only the popup */

@media (-moz-toolbar-prefers-color-scheme: dark){
  #DateTimePickerPanel{ --panel-background: #2b2a33 !important; }
}
@-moz-document url("chrome://global/content/datepicker.xhtml"){
  @media (-moz-toolbar-prefers-color-scheme: dark){
    :root{
      --border: 0.1rem solid #a4a4a4 !important;
      --weekend-font-color: #ff4030 !important
    }
    body,.month-year-view{ background: #2b2a33 !important; color: #f4f4f4 !important; }
    button.month-year::after,
    button{ fill: #f4f4f4 !important; }
  }
}
/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/dark_theme_aware_statuspanel.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/*
Makes statuspanel aware of the the theme text color
Meaning, if theme text is light then the statuspanel uses dark background and light text. On themes with dark text the statuspanel has normal appearance.
*/

:root[lwthemetextcolor="bright"] #statuspanel-label{
  background-color: rgb(50,50,52) !important;
  color: rgb(187,187,189) !important;
  border-color: grey !important;
}

/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/autohide_main_toolbar.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* This style hides the main toolbar and shows it when the cursor is over the tabs toolbar as well as whenever the focus is inside nav-bar, such as when urlbar is focused. */

:root{ --uc-navbar-transform: -40px }
:root[uidensity="compact"]{ --uc-navbar-transform: -34px }

#navigator-toolbox > div{ display: contents; }
:root[sessionrestored] :where(#nav-bar,#PersonalToolbar,#tab-notification-deck,.global-notificationbox){
  transform: translateY(var(--uc-navbar-transform))
}
:root:is([customizing],[chromehidden*="toolbar"]) :where(#nav-bar,#PersonalToolbar,#tab-notification-deck,.global-notificationbox){
  transform: none !important;
  opacity: 1 !important;
}

#nav-bar:not([customizing]){
  opacity: 0;
  transition:  transform 400ms ease 1.8s, opacity 400ms ease 1.8s !important;
  position: relative;
  z-index: 2;
}
#TabsToolbar{ position: relative; z-index: 3 }

/* Show when toolbox is focused, like when urlbar has received focus */
#navigator-toolbox:focus-within > .browser-toolbar{
  transform: translateY(0);
  opacity: 1;
  transition-duration: 500ms, 200ms !important;
  transition-delay: 0s !important;
}
/* Show when toolbox is hovered */
#titlebar:hover ~ .browser-toolbar,
#nav-bar:hover,
#nav-bar:hover + #PersonalToolbar{
  transform: translateY(0);
  opacity: 1;
  transition-duration: 500ms, 200ms !important;
  transition-delay: 0s !important;
}

/* Bookmarks toolbar needs so extra rules */
#PersonalToolbar{ transition: transform 400ms ease 1.8s !important; position: relative; z-index: 1 }

/* Move up the content view */
:root[sessionrestored]:not([inFullscreen]) > body > #browser{ margin-top: var(--uc-navbar-transform); }

/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/hide_tabs_toolbar.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Hides tabs toolbar */
/* For OSX use hide_tabs_toolbar_osx.css instead */

/* Note, if you have either native titlebar or menubar enabled, then you don't really need this style.
 * In those cases you can just use: #TabsToolbar{ visibility: collapse !important }
 */

/* IMPORTANT */
/*
Get window_control_placeholder_support.css
Window controls will be all wrong without it
*/

:root[tabsintitlebar]{ --uc-toolbar-height: 40px; }
:root[tabsintitlebar][uidensity="compact"]{ --uc-toolbar-height: 32px }

#TabsToolbar{ visibility: collapse !important }

:root[sizemode="fullscreen"] #TabsToolbar > :is(#window-controls,.titlebar-buttonbox-container){
  visibility: visible !important;
  z-index: 2;
}

:root:not([inFullscreen]) #nav-bar{
  margin-top: calc(0px - var(--uc-toolbar-height,0px));
}

:root[tabsintitlebar] #toolbar-menubar[autohide="true"]{
  min-height: unset !important;
  height: var(--uc-toolbar-height,0px) !important;
  position: relative;
}

#toolbar-menubar[autohide="false"]{
  margin-bottom: var(--uc-toolbar-height,0px)
}

:root[tabsintitlebar] #toolbar-menubar[autohide="true"] #main-menubar{
  flex-grow: 1;
  align-items: stretch;
  background-color: var(--toolbar-bgcolor,--toolbar-non-lwt-bgcolor);
  background-clip: padding-box;
  border-right: 30px solid transparent;
  border-image: linear-gradient(to left, transparent, var(--toolbar-bgcolor,--toolbar-non-lwt-bgcolor) 30px) 20 / 30px
}

#toolbar-menubar:not([inactive]){ z-index: 2 }
#toolbar-menubar[autohide="true"][inactive] > #menubar-items {
  opacity: 0;
  pointer-events: none;
  margin-left: var(--uc-window-drag-space-pre,0px)
}
'';
}
