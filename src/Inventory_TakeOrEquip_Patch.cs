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
    [HarmonyPatch(typeof(Inventory), nameof(Inventory.TakeOrEquip))]
    internal class Inventory_TakeOrEquip_Patch
    {

        public static bool IsDungeonMode { get; set; }

        public static bool PreventMove => PreventMoveLevel > 0;


        /// <summary>
        /// The current depth of the disassembly disable code.
        /// Required since some lower items such as disassemble are used 
        /// both individually and part of a larger method.  
        /// </summary>
        public static int PreventMoveLevel { get; set; } = 0;

        public static bool Prefix(BasePickupItem item, ref bool __result)
        {

            //Plugin.Logger.Log($"Item: {item.Id}");
            if (!IsDungeonMode || !PreventMove) return true;


            //Plugin.Logger.Log($"Item: contains check {item.Id}");
            if (Plugin.ExcludeItemList.Items.Contains(item.Id))
            {
                __result = false;
                return false;
            }

            return true;
        }
    }
}
