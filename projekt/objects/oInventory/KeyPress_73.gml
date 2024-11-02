if oPlayer.isAlive {
	opened = !opened;


	if opened {
		if !global.openedDep {
			but1 = instance_create_layer(0, 0, "UI", oInvButtonDrop);
		}
		else {
			but1 = instance_create_layer(0, 0, "UI", oInvButtonMove);
			but1.inInventory = true;
			oDeposit.but1Dep = instance_create_layer(0, 0, "UI", oInvButtonMove);
			oDeposit.but1Dep.inInventory = false;
		}
	} else {
		global.openedDep = false;
		CloseInventory(id);	
		
	}
}