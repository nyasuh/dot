# Material Theme for Sublime Text 3
This theme brings the [Material Design](http://www.google.com/design/) visual language to your Sublime Text 3. If you have problems first search for a similiar issue and then report with [new one](https://github.com/equinusocio/material-theme/issues).

Please read the [Known Issues](https://github.com/equinusocio/material-theme#known-issues) section before send a new one.

## Buy me a beer. (Alcoholist mode ON)

<!-- Pledgie Donation -->
<a href='https://pledgie.com/campaigns/29452'><img alt='Click here to lend your support to: Material Theme donations and make a donation at pledgie.com !' src='https://pledgie.com/campaigns/29452.png?skin_name=chrome' border='0' ></a>

<!-- <a target='_blank' href='https://www.coinbase.com/checkouts/1ApeKqUE3aLp5x3UuGHU3z95F7XoyDvpeF' data-code="1ApeKqUE3aLp5x3UuGHU3z95F7XoyDvpeF" class="coinbase-button"><img alt='Click here to lend your support to: Material Theme donations and make a donation at pledgie.com !' src='https://www.coinbase.com/assets/buttons/donation_small-210ad5fe8fe0846a0c6bc676e1bad3d462ab3fcbdaf2443de8755503d0729847.png' border='0' ></a> -->

## Screenshots

![Default version](http://equinusocio.github.io/material-theme/assets/materialtheme.png)

![Darker version](http://equinusocio.github.io/material-theme/assets/img/darker1.png)

![Lighter version](http://equinusocio.github.io/material-theme/assets/img/material-light.png)

More screenshots [here](http://equinusocio.github.io/material-theme/)

## Easy installation
You can install this awesome theme through the [Package Control](https://packagecontrol.io/installation). Search for *"Material Theme"*, install, **restart Sublime Text** and enjoy!

--

**Manual installation**

1. Download the [latest release](https://github.com/equinusocio/material-theme/releases/latest), extract and rename the folder to **"Material Theme"**.

2. Move the folder inside your sublime Packages directory. **(Preferences > Browse packages...)**

3. Activate the theme with the following preferences at  **(Preferences > Setting - User)**:

```json
"theme": "Material-Theme.sublime-theme",
"color_scheme": "Packages/Material Theme/schemes/Material-Theme.tmTheme",
```

***Note*** : Remember to restart Sublime Text after activating the theme.

## Theme styles
This theme provides a second style version:

**Darker**
```json
"theme": "Material-Theme-Darker.sublime-theme",
"color_scheme": "Packages/Material Theme/schemes/Material-Theme-Darker.tmTheme",
```

**Lighter**
```json
"theme": "Material-Theme-Lighter.sublime-theme",
"color_scheme": "Packages/Material Theme/schemes/Material-Theme-Lighter.tmTheme",
```

## Known issues
Please see the issue [#67](https://github.com/equinusocio/material-theme/issues/67) if you can't see the bottom panel (find/replace, rename, move, can't see the box inputs in SidebarEnhancement, etc..). here the quick fix:

![Drag the top edge](https://cloud.githubusercontent.com/assets/474329/8178894/a0dd09c0-1412-11e5-8ecf-f7f9ade439ae.gif)

#### White panels
If you want to enable the white panels and inputs you can install the addon package through **Package Control**, search for "Material theme white panels". You have to disable it if you want to use the ```Lighter``` theme style.

## Theme options

```json
"material_theme_small_tab": true,							// Set small tabs
"material_theme_disable_fileicons": true,					// Hide siderbar file type icons
"material_theme_disable_folder_animation": true,		// Disable folder animation
"material_theme_small_statusbar": true,					// Set small status bar
"material_theme_disable_tree_indicator": true,			// Disable sidebar file indicator
"material_theme_bold_tab": true,								// Make the tab labels bolder
"material_theme_tabs_separator": true,						// Show tabs separator
"material_theme_accent_lime": true,							// set green lime accent color
"material_theme_accent_purple": true,						// set purple accent color
"material_theme_accent_red": true,							// set pale red accent color
"material_theme_accent_orange": true,						// set orange accent color
"material_theme_accent_yellow": true,						// set yellow accent color
"material_theme_panel_separator": true,					// show bottom panel separator
"material_theme_tabs_autowidth": true,						// Enable autowidth for tabs
"material_theme_contrast_mode": true,						// Enable sidebar and panels contrast mode
```

## Recommended UI and font settings for a better experience:

```json
"overlay_scroll_bars": "enabled",
"line_padding_top": 3,
"line_padding_bottom": 3,
"always_show_minimap_viewport": true,
"bold_folder_labels": true,
"indent_guide_options": [ "draw_normal", "draw_active" ],   // Highlight active indent
"font_options": [ "gray_antialias" ],                      // On retina Mac
```

The font used for the code is "[Fira Code](https://github.com/tonsky/FiraCode)" with code ligatures (not supported in Sublime Text).

You can also use the official Material Design monospace font, "[Roboto Mono](https://www.google.com/fonts/specimen/Roboto+Mono)"


## Other Resources

**App icon**

[Download](https://dribbble.com/shots/2104476-Material-Theme-for-Sublime-Text-3/attachments/380650) the official Material Theme icon.

**Atom porting**

You can download the [Atom Material UI](https://github.com/silvestreh/atom-material-ui), theme porting made by @silvestreh.

**IntelliJ IDEA Porting**

You can download the [IntelliJ IDEA Material Theme](https://github.com/ChrisRM/material-theme-jetbrains), theme porting made by @ChrisRM.

**Vim Porting**

You can download the [Vim Hybrid Material](https://github.com/kristijanhusak/vim-hybrid-material), Material Theme porting made by @kristijanhusak.

**Terminal Porting**

You can download [Material Theme Terminal](https://gist.github.com/mvaneijgen/4c56701215847dd5ddcf), Material Theme porting made by @mvaneijgen

**Default Color Palette**

![Color Palette](http://i.imgur.com/zyIK71j.jpg)


## Thanks
Thanks for all the [contributors](https://github.com/equinusocio/material-theme/graphs/contributors).

Check the video review by **LevelUpTuts**
[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/6eqgrCxprOI/0.jpg)](http://www.youtube.com/watch?v=6eqgrCxprOI)
