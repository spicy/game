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

struct StrafeHist
{
    Vector pos, vel;
    QAngle viewangles;
    double deltaYaw, lazyPerfDeltaYaw;

    int buttons;

    bool synced, jumped;

    MouseDir mouseDir, strafeDir;
    KeyDir keyDir;

    PositionType positionType;
};

class History
{
  public:
    static CUtlVector<StrafeHist> strafes;
};