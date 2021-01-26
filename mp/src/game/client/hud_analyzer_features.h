#pragma once
#include "hudelement.h"
#include "vgui_controls/EditablePanel.h"

using namespace vgui;

class CHudAnalyzerFeatureBase
{
  public:
    virtual void Think();
    virtual void Paint();
};

class CHudAnalyzerStrafeTrainer : public CHudAnalyzerFeatureBase
{
  public:
    void Think() override;
    void Paint() override;
};
class CHudAnalyzerStrafeRange : public CHudAnalyzerFeatureBase
{
  public:
    void Think() override;
    void Paint() override;
};
class CHudAnalyzerSyncTrainer : public CHudAnalyzerFeatureBase
{
  public:
    void Think() override;
    void Paint() override;
};
