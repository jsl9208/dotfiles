
import * as React from "/Applications/Oni.app/Contents/Resources/app/node_modules/react"
import * as Oni from "/Applications/Oni.app/Contents/Resources/app/node_modules/oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    // oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

    // completion too
    oni.input.bind("<c-j>", "contextMenu.next")
    oni.input.bind("<c-k>", "contextMenu.previous")
    oni.input.bind("<tab>", "contextMenu.select")

    // menu bindings...
    oni.input.bind("<c-j>", "menu.next")
    oni.input.bind("<c-k>", "menu.previous")

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")
    // oni.input.bind("<c-p>", "quickOpen.show")
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    //add custom config here, such as

    //"ui.colorscheme": "solarized8",

    "oni.loadInitVim": true, // Load user's init.vim
    "oni.useDefaultConfig": false, // Do not load Oni's init.vim
    "autoClosingPairs.enabled": false, // disable autoclosing pairs
    "editor.quickOpen.filterStrategy": "regex", // A strategy for the fuzzy finder closer to CtrlP
    "commandline.mode": false, // Do not override commandline UI
    "wildmenu.mode": false, // Do not override wildmenu UI
    "sidebar.enabled": false,

    "editor.fontSize": "16px",
    "editor.fontFamily": "Source Code Pro for Powerline",
    "editor.clipboard.enabled": false,
    "editor.quickInfo.delay": 300,
    "editor.fullScreenOnStart": true,

    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "ui.fontSize": "16px",
    "ui.fontFamily": "Source Code Pro for Powerline",

    "autoUpdate.enabled": false,
}
