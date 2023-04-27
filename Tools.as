//某些工具性的东西
//--------------------------
//复活
void AdminRespawnPlyaer(CTerrorPlayer@ pPlayer){
  pPlayer.Respawn();
}

//获取武器
void AdminGiveWeapon(string weaponName,CTerrorPlayer@ pPlayer){
	//是否已经拥有此武器了
	if(Utils.StrContains(weaponName,pPlayer.GetCurrentWeapon().GetClassname())){
	  Chat.PrintToChat( pPlayer, "你已拥有"+pPlayer.GetCurrentWeapon().GetClassname()+"！");
	}
	else{
	  pPlayer.GiveWeapon(weaponName);
  }
}

//删除当前武器
void RemoveCurrentItem(CTerrorPlayer@ pPlayer){
  string CurrentItem=pPlayer.GetCurrentWeapon().GetClassname();
  if(Utils.StrEql(CurrentItem,"weapon_phone")){
    Chat.PrintToChat(pPlayer,"你当前拿的是手机！！！删了你他妈用什么看信息！");
    return;
  };
  pPlayer.RemoveWeapon(pPlayer.GetWeaponSlot(CurrentItem));
  Chat.PrintToChat(pPlayer,"武器 }"+pPlayer.GetCurrentWeapon().GetClassname()+"已被删除");
}

//--------------------------
//debug 字符串转十六进制
void printAsHex(string str) {
  string hex = '';
  for (uint i = 0; i < str.length(); i++) {
    hex += formatInt(str[i], 'H') + ' ';
  }
  HostPrintUTF8(hex);
}
