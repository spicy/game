#pragma once
#include "hudelement.h"
#include "vgui_controls/EditablePanel.h"

using namespace vgui;

class CHudAnalyzerStrafeTrainer : public CHudElement, public vgui::EditablePanel
{
    DECLARE_CLASS_SIMPLE(CHudAnalyzerStrafeTrainer, vgui::EditablePanel);

  public:
    CHudAnalyzerStrafeTrainer(const char *pElementName);
    void OnThink() override;
    void Paint() override;
    // void Init() override;
    // void Reset() override;
};

extern CHudAnalyzerStrafeTrainer *g_pStrafeTrainer;

// class CHudAnalyzerStrafeRange
// class CHudAnalyzerSyncTrainer
