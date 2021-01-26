#include "cbase.h"

#include <hudelement.h>

#include "c_mom_player.h"

#include "hud_macros.h"

#include "mom_shareddefs.h"
#include "mom_system_gamemode.h"

#include "view.h"
#include "iclientmode.h"

#include "vgui_controls/EditablePanel.h"
#include "utlvector.h"

//#include "VGuiMatSurface/IMatSystemSurface.h"
//#include "vgui/ILocalize.h"
#include "vgui/ISurface.h"
#include "vgui/IVGui.h"

#include "hud_analyzer_features.h"
#include "hud_analyzer_history_data.h"

#include "in_buttons.h"

#include "tier0/memdbgon.h"

using namespace vgui;

class CHudStrafeAnalyzerHistory : public CHudElement, public EditablePanel
{
  public:
    DECLARE_CLASS_SIMPLE(CHudStrafeAnalyzerHistory, vgui::EditablePanel);

    CHudStrafeAnalyzerHistory(const char *pElementName)
        : CHudElement(pElementName), EditablePanel(g_pClientMode->GetViewport(), pElementName)
    {
        ivgui()->AddTickSignal(GetVPanel(), 100);

        // m_pSlider = new Slider(this, "SomeSlider");

        LoadControlSettings("resource/ui/hud/HudStrafeAnalyzer.res"); // Loading layout/etc settings, to be reloaded
                                                                      // with "hud_reloadcontrols"
    }
    ~CHudStrafeAnalyzerHistory() { ivgui()->RemoveTickSignal(GetVPanel()); }



  protected:
    bool ShouldDraw() override;

    void Init() override;
    void LevelInit() override;
    void LevelShutdown() override;

    void OnThink() override;
    void Paint() override;

  private:
    CUtlVector<CHudAnalyzerFeatureBase *> m_vecFeatures;
};

DECLARE_HUDELEMENT(CHudStrafeAnalyzerHistory);

//DECLARE_HUD_MESSAGE(CHudStrafeAnalyzerHistory, DataUpdate);

static MAKE_TOGGLE_CONVAR(mom_hud_strafeanalyzer_enable, "1", FCVAR_ARCHIVE,
                          "Enables strafe analyzer. 0 = OFF, 1 = ON.\n");

CUtlVector<StrafeHist> History::strafes;

/// <summary>
/// Runs each frame, before Paint()
/// </summary>
void CHudStrafeAnalyzerHistory::OnThink()
{
    const auto pNormalPlayer = CBasePlayer::GetLocalPlayer();
    const auto vecVel = pNormalPlayer->GetAbsVelocity();
    const auto angAngles = pNormalPlayer->GetAbsAngles();
    const auto vecPos = pNormalPlayer->GetAbsOrigin();
    const auto iButtons = pNormalPlayer->m_nButtons;

    // raw delta value
    double dbDeltaYaw = 0;
    PositionType ePosType;
    MouseDir eMouseDir, eStrafeDir;
    KeyDir eKeyDir;

    if (History::strafes.Size() >= 2)
    {
        dbDeltaYaw = subtractAngle(angAngles.y, History::strafes[History::strafes.Size() - 2].viewangles.y);
    }

    // Mouse dir
    if (dbDeltaYaw > 0)
        eMouseDir = MouseDir::LEFT;
    else if (dbDeltaYaw < 0)
        eMouseDir = MouseDir::RIGHT;
    else
        eMouseDir = MouseDir::NONE;

    // Key dir
    if (iButtons & IN_MOVELEFT && iButtons & IN_MOVERIGHT || iButtons & IN_FORWARD && iButtons & IN_BACK)
        eKeyDir = KeyDir::COUNTER_STRAFE;
    else
    {
        if (iButtons & IN_FORWARD)
        {
            if (iButtons & IN_MOVELEFT)
                eKeyDir = KeyDir::FORWARD_LEFT;
            else if (iButtons & IN_MOVERIGHT)
                eKeyDir = KeyDir::FORWARD_RIGHT;
            else
                eKeyDir = KeyDir::FORWARD;
        }
        else if (iButtons & IN_BACK)
        {
            if (iButtons & IN_MOVELEFT)
                eKeyDir = KeyDir::BACK_LEFT;
            else if (iButtons & IN_MOVERIGHT)
                eKeyDir = KeyDir::BACK_RIGHT;
            else
                eKeyDir = KeyDir::BACK;
        }
        else if (iButtons & IN_MOVELEFT)
            eKeyDir = KeyDir::LEFT;
        else if (iButtons & IN_MOVERIGHT)
            eKeyDir = KeyDir::RIGHT;
        else
            eKeyDir = KeyDir::NONE;
    }

    // Strafe dir
    if (static_cast<int>(eMouseDir) == static_cast<int>(eKeyDir))
        eStrafeDir = eStrafeDir;

    // g_strafeDir = eMouseDir;

    auto speed = hypot(vecVel.x, vecVel.y);

    // Pos type
    switch (pNormalPlayer->GetFlags())
    {
    case FL_ONGROUND:
        ePosType = PositionType::GROUND;
        break;

    case FL_INWATER:
        ePosType = PositionType::WATER;
        break;
    default:
        ePosType = PositionType::AIR;
        break;
    }

    // PerfAngle Calculation
    const int ACCEL_LIMIT = 30;
    static ConVarRef airAccel("sv_airaccelerate");
    double accelSpeed = min((1 / TICK_INTERVAL) * ACCEL_LIMIT * airAccel.GetFloat(), ACCEL_LIMIT);
    double lazyPerfDeltaYaw = RAD2DEG(atan2f(accelSpeed, speed));

    // if (playerHasBeenOnGround(History::strafeHist.size() - 1))
    //{
    //    perfYaw = 1.18; // Hacky way of getting the correct prespeed angle
    //}

    // This swaps all elements (except the last) to the right.
    // this essentially removes the last element (oldest tick) from the vector
    // start at the top of the vector, and set each value to the previous value, shifting everything right.
    for (int i = History::strafes.Size() - 1; i > 0; i--)
        History::strafes[i] = History::strafes[i - 1];

    // Set the most recent data in our history
    History::strafes[0].pos = vecPos;
    History::strafes[0].vel = vecVel;
    History::strafes[0].viewangles = angAngles;
    History::strafes[0].deltaYaw = abs(dbDeltaYaw);
    History::strafes[0].lazyPerfDeltaYaw = lazyPerfDeltaYaw;
    History::strafes[0].buttons = iButtons;
    History::strafes[0].synced = false; // checkSynced();
    History::strafes[0].jumped = false; // checkJumped();
    History::strafes[0].mouseDir = eMouseDir;
    History::strafes[0].keyDir = eKeyDir;
    History::strafes[0].positionType = ePosType;

    ////////////////////////////////////////////////////////////////
    // fill the vecFeatures
    //m_vecFeatures.EnsureCount(3);
    //m_vecFeatures[0] = new CHudAnalyzerStrafeTrainer;

    //CHudAnalyzerSyncTrainer syncTrainer;
    //m_vecFeatures.push_back(*syncTrainer);

    // after updating the history vector, run all features Think()
    for (auto feature : m_vecFeatures)
    {
        feature->Think();
    }
}

/// <summary>
/// Runs each frame, after OnThink()
/// </summary>
void CHudStrafeAnalyzerHistory::Paint()
{
    // run all features Paint()
    for (auto feature : m_vecFeatures)
    {
        feature->Paint();
    }
}

/// <summary>
/// Determines the visibility of our functions
/// </summary>
/// <returns>Returns the value of our CVAR: mom_hud_strafeanalyzer_enable</returns>
bool CHudStrafeAnalyzerHistory::ShouldDraw()
{
    return CHudElement::ShouldDraw() && mom_hud_strafeanalyzer_enable.GetBool();
}

/// <summary>
/// Called on connect
/// </summary>
void CHudStrafeAnalyzerHistory::Init()
{
    int REPLACE_WITH_HISTORY_SIZE_CONVAR = 100;
    History::strafes.EnsureCount(REPLACE_WITH_HISTORY_SIZE_CONVAR);
}

/// <summary>
/// Called on connect + mapchange
/// </summary>
void CHudStrafeAnalyzerHistory::LevelInit()
{
    // ivgui()->AddTickSignal(GetVPanel(), int(g_pGameModeSystem->GetGameMode()->GetIntervalPerTick() * 1000.0f));
}

/// <summary>
/// Called on disconnect/mapchange/etc
/// </summary>
void CHudStrafeAnalyzerHistory::LevelShutdown() { History::strafes.PurgeAndDeleteElements(); }

/// <summary>
/// Subtracts two angles and finds the smallest angle between any two angles
/// Input: two angles, Output: smallest angle between them
/// </summary>
double subtractAngle(double angle1, double angle2)
{
    double temp = angle1 - angle2;

    if (temp > 180)
        temp -= 360;

    if (temp < -180)
        temp += 360;

    return temp;
}


