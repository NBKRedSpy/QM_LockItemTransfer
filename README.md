# I Don't Want That!  (Prevent Item Transfer)

![thumbnail icon](media/thumbnail.png)
Allows the user to mark items so they are not automatically transferred on the corpse recycle or take all commands.

The user can either use the context menu's "Lock" and "Unlock" button, or use the hotkeys.
To use the hotkeys, press F9 when hovering over an item to add or remove it to the blacklist.  Press F11 to clear out the blacklist.

The keys are configurable.

The command can also be added to the Context Menu Hotkeys mod.  See the [Context Menus Hotkey Mod](#context-menus-hotkey-mod) section below.


The game's normal drag and drop not affected and and therefore always move the item.

# Polish

There are a couple of items to be addressed in the next update:

* The "modified" icon (M) is used to indicate if something is blacklisted or not. 
This visually conflicts with anything that is found that is actually modified.
I don't know if it's even possible to find a modified item in the field.  This is just a placeholder.

* If an item is toggled with the hotkey and there is more than one of that item, the other items will not have the M indicator refreshed.  They are correctly toggled, just not updated until that screen is refreshed in some way. The context menu command is not affected.

# Configuration

The configuration file will be created on the first game run and can be found at `%AppData%\..\LocalLow\Magnum Scriptum Ltd\Quasimorph_ModConfigs\QM_LockItemTransfer\config.json`.

|Name|Default|Description|
|--|--|--|
|LockItemKey|F9|The key to add or remove an item from the blacklist|
|ClearItemListKey|F11|The key to clear out the blacklist|

# Context Menus Hotkey Mod

To add the context key to the Context Menus Hotkey mod, add the command "610000".
The configuration for the Context Menus Hotkey mod can be found here:
```%UserProfile%\AppData\LocalLow\Magnum Scriptum Ltd\Quasimorph_ModConfigs\QM_ContextMenuHotkeys\QM_ContextMenuHotkeys.json```

For example, to use L, add the following text as the first entry in the `"CommandBinds": [` section as such:

```json
  "CommandBinds": [
    {
      "Key": "L",
      "Command": 610000
    },
```    

Command 610000 toggles the lock.  The UI will show Lock/Unlock, but that is for UI purposes.

# Support
If you enjoy my mods and want to buy me a coffee, check out my [Ko-Fi](https://ko-fi.com/nbkredspy71915) page.
Thanks!

# Credits
* Special thanks to Crynano for his excellent Mod Configuration Menu. 

# Source Code
Source code is available on GitHub at https://github.com/NBKRedSpy/QM_LockItemTransfer

# Change Log

## 1.7.0 
* MCM integration.
## 1.6.3
* Fixed M icon not being updated.  Only fixes the context menu command, not the hotkey.

## 1.6.2
* Fixed trash created from eating not being filtered.

## 1.6.1
* Moved Lock/Unlock menu item to the bottom of the list.
## 1.6.0
* Added context menu Lock/Unlock command

# Credits


[Denied icons created by Alfredo Creates - Flaticon](https://www.flaticon.com/free-icons/denied")

[Move icons created by Shashank Singh - Flaticon](https://www.flaticon.com/free-icons/move")

