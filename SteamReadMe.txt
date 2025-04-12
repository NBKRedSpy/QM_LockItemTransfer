[h1]I Don't Want That!  (Prevent Item Transfer)[/h1]


Allows the user to mark items so they are not automatically transferred on the corpse recycle or take all commands.
The user can either use the context menu's "Lock" and "Unlock" button, or use the hotkeys.
To use the hotkeys, press F9 when hovering over an item to add or remove it to the blacklist.  Press F11 to clear out the blacklist.

The keys are configurable.

The command can also be added to the Context Menu Hotkeys mod.  See the Context Menus Hotkey Mod section below.

The game's normal drag and drop not affected and and therefore always move the item.

[h1]Polish[/h1]

There are a couple of items to be addressed in the next update:
[list]
[*]
The "modified" icon (M) is used to indicate if something is blacklisted or not.
This visually conflicts with anything that is found that is actually modified.
I don't know if it's even possible to find a modified item in the field.  This is just a placeholder.
[*]
Sometimes the M icon isn't refreshed when marking items and then moving them.  The functionality works, but the UI is not updated.  Closing the inventory and opening it back up will display the correct marks.
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

[h1]Context Menus Hotkey Mod[/h1]

To add the context key to the Context Menus Hotkey mod, add the command "610000".
The configuration for the Context Menus Hotkey mod can be found here:
[i]%UserProfile%\AppData\LocalLow\Magnum Scriptum Ltd\Quasimorph_ModConfigs\QM_ContextMenuHotkeys\QM_ContextMenuHotkeys.json[/i]

For example, to use L, add the following text as the first entry in the [i]"CommandBinds": [[/i] section as such:
[code]
  "CommandBinds": [
    {
      "Key": "L",
      "Command": 610000
    },
[/code]

Command 610000 toggles the lock.  The UI will show Lock/Unlock, but that is for UI purposes.

[h1]Support[/h1]

If you enjoy my mods and want to buy me a coffee, check out my [url=https://ko-fi.com/nbkredspy71915]Ko-Fi[/url] page.
Thanks!

[h1]Source Code[/h1]

Source code is available on GitHub at https://github.com/NBKRedSpy/QM_LockItemTransfer

[h1]Change Log[/h1]

[h2]1.6.1[/h2]
[list]
[*]Moved Lock/Unlock menu item to the bottom of the list.
[/list]

[h2]1.6.0[/h2]
[list]
[*]Added context menu Lock/Unlock command
[/list]

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
