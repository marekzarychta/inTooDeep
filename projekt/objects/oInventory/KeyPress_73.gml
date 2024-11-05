//if oPlayer.isAlive {
//	opened = !opened;

//	//creation of buttons
//	if opened {
//		//chosing is only inventory open or deposit and inventory open
//		if !global.openedDep {
//			but1 = instance_create_layer(0, 0, "UI", oInvButtonDrop);
//		}
//		else {
//			but1 = instance_create_layer(0, 0, "UI", oInvButtonMove);
//			but1.inInventory = true;
//			oDeposit.but1Dep = instance_create_layer(0, 0, "UI", oInvButtonMove);
//			oDeposit.but1Dep.inInventory = false;

//		}
//	} else {
		
//		//destruction of buttons after closing inventory
//		global.openedDep = false;
//		CloseInventory(id);	
		
//	}
//}