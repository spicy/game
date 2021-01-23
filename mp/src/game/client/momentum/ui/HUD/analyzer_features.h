class CHudFeatureBase
{
public:
    void OnThink() OVERRIDE;  
    void Paint() OVERRIDE;  
};

class CHudAnalyzerStrafeTrainer : public CHudElement, public CHudFeatureBase { };
class CHudAnalyzerStrafeRange : public CHudElement, public CHudFeatureBase { };
class CHudAnalyzerSyncTrainer : public CHudElement, public CHudFeatureBase { };
