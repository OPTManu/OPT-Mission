#define COMPONENT cargo
#define COMPONENT_BEAUTIFIED Cargo
#include "..\main\script_mission.hpp"

//#define DEBUG_MODE_MINIMAL
#define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_cargo
    #define DEBUG_MODE_FULL
#endif

#include "..\main\script_macros.hpp"
#include "setup.hpp"