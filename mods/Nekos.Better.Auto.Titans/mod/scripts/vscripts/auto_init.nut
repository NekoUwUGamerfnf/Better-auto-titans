global function auto_init


void function auto_init() {
#if SERVER
	AddSpawnCallback( "npc_titan", Auto )
	AddCallback_OnTitanBecomesPilot( OnTitanBecomesPilot )
    AddCallback_OnPilotBecomesTitan( onpilot )
#endif
}

#if SERVER
void function ronincore( entity titan )
{
if( IsValid( titan ) )
{
titan.DisableBehavior( "Follow" )
titan.SetAISettings( "npc_titan_stryder_leadwall_shift_core" )
titan.SetBehaviorSelector( "behavior_titan_melee_core" )
}
}

void function OnTitanBecomesPilot( entity player, entity titan )
{
    if( IsValid( titan ) )
	ai( titan )
}

void function OnPilotBecomesTitan( entity player, entity titan )
{
 if( IsValid( player ) )
 {
array <entity> weapons = player.GetMainWeapons()
if ( weapons[0].GetWeaponClassName() != "mp_titanweapon_flightcore_rockets" )
return
if ( !TitanCoreInUse( player ) )
return
TakeWeaponsForArray( player, player.GetMainWeapons() )
player.GiveWeapon("mp_titanweapon_sniper")
entity soul = player.GetTitanSoul()
if ( soul != null )
{
if( SoulHasPassive( soul, ePassives.PAS_NORTHSTAR_WEAPON ) )
player.GetMainWeapons()[0].AddMod( "power_shot" )
if( SoulHasPassive( soul, ePassives.PAS_NORTHSTAR_OPTICS ) )
player.GetMainWeapons()[0].AddMod( "pas_northstar_optics" )
if(GetCurrentPlaylistVarInt("aegis_upgrades", 0) == 1)
{
player.GetMainWeapons()[0].AddMod( "quick_shot" )
player.GetMainWeapons()[0].AddMod( "pas_northstar_weapon" )
player.GetMainWeapons()[0].AddMod( "fd_upgrade_charge" )
player.GetMainWeapons()[0].AddMod( "fd_upgrade_crit" )
}
}
 }
}

void function scorcha( entity titan )
{
if( IsValid( titan ) )
{
titan.SetAISettings( "npc_titan_ogre_meteor" )
titan.SetBehaviorSelector( "behavior_titan_ogre_meteor" )
}
}

void function ronina( entity titan )
{
if( IsValid( titan ) )
{
titan.EnableBehavior( "Follow" )
titan.SetAISettings( "npc_titan_stryder_leadwall" )
titan.SetBehaviorSelector( "behavior_titan_shotgun" )
}
}

void function northstara( entity titan )
{
if( IsValid( titan ) )
{
titan.SetAISettings( "npc_titan_stryder_sniper" )
titan.SetBehaviorSelector( "behavior_titan_sniper" ) 
}
}

void function iona( entity titan )
{
if( IsValid( titan ) )
{
titan.SetAISettings( "npc_titan_atlas_stickybomb" )
titan.SetBehaviorSelector( "behavior_titan_long_range" )
}
}

void function tonea( entity titan )
{
if( IsValid( titan ) )
{
titan.SetAISettings( "npc_titan_atlas_tracker" )
titan.SetBehaviorSelector( "behavior_titan_long_range" )
}
}

void function vanguarda( entity titan )
{
if( IsValid( titan ) )
{
if( titan.GetModelName() != $"models/titans/buddy/titan_buddy.mdl")
{
titan.SetAISettings( "npc_titan_atlas_vanguard" )
titan.SetBehaviorSelector( "behavior_titan_long_range" )
}
}
}

void function legiona( entity titan )
{
if( IsValid( titan ) )
{
titan.SetAISettings( "npc_titan_ogre_minigun" )
titan.SetBehaviorSelector( "behavior_titan_ogre_minigun" )
}
}

void function tone( entity titan )
{
	while( true )
	{
        if( IsValid( titan ) )
		tonea( titan )
        if( !IsValid( titan ) )
        return
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function northstar( entity titan )
{
	while( true )
	{
        if( IsValid( titan ) )
		northstara( titan )
        if( !IsValid( titan ) )
        return
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function scorch( entity titan )
{
	while( true )
	{
        if( IsValid( titan ) )
		scorcha( titan )
        if( !IsValid( titan ) )
        return
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function vanguard( entity titan )
{
	while( true )
	{
        if( IsValid( titan ) )
        {
        if( titan.GetModelName() != $"models/titans/buddy/titan_buddy.mdl")
		vanguarda( titan )
        }
        if( !IsValid( titan ) )
        return
		titan.WaitSignal( "ChangedTitanMode" )
	}
}


void function ion( entity titan )
{
	while( true )
	{
        if( IsValid( titan ) )
		iona( titan )
        if( !IsValid( titan ) )
        return
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function legion( entity titan )
{
	while( true )
	{
        if( IsValid( titan ) )
		legiona( titan )
        if( !IsValid( titan ) )
        return
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function ronin( entity titan )
{
WaitFrame()
	while( true )
	{
        if( IsValid( titan ) )
        {
        if( titan.IsPlayer() || !titan.IsTitan() )
        return
        if( !TitanCoreInUse( titan ) )
		ronina( titan )
        if( TitanCoreInUse( titan ) )
        ronincore( titan )
		WaitFrame()
        }
        if( !IsValid( titan ) )
        return
	}
}

#endif

#if SERVER
void function Auto( entity titan )
{
if( IsValid( titan ) )
{
	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin":  entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ) )
                              {
                              titan.SetAISettings( "npc_titan_stryder_leadwall" )
                              titan.SetBehaviorSelector( "behavior_titan_shotgun" )
                              thread ronin( titan )
                              }
                        break;
		case "scorch":  entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ) ) 
                              {
titan.SetAISettings( "npc_titan_ogre_meteor" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_meteor" )
                               thread scorch( titan )
                               }
                        break;
		case "legion":  entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ) )
                              {
 titan.SetAISettings( "npc_titan_ogre_minigun" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_minigun" )
                               thread legion( titan )
                               }
			break;
		case "ion": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ) )  
                              {
titan.SetAISettings( "npc_titan_atlas_stickybomb" )
                            titan.SetBehaviorSelector( "behavior_titan_long_range" )
                            thread ion( titan )
                            }
                        break;
		case "tone": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ) )
                              {
                              titan.SetAISettings( "npc_titan_atlas_tracker" )
                             titan.SetBehaviorSelector( "behavior_titan_long_range" )
                             thread tone( titan )
                             }
                        break;
		case "vanguard": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ) )
                              {
 titan.SetAISettings( "npc_titan_atlas_vanguard" )
                                 titan.SetBehaviorSelector( "behavior_titan_long_range" )
                                 thread vanguard( titan )
                                 }
                        break;
                case "northstar": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ) )
                              {
                               titan.SetAISettings( "npc_titan_stryder_sniper" )
                                  titan.SetBehaviorSelector( "behavior_titan_sniper" )
                                  thread northstar( titan )
                                  }  
                             break;
              }
titan.SetCapabilityFlag( bits_CAP_SYNCED_MELEE_ATTACK, false )
}
}
#endif

#if SERVER
void function onpilot( entity player, entity titan )
{
if( IsValid( titan ) )
{
	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
                case "northstar": thread OnPilotBecomesTitan ( player, titan )
                             break;
              }
}
}
#endif

#if SERVER
void function ai( entity titan )
{
if( IsValid( titan ) )
{
	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin": titan.SetAISettings( "npc_titan_stryder_leadwall" )
                              titan.SetBehaviorSelector( "behavior_titan_shotgun" )
                              thread ronin( titan )
                        break;
		case "scorch": titan.SetAISettings( "npc_titan_ogre_meteor" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_meteor" )
                               thread scorch( titan )
                        break;
		case "legion": titan.SetAISettings( "npc_titan_ogre_minigun" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_minigun" )
                               thread legion( titan )
			break;
		case "ion": titan.SetAISettings( "npc_titan_atlas_stickybomb" )
                            titan.SetBehaviorSelector( "behavior_titan_long_range" )
                            thread ion( titan )
                        break;
		case "tone": titan.SetAISettings( "npc_titan_atlas_tracker" )
                             titan.SetBehaviorSelector( "behavior_titan_long_range" )
                             thread tone( titan )
                        break;
		case "vanguard": titan.SetAISettings( "npc_titan_atlas_vanguard" )
                                 titan.SetBehaviorSelector( "behavior_titan_long_range" )
                                 thread vanguard( titan )
                        break;
                case "northstar": titan.SetAISettings( "npc_titan_stryder_sniper" )
                                  titan.SetBehaviorSelector( "behavior_titan_sniper" )
                                  thread northstar( titan )  
                        break;
        }
titan.SetCapabilityFlag( bits_CAP_SYNCED_MELEE_ATTACK, false )
}
}
#endif