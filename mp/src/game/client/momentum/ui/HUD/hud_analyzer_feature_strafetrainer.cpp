#include "cbase.h"

#include "c_mom_player.h"
#include "clientmode.h"
#include "hud_analyzer_features.h"
#include "hudelement.h"
#include "mom_system_gamemode.h"
#include "util/mom_util.h"

#include "tier0/memdbgon.h"

using namespace vgui;
static MAKE_TOGGLE_CONVAR(mom_hud_analyzer_strafetrainer, "1", FCVAR_CLIENTCMD_CAN_EXECUTE | FCVAR_ARCHIVE,
                          "Toggles displaying the strafe trainer graph.\n");

static ConVar analyzer_strafetrainer_graphtype(
    "mom_hud_strafesync_type", "1", FCVAR_CLIENTDLL | FCVAR_CLIENTCMD_CAN_EXECUTE | FCVAR_ARCHIVE,
    "1: Filled graph\n 2: Line Graph\n 3: Horizontal Bar\n 4: Vertical Bar\n", true, 1, true, 4);

static ConVar analyzer_strafetrainer_colorize(
    "mom_hud_analyzer_strafetrainer_colorize", "2", FCVAR_CLIENTDLL | FCVAR_CLIENTCMD_CAN_EXECUTE | FCVAR_ARCHIVE,
    "Toggles strafetrainer data colorization type based on sync and speedloss. 0 to disable and set to static color\n",
    true, 0, true, 2);
void CHudAnalyzerStrafeTrainer::OnThink()
{





}

void CHudAnalyzerStrafeTrainer::Paint()
{





}
