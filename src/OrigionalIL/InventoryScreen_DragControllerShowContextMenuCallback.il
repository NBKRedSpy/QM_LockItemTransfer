.method private hidebysig 
	instance void DragControllerShowContextMenuCallback (
		class MGSC.ItemSlot obj
	) cil managed 
{
	// Method begins at RVA 0xab2ac
	// Header size: 12
	// Code size: 1130 (0x46a)
	.maxstack 4
	.locals init (
		[0] valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0',
		[1] class MGSC.BasePickupItem,
		[2] class MGSC.BreakableItemComponent,
		[3] bool,
		[4] class MGSC.WeaponComponent,
		[5] class MGSC.WeaponRecord,
		[6] bool,
		[7] int32,
		[8] class MGSC.ConsumableRecord,
		[9] valuetype MGSC.ItemClass,
		[10] valuetype MGSC.ItemStorageSource
	)

	// {
	IL_0000: ldloca.s 0
	// int cmdsCount = 0;
	IL_0002: ldc.i4.0
	IL_0003: stfld int32 MGSC.InventoryScreen/'<>c__DisplayClass83_0'::cmdsCount
	// BasePickupItem item = obj.Item;
	IL_0008: ldarg.1
	IL_0009: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
	IL_000e: stloc.1
	// BreakableItemComponent breakableItemComponent = item.Comp<BreakableItemComponent>();
	IL_000f: ldloc.1
	IL_0010: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.BreakableItemComponent>()
	IL_0015: stloc.2
	// bool flag = false;
	IL_0016: ldc.i4.0
	IL_0017: stloc.3
	// WeaponComponent weaponComponent = item.Comp<WeaponComponent>();
	IL_0018: ldloc.1
	IL_0019: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.WeaponComponent>()
	IL_001e: stloc.s 4
	// WeaponRecord weaponRecord = item.Record<WeaponRecord>();
	IL_0020: ldloc.1
	IL_0021: callvirt instance !!0 MGSC.BasePickupItem::Record<class MGSC.WeaponRecord>()
	IL_0026: stloc.s 5
	// CommonContextMenu contextMenu = UI.Get<CommonContextMenu>();
	IL_0028: ldloca.s 0
	IL_002a: call !!0 MGSC.UI::Get<class MGSC.CommonContextMenu>()
	IL_002f: stfld class MGSC.CommonContextMenu MGSC.InventoryScreen/'<>c__DisplayClass83_0'::contextMenu
	// _contextMenuItemSlot = obj;
	IL_0034: ldarg.0
	IL_0035: ldarg.1
	IL_0036: stfld class MGSC.ItemSlot MGSC.InventoryScreen::_contextMenuItemSlot
	// bool flag2 = false;
	IL_003b: ldc.i4.0
	IL_003c: stloc.s 6
	// if (item.Locked || item.IsImplicit)
	IL_003e: ldloc.1
	IL_003f: callvirt instance bool MGSC.BasePickupItem::get_Locked()
	IL_0044: brtrue.s IL_004e

	IL_0046: ldloc.1
	IL_0047: callvirt instance bool MGSC.BasePickupItem::get_IsImplicit()
	IL_004c: brfalse.s IL_004f

	// }
	IL_004e: ret

	// if (SingletonMonoBehaviour<InputController>.Instance.Mode != InputController.InputMode.KeyboardAndMouse)
	IL_004f: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.InputController>::get_Instance()
	IL_0054: callvirt instance valuetype MGSC.InputController/InputMode MGSC.InputController::get_Mode()
	IL_0059: ldc.i4.1
	IL_005a: beq.s IL_0094

	// flag = true;
	IL_005c: ldc.i4.1
	IL_005d: stloc.3
	// (no C# code)
	IL_005e: ldloc.0
	IL_005f: ldfld int32 MGSC.InventoryScreen/'<>c__DisplayClass83_0'::cmdsCount
	IL_0064: stloc.s 7
	// cmdsCount++;
	IL_0066: ldloca.s 0
	IL_0068: ldloc.s 7
	IL_006a: ldc.i4.1
	IL_006b: add
	IL_006c: stfld int32 MGSC.InventoryScreen/'<>c__DisplayClass83_0'::cmdsCount
	// contextMenu.SetupCommand(Localization.Get($"ui.context.{ContextMenuCommand.Take}"), 20);
	IL_0071: ldloc.0
	IL_0072: ldfld class MGSC.CommonContextMenu MGSC.InventoryScreen/'<>c__DisplayClass83_0'::contextMenu
	IL_0077: ldstr "ui.context.{0}"
	IL_007c: ldc.i4.1
	IL_007d: box MGSC.ContextMenuCommand
	IL_0082: call string [mscorlib]System.String::Format(string, object)
	IL_0087: call string MGSC.Localization::Get(string)
	IL_008c: ldc.i4.s 20
	IL_008e: ldc.i4.1
	IL_008f: callvirt instance void MGSC.CommonContextMenu::SetupCommand(string, int32, bool)

	// if (item.Is<FixationMedicineRecord>())
	IL_0094: ldloc.1
	IL_0095: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.FixationMedicineRecord>()
	IL_009a: brfalse.s IL_00a4

	// SetupCommand(ContextMenuCommand.FixWound);
	IL_009c: ldc.i4.8
	IL_009d: ldloca.s 0
	IL_009f: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (item.Is<ConsumableRecord>())
	IL_00a4: ldloc.1
	IL_00a5: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.ConsumableRecord>()
	IL_00aa: brfalse IL_0151

	// ConsumableRecord consumableRecord = item.Record<ConsumableRecord>();
	IL_00af: ldloc.1
	IL_00b0: callvirt instance !!0 MGSC.BasePickupItem::Record<class MGSC.ConsumableRecord>()
	IL_00b5: stloc.s 8
	// flag2 = true;
	IL_00b7: ldc.i4.1
	IL_00b8: stloc.s 6
	// ItemClass itemClass = consumableRecord.ItemClass;
	IL_00ba: ldloc.s 8
	IL_00bc: callvirt instance valuetype MGSC.ItemClass MGSC.ItemRecord::get_ItemClass()
	IL_00c1: stloc.s 9
	// if (itemClass == ItemClass.Alcohol || itemClass == ItemClass.Food || itemClass == ItemClass.Drink || itemClass == ItemClass.Pills)
	IL_00c3: ldloc.s 9
	IL_00c5: ldc.i4.s 12
	IL_00c7: beq.s IL_00db

	IL_00c9: ldloc.s 9
	IL_00cb: ldc.i4.s 10
	IL_00cd: beq.s IL_00db

	IL_00cf: ldloc.s 9
	IL_00d1: ldc.i4.s 11
	IL_00d3: beq.s IL_00db

	IL_00d5: ldloc.s 9
	IL_00d7: ldc.i4.s 13
	IL_00d9: bne.un.s IL_0149

	// if (_creatures != null && _creatures.Player.CreatureData.EffectsController.HasAnyEffect<WoundEffectNoFood>())
	IL_00db: ldarg.0
	IL_00dc: ldfld class MGSC.Creatures MGSC.InventoryScreen::_creatures
	IL_00e1: brfalse.s IL_012b

	IL_00e3: ldarg.0
	IL_00e4: ldfld class MGSC.Creatures MGSC.InventoryScreen::_creatures
	IL_00e9: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_00ee: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_00f3: ldfld class MGSC.EffectsController MGSC.CreatureData::EffectsController
	IL_00f8: callvirt instance bool MGSC.EffectsController::HasAnyEffect<class MGSC.WoundEffectNoFood>()
	IL_00fd: brfalse.s IL_012b

	// (no C# code)
	IL_00ff: ldloc.0
	IL_0100: ldfld int32 MGSC.InventoryScreen/'<>c__DisplayClass83_0'::cmdsCount
	IL_0105: stloc.s 7
	// cmdsCount++;
	IL_0107: ldloca.s 0
	IL_0109: ldloc.s 7
	IL_010b: ldc.i4.1
	IL_010c: add
	IL_010d: stfld int32 MGSC.InventoryScreen/'<>c__DisplayClass83_0'::cmdsCount
	// contextMenu.SetupCommand(Localization.Get("ui.context.no_food"), 7, interactable: false);
	IL_0112: ldloc.0
	IL_0113: ldfld class MGSC.CommonContextMenu MGSC.InventoryScreen/'<>c__DisplayClass83_0'::contextMenu
	IL_0118: ldstr "ui.context.no_food"
	IL_011d: call string MGSC.Localization::Get(string)
	IL_0122: ldc.i4.7
	IL_0123: ldc.i4.0
	IL_0124: callvirt instance void MGSC.CommonContextMenu::SetupCommand(string, int32, bool)
	// SetupCommand(ContextMenuCommand.Eat);
	IL_0129: br.s IL_0133

	IL_012b: ldc.i4.7
	IL_012c: ldloca.s 0
	IL_012e: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (consumableRecord.ItemClass == ItemClass.Drink)
	IL_0133: ldloc.s 8
	IL_0135: callvirt instance valuetype MGSC.ItemClass MGSC.ItemRecord::get_ItemClass()
	IL_013a: ldc.i4.s 11
	IL_013c: bne.un.s IL_0151

	// SetupCommand(ContextMenuCommand.RemoveFire);
	IL_013e: ldc.i4.s 19
	IL_0140: ldloca.s 0
	IL_0142: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)
	// SetupCommand(ContextMenuCommand.Use);
	IL_0147: br.s IL_0151

	IL_0149: ldc.i4.4
	IL_014a: ldloca.s 0
	IL_014c: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (item.Is<RepairRecord>())
	IL_0151: ldloc.1
	IL_0152: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.RepairRecord>()
	IL_0157: brfalse.s IL_0162

	// SetupCommand(ContextMenuCommand.Repair);
	IL_0159: ldc.i4.s 13
	IL_015b: ldloca.s 0
	IL_015d: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (item.Is<SkullRecord>() && !_creatures.Player.Mercenary.CreatureData.HasUltimate)
	IL_0162: ldloc.1
	IL_0163: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.SkullRecord>()
	IL_0168: brfalse.s IL_018f

	IL_016a: ldarg.0
	IL_016b: ldfld class MGSC.Creatures MGSC.InventoryScreen::_creatures
	IL_0170: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_0175: callvirt instance class MGSC.Mercenary MGSC.Player::get_Mercenary()
	IL_017a: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
	IL_017f: ldfld bool MGSC.CreatureData::HasUltimate
	IL_0184: brtrue.s IL_018f

	// SetupCommand(ContextMenuCommand.ApplySkull);
	IL_0186: ldc.i4.s 17
	IL_0188: ldloca.s 0
	IL_018a: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (item.Is<DeviceRecord>())
	IL_018f: ldloc.1
	IL_0190: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.DeviceRecord>()
	IL_0195: brfalse.s IL_01dd

	// if (item.Record<DeviceRecord>().UseEffect.ContainsKey("BreakPact"))
	IL_0197: ldloc.1
	IL_0198: callvirt instance !!0 MGSC.BasePickupItem::Record<class MGSC.DeviceRecord>()
	IL_019d: callvirt instance class [mscorlib]System.Collections.Generic.Dictionary`2<string, float32> MGSC.DeviceRecord::get_UseEffect()
	IL_01a2: ldstr "BreakPact"
	IL_01a7: callvirt instance bool class [mscorlib]System.Collections.Generic.Dictionary`2<string, float32>::ContainsKey(!0)
	IL_01ac: brfalse.s IL_01d5

	// if (_creatures.Player.Mercenary.CreatureData.HasUltimate)
	IL_01ae: ldarg.0
	IL_01af: ldfld class MGSC.Creatures MGSC.InventoryScreen::_creatures
	IL_01b4: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_01b9: callvirt instance class MGSC.Mercenary MGSC.Player::get_Mercenary()
	IL_01be: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
	IL_01c3: ldfld bool MGSC.CreatureData::HasUltimate
	IL_01c8: brfalse.s IL_01dd

	// SetupCommand(ContextMenuCommand.RemoveSkull);
	IL_01ca: ldc.i4.s 18
	IL_01cc: ldloca.s 0
	IL_01ce: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)
	// SetupCommand(ContextMenuCommand.Use);
	IL_01d3: br.s IL_01dd

	IL_01d5: ldc.i4.4
	IL_01d6: ldloca.s 0
	IL_01d8: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (item.Is<ExpGainerRecord>() && !flag2)
	IL_01dd: ldloc.1
	IL_01de: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.ExpGainerRecord>()
	IL_01e3: brfalse.s IL_01f4

	IL_01e5: ldloc.s 6
	IL_01e7: brtrue.s IL_01f4

	// flag2 = true;
	IL_01e9: ldc.i4.1
	IL_01ea: stloc.s 6
	// SetupCommand(ContextMenuCommand.Use);
	IL_01ec: ldc.i4.4
	IL_01ed: ldloca.s 0
	IL_01ef: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (!flag2 && !_raidMetadata.StationVisit && item.Is<PlaceableDeviceRecord>() && !item.IsUseRestricted)
	IL_01f4: ldloc.s 6
	IL_01f6: brtrue.s IL_0220

	IL_01f8: ldarg.0
	IL_01f9: ldfld class MGSC.RaidMetadata MGSC.InventoryScreen::_raidMetadata
	IL_01fe: callvirt instance bool MGSC.RaidMetadata::get_StationVisit()
	IL_0203: brtrue.s IL_0220

	// (no C# code)
	IL_0205: ldloc.1
	IL_0206: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.PlaceableDeviceRecord>()
	IL_020b: brfalse.s IL_0220

	// flag2 = true;
	IL_020d: ldloc.1
	IL_020e: callvirt instance bool MGSC.BasePickupItem::get_IsUseRestricted()
	IL_0213: brtrue.s IL_0220

	IL_0215: ldc.i4.1
	IL_0216: stloc.s 6
	// SetupCommand(ContextMenuCommand.Use);
	IL_0218: ldc.i4.4
	IL_0219: ldloca.s 0
	IL_021b: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (item.Storage.Source == ItemStorageSource.Floor || item.Storage.Source == ItemStorageSource.Object || item.Storage.Source == ItemStorageSource.StationCargo || item.Storage.Source == ItemStorageSource.ShipCargo)
	IL_0220: ldloc.1
	IL_0221: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
	IL_0226: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
	IL_022b: brfalse.s IL_025c

	IL_022d: ldloc.1
	IL_022e: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
	IL_0233: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
	IL_0238: ldc.i4.s 10
	IL_023a: beq.s IL_025c

	IL_023c: ldloc.1
	IL_023d: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
	IL_0242: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
	IL_0247: ldc.i4.s 12
	IL_0249: beq.s IL_025c

	IL_024b: ldloc.1
	IL_024c: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
	IL_0251: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
	IL_0256: ldc.i4.s 11
	IL_0258: ceq
	IL_025a: br.s IL_025d

	// if (!flag)
	IL_025c: ldc.i4.1

	IL_025d: brfalse.s IL_02aa

	IL_025f: ldloc.3
	IL_0260: brtrue.s IL_026a

	// SetupCommand(ContextMenuCommand.Take);
	IL_0262: ldc.i4.1
	IL_0263: ldloca.s 0
	IL_0265: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (item.Is<ArmorRecord>() || item.Is<VestRecord>() || item.Is<HelmetRecord>() || item.Is<BackpackRecord>() || item.Is<BootsRecord>() || item.Is<LeggingsRecord>())
	IL_026a: ldloc.1
	IL_026b: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.ArmorRecord>()
	IL_0270: brtrue.s IL_029d

	IL_0272: ldloc.1
	IL_0273: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.VestRecord>()
	IL_0278: brtrue.s IL_029d

	// (no C# code)
	IL_027a: ldloc.1
	IL_027b: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.HelmetRecord>()
	IL_0280: brtrue.s IL_029d

	IL_0282: ldloc.1
	IL_0283: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.BackpackRecord>()
	IL_0288: brtrue.s IL_029d

	IL_028a: ldloc.1
	IL_028b: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.BootsRecord>()
	IL_0290: brtrue.s IL_029d

	// SetupCommand(ContextMenuCommand.Equip);
	IL_0292: ldloc.1
	IL_0293: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.LeggingsRecord>()
	IL_0298: brfalse IL_0333

	IL_029d: ldc.i4.2
	IL_029e: ldloca.s 0
	IL_02a0: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)
	// else if (item.Is<WeaponRecord>() || item.Is<ArmorRecord>() || item.Is<VestRecord>() || item.Is<HelmetRecord>() || item.Is<BackpackRecord>() || item.Is<LeggingsRecord>() || item.Is<BootsRecord>())
	IL_02a5: br IL_0333

	IL_02aa: ldloc.1
	IL_02ab: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.WeaponRecord>()
	IL_02b0: brtrue.s IL_02e2

	IL_02b2: ldloc.1
	IL_02b3: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.ArmorRecord>()
	IL_02b8: brtrue.s IL_02e2

	// (no C# code)
	IL_02ba: ldloc.1
	IL_02bb: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.VestRecord>()
	IL_02c0: brtrue.s IL_02e2

	IL_02c2: ldloc.1
	IL_02c3: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.HelmetRecord>()
	IL_02c8: brtrue.s IL_02e2

	IL_02ca: ldloc.1
	IL_02cb: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.BackpackRecord>()
	IL_02d0: brtrue.s IL_02e2

	IL_02d2: ldloc.1
	IL_02d3: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.LeggingsRecord>()
	IL_02d8: brtrue.s IL_02e2

	// ItemStorageSource source = item.Storage.Source;
	IL_02da: ldloc.1
	IL_02db: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.BootsRecord>()
	IL_02e0: brfalse.s IL_0333

	IL_02e2: ldloc.1
	IL_02e3: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
	IL_02e8: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
	IL_02ed: stloc.s 10
	// if (source == ItemStorageSource.WeaponSlot || source == ItemStorageSource.ArmorSlot || source == ItemStorageSource.VestSlot || source == ItemStorageSource.HelmetSlot || source == ItemStorageSource.BackpackSlot || source == ItemStorageSource.LeggingsSlot || source == ItemStorageSource.BootsSlot)
	IL_02ef: ldloc.s 10
	IL_02f1: ldc.i4.3
	IL_02f2: beq.s IL_0313

	IL_02f4: ldloc.s 10
	IL_02f6: ldc.i4.7
	IL_02f7: beq.s IL_0313

	IL_02f9: ldloc.s 10
	IL_02fb: ldc.i4.4
	IL_02fc: beq.s IL_0313

	IL_02fe: ldloc.s 10
	IL_0300: ldc.i4.6
	IL_0301: beq.s IL_0313

	IL_0303: ldloc.s 10
	IL_0305: ldc.i4.5
	IL_0306: beq.s IL_0313

	IL_0308: ldloc.s 10
	IL_030a: ldc.i4.8
	IL_030b: beq.s IL_0313

	IL_030d: ldloc.s 10
	IL_030f: ldc.i4.s 9
	IL_0311: bne.un.s IL_031d

	// SetupCommand(ContextMenuCommand.Unequip);
	IL_0313: ldc.i4.3
	IL_0314: ldloca.s 0
	IL_0316: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)
	// else if (item.Storage.Source != ItemStorageSource.WeaponSlot)
	IL_031b: br.s IL_0333

	IL_031d: ldloc.1
	IL_031e: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
	IL_0323: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
	IL_0328: ldc.i4.3
	IL_0329: beq.s IL_0333

	// SetupCommand(ContextMenuCommand.Equip);
	IL_032b: ldc.i4.2
	IL_032c: ldloca.s 0
	IL_032e: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (item.Id.Equals("gas_ammo"))
	IL_0333: ldloc.1
	IL_0334: callvirt instance string MGSC.BasePickupItem::get_Id()
	IL_0339: ldstr "gas_ammo"
	IL_033e: callvirt instance bool [mscorlib]System.String::Equals(string)
	IL_0343: brfalse.s IL_0360

	// SetupCommand(ContextMenuCommand.SpillOnTheFloorX1);
	IL_0345: ldc.i4.s 15
	IL_0347: ldloca.s 0
	IL_0349: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)
	// if (item.StackCount >= 5)
	IL_034e: ldloc.1
	IL_034f: callvirt instance int16 MGSC.BasePickupItem::get_StackCount()
	IL_0354: ldc.i4.5
	IL_0355: blt.s IL_0360

	// SetupCommand(ContextMenuCommand.SpillOnTheFloorX5);
	IL_0357: ldc.i4.s 16
	IL_0359: ldloca.s 0
	IL_035b: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (weaponComponent != null)
	IL_0360: ldloc.s 4
	IL_0362: brfalse.s IL_03e1

	// if (weaponComponent.NeedReload && !breakableItemComponent.IsBroken && item.Equals(_creatures.Player.CreatureData.Inventory.CurrentWeapon))
	IL_0364: ldloc.s 4
	IL_0366: callvirt instance bool MGSC.WeaponComponent::get_NeedReload()
	IL_036b: brfalse.s IL_039f

	IL_036d: ldloc.2
	IL_036e: callvirt instance bool MGSC.BreakableItemComponent::get_IsBroken()
	IL_0373: brtrue.s IL_039f

	// SetupCommand(ContextMenuCommand.Reload);
	IL_0375: ldloc.1
	IL_0376: ldarg.0
	IL_0377: ldfld class MGSC.Creatures MGSC.InventoryScreen::_creatures
	IL_037c: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_0381: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0386: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
	IL_038b: callvirt instance class MGSC.BasePickupItem MGSC.Inventory::get_CurrentWeapon()
	IL_0390: callvirt instance bool [mscorlib]System.Object::Equals(object)
	IL_0395: brfalse.s IL_039f

	IL_0397: ldc.i4.5
	IL_0398: ldloca.s 0
	IL_039a: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (weaponComponent.RequireAmmo && weaponComponent.CurrentAmmo > 0)
	IL_039f: ldloc.s 4
	IL_03a1: callvirt instance bool MGSC.WeaponComponent::get_RequireAmmo()
	IL_03a6: brfalse.s IL_03ba

	IL_03a8: ldloc.s 4
	IL_03aa: callvirt instance int16 MGSC.WeaponComponent::get_CurrentAmmo()
	IL_03af: ldc.i4.0
	IL_03b0: ble.s IL_03ba

	// SetupCommand(ContextMenuCommand.UnloadAmmo);
	IL_03b2: ldc.i4.6
	IL_03b3: ldloca.s 0
	IL_03b5: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (weaponRecord.MeleeCanAmputate && !breakableItemComponent.IsBroken && !_raidMetadata.StationVisit)
	IL_03ba: ldloc.s 5
	IL_03bc: callvirt instance bool MGSC.WeaponRecord::get_MeleeCanAmputate()
	IL_03c1: brfalse.s IL_03e1

	IL_03c3: ldloc.2
	IL_03c4: callvirt instance bool MGSC.BreakableItemComponent::get_IsBroken()
	IL_03c9: brtrue.s IL_03e1

	// SetupCommand(ContextMenuCommand.Amputate);
	IL_03cb: ldarg.0
	IL_03cc: ldfld class MGSC.RaidMetadata MGSC.InventoryScreen::_raidMetadata
	IL_03d1: callvirt instance bool MGSC.RaidMetadata::get_StationVisit()
	IL_03d6: brtrue.s IL_03e1

	IL_03d8: ldc.i4.s 9
	IL_03da: ldloca.s 0
	IL_03dc: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (item.IsStackable && item.StackCount > 1)
	IL_03e1: ldloc.1
	IL_03e2: callvirt instance bool MGSC.BasePickupItem::get_IsStackable()
	IL_03e7: brfalse.s IL_03fe

	IL_03e9: ldloc.1
	IL_03ea: callvirt instance int16 MGSC.BasePickupItem::get_StackCount()
	IL_03ef: ldc.i4.1
	IL_03f0: ble.s IL_03fe

	// contextMenu.AddSplitStacksCommand(item);
	IL_03f2: ldloc.0
	IL_03f3: ldfld class MGSC.CommonContextMenu MGSC.InventoryScreen/'<>c__DisplayClass83_0'::contextMenu
	IL_03f8: ldloc.1
	IL_03f9: callvirt instance void MGSC.CommonContextMenu::AddSplitStacksCommand(class MGSC.BasePickupItem)

	// if (ItemInteractionSystem.CanDisassemble(item))
	IL_03fe: ldloc.1
	IL_03ff: call bool MGSC.ItemInteractionSystem::CanDisassemble(class MGSC.BasePickupItem)
	IL_0404: brfalse.s IL_0434

	// if (item.IsStackable && item.StackCount > 1)
	IL_0406: ldloc.1
	IL_0407: callvirt instance bool MGSC.BasePickupItem::get_IsStackable()
	IL_040c: brfalse.s IL_042b

	IL_040e: ldloc.1
	IL_040f: callvirt instance int16 MGSC.BasePickupItem::get_StackCount()
	IL_0414: ldc.i4.1
	IL_0415: ble.s IL_042b

	// SetupCommand(ContextMenuCommand.DisassembleX1);
	IL_0417: ldc.i4.s 12
	IL_0419: ldloca.s 0
	IL_041b: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)
	// SetupCommand(ContextMenuCommand.DisassembleAll);
	IL_0420: ldc.i4.s 11
	IL_0422: ldloca.s 0
	IL_0424: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)
	// SetupCommand(ContextMenuCommand.Disassemble);
	IL_0429: br.s IL_0434

	IL_042b: ldc.i4.s 10
	IL_042d: ldloca.s 0
	IL_042f: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (item.Storage.Source != 0)
	IL_0434: ldloc.1
	IL_0435: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
	IL_043a: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
	IL_043f: brfalse.s IL_0449

	// SetupCommand(ContextMenuCommand.Drop);
	IL_0441: ldc.i4.0
	IL_0442: ldloca.s 0
	IL_0444: call void MGSC.InventoryScreen::'<DragControllerShowContextMenuCallback>g__SetupCommand|83_0'(valuetype MGSC.ContextMenuCommand, valuetype MGSC.InventoryScreen/'<>c__DisplayClass83_0'&)

	// if (cmdsCount > 0)
	IL_0449: ldloc.0
	IL_044a: ldfld int32 MGSC.InventoryScreen/'<>c__DisplayClass83_0'::cmdsCount
	IL_044f: ldc.i4.0
	IL_0450: ble.s IL_0469

	// 		UI.Chain<CommonContextMenu>().Show().SetBackgroundOrder(-1)
	// 			.SetBackOnBackgroundClick(value: true);
	IL_0452: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.CommonContextMenu>()
	IL_0457: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.CommonContextMenu>::Show()
	IL_045c: ldc.i4.m1
	IL_045d: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.CommonContextMenu>::SetBackgroundOrder(int32)
	IL_0462: ldc.i4.1
	IL_0463: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.CommonContextMenu>::SetBackOnBackgroundClick(bool)
	IL_0468: pop

	// (no C# code)
	IL_0469: ret
} // end of method InventoryScreen::DragControllerShowContextMenuCallback
