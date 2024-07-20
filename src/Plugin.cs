using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using static QM_LockItemTransfer.Inventory_TakeOrEquip_Patch;

namespace QM_LockItemTransfer
{
    public static class Plugin
    {
        public static string ModAssemblyName => Assembly.GetExecutingAssembly().GetName().Name;

        public static string ConfigPath => Path.Combine(Application.persistentDataPath, ModAssemblyName, "config.json");
        public static string ModPersistenceFolder => Path.Combine(Application.persistentDataPath, ModAssemblyName);

        public static ExcludeItemList ExcludeItemList { get; set; }

        public static ModConfig Config { get; private set; }


        [Hook(ModHookType.AfterConfigsLoaded)]
        public static void AfterConfig(IModContext context)
        {
            Config = ModConfig.LoadConfig(ConfigPath);

            ExcludeItemList = new ExcludeItemList(Path.Combine(ModPersistenceFolder, "ExcludeItems.txt"));
            ExcludeItemList.Load();

            new Harmony("nbk_redspy_" + ModAssemblyName).PatchAll();
        }


        [Hook(ModHookType.DungeonStarted)]
        public static void DungeonStarted(IModContext context)
        {
            Inventory_TakeOrEquip_Patch.IsDungeonMode = true;
        }



        [Hook(ModHookType.DungeonFinished)]
        public static void DungeonFinished(IModContext context)
        {
            Inventory_TakeOrEquip_Patch.IsDungeonMode = false;

        }

        [Hook(ModHookType.DungeonUpdateAfterGameLoop)]
        public static void DungeonUpdateAfterGameLoop(IModContext context)
        {
            if(Input.GetKeyUp(Config.ClearItemListKey))
            {
                ExcludeItemList.Clear();
            }
        }




    }
}
