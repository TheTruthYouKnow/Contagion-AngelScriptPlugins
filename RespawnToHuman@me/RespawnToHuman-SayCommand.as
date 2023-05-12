//功能：玩家复活 
//不知道重新格式化有没有用

//定义人类玩家阵营
const int TEAM_SURVIVORS = 2;

CBaseEntity@ ToBaseEntity( CTerrorPlayer@ pPlayer )
{
	CBasePlayer@ pBasePlayer = pPlayer.opCast();
	CBaseEntity@ pEntityPlayer = pBasePlayer.opCast();
	return pEntityPlayer;
}

void OnPluginInit()
{
	PluginData::SetVersion( "20220624" );
	PluginData::SetAuthor( "Contagion[CN]" );
	PluginData::SetName( "Say_respawn" );
	//hook玩家说话
	Events::Player::PlayerSay.Hook( @PlayerSay );
	//当玩家死后发送提示
	Events::Player::OnPlayerKilled.Hook( @OnPlayerKilled );
}

HookReturnCode OnPlayerKilled(CTerrorPlayer@ pPlayer, CTakeDamageInfo &in DamageInfo)
{
	Chat.PrintToChat( pPlayer,"{default}服务器内测功能：在{red}聊天框{default}输入{green}!respawn{default}复活");
	return HOOK_CONTINUE;
}


HookReturnCode PlayerSay(CTerrorPlayer@ pPlayer, CASCommand@ pArgs)
{

CBaseEntity@ pEntityPlayer = ToBaseEntity(pPlayer);
CBasePlayer@ pBasePlayer = ToBasePlayer(pPlayer.entindex());
	
	//拿到聊天框内容
	string message=pArgs.Arg( 1 );
	//判断命令是否是设定的命令
	if(Utils.StrEql(message,"!respawn"))
	{
		
		if(pEntityPlayer.GetTeamNumber()==TEAM_SURVIVORS)
		{
		Chat.PrintToChat( pPlayer,"{green}你无需复活");
		return HOOK_HANDLED;
		}
		//Chat.PrintToChat( pPlayer,"你当前阵营是{green}"+pEntityPlayer.GetTeamNumber());
		//小强观察者的阵营都是1
		pEntityPlayer.ChangeTeam(TEAM_SURVIVORS);
		pPlayer.Respawn();
		Chat.PrintToChat( all,"{default}玩家{green}"+ pBasePlayer.GetPlayerName()+"{default}已复活");
		return HOOK_HANDLED;
	}
	
	return HOOK_CONTINUE;
}
