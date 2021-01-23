// this will be included in all seperate features for access to History::strafes
#include "analyzer_history_data.h"

// all features
#include "analyzer_features.h"

class CHudStrafeAnalyzerHistory : public CHudElement
{
public:
    void OnThink() OVERRIDE;  
    void Paint() OVERRIDE;
    
protected:
  CUtilVect<CHudFeatureBase *> m_vecFeatures;
}

void CHudStrafeAnalyzerHistory::OnThink()
{
  // grab newest vector elements
  ....
  ...
  ..
  .
  // manually swap all vector elements to the right
  ....
  ...
  ..
  .
  
  // fill the vecFeatures  
  CHudAnalyzerStrafeTrainer strafeTrainer;
  m_vecFeatures.push_back(*strafeTrainer);
    
  CHudAnalyzerSyncTrainer syncTrainer;
  m_vecFeatures.push_back(*syncTrainer);
    
  // after updating the history vector, run all features Think()
  for (auto feature : m_vecFeatures)
  {
      feature->Think();
  }
}


void CHudStrafeAnalyzerHistory::Paint()
{
  // run all features Paint()
  for (auto feature : m_vecFeatures)
  {
    feature->Paint();
  }
}
