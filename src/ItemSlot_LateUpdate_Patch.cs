
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
    [HarmonyPatch(typeof(ItemSlot), nameof(ItemSlot.LateUpdate))]
    internal static class ItemSlot_LateUpdate_Patch
    {


        /// <summary>
        /// Adds the "Add/Remove when hovering over item" functionality.
        /// </summary>
        /// <param name="__instance"></param>
        public static void Prefix(ItemSlot __instance)
        {

            if (!Inventory_TakeOrEquip_Patch.IsDungeonMode) return;

            if (__instance.IsPointerInside == false || UI.Drag.IsDragging)
            {
                return;
            }

            
            if (!InputHelper.GetKeyDown(Plugin.Config.LockItemKey)) return;

            string id = __instance.Item?.Id;
            if (id == null) return;

            ItemToggleUtility.ToggleAndSave(id, __instance);
}

    }

}

