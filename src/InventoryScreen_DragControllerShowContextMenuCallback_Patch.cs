﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Security.Policy;
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
        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {

            //Goal:
            //  Add a simple call to this class's InjectCommandAtEnd() after the last menu item is called.
            //
            //  Most of the work below is being very sure we are finding the code before the game's Show() work
            //  starts.

            List<CodeInstruction> original = instructions.ToList();

            //Utils.LogIL(origional, @"c:\work\before.il");

            //--Look for this code:
            //  if (cmdsCount > 0)
            //  {
            //      UI.Chain<CommonContextMenu>().Show().SetBackgroundOrder(-1)
            //          .SetBackOnBackgroundClick(value: true);
            //  }

            List<CodeInstruction> result = new CodeMatcher(original)
                .MatchStartForward(
                //There is only context menu Show(), so it is currently safe to just search for that call.
                new CodeMatch(OpCodes.Callvirt,
                    typeof(MGSC.UI.CmdChain<CommonContextMenu>).Method(nameof(MGSC.UI.CmdChain<CommonContextMenu>.Show)))
                )
                .ThrowIfNotMatch("Did not find Show() block")
                //Call the InjectCommandAtEnd() before the "cmdsCount" check since that will be after the last
                //  menu item was added, but before the menu is shown.
                .Advance(-1)
                .Insert(
                    CodeInstruction.LoadArgument(1),    //The ItemSlot argument
                    CodeInstruction.Call(() => InventoryScreen_DragControllerShowContextMenuCallback_Patch.InjectCommandAtEnd(default))
                )
                .InstructionEnumeration()
                .ToList();

            return result;

        }

        /// <summary>
        /// Called after the last menu item is added and before the context menu is shown.
        /// </summary>
        /// <param name="itemSlot"></param>
        public static void InjectCommandAtEnd(ItemSlot itemSlot)
        {
            string label = Plugin.ExcludeItemList.Items.Contains(itemSlot.Item.Id) ? "Unlock" : "Lock";

            UI.Get<CommonContextMenu>().SetupCommand(label, (int)ContextMenuCommand.Toggle);
        }
    }



}
