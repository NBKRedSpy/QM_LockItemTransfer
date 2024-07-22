using System;
using System.Collections.Generic;
using System.Drawing.Text;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using HarmonyLib;
using MGSC;
using UnityEngine;

namespace QM_LockItemTransfer
{
    public static class PreventMovePatches
    {
        /// <summary>
        /// Signals if the mod should prevent an item from being transferred.
        /// This is a list of functions that have a call that attempts to put an item into a storage.
        /// This is required as there are shared screens between the dungeon and other areas and only the dungeon
        /// versions should be affected.
        /// 
        /// </summary>
        /// <param name="harmony"></param>
        public static void Patch(Harmony harmony)
        {
            harmony.Patch(AccessTools.Method(typeof(InventoryScreen), nameof(InventoryScreen.TakeAllFromCorpse)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Prefix)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Postfix))
                );

            harmony.Patch(AccessTools.Method(typeof(CorpseInventoryView), nameof(CorpseInventoryView.DisassemblyAllItems)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Prefix)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Postfix))
                );

            harmony.Patch(AccessTools.Method(typeof(ItemInteraction), nameof(ItemInteraction.Disassemble)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Prefix)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Postfix))
                );

            harmony.Patch(AccessTools.Method(typeof(InventoryScreen), nameof(InventoryScreen.TakeAllFromItemStorage)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Prefix)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Postfix))
                );

            harmony.Patch(AccessTools.Method(typeof(ItemInteraction), nameof(ItemInteraction.UnloadWeapon)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Prefix)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Postfix))
                );

            harmony.Patch(AccessTools.Method(typeof(CorpseInventoryView), nameof(CorpseInventoryView.AmputateSlot)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Prefix)),
                new HarmonyMethod(typeof(PreventMovePatches), nameof(Postfix))
                );

        }

        public static void Prefix(MethodBase __originalMethod)
        {
            if (!Inventory_TakeOrEquip_Patch.IsDungeonMode) return;


            Inventory_TakeOrEquip_Patch.PreventMoveLevel++;

            //Debug.Log($"Prevent: {__originalMethod.DeclaringType} {__originalMethod.Name} {Inventory_TakeOrEquip_Patch.PreventMoveLevel}");

        }

        public static void Postfix(MethodBase __originalMethod)
        {
            if (!Inventory_TakeOrEquip_Patch.IsDungeonMode) return;

            Inventory_TakeOrEquip_Patch.PreventMoveLevel--;

            //Debug.Log($"Prevent: {__originalMethod.DeclaringType} {__originalMethod.Name} {Inventory_TakeOrEquip_Patch.PreventMoveLevel}");
        }
    }


}
