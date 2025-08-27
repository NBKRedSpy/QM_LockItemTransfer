using MGSC;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace QM_LockItemTransfer
{
    public class ModConfig
    {

        [JsonConverter(typeof(StringEnumConverter))]
        public KeyCode LockItemKey { get; set; } = KeyCode.F9;

        [JsonConverter(typeof(StringEnumConverter))]
        public KeyCode ClearItemListKey { get; set; } = KeyCode.F11;

        private static JsonSerializerSettings SerializerSettings = new JsonSerializerSettings()
        {
            Formatting = Formatting.Indented,
        };


        public static ModConfig LoadConfig(string configPath)
        {
            ModConfig config;


            if (File.Exists(configPath))
            {
                try
                {
                    config = JsonConvert.DeserializeObject<ModConfig>(File.ReadAllText(configPath), SerializerSettings);
                    return config;
                }
                catch (Exception ex)
                {
                    Plugin.Logger.LogError(ex,"Error parsing configuration.  Ignoring config file and using defaults");

                    //Not overwriting in case the user just made a typo.
                    config = new ModConfig();
                    return config;
                }
            }
            else
            {
                config = new ModConfig();

                config.Save();

                return config;
            }


        }

        public void Save()
        {
            string json = JsonConvert.SerializeObject(this, SerializerSettings);
            File.WriteAllText(Plugin.ConfigDirectories.ConfigPath, json);
        }
    }
}
