void OnPluginInit()
{
	PluginData::SetVersion( "20220622" );
  //QQ群488061138
	PluginData::SetAuthor( "Contagion[CN]" );
	PluginData::SetName( "无限后备子弹" );
	InfiniteCollectedAmmo();
}



//控制台查找到对应的指令并且修改
void InfiniteCollectedAmmo()
{
  //相关的控制台指令
  //无限体力 sv_infinite_stamina
  //无限子弹不换弹夹 sv_infinite_ammo 
	CASConVarRef@ pInfiniteCollectedAmmo = ConVar::Find( "sv_infinite_collected_ammo" );
	pInfiniteCollectedAmmo.SetValue( "1" );
	Chat.PrintToChat(all, "{green}服务器已开启无限后备子弹");
	
}

void OnPluginUnload()
{
  //卸载插件时候别忘了关闭无限后备子弹
  CASConVarRef@ pInfiniteCollectedAmmo = ConVar::Find( "sv_infinite_collected_ammo" );
	pInfiniteCollectedAmmo.SetValue( "0" );
	Chat.PrintToChat(all, "{green}服务器已关闭无限后备子弹");
}
