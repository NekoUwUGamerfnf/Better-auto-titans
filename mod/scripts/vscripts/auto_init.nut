global function auto_init


void function auto_init() {
#if SERVER
	AddSpawnCallback( "npc_titan", Auto )
	//AddCallback_OnTitanBecomesPilot( OnTitanBecomesPilot )
#endif
}

void function scorcha( entity titan )
{
titan.SetAISettings( "npc_titan_ogre_meteor" )
titan.SetBehaviorSelector( "behavior_titan_ogre_meteor" )
}

void function ronina( entity titan )
{
titan.SetAISettings( "npc_titan_stryder_leadwall" )
titan.SetBehaviorSelector( "behavior_titan_shotgun" )
}

void function northstara( entity titan )
{
titan.SetAISettings( "npc_titan_stryder_sniper" )
titan.SetBehaviorSelector( "behavior_titan_sniper" ) 
}

void function iona( entity titan )
{
titan.SetAISettings( "npc_titan_atlas_stickybomb" )
titan.SetBehaviorSelector( "behavior_titan_long_range" )
}

void function tonea( entity titan )
{
titan.SetAISettings( "npc_titan_atlas_tracker" )
titan.SetBehaviorSelector( "behavior_titan_long_range" )
}

void function vanguarda( entity titan )
{
titan.SetAISettings( "npc_titan_atlas_vanguard" )
titan.SetBehaviorSelector( "behavior_titan_long_range" )}

void function legiona( entity titan )
{
titan.SetAISettings( "npc_titan_ogre_minigun" )
titan.SetBehaviorSelector( "behavior_titan_ogre_minigun" )
}

void function tone( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		tonea( titan )
		WaitFrame()
	}
}

void function northstar( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		northstara( titan )
		WaitFrame()
	}
}

void function scorch( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		scorcha( titan )
		WaitFrame()
	}
}

void function vanguard( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		vanguarda( titan )
		WaitFrame()
	}
}


void function ion( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		iona( titan )
		WaitFrame()
	}
}

void function legion( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		legiona( titan )
		WaitFrame()
	}
}

void function ronin( entity titan )
{
	while( true )
	{
                if( IsValid(titan))
		ronina( titan )
		WaitFrame()
	}
}
/*
void function balls( entity titan )
{

Auto( titan )

}

void function OnTitanBecomesPilot( entity player, entity titan )
{
	balls( titan )
}
*/

#if SERVER
void function Auto( entity titan )
{
        //array<entity> weapons = titan.GetMainWeapons( )
	//entity weapon = titan.GetOffhandWeapon( OFFHAND_EQUIPMENT )
	//if ( weapons[0] != null)
        //{ //titan.TakeWeaponNow( weapon.GetWeaponClassName() )
          //titan.TakeOffhandWeapon( OFFHAND_ANTIRODEO )
        //}
	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin": titan.SetAISettings( "npc_titan_stryder_leadwall" )
                              titan.SetBehaviorSelector( "behavior_titan_shotgun" )
                              thread ronin( titan )
                              entity soul = titan.GetTitanSoul()
                              if ( IsValid( soul ) )
                              {
 		              GivePassive( soul, ePassives.PAS_ENHANCED_TITAN_AI )
                              }
                        break;
		case "scorch": titan.SetAISettings( "npc_titan_ogre_meteor" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_meteor" )
                               thread scorch( titan )
                              entity soul = titan.GetTitanSoul()
                              if ( IsValid( soul ) )
                              {
 		              GivePassive( soul, ePassives.PAS_ENHANCED_TITAN_AI )
                              }
                        break;
		case "legion": titan.SetAISettings( "npc_titan_ogre_minigun" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_minigun" )
                               thread legion( titan )
                              entity soul = titan.GetTitanSoul()
                              if ( IsValid( soul ) )
                              {
 		              GivePassive( soul, ePassives.PAS_ENHANCED_TITAN_AI )
                              }
			break;
		case "ion": titan.SetAISettings( "npc_titan_atlas_stickybomb" )
                            titan.SetBehaviorSelector( "behavior_titan_long_range" )
                            thread ion( titan )
                              entity soul = titan.GetTitanSoul()
                              if ( IsValid( soul ) )
                              {
 		              GivePassive( soul, ePassives.PAS_ENHANCED_TITAN_AI )
                              }
                        break;
		case "tone": titan.SetAISettings( "npc_titan_atlas_tracker" )
                             titan.SetBehaviorSelector( "behavior_titan_long_range" )
                             thread tone( titan )
                              entity soul = titan.GetTitanSoul()
                              if ( IsValid( soul ) )
                              {
 		              GivePassive( soul, ePassives.PAS_ENHANCED_TITAN_AI )
                              }
                        break;
		case "vanguard": titan.SetAISettings( "npc_titan_atlas_vanguard" )
                                 titan.SetBehaviorSelector( "behavior_titan_long_range" )
                                 thread vanguard( titan )
                              entity soul = titan.GetTitanSoul()
                              if ( IsValid( soul ) )
                              {
 		              GivePassive( soul, ePassives.PAS_ENHANCED_TITAN_AI )
                              }
                        break;
                case "northstar": titan.SetAISettings( "npc_titan_stryder_sniper" )
                                  titan.SetBehaviorSelector( "behavior_titan_sniper" )
                                  thread northstar( titan )  
                              entity soul = titan.GetTitanSoul()
                              if ( IsValid( soul ) )
                              {
 		              GivePassive( soul, ePassives.PAS_ENHANCED_TITAN_AI )
                              }
                        break;
        }
}
#endif