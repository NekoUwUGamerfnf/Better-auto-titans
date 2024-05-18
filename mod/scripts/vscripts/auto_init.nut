global function auto_init


void function auto_init() {
#if SERVER
	AddSpawnCallback("npc_titan", Auto )
#endif
}
#if SERVER
void function Auto( entity titan )
{
        array<entity> weapons = titan.GetMainWeapons( )
	//entity weapon = titan.GetOffhandWeapon( OFFHAND_EQUIPMENT )
	if ( weapons[0] != null)
        { //titan.TakeWeaponNow( weapon.GetWeaponClassName() )
          //titan.TakeOffhandWeapon(OFFHAND_ANTIRODEO)
        }

	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin": titan.SetAISettings( "npc_titan_stryder_leadwall" )
                              titan.SetBehaviorSelector( "behavior_titan_shotgun" )
                        break;
		case "scorch": titan.SetAISettings( "npc_titan_ogre_meteor" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_meteor" )
                        break;
		case "legion": titan.SetAISettings( "npc_titan_ogre_minigun" )
                               titan.SetBehaviorSelector( "behavior_titan_ogre_minigun" )
			break;
		case "ion": titan.SetAISettings( "npc_titan_atlas_stickybomb" )
                            titan.SetBehaviorSelector( "behavior_titan_long_range" )
                        break;
		case "tone": titan.SetAISettings( "npc_titan_atlas_tracker" )
                             titan.SetBehaviorSelector( "behavior_titan_long_range" )
                        break;
		case "vanguard": titan.SetAISettings( "npc_titan_atlas_vanguard" )
                                 titan.SetBehaviorSelector( "behavior_titan_long_range" )
                        break;
                case "northstar": titan.SetAISettings( "npc_titan_stryder_sniper" )
                                  titan.SetBehaviorSelector( "behavior_titan_sniper" )   
                        break;
	    }
}
#endif