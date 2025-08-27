using HarmonyLib;
using ModConfigMenu;
using ModConfigMenu.Objects;
using System;
using System.CodeDom;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml;
using UnityEngine;

namespace QM_LockItemTransfer.Mcm
{
    internal class McmConfiguration : McmConfigurationBase
    {

        public McmConfiguration(ModConfig config) : base (config) { }

        public override void Configure()
        {
            ModConfig defaults = new ModConfig();

            ModConfigMenuAPI.RegisterModConfig("Lock Item Transfer", new List<ConfigValue>()
            {
                CreateReadOnly(nameof(ModConfig.LockItemKey)),
                CreateReadOnly(nameof(ModConfig.ClearItemListKey)),
            }, OnSave);
        }
         
    }
}
