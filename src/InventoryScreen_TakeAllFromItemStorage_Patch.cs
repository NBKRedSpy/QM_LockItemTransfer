using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QM_LockItemTransfer
{
    [HarmonyPatch(typeof(InventoryScreen), nameof(InventoryScreen.TakeAllFromItemStorage))]
    internal static class InventoryScreen_TakeAllFromItemStorage_Patch
    {
        public static void Prefix()
        {
            if (!Inventory_TakeOrEquip_Patch.IsDungeonMode) return;

            Inventory_TakeOrEquip_Patch.PreventMove = true;
        }

        public static void Postfix()
        {
            if (!Inventory_TakeOrEquip_Patch.IsDungeonMode) return;

            Inventory_TakeOrEquip_Patch.PreventMove = false;
        }
    }
}


