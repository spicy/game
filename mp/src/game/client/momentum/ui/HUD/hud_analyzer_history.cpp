#include "analyzer_history_data.h"

// all features
#include "analyzer_features.h"

class CHudStrafeAnalyzerHistory : public CHudElement
{
public:
    void OnThink() override;  
    void Paint() override;
    
protected:
  CUtilVect<CHudFeatureBase *> m_vecFeatures;
}

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
    // m_vecFeatures.EnsureCount(3);
    // m_vecFeatures[0] = new CHudAnalyzerStrafeTrainer;

    // CHudAnalyzerSyncTrainer syncTrainer;
    // m_vecFeatures.push_back(*syncTrainer);
  
  // fill the vecFeatures
  CHudAnalyzerStrafeTrainer strafeTrainer;
  m_vecFeatures.push_back(*strafeTrainer);
    
  CHudAnalyzerSyncTrainer syncTrainer;
  m_vecFeatures.push_back(*syncTrainer);
    
  // after updating the history vector, run all features Think()
  for (auto feature : m_vecFeatures)
  {
      feature->OnThink();
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
