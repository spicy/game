"resource/ui/settings/Settings_Video.res"
{
    "VideoPage"
    {
        "ControlName"        "EditablePanel"
        "fieldName"        "VideoPage"
        "proportionalToParent" "0"
        "wide" "f0"
        "tall" "880"
        "autoResize"        "0"
        "pinCorner"        "0"
        "RoundedCorners"        "15"
        "pin_corner_to_sibling"        "0"
        "pin_to_sibling_corner"        "0"
        "visible"        "0"
        "enabled"        "1"
        "tabPosition"        "0"
        "settitlebarvisible"        "1"
        "BgColor_override" "MomGreydientStep4"
    }

    "VideoSettingsLabel"
    {
        "ControlName"        "Label"
        "fieldName"        "VideoSettingsLabel"
        "xpos"        "0"
        "ypos"        "12"
        "proportionalToParent" "1"
        "wide"        "f0"
        "tall"        "24"
        "pin_corner_to_sibling" "0"
        "pin_to_sibling_corner" "0"
        "autoResize"        "0"
        "pinCorner"        "0"
        "visible"        "1"
        "enabled"        "1"
        "tabPosition"        "0"
        "BgColor"        "0 0 0 0"
        "allowColorOverrides"        "0"
        "labelText"        "#MOM_Settings_Title_Video"
        "textAlignment"        "center"
        "dulltext"        "0"
        "brighttext"        "0"
        "wrap"        "0"
        "centerwrap"        "0"
        "textinsetx"        "0"
        "textinsety"        "0"
        "auto_wide_tocontents" "0"
        "auto_tall_tocontents" "1"
        "font" "Subheader"
    }
    
	"FOVLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"FOVLabel"
        "xpos"		"-16"
		"ypos"		"10"
		"wide"		"250"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "VideoSettingsLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"6"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"textAlignment"		"east"
		"labelText"		"#GameUI_FOV"
		"associate"		"FOVSlider"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "1"
	}
	"FOVSlider"
	{
		"ControlName"		"CvarSlider"
		"fieldName"		"FOVSlider"
		"cvar_name"		"fov_desired"
		"minvalue"		"90"
		"maxvalue"		"179"
        "precision"     "0"
        "autoapply"     "0"
		"usecvarbounds" "0"
        "xpos"		"24"
		"ypos"		"4"
		"wide"		"175"
		"tall"		"30"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "FOVLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"1"
		"leftText"		""
		"rightText"		""
	}
    "FOVEntry"
	{
		"ControlName"		"CvarTextEntry"
		"fieldName"		"FOVEntry"
		"cvar_name"     "fov_desired"
		"xpos"		"6"
		"ypos"		"0"
		"wide"		"36"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "FOVSlider"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"3"
		"textHidden"		"0"
		"editable"		"1"
		"maxchars"		"3"
		"NumericInputOnly"		"1"
		"unicode"		"0"
        "precision" "0"
        "draw_offset_x" "6"
        "actionsignallevel" "1"
	}

    "DisplayModeLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"DisplayModeLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "FOVLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_DisplayMode"
		"textAlignment"		"east"
		"associate"		"DisplayModeCombo"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"DisplayModeCombo"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"DisplayModeCombo"
        "xpos"		"0"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "FOVSlider"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}
    
	"AspectRatioLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"AspectRatioLabel"
		"xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "DisplayModeLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_AspectRatio"
		"textAlignment"		"east"
		"associate"		"AspectRatio"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"AspectRatio"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"AspectRatio"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "DisplayModeCombo"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

	"ResolutionLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"ResolutionLabel"
		"xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "AspectRatioLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Resolution"
		"textAlignment"		"east"
		"associate"		"Resolution"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"Resolution"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"Resolution"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "AspectRatio"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

    "RenderSettingsDivider"
    {
        "ControlName" "Divider"
        "fieldName" "RenderSettingsDivider"
        "xpos" "cs-0.5"
        "ypos" "166"
        "proportionalToParent" "1"
        "wide" "500"
        "tall" "1"
    }

    "RenderSettingsLabel"
    {
        "ControlName"        "Label"
        "fieldName"        "RenderSettingsLabel"
        "xpos"        "0"
        "ypos"        "12"
        "proportionalToParent" "1"
        "wide"        "f0"
        "tall"        "24"
        "pin_to_sibling" "RenderSettingsDivider"
        "pin_corner_to_sibling" "4"
        "pin_to_sibling_corner" "6"
        "autoResize"        "0"
        "pinCorner"        "0"
        "visible"        "1"
        "enabled"        "1"
        "tabPosition"        "0"
        "BgColor"        "0 0 0 0"
        "allowColorOverrides"        "0"
        "labelText"        "#MOM_Settings_Title_Video_Render"
        "textAlignment"        "center"
        "dulltext"        "0"
        "brighttext"        "0"
        "wrap"        "0"
        "centerwrap"        "0"
        "textinsetx"        "0"
        "textinsety"        "0"
        "auto_wide_tocontents" "0"
        "auto_tall_tocontents" "1"
        "font" "Subheader"
    }

	"AntialiasingModeLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"AntialiasingModeLabel"
        "xpos"		"0"
		"ypos"		"60"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "ResolutionLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Antialiasing_Mode"
		"textAlignment"		"east"
		"associate"		"AntialiasingMode"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"AntialiasingMode"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"AntialiasingMode"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "AntialiasingModeLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

	"FilteringModeLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"FilteringModeLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "AntialiasingModeLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Filtering_Mode"
		"textAlignment"		"east"
		"associate"		"FilteringMode"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"FilteringMode"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"FilteringMode"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "FilteringModeLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

	"VSyncLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"VSyncLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "FilteringModeLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Wait_For_VSync"
		"textAlignment"		"east"
		"associate"		"VSync"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"VSync"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"VSync"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "VSyncLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}
    
	"ModelDetailLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"ModelDetailLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "VSyncLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Model_Detail"
		"textAlignment"		"east"
		"associate"		"ModelDetail"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
    "ModelDetail"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"ModelDetail"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "ModelDetailLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

	"TextureDetailLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"TextureDetailLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "ModelDetailLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Texture_Detail"
		"textAlignment"		"east"
		"associate"		"TextureDetail"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
    "TextureDetail"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"TextureDetail"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "TextureDetailLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

    
	"ShadowDetailLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"ShadowDetailLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "TextureDetailLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Shadow_Detail"
		"textAlignment"		"east"
		"associate"		"ShadowDetail"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"ShadowDetail"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"ShadowDetail"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "ShadowDetailLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

    
	"ShaderDetailLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"ShaderDetailLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "ShadowDetailLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Shader_Detail"
		"textAlignment"		"east"
		"associate"		"ShaderDetail"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
    "ShaderDetail"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"ShaderDetail"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "ShaderDetailLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

    
	"WaterDetailLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"WaterDetailLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "ShaderDetailLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Water_Detail"
		"textAlignment"		"east"
		"associate"		"WaterDetail"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"WaterDetail"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"WaterDetail"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "WaterDetailLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

    
	"MulticoreLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"MulticoreLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "WaterDetailLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
        "associate" "Multicore"
		"labelText"		"#GameUI_MulticoreRendering"
		"textAlignment"		"east"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
        
	}
	"Multicore"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"Multicore"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "MulticoreLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}


    "PostProcSettingsDivider"
    {
        "ControlName" "Divider"
        "fieldName" "PostProcSettingsDivider"
        "xpos" "cs-0.5"
        "ypos" "476"
        "proportionalToParent" "1"
        "wide" "500"
        "tall" "1"
    }

    "PostProcSettingsLabel"
    {
        "ControlName"        "Label"
        "fieldName"        "PostProcSettingsLabel"
        "xpos"        "0"
        "ypos"        "12"
        "proportionalToParent" "1"
        "wide"        "f0"
        "tall"        "24"
        "pin_to_sibling" "PostProcSettingsDivider"
        "pin_corner_to_sibling" "4"
        "pin_to_sibling_corner" "6"
        "autoResize"        "0"
        "pinCorner"        "0"
        "visible"        "1"
        "enabled"        "1"
        "tabPosition"        "0"
        "BgColor"        "0 0 0 0"
        "allowColorOverrides"        "0"
        "labelText"        "#MOM_Settings_Title_Video_Post"
        "textAlignment"        "center"
        "dulltext"        "0"
        "brighttext"        "0"
        "wrap"        "0"
        "centerwrap"        "0"
        "textinsetx"        "0"
        "textinsety"        "0"
        "auto_wide_tocontents" "0"
        "auto_tall_tocontents" "1"
        "font" "Subheader"
    }

	"ColorCorrectionLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"ColorCorrectionLabel"
        "xpos"		"-14"
		"ypos"		"8"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "PostProcSettingsLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"6"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Color_Correction"
		"textAlignment"		"east"
		"associate"		"ColorCorrection"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"ColorCorrection"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"ColorCorrection"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "ColorCorrectionLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

    
	"MotionBlurLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"MotionBlurLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "ColorCorrectionLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_MotionBlur"
		"textAlignment"		"east"
		"associate"		"MotionBlur"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"MotionBlur"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"MotionBlur"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "MotionBlurLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

	"BloomLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"BloomLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "MotionBlurLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Bloom"
		"textAlignment"		"east"
		"associate"		"Bloom"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"Bloom"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"Bloom"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "BloomLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

	"TonemapLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"TonemapLabel"
        "xpos"		"0"
		"ypos"		"10"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "BloomLabel"
		"pin_corner_to_sibling"		"1"
		"pin_to_sibling_corner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_Tonemap"
		"textAlignment"		"east"
		"associate"		"Tonemap"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
        "auto_tall_tocontents" "0"
	}
	"Tonemap"
	{
		"ControlName"		"ComboBox"
		"fieldName"		"Tonemap"
        "xpos"		"28"
		"ypos"		"0"
		"wide"		"175"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "TonemapLabel"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"6"
		"textHidden"		"0"
		"editable"		"0"
		"maxchars"		"-1"
		"NumericInputOnly"		"0"
		"unicode"		"0"
        "draw_offset_x" "6"
	}

	"RecommendedSettingsLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"RecommendedSettingsLabel"
        "xpos"		"0"
		"ypos"		"12"
		"wide"		"150"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
        "pin_to_sibling" "GammaSettingsDivider"
		"pin_corner_to_sibling"		"6"
		"pin_to_sibling_corner"		"4"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_RecommendedSettings"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"0"
		"textinsety"		"0"
		"auto_wide_tocontents"		"1"
        "auto_tall_tocontents" "1"
        "FgColor_override" "MomGreydientHOStep8"
	}

    "GammaSettingsDivider"
    {
        "ControlName" "Divider"
        "fieldName" "GammaSettingsDivider"
        "xpos" "cs-0.5"
        "ypos" "668"
        "proportionalToParent" "1"
        "wide" "500"
        "tall" "1"
    }

    "GammaSettingsLabel"
    {
        "ControlName"        "Label"
        "fieldName"        "GammaSettingsLabel"
        "xpos"        "0"
        "ypos"        "12"
        "proportionalToParent" "1"
        "wide"        "f0"
        "tall"        "24"
        "pin_to_sibling" "GammaSettingsDivider"
        "pin_corner_to_sibling" "4"
        "pin_to_sibling_corner" "6"
        "autoResize"        "0"
        "pinCorner"        "0"
        "visible"        "1"
        "enabled"        "1"
        "tabPosition"        "0"
        "BgColor"        "0 0 0 0"
        "allowColorOverrides"        "0"
        "labelText"        "#MOM_Settings_Title_Video_Gamma"
        "textAlignment"        "center"
        "dulltext"        "0"
        "brighttext"        "0"
        "wrap"        "0"
        "centerwrap"        "0"
        "textinsetx"        "0"
        "textinsety"        "0"
        "auto_wide_tocontents" "0"
        "auto_tall_tocontents" "1"
        "font" "Subheader"
    }
	"GammaInfoLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"GammaInfoLabel"
		"xpos"		"0"
		"ypos"		"8"
		"wide"		"264"
		"tall"		"53"
        "pin_to_sibling" "GammaSettingsLabel"
		"pin_corner_to_sibling"		"4"
		"pin_to_sibling_corner"		"6"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"#GameUI_GammaInfo"
		"textAlignment"		"west"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
        "auto_wide_tocontents" "1"
        "auto_tall_tocontents" "1"
	}

	"GammaImage"
	{
		"ControlName"		"ImagePanel"
		"fieldName"		"GammaImage"
		"xpos"		"0"
		"ypos"		"10"
		"wide"		"130"
		"tall"		"120"
        "pin_to_sibling" "GammaInfoLabel"
        "pin_to_sibling_corner" "6"
        "pin_corner_to_sibling" "4"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"image"		"gamma"
        "scaleImage" "1"
		// "scalePanelToImage"		"1"
        "scaleAmount" "0"
        "centerImage" "1"
        "positionImage" "1"
	}
    
    "GammaSlider"
	{
		"ControlName"		"CvarSlider"
		"fieldName"		"GammaSlider"
		"cvar_name"     "mat_monitorgamma"
        "precision"     "1"
        "autoapply"     "1"
		"usecvarbounds" "1"
		"xpos"		"-10"
		"ypos"		"-24"
		"wide"		"200"
		"tall"		"40"
        "pin_to_sibling" "GammaImage"
        "pin_to_sibling_corner" "6"
        "pin_corner_to_sibling" "4"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"1"
		"leftText"		"#GameUI_Light"
		"rightText"		"#GameUI_Dark"
	}
	"GammaEntry"
	{
		"ControlName"		"CvarTextEntry"
		"fieldName"		"GammaEntry"
		"cvar_name"     "mat_monitorgamma"
		"xpos"		"6"
		"ypos"		"0"
		"wide"		"44"
		"tall"		"24"
        "pin_to_sibling" "GammaSlider"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"2"
		"textHidden"		"0"
		"editable"		"1"
		"maxchars"		"-1"
		"NumericInputOnly"		"1"
		"unicode"		"0"
	}
}