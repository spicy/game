#pragma once
#include "utlvector.h"

enum class MouseDir
{
    LEFT = -1,
    NONE,
    RIGHT
};

enum class KeyDir
{
    LEFT = -1,
    NONE,
    RIGHT,
    FORWARD,
    FORWARD_LEFT,
    FORWARD_RIGHT,
    BACK,
    BACK_LEFT,
    BACK_RIGHT,
    COUNTER_STRAFE
};

enum class PositionType
{
    GROUND = 0,
    AIR,
    WATER
};


/// <summary>
/// Checks if the players keypresses are synced with their mouse movements.
/// </summary>
/// <returns> 0 = counterstrafing, 1 = synced, 2 = not synced </returns>
enum class SyncType
{
    COUNTERSTRAFE = 0,
    SYNCED,
    NOT_SYNCED
};

struct StrafeHist
{
    Vector pos, vel;
    QAngle viewangles;
    double deltaYaw, perfDeltaYaw;
    double speed;

    int buttons;

    SyncType syncState;
    bool jumped;

    MouseDir mouseDir, strafeDir;
    KeyDir keyDir;

    PositionType positionType;
};

class History
{
  public:
    static CUtlVector<StrafeHist> strafes;
};