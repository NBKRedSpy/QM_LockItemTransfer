using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QM_LockItemTransfer
{
    public static class ItemToggleUtility
    {

        /// <summary>
        /// Toggles the lock status of an item, saves the persistence data,
        /// and updates the itemSlot's status icon
        /// </summary>
        /// <param name="id">The BasePickupItem's identifier string</param>
        /// <returns>true if added</returns>
        public static bool ToggleAndSave(string itemId, ItemSlot itemSlot)
        {
            bool added = Plugin.ExcludeItemList.ToggleAndSave(itemId);
            itemSlot._modifiedIcon.gameObject.SetActive(added);

            return added;
        }
    }
}
