> The current version is `v2.1b`

# v2.1a

- added this changelog!

- implemented more usage of delta timing, in preparation of real slow-motion mechanics

- gameplay change: the player now slows down if they are over their max speed when running
    > before this change the player would keep their speed, making bomb boosting extremely broken if done right.<br>
    *(this change does not apply while in the air)*

- fixed a visual bug when the player falls in a pit while at high speeds.

- fixed a very old visual bug where pixel particles were the wrong color when in fullscreen.

- added object: `fx_bossintro`<br>
*(currently unused)*

- added language key: `ui.warning`<br>
*(currently unused)*

# v2.1b

- new formatting for `CHANGELOG.md`. hopefully this one stays!

- removed unused files in the `datafiles` directory.<br>
level data has been moved from `leveldata` to `data/levels`

- translations are now data-driven! you can find them in `data/lang.json`

# v2.1c (in development)

- reformatted `CHANGELOG.md` *again*, hopefully ***this*** one stays! (for real this time!!)

- added run modifiers - mid-run gameplay additions / changes that each have upsides and downsides.<br>
*(these are currently unobtainable without commands, will fix later)*

- the commands console now uses **Scribble** to display text.

- added `timer` command, which allows the player to manipulate the run timer.

- added `modifier` command, which allows the player to manage run modifiers.

- the settings menu is now properly localizable, see the relevant language keys in `data/lang.json`.

    ### Technical "Under the Hood" Changes
- implemented a new shortcut function `getdef`, to more easily reference item and modifier definitions in code.<br>
*(this change does not affect the original method)*

    here are example comparisons of the two methods:<br>
    old (direct) method:
    ```gml
    // itemdef reference
    var item_name = global.itemdefs[$ "beeswax"].displayname;

    // modifierdef reference
    var modifier_name = global.modifierdefs[$ "reckless"].displayname;
    ```
    new method:
    ```gml
    // itemdef reference
    var item_name = getdef("beeswax", deftype.item).displayname;
    // alternative argument
    var item_name = getdef("beeswax", 0).displayname;
    // getdef also defaults to item if you leave out the second argument

    // modifierdef reference
    var modifier_name = getdef("reckless", deftype.modifier).displayname;
    // alternative argument
    var modifier_name = getdef("reckless", 1).displayname;
    ```

- implemented a "item pickup queue," to prevent pickup notifications from overlapping. this does not affect gameplay.<br>
this array is stored in the `oCamera` object.

- modified the `console_log` function to be able to be safely called by objects/structs/scripts that are not the Game Manager object.

- console output and other debug messages are now recorded to a file called `latest.log`, which can be found in the save directory.
