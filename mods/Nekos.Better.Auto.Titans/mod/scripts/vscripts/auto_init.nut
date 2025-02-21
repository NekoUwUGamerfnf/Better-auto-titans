global function auto_init


void function auto_init() {
    AddPrivateMatchModeSettingEnum( "#Better_Auto_Titans", "very_enhanced_auto_titans", [ "#SETTING_DISABLED", "#SETTING_ENABLED" ], "0" )
#if SERVER
	AddSpawnCallback( "npc_titan", Auto )
	AddCallback_OnTitanBecomesPilot( OnTitanBecomesPilot )
        AddCallback_OnPilotBecomesTitan( onpilot )
#endif
}
#if SERVER
void function ronincore( entity titan )
{
    entity meleeWeapon = titan.GetMeleeWeapon()
	if( meleeWeapon.HasMod( "super_charged" ) )
    {
    titan.DisableBehavior( "Assault" )
    titan.DisableBehavior( "Follow" )
    titan.SetAISettings( "npc_titan_stryder_leadwall_shift_core_elite" )
    titan.SetBehaviorSelector( "behavior_titan_melee_core_elite" )
    titan.WaitSignal( "CoreEnd" )
    titan.EnableBehavior( "Assault" )
    titan.EnableBehavior( "Follow" )
    ronina( titan )
    }
}

void function ronincoree( entity titan )
{
    entity meleeWeapon = titan.GetMeleeWeapon()
	if( meleeWeapon.HasMod( "super_charged" ) )
    {
    titan.DisableBehavior( "Assault" )
    titan.DisableBehavior( "Follow" )
    titan.SetAISettings( "npc_titan_stryder_leadwall_shift_core" )
    titan.SetBehaviorSelector( "behavior_titan_melee_core" )
    titan.WaitSignal( "CoreEnd" )
    titan.EnableBehavior( "Assault" )
    titan.EnableBehavior( "Follow" )
    ronina( titan )
    }
}

void function OnTitanBecomesPilot( entity player, entity titan )
{
        if( IsValid(titan))
	ai( titan )
}

void function OnPilotBecomesTitan( entity player, entity titan )
{
if( IsValid(player))
player.TakeWeaponNow("mp_titanweapon_flightcore_rockets")
player.TakeWeaponNow("mp_titanweapon_sniper")
player.GiveWeapon("mp_titanweapon_sniper")
entity soul = player.GetTitanSoul()
if ( soul != null )
if( SoulHasPassive( soul, ePassives.PAS_NORTHSTAR_WEAPON ) )
{
player.GetMainWeapons()[0].AddMod( "power_shot" )
}
if( SoulHasPassive( soul, ePassives.PAS_NORTHSTAR_OPTICS ) )
{
player.GetMainWeapons()[0].AddMod( "pas_northstar_optics" )
}
if ( player.GetOffhandWeapons()[OFFHAND_SPECIAL].HasMod("pas_northstar_trap") )
player.GetMainWeapons()[0].AddMod( "quick_shot" )
player.GetMainWeapons()[0].AddMod( "pas_northstar_weapon" )
player.GetMainWeapons()[0].AddMod( "fd_upgrade_charge" )
player.GetMainWeapons()[0].AddMod( "fd_upgrade_crit" )
}

void function scorcha( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_ogre_meteor_boss_fd_elite" )
titan.SetBehaviorSelector( "behavior_titan_ogre_meteor_elite" )
}

void function core( entity titan )
{
while( true )
   {
    titan.WaitSignal( "CoreBegin" )
    if( IsValid(titan))
    {
    ronincore( titan )
    }
   }
}

void function coree( entity titan )
{
while( true )
   {
    titan.WaitSignal( "CoreBegin" )
    if( IsValid(titan))
    {
    ronincoree( titan )
    }
   }
}

void function ronina( entity titan )
{
if( IsValid(titan))
{
titan.SetAISettings( "npc_titan_stryder_leadwall_boss_fd_elite" )
titan.SetBehaviorSelector( "behavior_titan_shotgun_elite" )
}
}

void function northstara( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_stryder_sniper_boss_fd_elite" )
titan.SetBehaviorSelector( "behavior_titan_sniper_elite" ) 
}

void function iona( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_atlas_stickybomb_boss_fd_elite" )
titan.SetBehaviorSelector( "behavior_titan_long_range_elite" )
}

void function tonea( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_atlas_tracker_fd_sniper_elite" )
titan.SetBehaviorSelector( "behavior_titan_long_range_elite" )
}

void function vanguarda( entity titan )
{
if( IsValid(titan))
if( titan.GetModelName() != $"models/titans/buddy/titan_buddy.mdl")
titan.SetAISettings( "npc_titan_atlas_vanguard_boss_fd_elite" )
titan.SetBehaviorSelector( "behavior_titan_long_range_elite" )}

void function legiona( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_ogre_minigun_boss_fd_elite" )
titan.SetBehaviorSelector( "behavior_titan_ogre_minigun_elite" )
}

void function scorchae( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_ogre_meteor" )
titan.SetBehaviorSelector( "behavior_titan_ogre_meteor" )
}

void function roninae( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_stryder_leadwall" )
titan.SetBehaviorSelector( "behavior_titan_shotgun" )
}

void function northstarae( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_stryder_sniper" )
titan.SetBehaviorSelector( "behavior_titan_sniper" ) 
}

void function ionae( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_atlas_stickybomb" )
titan.SetBehaviorSelector( "behavior_titan_long_range" )
}

void function toneae( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_atlas_tracker" )
titan.SetBehaviorSelector( "behavior_titan_long_range" )
}

void function vanguardae( entity titan )
{
if( IsValid(titan))
if( titan.GetModelName() != $"models/titans/buddy/titan_buddy.mdl")
titan.SetAISettings( "npc_titan_atlas_vanguard" )
titan.SetBehaviorSelector( "behavior_titan_long_range" )}

void function legionae( entity titan )
{
if( IsValid(titan))
titan.SetAISettings( "npc_titan_ogre_minigun" )
titan.SetBehaviorSelector( "behavior_titan_ogre_minigun" )
}

void function tone( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		tonea( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function northstar( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		northstara( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function scorch( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		scorcha( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function vanguard( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
                if( titan.GetModelName() != $"models/titans/buddy/titan_buddy.mdl")
		vanguarda( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}


void function ion( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		iona( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function legion( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		legiona( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function ronin( entity titan )
{
	while( true )
	{
        if( IsValid(titan))
		ronina( titan )
        thread ronincore( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function tonee( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		toneae( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function northstare( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		northstarae( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function scorche( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		scorchae( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function vanguarde( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
                if( titan.GetModelName() != $"models/titans/buddy/titan_buddy.mdl")
		vanguardae( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}


void function ione( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		ionae( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function legione( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		legionae( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}

void function ronine( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		roninae( titan )
		titan.WaitSignal( "ChangedTitanMode" )
	}
}
#endif
#if SERVER
void function Auto( entity titan )
{
entity soul = titan.GetTitanSoul()
if ( soul != null )
if ( GetCurrentPlaylistVarInt( "very_enhanced_auto_titans", 0 ) == 1 && SoulHasPassive( soul, ePassives.PAS_ENHANCED_TITAN_AI ) )
{
	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin":  entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))
                              {
                              titan.SetAISettings( "npc_titan_stryder_leadwall_boss_fd_elite" )
                              titan.SetBehaviorSelector( "behavior_titan_shotgun_elite" )
                              thread ronin( titan )
                              thread core( titan )
                              }
                        break;
		case "scorch":  entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player )) 
                              {
titan.SetAISettings( "npc_titan_ogre_meteor_boss_fd_elite" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_meteor_elite" )
                               thread scorch( titan )
                               }
                        break;
		case "legion":  entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))
                              {
 titan.SetAISettings( "npc_titan_ogre_minigun_boss_fd_elite" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_minigun_elite" )
                               thread legion( titan )
                               }
			break;
		case "ion": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))  
                              {
titan.SetAISettings( "npc_titan_atlas_stickybomb_boss_fd_elite" )
                            titan.SetBehaviorSelector( "behavior_titan_long_range_elite" )
                            thread ion( titan )
                            }
                        break;
		case "tone": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))
                              {
                              titan.SetAISettings( "npc_titan_atlas_tracker_fd_sniper_elite" )
                             titan.SetBehaviorSelector( "behavior_titan_long_range_elite" )
                             thread tone( titan )
                             }
                        break;
		case "vanguard": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))
                              {
 titan.SetAISettings( "npc_titan_atlas_vanguard_boss_fd_elite" )
                                 titan.SetBehaviorSelector( "behavior_titan_long_range_elite" )
                                 thread vanguard( titan )
                                 }
                        break;
                case "northstar": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))
                              {
                               titan.SetAISettings( "npc_titan_stryder_sniper_boss_fd_elite" )
                                  titan.SetBehaviorSelector( "behavior_titan_sniper_elite" )
                                  thread northstar( titan )
                                  }  
                             break;
              }
}
else
{
thread Autoe( titan )
}
}
#endif

#if SERVER
void function Autoe( entity titan )
{
	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin":  entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))
                              {
                              titan.SetAISettings( "npc_titan_stryder_leadwall" )
                              titan.SetBehaviorSelector( "behavior_titan_shotgun" )
                              thread ronin( titan )
                              }
                        break;
		case "scorch":  entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player )) 
                              {
titan.SetAISettings( "npc_titan_ogre_meteor" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_meteor" )
                               thread scorch( titan )
                               }
                        break;
		case "legion":  entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))
                              {
 titan.SetAISettings( "npc_titan_ogre_minigun" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_minigun" )
                               thread legion( titan )
                               }
			break;
		case "ion": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))  
                              {
titan.SetAISettings( "npc_titan_atlas_stickybomb" )
                            titan.SetBehaviorSelector( "behavior_titan_long_range" )
                            thread ion( titan )
                            }
                        break;
		case "tone": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))
                              {
                              titan.SetAISettings( "npc_titan_atlas_tracker" )
                             titan.SetBehaviorSelector( "behavior_titan_long_range" )
                             thread tone( titan )
                             }
                        break;
		case "vanguard": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))
                              {
 titan.SetAISettings( "npc_titan_atlas_vanguard" )
                                 titan.SetBehaviorSelector( "behavior_titan_long_range" )
                                 thread vanguard( titan )
                                 }
                        break;
                case "northstar": entity soul = titan.GetTitanSoul()
                              entity player = GetPetTitanOwner( titan )
                              if ( IsValid( player ))
                              {
                               titan.SetAISettings( "npc_titan_stryder_sniper" )
                                  titan.SetBehaviorSelector( "behavior_titan_sniper" )
                                  thread northstar( titan )
                                  }  
                             break;
              }
}
#endif

#if SERVER
void function onpilot( entity player, entity titan )
{
	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
                case "northstar": thread OnPilotBecomesTitan ( player, titan )
                             break;
              }
}
#endif

#if SERVER
void function ai( entity titan )
{
entity soul = titan.GetTitanSoul()
if ( soul != null )
if ( GetCurrentPlaylistVarInt( "very_enhanced_auto_titans", 0 ) == 1 && SoulHasPassive( soul, ePassives.PAS_ENHANCED_TITAN_AI ) )
{
	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin": titan.SetAISettings( "npc_titan_stryder_leadwall_boss_fd_elite" )
                              titan.SetBehaviorSelector( "behavior_titan_shotgun_elite" )
                              thread ronin( titan )
                              thread core( titan )
                        break;
		case "scorch": titan.SetAISettings( "npc_titan_ogre_meteor_boss_fd_elite" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_meteor_elite" )
                               thread scorch( titan )
                        break;
		case "legion": titan.SetAISettings( "npc_titan_ogre_minigun_boss_fd_elite" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_minigun_elite" )
                               thread legion( titan )
			break;
		case "ion": titan.SetAISettings( "npc_titan_atlas_stickybomb_boss_fd_elite" )
                            titan.SetBehaviorSelector( "behavior_titan_long_range_elite" )
                            thread ion( titan )
                        break;
		case "tone": titan.SetAISettings( "npc_titan_atlas_tracker_fd_sniper_elite" )
                             titan.SetBehaviorSelector( "behavior_titan_long_range_elite" )
                             thread tone( titan )
                        break;
		case "vanguard": titan.SetAISettings( "npc_titan_atlas_vanguard_boss_fd_elite" )
                                 titan.SetBehaviorSelector( "behavior_titan_long_range_elite" )
                                 thread vanguard( titan )
                        break;
                case "northstar": titan.SetAISettings( "npc_titan_stryder_sniper_boss_fd_elite" )
                                  titan.SetBehaviorSelector( "behavior_titan_sniper_elite" )
                                  thread northstar( titan )  
                        break;
        }
}
else
{
thread aie( titan )
}
}

void function aie( entity titan )
{
	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin": titan.SetAISettings( "npc_titan_stryder_leadwall" )
                              titan.SetBehaviorSelector( "behavior_titan_shotgun" )
                              thread ronine( titan )
                        break;
		case "scorch": titan.SetAISettings( "npc_titan_ogre_meteor" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_meteor" )
                               thread scorche( titan )
                        break;
		case "legion": titan.SetAISettings( "npc_titan_ogre_minigun" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_minigun" )
                               thread legione( titan )
			break;
		case "ion": titan.SetAISettings( "npc_titan_atlas_stickybomb" )
                            titan.SetBehaviorSelector( "behavior_titan_long_range" )
                            thread ione( titan )
                        break;
		case "tone": titan.SetAISettings( "npc_titan_atlas_tracker" )
                             titan.SetBehaviorSelector( "behavior_titan_long_range" )
                             thread tonee( titan )
                        break;
		case "vanguard": titan.SetAISettings( "npc_titan_atlas_vanguard" )
                                 titan.SetBehaviorSelector( "behavior_titan_long_range" )
                                 thread vanguarde( titan )
                        break;
                case "northstar": titan.SetAISettings( "npc_titan_stryder_sniper" )
                                  titan.SetBehaviorSelector( "behavior_titan_sniper" )
                                  thread northstare( titan )  
                        break;
        }
}
#endif