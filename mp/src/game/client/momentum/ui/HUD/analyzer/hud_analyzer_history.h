#pragma once
#include "hud_analyzer_features.h"
#include "hud_analyzer_history_data.h"

#include "c_mom_player.h"
#include "clientmode.h"

#include <hudelement.h>
#include "vgui_controls/EditablePanel.h"

#include "hud_analyzer_features.h"


class CHudStrafeAnalyzerHistory : public CHudElement, public EditablePanel
{
  public:
    DECLARE_CLASS_SIMPLE(CHudStrafeAnalyzerHistory, vgui::EditablePanel);

    CHudStrafeAnalyzerHistory(const char *pElementName)
        : CHudElement(pElementName), EditablePanel(g_pClientMode->GetViewport(), pElementName);

    // Give History access to features
    friend CHudAnalyzerStrafeTrainer;

  protected:
    bool ShouldDraw() override;

    void Init() override;
    void LevelInit() override;
    void LevelShutdown() override;
    void FireGameEvent(IGameEvent *pEvent) override;

    void OnThink() override;
    void Paint() override;

  private:
    C_MomRunStats *m_pRunStats;
    C_MomRunEntityData *m_pRunEntData;

    CUtlVector<Panel *> m_vecFeatures;
    CUtlVector<StrafeHist> strafes; // global for features/extern? or use friends
};