void OnPluginInit()
{
	PluginData::SetVersion( "20220624" );
	PluginData::SetAuthor( "Contagion[CN]" );
	PluginData::SetName( "RespawnToHuman" );
	//hook玩家说话
	Events::Player::PlayerSay.Hook( @PlayerSay );
	//当玩家死后发送提示
	Events::Player::OnPlayerKilled.Hook( @OnPlayerKilled );
}


//当玩家死后发送提示  
HookReturnCode OnPlayerKilled(CTerrorPlayer@ pPlayer, CTakeDamageInfo &in DamageInfo)
{
	Chat.PrintToChat( pPlayer,"{green}服务器：{default}在聊天框输入{green}!respawn{default}复活为人类。");
	return HOOK_CONTINUE;
}

//hook玩家说话  
HookReturnCode PlayerSay(CTerrorPlayer@ pPlayer, CASCommand@ pArgs)
{
	//拿到聊天框内容  
	string message=pArgs.Arg( 1 );
	//判断命令是否是设定的命令  
	if(Utils.StrEql(message,"!respawn"))
	{
    CBasePlayer@ pTerrorBasePlayer = pPlayer.opCast();
    CBaseEntity@ pBaseEntity = pTerrorBasePlayer.opCast();
		pBaseEntity.ChangeTeam(2);
		pPlayer.Respawn();
		Chat.PrintToChat( all,"{default}玩家{green}"+ pBasePlayer.GetPlayerName()+"{default}已复活");
		return HOOK_HANDLED;
	}
	
	return HOOK_CONTINUE;
}
