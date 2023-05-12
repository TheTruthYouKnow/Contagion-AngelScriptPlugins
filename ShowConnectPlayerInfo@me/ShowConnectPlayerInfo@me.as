//功能：显示进入/退出的玩家的昵称，steamID和IP地址

void OnPluginInit()
{
	PluginData::SetVersion( "20220810" );
	PluginData::SetAuthor( "Contagion[CN]" );
	PluginData::SetName( "显示进入玩家信息" );
  //当有玩家进入游戏
	Events::Player::OnPlayerConnected.Hook( @OnPlayerConnected );
  //当玩家退出游戏
	Events::Player::OnPlayerDisconnected.Hook( @OnPlayerDisconnected );
}


HookReturnCode OnPlayerConnected( CTerrorPlayer@ pPlayer )
{
  //获取玩家IP
  string IP = pPlayer.GrabIP();
  //获取玩家的Ping
  int ping=pPlayer.GrabPing();
  //通过ping范围显示颜色 1~50：绿色。50~100：橙色。100以上：红色
  string playerPing="";
  if(ping<51){
    playerPing="{green}"+ping;
  }else if(50<ping&&ping<101){
    playerPing="{darkorange}"+ping;
  }else{
    playerPing="{red}"+ping;
  }
  //玩家steamID64（长长的一大串，形式是以76开头
  string steamid64=pPlayer.GetSteamID64();
  //玩家steamID32，形式是 STEAMID:数字:数字:一串数字
  string steamid32=Utils.Steam64ToSteam32(steamid64);
	Chat.PrintToChat(all,"{green}[加入游戏]{normal}玩家："+pPlayer.GetPlayerName()+" IP："+IP+" Ping:"+playerPing);
	return HOOK_CONTINUE;
}


HookReturnCode OnPlayerDisconnected( CTerrorPlayer@ pPlayer )
{
  //获取玩家IP
  string IP = pPlayer.GrabIP();
  //获取玩家的Ping
  int ping=pPlayer.GrabPing();
  //通过ping范围显示颜色 1~50：绿色。50~100：橙色。100以上：红色
  string playerPing="";
  if(ping<51){
    playerPing="{green}"+ping;
  }else if(50<ping&&ping<101){
    playerPing="{darkorange}"+ping;
  }else{
    playerPing="{red}"+ping;
  }
  //玩家steamID64（长长的一大串，形式是以76开头
  string steamid64=pPlayer.GetSteamID64();
  //玩家steamID32，形式是 STEAMID:数字:数字:一串数字
  string steamid32=Utils.Steam64ToSteam32(steamid64);
	Chat.PrintToChat(all,"{green}[退出游戏]{normal}玩家："+pPlayer.GetPlayerName()+" IP："+IP+" Ping:"+playerPing);
	return HOOK_CONTINUE;
}
