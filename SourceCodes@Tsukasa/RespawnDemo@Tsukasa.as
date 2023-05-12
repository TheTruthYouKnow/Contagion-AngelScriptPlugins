void OnPluginInit()
{
	PluginData::SetVersion("20220627");
	PluginData::SetAuthor("Tsukasa");
	PluginData::SetName("Respawn");
  //当玩家死亡
	Events::Player::OnPlayerKilledPost.Hook( @OnPlayerKilledPost );
}

HookReturnCode OnPlayerKilledPost(CTerrorPlayer@ pPlayer)
{
	//CTerrorPlayer@ pBasePlayer = pPlayer.opCast();
  CBasePlayer@ pTerrorBasePlayer = pPlayer.opCast();
	CBaseEntity@ pBaseEntity = pTerrorBasePlayer.opCast();
  //改变玩家阵营为人类
	pBaseEntity.ChangeTeam(2);
  //复活！
	pPlayer.Respawn();
	return HOOK_CONTINUE;
}

