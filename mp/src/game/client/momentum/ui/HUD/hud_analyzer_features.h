class CHudFeatureBase : public CHudElement
{
public:
    void OnThink() override;  
    void Paint() override;  
};

class CHudAnalyzerStrafeTrainer : public CHudFeatureBase { };
class CHudAnalyzerStrafeRange : public CHudFeatureBase { };
class CHudAnalyzerSyncTrainer : public CHudFeatureBase { };
