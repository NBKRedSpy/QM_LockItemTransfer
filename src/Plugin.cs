using HarmonyLib;
using MGSC;
using QM_LockItemTransfer.Mcm;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.Windows.Speech;
using static QM_LockItemTransfer.Inventory_TakeOrEquip_Patch;

namespace QM_LockItemTransfer
{
    public static class Plugin
    {

        public static ConfigDirectories ConfigDirectories = new ConfigDirectories();

        public static ExcludeItemList ExcludeItemList { get; set; }

        public static ModConfig Config { get; private set; }

        public static Logger Logger { get; private set; } = new Logger();

        private static McmConfiguration McmConfiguration { get; set; }   


        [Hook(ModHookType.AfterConfigsLoaded)]
        public static void AfterConfig(IModContext context)
        {

            Directory.CreateDirectory(ConfigDirectories.AllModsConfigFolder);
            ConfigDirectories = new ConfigDirectories();
            ConfigDirectories.UpgradeModDirectory();

            Directory.CreateDirectory(ConfigDirectories.ModPersistenceFolder);

            Config = ModConfig.LoadConfig(ConfigDirectories.ConfigPath);

            ExcludeItemList = new ExcludeItemList(Path.Combine(ConfigDirectories.ModPersistenceFolder, "ExcludeItems.txt"));
            ExcludeItemList.Load();

            McmConfiguration = new McmConfiguration(Config);
            McmConfiguration.TryConfigure();

            Harmony harmony = new Harmony("nbk_redspy_" + ConfigDirectories.ModAssemblyName);

            PreventMovePatches.Patch(harmony);
            harmony.PatchAll();
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
            if(InputHelper.GetKeyDown(Config.ClearItemListKey))
            {
                ExcludeItemList.Clear();
            }
        }




    }
}
