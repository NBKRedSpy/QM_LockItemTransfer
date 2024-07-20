using MGSC;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QM_LockItemTransfer
{

    /// <summary>
    /// The list of items that are to be excluded from transfers.
    /// </summary>
    public class ExcludeItemList 
    {

        public string ConfigPath { get; private set; }  
        public HashSet<string> Items { get;  private set; }

        public ExcludeItemList()
        {
                
        }

        public ExcludeItemList(string filePath)
        {
            if (string.IsNullOrEmpty(filePath))
            {
                throw new ArgumentNullException(nameof(filePath), "filePath must be set");
            }

            ConfigPath = filePath;
        }

        public void Load()
        {
            Directory.CreateDirectory(Path.GetDirectoryName(ConfigPath));

            if (File.Exists(ConfigPath))
            {
                Items = new HashSet<string>(File.ReadLines(ConfigPath));
            }
            else
            {
                //Create the default.
                Items = new HashSet<string>();
                File.WriteAllText(ConfigPath, "");
            }
        }

        public void Save()
        {
            
            Items = new HashSet<string>(Items.ToList().OrderBy(x => x));
            
            File.WriteAllLines(ConfigPath, Items.ToList());
        }

        internal void Clear()
        {
            Items.Clear();
            Save();
        }
    }
}
