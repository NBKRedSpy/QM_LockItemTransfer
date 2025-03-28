using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HarmonyLib;
using MGSC;
using UnityEngine;

namespace QM_LockItemTransfer
{

    [HarmonyPatch(typeof(InventoryScreen), nameof(InventoryScreen.DragControllerShowContextMenuCallback))]
    public static class InventoryScreen_DragControllerShowContextMenuCallback_Patch
    {
        public static void Prefix(InventoryScreen __instance, ItemSlot obj)
        {

            //This game's function only handles the dungeon mode, so no need to check.
            BasePickupItem item = obj.Item;

            //Game's check
            if (item.Locked || item.IsImplicit)
            {
                return;
            }

            //Note - the game's function has a count for the number of command buttons, 
            //  but this is just checked for != to see if it needs to show the menu.
            //
            //  The context menus that this mod is added to always has values,
            //  so no need to mess with the original function's count.
            string label = Plugin.ExcludeItemList.Items.Contains(item.Id) ? "Unlock" : "Lock";

            UI.Get<CommonContextMenu>().SetupCommand(label, (int)ContextMenuCommand.Toggle);
        }
    }
}
