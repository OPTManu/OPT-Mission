/**
* Author: James
* defines all objects that can be bought and sold with prices. A price of 0 means not able to buy or sell.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call vehiclePool_war.sqf;
*
*/
#include "script_component.hpp"

#define DEF_PROD(var1) var1, GVAR(saleReturnValueForOwn) * var1,  GVAR(saleReturnValueForEnemy) * var1 // default product with 0.75 sold value for own and 1.50 for enemy

/* ANLEITUNG: 
* Jedes Fahrzeug besitzt einen Eintrag der Form [classname, Kaufpreis, Verkaufpreis für eigene Seite, Verkaufpreis für Feindseite]
* Klassname kann dem Editor mit Rechtsklick -> Log -> Classnames entnommen werden
* Kaufpreis größer 0 heißt, dass Fahrzeug steht zum Kaufen bereit, sonst taucht es nicht auf
* Verkaufspreis größer 0 heißt, das Fahrzeug kann verkauft werden, sonst taucht es nicht auf (für beide)
* DEF_PROD(PREIS) sorgt dafür, dass Kauf und Verkaufspreis automatisch bestimmt werden mit der Variable
* GVAR(saleReturnValueForOwn), die in der fnc_initCBASettings.sqf ist (aktuell 75%)
* GVAR(saleReturnValueForEnemy), die in der fnc_initCBASettings.sqf definiert ist (aktuell 150%)
* Es kann aber jedes Fahrzeug individuell angepasst werden, indem einfach manuell drei Preise eingetragen werden, z.B.
* ["B_Quadbike_01_F", 1500, 0, 0] -> nur kaufen
* ["B_Quadbike_01_F", 0, 500, 1000] -> nur verkaufen, wobei 500 für eigenes Quad, 1000 für Feind-Quad
*/

GVAR(nato_vehicles) = 
[
    ["B_Quadbike_01_F", DEF_PROD(1500)],                    // Quadbike
    ["B_T_LSV_01_unarmed_F", DEF_PROD(5000)],               // Prowler unarmed 
    ["B_T_LSV_01_armed_F", DEF_PROD(8000)],                 // Prowler armed
    ["B_G_Offroad_01_F", DEF_PROD(0)],                      // Pickup, 1000, ersetzt durch Prawler
    ["B_G_Offroad_01_armed_F", DEF_PROD(0)],                // Pickup HMG, 4000, ersetzt durch Prawler
    ["B_Truck_01_covered_F ", DEF_PROD(8000)],              // HEMTT Abgedeckt
    ["B_Truck_01_Repair_F", DEF_PROD(10000)],               // HEMTT Repair, ersetzt durch Container
    ["B_Truck_01_medical_F", DEF_PROD(10000)],              // HEMTT Medical, ersetzt durch Container
    ["B_Truck_01_transport_F", DEF_PROD(2000)],             // HEMTT 2000 (fr Radar Container, keine Sitze auf 
	["B_MRAP_01_hmg_F", DEF_PROD(20000)],                   // Hunter HMG - neu
    ["B_MRAP_01_F", DEF_PROD(5000)]                         // Hunter
];

// Fahrzeuge dieser Liste können nicht verkauft werden!
GVAR(nato_vehicles_supply) = 
[
    ["B_Truck_01_ammo_F", DEF_PROD(50000)],                 // HEMTT Ammo, 50000 ersetzt durch Container
    ["B_Truck_01_fuel_F", DEF_PROD(10000)]                  // HEMTT Fuel, 10000 ersetzt durch Container
];
    
GVAR(nato_choppers) = 
[
    ["I_Heli_light_03_unarmed_F", DEF_PROD(80000)],         // WY-55 Hellcat unbewaffnet
    ["I_Heli_light_03_F", DEF_PROD(150000)],                // WY-55 Hellcat CAS
    ["B_Heli_Light_01_F", DEF_PROD(60000)],                 // MH-9 Hummingbird
    ["B_Heli_Light_01_armed_F", DEF_PROD(0)],               // AH-9 Pawnee
    ["B_Heli_Transport_01_F", DEF_PROD(90000)],             // UH-80 Ghosthawk
    ["B_Heli_Transport_03_unarmed_F", DEF_PROD(0)],         // CH-67 Huron unarmed (Transport+Lift)
    ["B_Heli_Transport_03_F", DEF_PROD(170000)],            // CH-67 Huron armed (Transport+Lift)
    ["B_UAV_02_F", DEF_PROD(0)],                            // Greyhawk   
    ["I_Heli_Transport_02_F", DEF_PROD(0)],                 // CH-49 Mohawk (Transport+Lift)
    ["B_T_UAV_03_F", DEF_PROD(0)],                          // MQ12-Falcon - noch in arbeit erstma nur testweise mit preis eingebaut
    ["O_T_VTOL_02_infantry_F", DEF_PROD(0)],   		        // VTOL Y-32 Xi'an (Inf-Transport)
    ["O_T_VTOL_02_vehicle_F", DEF_PROD(0)],                 // VTOL Y-32 Xi'an (Fahrzeug-Transport)
    ["B_T_VTOL_01_infantry_F", DEF_PROD(0)],                // VTOL Blackfish (Inf-Transport) 200000
    ["B_T_VTOL_01_vehicle_F", DEF_PROD(0)],         	    // VTOL Blackfish (Fahrzeug-Transport)
    ["B_T_VTOL_01_armed_F", DEF_PROD(0)],                   // VTOL Blackfish BEWAFFNET
    ["B_Heli_Attack_01_F", DEF_PROD(0)],                    // AH-99 Blackfoot 200000(Unbewaffnet)
    ["B_Plane_CAS_01_F", DEF_PROD(0)],                      // A-164 Wipeout
    ["B_Plane_Fighter_01_F", DEF_PROD(0)]                   // F/A-181 Black Wasp II (AA)
];
    
GVAR(nato_armored) = 
[
    ["B_APC_Tracked_01_rcws_F", DEF_PROD(30000)],           // IFV-6c Panther
    ["B_APC_Wheeled_01_cannon_F", DEF_PROD(50000)],         // AMV-7 Marshall    
    ["B_APC_Tracked_01_AA_F", DEF_PROD(125000)],            // IFV-6a Cheetah
    ["I_APC_tracked_03_cannon_F", DEF_PROD(60000)],         // FV-720 Mora    
    ["B_MBT_01_cannon_F", DEF_PROD(0)],                     // M2A4 Slammer
    ["B_MBT_01_TUSK_F", DEF_PROD(125000)],                  // M2A4 SlammerUp
    ["I_MBT_03_cannon_F", DEF_PROD(0)],                     // MBT-52 Kuma, fliegt raus
    ["B_MBT_01_arty_F", DEF_PROD(0)],                       // M4 Scorcher
    ["B_MBT_01_mlrs_F", DEF_PROD(0)],                       // M5 Sandstorm     
    ["B_MRAP_01_gmg_F", DEF_PROD(0)],                		// Hunter GMG - neu
    ["I_MRAP_03_F", DEF_PROD(0)],                           // Strider, 6500 
    ["I_MRAP_03_hmg_F", DEF_PROD(0)],                       // Strider HMG, 
    ["I_MRAP_03_gmg_F", DEF_PROD(0)],                	    // Strider GMG, 22000 
	["B_T_LSV_01_AT_F", DEF_PROD(80000)]                    // Prowler AT - 20000
];

GVAR(nato_supplies) = 
[
    ["Box_NATO_Ammo_F", 40000, 10000, 20000],               // Munitionskiste
    ["Box_NATO_WpsSpecial_F", 60000, 10000, 20000],         // Munition spezial
    ["Box_NATO_Grenades_F", 75000, 10000, 20000],           // granatenkiste
    ["Box_NATO_AmmoOrd_F", 150000, 10000, 20000],           // sprengstoffkiste
    ["Box_NATO_WpsLaunch_F", 200000, 10000, 20000],         // AT Raketenkiste (MRAWS)
    ["B_supplyCrate_F", DEF_PROD(0)],                       // Transportkiste (leer)
    ["B_CargoNet_01_ammo_F", DEF_PROD(5000)],               // Ausrstungskiste   
    ["B_UGV_01_F", DEF_PROD(2000)],                         // UGV Stomper
    ["B_UGV_01_rcws_F", DEF_PROD(0)],                       // UGV Stomper RCWS
    ["B_UAV_01_F", DEF_PROD(0)],                            // Darter AR-2
    ["FlexibleTank_01_forest_F", DEF_PROD(1000)],           // Treibstoff-Fass
    ["ACE_Box_82mm_Mo_HE", DEF_PROD(50000)],                // Mörsermuni
    ["B_Slingload_01_Ammo_F", 0, 0, 0],        			    // Munitionscontainer
    ["B_Slingload_01_Fuel_F", DEF_PROD(8000)],              // Fuelcontainer
    ["B_Slingload_01_Repair_F", DEF_PROD(8000)],            // Reparaturcontainer
    ["B_Slingload_01_Medevac_F", DEF_PROD(0)]               // Lazarettcontainer
];

GVAR(nato_static) = 
[
    ["B_HMG_01_high_F", DEF_PROD(10000)],                   // Stand-MG hoch
    ["B_HMG_01_F", DEF_PROD(10000)],                        // Stand-MG niedrig
    ["B_GMG_01_high_F", DEF_PROD(75000)],                   // Stand-GMG hoch
    ["B_GMG_01_F", DEF_PROD(75000)],                        // Stand-GMG niedrig
    ["B_static_AA_F", DEF_PROD(50000)],                     // Stand-AA
    ["B_static_AT_F", DEF_PROD(150000)],                    // Stand-AT
    ["B_Mortar_01_F", DEF_PROD(110000)],                    // MK6 - Mörser
    ["B_Static_Designator_01_F", DEF_PROD(10000)]           // Remote Designator
];

GVAR(nato_sea) = 
[
    ["B_Boat_Armed_01_minigun_F", DEF_PROD(10000)],         // Speedboat Minigun
    ["B_Boat_Transport_01_F", DEF_PROD(500)],               // Assault Boat
    ["B_SDV_01_F", DEF_PROD(2000)],                         // Submarine
    ["B_G_Boat_Transport_02_F", DEF_PROD(7000)]             // Rhib unbewaffnet
];

GVAR(csat_vehicles) = 
[
//Vanilla
    ["O_Quadbike_01_F", DEF_PROD(1500)],                    // Quadbike-
    ["O_T_LSV_02_unarmed_F", DEF_PROD(4000)],               // Quilin unarmed-
    ["O_T_LSV_02_armed_F", DEF_PROD(8000)],                 // Quilin armed-
    ["O_Truck_03_covered_F", DEF_PROD(8000)],               // Tempest Transport-
    ["O_Truck_03_repair_F", DEF_PROD(10000)],               // Tempest Repair, ersetzt durch container-
    ["O_Truck_03_medical_F", DEF_PROD(10000)],              // Tempest Medical, ersetzt durch container-
    ["O_Truck_03_transport_F", DEF_PROD(2000)],             // Tempest (fr Radar, keine Sitze auf Ladeflche)-
    ["O_G_Offroad_01_F", DEF_PROD(0)],                      // Pickup, ersetzt durch quilin
    ["O_G_Offroad_01_armed_F", DEF_PROD(0)],                // Pickup HMG, ersetzt durch quilin
    ["O_MRAP_02_F", DEF_PROD(5500)],                        // Ifrit-
	["O_MRAP_02_hmg_F", DEF_PROD(21000)],                   // Ifrit HMG
    //Tropentarn
    ["O_T_Quadbike_01_ghex_F", DEF_PROD(0)],                // Quadbike 1500
    ["O_T_LSV_02_unarmed_F", DEF_PROD(0)],                  // Quilin unarmed 3000
    ["O_T_LSV_02_armed_F", DEF_PROD(0)],                    // Quilin armed 4000
    ["O_T_Truck_03_covered_ghex_F", DEF_PROD(0)],           // Tempest Transport 8000
    ["O_T_Truck_03_repair_ghex_F", DEF_PROD(0)],            // Tempest Repair, ersetzt durch container 10000
    ["O_T_Truck_03_medical_ghex_F", DEF_PROD(0)],           // Tempest Medical, ersetzt durch container 10000
    ["O_T_Truck_03_transport_ghex_F", DEF_PROD(0)],         // Tempest (fr Radar, keine Sitze auf Ladeflche) 2000
    ["O_G_Offroad_01_F", DEF_PROD(0)],                      // Pickup, ersetzt durch quilin
    ["O_G_Offroad_01_armed_F", DEF_PROD(0)],                // Pickup HMG, ersetzt durch quilin
    ["O_T_MRAP_02_ghex_F", DEF_PROD(0)],                    // Ifrit 5500
    ["O_T_MRAP_02_hmg_ghex_F", DEF_PROD(0)]                 // Ifrit HMG 26000
];

// Fahrzeuge dieser Liste knnen nicht verkauft werden!
GVAR(csat_vehicles_supply) = 
[
    ["O_T_Truck_03_ammo_ghex_F", DEF_PROD(0)],              // Tempest Ammo, ersetzt durch container 50000
    ["O_T_Truck_03_fuel_ghex_F", DEF_PROD(0)],              // Tempest Fuel, ersetzt durch container 10000
    ["O_Truck_03_ammo_F", DEF_PROD(50000)],                 // Tempest Ammo, ersetzt durch container
    ["O_Truck_03_fuel_F", DEF_PROD(10000)]                  // Tempest Fuel, ersetzt durch container
];

GVAR(csat_choppers) = 
[
    //Hextarn
    ["O_Heli_Light_02_F", DEF_PROD(150000)],                // PO-30 Orca DAGR
    ["O_Heli_Transport_04_F", DEF_PROD(100000)],            // Mi-290 Taru (Lift)
    ["O_Heli_Transport_04_covered_F", DEF_PROD(110000)],    // Mi-290 Taru (Transport)
    ["O_Heli_Transport_04_bench_F", DEF_PROD(120000)],      // Mi-290 Taru (Bench) 
    ["O_Heli_Attack_02_F", DEF_PROD(0)],                    // Mi-48 Kajman
    //schwarz
    ["O_Heli_Light_02_unarmed_F", DEF_PROD(60000)],         // PO-30 Orca unbewaffnet
    ["O_Heli_Transport_04_black_F", DEF_PROD(0)],           // Mi-290 Taru (Lift)
    ["O_Heli_Transport_04_covered_black_F", DEF_PROD(0)],   // Mi-290 Taru (Transport)
    ["O_Heli_Transport_04_bench_black_F", DEF_PROD(0)],     // Mi-290 Taru (Bench)
    ["O_Heli_Attack_02_black_F", DEF_PROD(0)],              // Mi-48 Kajman (Schwarz)
    //
    ["O_UAV_02_F", DEF_PROD(300000)],                       // Ababil  
    ["O_T_VTOL_02_infantry_F", DEF_PROD(0)],   		        // VTOL Y-32 Xi'an (Inf-Transport)
    ["O_T_VTOL_02_vehicle_F", DEF_PROD(0)],                 // VTOL Y-32 Xi'an (Fahrzeug-Transport)   
    ["O_Plane_CAS_02_F", DEF_PROD(0)],                      // To-199 Neophron
    ["O_T_UAV_04_CAS_F", DEF_PROD(0)],                      // KH-3A Fenghuan - noch in arbeit erstma nur testweise mit preis eingebaut
    ["O_Plane_Fighter_02_F", DEF_PROD(0)]                   // To-201 Shikra (AA)
];
    
GVAR(csat_armored) = 
[
//Vanilla
    ["O_APC_Wheeled_02_rcws_v2_F", DEF_PROD(25000)],        // MSE-3 Marid - raus wegen bug - 25000
    ["I_APC_Wheeled_03_cannon_F", DEF_PROD(50000)],         // AFV-4 Gorgon
    ["O_APC_Tracked_02_AA_F", DEF_PROD(125000)],            // ZSU-39 Tigris
    ["O_APC_Tracked_02_cannon_F", DEF_PROD(0)],             // BTR-K Kamysh
    ["O_MBT_02_cannon_F", DEF_PROD(125000)],                // T-100 Varsuk
    ["O_MBT_02_arty_F", DEF_PROD(300000)],                  // 2S9 Sochor
        
    ["O_MRAP_02_gmg_F", DEF_PROD(0)],                       // Ifrit GMG
	["O_T_LSV_02_AT_F", DEF_PROD(80000)],                   // Quilin AT 20000
//Tropentarn
    ["O_T_APC_Wheeled_02_rcws_v2_ghex_F", DEF_PROD(0)],     // MSE-3 Marid 50000
    ["I_APC_Wheeled_03_cannon_F", DEF_PROD(0)],             // AFV-4 Gorgon 120000
    ["O_T_APC_Tracked_02_AA_ghex_F", DEF_PROD(0)],          // ZSU-39 Tigris 275000
    ["O_T_APC_Tracked_02_cannon_ghex_F", DEF_PROD(0)],      // BTR-K Kamysh 120000
    ["O_T_MBT_02_cannon_ghex_F", DEF_PROD(0)],              // T-100 Varsuk 450000
    ["O_T_MBT_02_arty_ghex_F", DEF_PROD(0)],                // 2S9 Sochor 400000
    ["I_Truck_02_MRL_F", DEF_PROD(0)],                      // Zamak MRL
    ["O_T_MRAP_02_gmg_ghex_F", DEF_PROD(0)],                // Ifrit GMG 31000                
    ["O_T_LSV_02_AT_F", DEF_PROD(0)]                        // Quilin AT
];

GVAR(csat_supplies) = 
[
    ["Box_East_Ammo_F", 40000, 10000, 20000],               // Munitionskiste
    ["Box_East_WpsSpecial_F", 60000, 10000, 20000],         // Munition spezial kiste
    ["Box_East_Grenades_F", 75000, 10000, 20000],           // granatenkiste
    ["Box_East_AmmoOrd_F", 150000, 10000, 20000],           // sprengstoffkiste
    ["Box_East_WpsLaunch_F", 200000, 10000, 20000],         // Raketenkiste 
    ["O_supplyCrate_F", DEF_PROD(500)],                     // Transportkiste
    ["O_CargoNet_01_ammo_F", DEF_PROD(5000)],               // Ausrstungskiste
    ["O_T_UGV_01_ghex_F", DEF_PROD(0)],                     // UGV Saif tropentarn
    ["O_UGV_01_F", DEF_PROD(2000)],                         // UGV Saif    
    ["O_UAV_01_F", DEF_PROD(0)],                            // Tayran AR-2
    ["FlexibleTank_01_sand_F", DEF_PROD(1000)],             // Treibstoff-Fass
    ["ACE_Box_82mm_Mo_HE", DEF_PROD(50000)],                // Mörsermuni
    //hextarn
    ["Land_Pod_Heli_Transport_04_fuel_F", DEF_PROD(8000)],      // Fuelcontainer
    ["Land_Pod_Heli_Transport_04_ammo_F", 0, 0, 0],             // Munitionscontainer
    ["Land_Pod_Heli_Transport_04_repair_F", DEF_PROD(8000)],    // Reparaturcontainer - 8000
    ["Land_Pod_Heli_Transport_04_box_F", DEF_PROD(0)],          // Cargocontainer
    //schwarz
    ["Land_Pod_Heli_Transport_04_fuel_black_F", DEF_PROD(0)],   // Fuelcontainer (schwarz)
    ["Land_Pod_Heli_Transport_04_ammo_black_F", DEF_PROD(0)],   // Munitionscontainer (Schwarz)   
    ["Land_Pod_Heli_Transport_04_repair_black_F", DEF_PROD(0)], // Reparaturcontainer (schwarz)
    ["Land_Pod_Heli_Transport_04_box_black_F", DEF_PROD(0)]     // Cargocontainer
];

GVAR(csat_static) = 
[
    ["O_HMG_01_high_F", DEF_PROD(10000)],                    // Stand-MG hoch
    ["O_HMG_01_F", DEF_PROD(10000)],                         // Stand-MG niedrig
    ["O_GMG_01_high_F", DEF_PROD(75000)],                    // Stand-GMG hoch
    ["O_GMG_01_F", DEF_PROD(75000)],                         // Stand-GMG niedrig
    ["O_static_AA_F", DEF_PROD(50000)],                      // Stand-AA
    ["O_static_AT_F", DEF_PROD(150000)],                     // Stand-AT
    ["O_Mortar_01_F", DEF_PROD(110000)],                     // MK6 Mrser
    ["O_Static_Designator_02_F", DEF_PROD(10000)]            // Remote Designator
];

GVAR(csat_sea) = 
[
    ["O_Boat_Transport_01_F", DEF_PROD(500)],                // Assault Boat
    ["O_Boat_Armed_01_hmg_F", DEF_PROD(14000)],              // Speedboat HMG
    ["O_G_Boat_Transport_02_F", DEF_PROD(7000)],             // rhib unbewaffnet
    ["O_SDV_01_F", DEF_PROD(2000)]                           // Submarine
];

GVAR(allNato) = GVAR(nato_vehicles) +
GVAR(nato_vehicles_supply) +
GVAR(nato_choppers) +
GVAR(nato_armored) +
GVAR(nato_supplies) +
GVAR(nato_static) +
GVAR(nato_sea);

GVAR(allCsat) = GVAR(csat_vehicles) +
GVAR(csat_vehicles_supply) +
GVAR(csat_choppers) +
GVAR(csat_armored) +
GVAR(csat_supplies) +
GVAR(csat_static) + 
GVAR(csat_sea);

GVAR(all) = GVAR(allNato) + GVAR(allCsat);
