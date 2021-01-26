#pragma once
#include "utlvector.h"

/*
    double ButtonsPhi(KeyDir keyDir)
    {
        switch (keyDir) {
        case       FORWARD: return 0;
        case  FORWARD_LEFT: return M_PI / 4;
        case          LEFT: return M_PI / 2;
        case     BACK_LEFT: return 3 * M_PI / 4;
        case          BACK: return -M_PI;
        case    BACK_RIGHT: return -3 * M_PI / 4;
        case         RIGHT: return -M_PI / 2;
        case FORWARD_RIGHT: return -M_PI / 4;
        default: return 0;
        }
    }
*/

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

    // int curYawX, curYawY;
    // int perfYawX, perfYawY;  make a framebuffer array
};

class History
{
  public:
    static CUtlVector<StrafeHist> strafes;
};