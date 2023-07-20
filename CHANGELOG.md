# v2.1a

added this changelog!

implemented more usage of delta timing, in preparation of real slow-motion mechanics

gameplay change: the player now slows down to their max speed over time while on the ground and holding a movement key
> before this change the player would keep their speed making bomb boosting extremely broken<br>
> this change does not apply while in the air

fixed a visual bug when the player falls in a pit while at high speeds.<br>
fixed a very old visual bug where pixel particles were the wrong color when in fullscreen.

added object: `fx_bossintro`

added language key: `ui.warning`

# v2.1b

new formatting for `CHANGELOG.md`. hopefully this one stays!

removed unused files in the `datafiles` directory.<br>
level data has been moved from `leveldata` to `data/levels`

translations are now data-driven! you can find them in `data/lang.json`

# v2.1c

the console now records output to the debug log.<br>
modified the `console_log()` function to be able to be safely called by objects/structs/scripts that are not the Game Manager object.

added Run Modifiers - mid-run gameplay additions that both benefit and detriment the player.

the console and debug messages are now recorded to a file called `latest.log`, which can be found in the save directory.

the console now uses Scribble.

added command `timer`<br> - allows the player to manipulate the run timer (`global.t`)
added command `modifier` - allows the player to manage run modifiers
