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
    [HarmonyPatch(typeof(ItemSlot), nameof(ItemSlot.Initialize))]
    internal static class ItemSlot_Initialize_Patch
    {
        public static void Postfix(ItemSlot __instance, BasePickupItem item)
        {

            if (!Inventory_TakeOrEquip_Patch.IsDungeonMode) return;

            if (item == null || !Plugin.ExcludeItemList.Items.Contains(item.Id)) return;


            __instance._modifiedIcon.gameObject.SetActive(true);
        }
    }

}
