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
