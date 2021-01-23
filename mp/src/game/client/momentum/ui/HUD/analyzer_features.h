class CHudFeatureBase
{
public:
    void OnThink() OVERRIDE;  
    void Paint() OVERRIDE;  
};

class CHudAnalyzerStrafeTrainer : public CHudFeatureBase { };
class CHudAnalyzerStrafeRange : public CHudFeatureBase { };
class CHudAnalyzerSyncTrainer : public CHudFeatureBase { };
