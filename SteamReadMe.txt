[h1]I Don't Want That!  (Prevent Item Transfer)[/h1]


[h1]Important - This version of the mod is only for the opt in beta version of the game![/h1]

This is a temporary version that supports the 0.8.6 beta, and not the current game's version.
For the non beta version of the game, use the mod of the same name without the BETA suffix.

The non beta version [i]must[/i] be uninstalled.
When the 0.8.6 becomes the main version, this mod will be deleted.
Note that the beta is expected to change many times before release.
As such, this mod may break on each beta release.

[h1]Docs[/h1]

Allows the user to mark items so they are not automatically transferred on the corpse recycle or take all commands.

When on mission, press F9 when hovering over an item to add or remove it to the blacklist.  Press F11 to clear out the blacklist.

The keys are configurable.

The game's normal Ctrl + Click and drag and drop not affected.

[h1]Polish[/h1]

There are a couple of items to be addressed in the next update:
[list]
[*]The "modified" icon (M) is used to indicate if something is blacklisted or not.
This visually conflicts with anything that is found that is actually modified.
I don't know if it's even possible to find a modified item in the field.  This is just a placeholder.
[*]Sometimes the M icon isn't refreshed when marking items and then moving them.  The functionality works, but the UI is not updated.  Closing the inventory and opening it back up will display the correct marks.
[/list]

[h1]Configuration[/h1]

The configuration file will be created on the first game run and can be found at [i]%AppData%\..\LocalLow\Magnum Scriptum Ltd\Quasimorph_ModConfigs\QM_LockItemTransfer\config.json[/i].
[table]
[tr]
[td]Name
[/td]
[td]Default
[/td]
[td]Description
[/td]
[/tr]
[tr]
[td]LockItemKey
[/td]
[td]F9
[/td]
[td]The key to add or remove an item from the blacklist
[/td]
[/tr]
[tr]
[td]ClearItemListKey
[/td]
[td]F11
[/td]
[td]The key to clear out the blacklist
[/td]
[/tr]
[/table]

[h1]Support[/h1]

If you enjoy my mods and want to buy me a coffee, check out my [url=https://ko-fi.com/nbkredspy71915]Ko-Fi[/url] page.
Thanks!

[h1]Source Code[/h1]

Source code is available on GitHub at https://github.com/NBKRedSpy/QM_LockItemTransfer

[h1]Change Log[/h1]

[h2]1.5.0[/h2]
[list]
[*]Version 0.8.6 compatibility
[/list]

[h2]1.4.0[/h2]
[list]
[*]v0.8.5 compatible.
[/list]

[h2]1.3.0[/h2]
[list]
[*]Moved config file directory.
[/list]

[h2]1.2.1[/h2]
[list]
[*]Changed default "Clear" binding to F11 from F12 as it is also used by Steam to create a screenshot.  Thanks to Steam user Anton for reporting this.
[*]Changed to use the MGSC.InputHelper instead of Unity's helper.  This is for compatibility purposes with the Context Menu Hotkeys mod since that mod needs to temporarily disable InputHelper for non context menu keys.
[/list]

[h2]1.2.0[/h2]
[list]
[*]Fixes amputations not being filtered.
[/list]

[h2]1.1.1[/h2]
[list]
[*]Fix for mod crashing for new users due to the config folder not being created.  Thank you to TheGentlingCone for reporting this.
[/list]

[h2]1.1.0[/h2]
[list]
[*]Fixed Rules not filtering items when an action automatically unloads a weapon or an item is directly disassembled.
[/list]

[h1]Credits[/h1]

[url=https://www.flaticon.com/free-icons/denied%22]Denied icons created by Alfredo Creates - Flaticon[/url]

[url=https://www.flaticon.com/free-icons/move%22]Move icons created by Shashank Singh - Flaticon[/url]
