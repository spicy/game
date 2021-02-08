
#include "hud_analyzer_features.h"
#include "hud_analyzer_history_data.h"

#include "c_mom_player.h"
#include "clientmode.h"
#include "hudelement.h"
#include "mom_system_gamemode.h"
#include "util/mom_util.h"

#include "vgui/ISurface.h"

#include "tier0/memdbgon.h"

using namespace vgui;
static MAKE_TOGGLE_CONVAR(mom_hud_analyzer_strafetrainer, "1", FCVAR_CLIENTCMD_CAN_EXECUTE | FCVAR_ARCHIVE,
                          "Toggles displaying the strafe trainer graph.\n");

static ConVar analyzer_strafetrainer_type("mom_hud_strafetrainer_type", "1",
                                          FCVAR_CLIENTDLL | FCVAR_CLIENTCMD_CAN_EXECUTE | FCVAR_ARCHIVE,
                                          "1: Filled graph\n 2: Line Graph\n 3: Horizontal Bar\n 4: Vertical Bar\n",
                                          true, 1, true, 4);

static MAKE_TOGGLE_CONVAR(analyzer_strafetrainer_colorize, "1", FCVAR_CLIENTCMD_CAN_EXECUTE | FCVAR_ARCHIVE,
                          "Toggles strafetrainer data colorization type based on sync and speedloss. 0 to disable and "
                          "set to default static color\n");

static MAKE_TOGGLE_CONVAR(mom_hud_strafetrainer_centered, "1", FCVAR_CLIENTCMD_CAN_EXECUTE | FCVAR_ARCHIVE,
                          "Centers the strafe trainer graph.\n");

static ConVar analyzer_strafetrainer_xoffset(
    "mom_hud_analyzer_strafetrainer_xoffset", "960", FCVAR_CLIENTDLL | FCVAR_CLIENTCMD_CAN_EXECUTE | FCVAR_ARCHIVE,
    "The X coordinate of the strafe trainer graph on the players screen, if not centered\n", true, 0, false, 0);

static ConVar analyzer_strafetrainer_yoffset("mom_hud_analyzer_strafetrainer_yoffset", "1000",
                                             FCVAR_CLIENTDLL | FCVAR_CLIENTCMD_CAN_EXECUTE | FCVAR_ARCHIVE,
                                             "The Y coordinate of the strafe trainer graph on the players screen\n",
                                             true, 0, false, 0);

static MAKE_TOGGLE_CONVAR(mom_hud_analyzer_strafetrainer_stats, "1", FCVAR_CLIENTCMD_CAN_EXECUTE | FCVAR_ARCHIVE,
                          "Toggles displaying the strafe trainer stats.\n");

CHudAnalyzerStrafeTrainer *g_pStrafeTrainer = nullptr;

CHudAnalyzerStrafeTrainer::CHudAnalyzerStrafeTrainer(const char *pElementName)
    : CHudElement(pElementName), EditablePanel(g_pClientMode->GetViewport(), "HudStrafeAnalyzer")
{
    // ListenForGameEvent("zone_exit");
    // ListenForGameEvent("zone_enter");
}

void CHudAnalyzerStrafeTrainer::OnThink()
{
    // Update the values of our strafe trainer stat labels
}

bool playerHasBeenOnGround(int index)
{
    if (!(History::strafes.Size() > 1))
        return false;
    if (index < 0 || index >= History::strafes.Size() - 1)
        return false;

    return (History::strafes[index].positionType == PositionType::GROUND &&
            History::strafes[index + 1].positionType == PositionType::GROUND);
}

bool playerLostSpeed(int index, double tolerance)
{
    if (!(History::strafes.Size() > 1))
        return false;
    if (index < 0 || index >= History::strafes.Size() - 1)
        return false;

    // if lost speed, diff is negative
    double diff = History::strafes[index].speed < History::strafes[index].speed;
    return (diff < -tolerance);
}

Color getCurTickColor(int index, double tolerance)
{
    Color colorPerf = {255, 255, 255, 120}, colorSynced = {61, 79, 115, 255}, colorNotSynced = {216, 162, 55, 255},
          colorLeft = {61, 79, 115, 255}, colorRight = {216, 162, 55, 255}, colorCS = {0, 0, 0, 255},
          colorLostSpeed = {250, 75, 75, 255};

    Color curStateColor;

    // Switches color based on the keystate
    if (playerHasBeenOnGround(index))
        curStateColor = {73, 112, 191, 255};    // Player has been on the ground for at least 2 ticks in a row
    else if (playerLostSpeed(index, tolerance)) // Lostspeed
        curStateColor = colorLostSpeed;
    else
    {
        switch (History::strafes[index].syncState)
        {
        case SyncType::COUNTERSTRAFE:
            curStateColor = colorCS; // Counterstrafing
            break;
        case SyncType::SYNCED:
            curStateColor = colorSynced; // Synced
            break;
        case SyncType::NOT_SYNCED:
            curStateColor = colorNotSynced; // Not Synced
            break;
        }
    }
    return curStateColor;
}

void CHudAnalyzerStrafeTrainer::Paint()
{
    if (!(History::strafes.Size() > 1))
        return;
    if (!(mom_hud_analyzer_strafetrainer.GetBool()))
        return;

    const int DATA_WIDTH = 5; // g_menu.features.strafetrainer.dataWidth;
    const int DATA_HEIGHT = 5;
    const int HISTORY_SIZE = History::strafes.Size();
    const int MAX_ANGLE = 20;
    const float SPEEDLOSS_TOLERANCE = 0.01f;

    int screenWidth, screenHeight;
    surface()->GetScreenSize(screenWidth, screenHeight);

    // Find the correct graph Offset based on menuoptions
    int xOffset = analyzer_strafetrainer_xoffset.GetInt();
    int yOffset = analyzer_strafetrainer_yoffset.GetInt();

    Color colorPerfDeltaYaw = {255, 255, 255, 120};

    if (mom_hud_strafetrainer_centered.GetBool())
    {
        xOffset = (screenWidth / 2) - ((HISTORY_SIZE * DATA_WIDTH) / 2);
    }

    if (analyzer_strafetrainer_type.GetInt() == 0) // Filled Graph
    {
        for (int i = 0; i < HISTORY_SIZE; i++)
        {
            // Ensures we are not drawing large angles
            if (History::strafes[i].perfDeltaYaw < MAX_ANGLE)
            {
                // Draw PerfDeltaYaw
                surface()->DrawSetColor(colorPerfDeltaYaw);
                surface()->DrawFilledRect(xOffset + (DATA_WIDTH * i),
                                          yOffset - (DATA_HEIGHT * History::strafes[i].perfDeltaYaw), DATA_WIDTH,
                                          (DATA_HEIGHT * History::strafes[i].perfDeltaYaw));
            }

            if (History::strafes[i].deltaYaw < MAX_ANGLE)
            {
                // Draw actual deltaYaw
                surface()->DrawSetColor(getCurTickColor(i, SPEEDLOSS_TOLERANCE));
                surface()->DrawFilledRect(xOffset + (DATA_WIDTH * i),
                                          yOffset - (DATA_HEIGHT * History::strafes[i].deltaYaw), DATA_WIDTH,
                                          (DATA_HEIGHT * History::strafes[i].deltaYaw));
            }
        }
    }
    else if (analyzer_strafetrainer_type.GetInt() == 1) // Line Graph
    {
        for (int i = 0; i < HISTORY_SIZE - 1; i++)
        {
            // Ensures we are not drawing large angles
            if (History::strafes[i].perfDeltaYaw < MAX_ANGLE && History::strafes[i + 1].perfDeltaYaw < MAX_ANGLE)
            {
                surface()->DrawSetColor(colorPerfDeltaYaw);
                // Draw the line X times to thicken it (with some Y offset)
                for (int j = 0; j < 2; j++)
                {
                    surface()->DrawLine(
                        xOffset + (DATA_WIDTH * i), yOffset - (DATA_HEIGHT * History::strafes[i].perfDeltaYaw) + j,
                        xOffset + (DATA_WIDTH * i), yOffset - (DATA_HEIGHT * History::strafes[i + 1].perfDeltaYaw) + j);
                }
            }

            if (History::strafes[i].deltaYaw < MAX_ANGLE && History::strafes[i + 1].deltaYaw < MAX_ANGLE)
            {
                surface()->DrawSetColor(getCurTickColor(i, SPEEDLOSS_TOLERANCE));
                // Draw the line X times to thicken it (with some Y offset)
                for (int j = 0; j < 3; j++)
                {
                    surface()->DrawLine(
                        xOffset + (DATA_WIDTH * i), yOffset - (DATA_HEIGHT * History::strafes[i].perfDeltaYaw) + j,
                        xOffset + (DATA_WIDTH * i), yOffset - (DATA_HEIGHT * History::strafes[i + 1].perfDeltaYaw) + j);
                }
            }
        }
    }
    else if (analyzer_strafetrainer_type.GetInt() == 2) // Horizontal
    {

        // Find the ratio of deltaYaw to perfangle
        const int DESIRED_PIXELS = 500;
        const double maxAngle = History::strafes[0].perfDeltaYaw * 2;
        const double anglePerPixel = maxAngle / DESIRED_PIXELS;
        double viewangleX = min(History::strafes[0].deltaYaw, maxAngle) / anglePerPixel;

        surface()->DrawSetColor(colorPerfDeltaYaw);
        surface()->DrawOutlinedRect((screenWidth / 2) - 250, 650, 500, 50);  // Top horiz
        surface()->DrawLine((screenWidth / 2), 650, (screenWidth / 2), 700); // Middle line

        surface()->DrawSetColor(61, 79, 115, 255);
        surface()->DrawFilledRect((screenWidth / 2) - 250 + viewangleX, 650, 2, 50); // Viewangle

        // use getCurTickColor(0, SPEEDLOSS_TOLERANCE));  if we want it to change colors based on the current state
        // (though hard to see)
    }
    else if (analyzer_strafetrainer_type.GetInt() == 3) // Vertical
    {
        // Find the ratio of deltaYaw to perfangle
        const int DESIRED_PIXELS = 500;
        const double maxAngle = 13;
        const double anglePerPixel = maxAngle / DESIRED_PIXELS;
        double curYawX = min(History::strafes[0].deltaYaw, maxAngle) / anglePerPixel;
        double perfYawX = min(History::strafes[0].perfDeltaYaw, maxAngle) / anglePerPixel;

        surface()->DrawSetColor(colorPerfDeltaYaw);
        surface()->DrawOutlinedRect((screenWidth / 2) - 20, 500, 40, 500); // Top horiz

        surface()->DrawSetColor(61, 79, 115, 255);
        surface()->DrawFilledRect((screenWidth / 2) - 20, 1000 - curYawX, 39, 3); // Player delta yaw
        surface()->DrawSetColor(216, 162, 55, 255);
        surface()->DrawFilledRect((screenWidth / 2) - 20, 1000 - perfYawX, 39, 3); // Perfect delta yaw
    }

    // Draws StrafeTrainer Stats
    if (mom_hud_analyzer_strafetrainer_stats.GetBool())
    {
        if (mom_hud_strafetrainer_centered.GetBool())
        {
            // int tempcenter = (screenWidth / 2) + ((historySize * dataWidth) / 2);
            // render::s_text(screenWidth - tempcenter - 150, yOffset - 80, color::white(255), render::moon_font, false,
            // "90-100 = " + UAnalyzer.cur.trainerstats.sPhan); render::s_text(screenWidth - tempcenter - 150, yOffset -
            // 60, color::white(255), render::moon_font, false, "80-90 = " + UAnalyzer.cur.trainerstats.sZeltim);
            // render::s_text(screenWidth - tempcenter - 150, yOffset - 40, color::white(255), render::moon_font, false,
            // "70-80 = " + UAnalyzer.cur.trainerstats.sAppa); render::s_text(screenWidth - tempcenter - 150, yOffset -
            // 20, color::white(255), render::moon_font, false, "< 70 = " + UAnalyzer.cur.trainerstats.sTST);
        }
        else
        {
            // render::s_text(xOffset - 150, yOffset - 80, color::white(255), render::moon_font, false, "90-100 = " +
            // UAnalyzer.cur.trainerstats.sPhan); render::s_text(xOffset - 150, yOffset - 60, color::white(255),
            // render::moon_font, false, "80-90 = " + UAnalyzer.cur.trainerstats.sZeltim); render::s_text(xOffset - 150,
            // yOffset - 40, color::white(255), render::moon_font, false, "70-80 = " +
            // UAnalyzer.cur.trainerstats.sAppa); render::s_text(xOffset - 150, yOffset - 20, color::white(255),
            // render::moon_font, false, "< 70 = " + UAnalyzer.cur.trainerstats.sTST);
        }
    }
}

CHudAnalyzerStrafeTrainer *g_pStrafeTrainer;