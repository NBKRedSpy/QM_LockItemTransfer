using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace QM_LockItemTransfer
{
    [HarmonyPatch(typeof(InventoryScreen), nameof(InventoryScreen.ContextMenuOnCmdSelected))]
    public static class InventoryScreen_ContextMenuOnCmdSelected_Patch
    {
        public static void Prefix(InventoryScreen __instance, int bindValue)
        {
            //The original function passes through if no command matches.  
            //  so no need to abort the call.

            //If the command is disabled, it just won't be shown.  No need to check for dungeon mode.
            if( (ContextMenuCommand) bindValue == ContextMenuCommand.Toggle)
            {
                ItemToggleUtility.ToggleAndSave(__instance._contextMenuItemSlot.Item.Id,
                    __instance._contextMenuItemSlot);

                __instance.RefreshItemsList(true);


            }
        }
    }
}