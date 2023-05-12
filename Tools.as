//某些工具性的东西
//----------function----------
//CTerrorPlayer->CBaseEntity 官方给的，原理不明
CBaseEntity@ ToBaseEntity( CTerrorPlayer@ pPlayer )
{
	CBasePlayer@ pBasePlayer = pPlayer.opCast();
	CBaseEntity@ pEntityPlayer = pBasePlayer.opCast();
	return pEntityPlayer;
}

//复活成人类
//官方的复活带BUG无法直接复活成为人类。
void RespawnToHuman(CTerrorPlayer@ pPlayer){
	CBaseEntity@ pBaseEntity=CBaseEntity@ ToBaseEntity(pPlayer);
	pBaseEntity.ChangeTeam(2);
	pBaseEntity.Respawn();
}

//----------debug----------
