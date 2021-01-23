// this will be included in all seperate features for access to History::strafes
#include "analyzer_history_data.h"

// all features
#include "analyzer_feature_strafetrainer.h"
#include "analyzer_feature_straferange.h"

class CHudStrafeAnalyzerHistory : public CHudElement
{
public:
    void OnThink() OVERRIDE;  
    void Paint() OVERRIDE;
    
protected:
  CUtilVect<Panel *> m_vecFeatures;
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
