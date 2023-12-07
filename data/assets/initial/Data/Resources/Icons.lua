-- iOS/macOS
resource "Icons" "DevIcon" {stage="dev", type="AppleAppIcon", source="Data/Images/System/Sky_AppIcon_Dev.png"}
resource "Icons" "TestIcon" {stage="beta", type="AppleAppIcon", source="Data/Images/System/Sky_AppIcon_Beta.png"}
resource "Icons" "AppIcon" {stage="live", type="AppleAppIcon", source="Data/Images/System/Sky_AppIcon_Live.png"}

-- iOS
resource "Icons" "AppIconEverGreen" {stage="live", type="AppleAppIcon", source="Data/Images/System/Sky_AppIcon_Live_evergreen.png"}
-- resource "Icons" "AppIconTest1" {stage="live", type="AppleAppIcon", source="Data/Images/System/Sky_AppIcon_Live_test1.png"}
-- resource "Icons" "AppIconTest2" {stage="live", type="AppleAppIcon", source="Data/Images/System/Sky_AppIcon_Live_test2.png"}
-- resource "Icons" "AppIconTest3" {stage="live", type="AppleAppIcon", source="Data/Images/System/Sky_AppIcon_Live_test3.png"}
resource "Icons" "AppIconTest4" {stage="live", type="AppleAppIcon", source="Data/Images/System/Sky_AppIcon_Live_test4.png"}
resource "Icons" "StickersSquareIcon" {type="AppleStickersSquareIcon", source="Data/Images/System/Sky_StickersIcon_Square.png"}
resource "Icons" "StickersLandscapeIcon" {type="AppleStickersLandscapeIcon", source="Data/Images/System/Sky_StickersIcon_Landscape.png"}

-- Android
resource "Icons" "icon" {stage="dev", type="AndroidAppIcon", source="Data/Images/System/Sky_AppIcon_Dev.png"}
resource "Icons" "icon" {stage="beta", type="AndroidAppIcon", source="Data/Images/System/Sky_AppIcon_Beta.png"}
resource "Icons" "adaptive_icon_back" {stage="live", type="AndroidAppIcon", source="Data/Images/System/Sky_AppIcon_Live_Back.png"}
resource "Icons" "adaptive_icon_front" {stage="live", type="AndroidAppIcon", source="Data/Images/System/Sky_AppIcon_Live_Front.png"}
resource "Icons" "ic_notification" {stage="dev", type="AndroidNotificationIcon", source="Data/Images/System/Sky_NotificationIcon_Dev.png"}
resource "Icons" "ic_notification" {stage="beta", type="AndroidNotificationIcon", source="Data/Images/System/Sky_NotificationIcon_Beta.png"}
resource "Icons" "ic_notification" {stage="live", type="AndroidNotificationIcon", source="Data/Images/System/Sky_NotificationIcon_Live.png"}

-- Switch
resource "Icons" "Sky_AppIcon_Dev" {stage="dev", type="NxAppIcon", source="Data/Images/System/Sky_AppIcon_Dev.png"}
resource "Icons" "Sky_AppIcon_Beta" {stage="beta", type="NxAppIcon", source="Data/Images/System/Sky_AppIcon_Beta.png"}
resource "Icons" "Sky_AppIcon_Live" {stage="live", type="NxAppIcon", source="Data/Images/System/Sky_AppIcon_Live.png"}

-- PS4
resource "Icons" "icon0" {stage="dev", type="PS4AppIcon", source="Data/Images/System/Sky_AppIcon_Dev.png"}
resource "Icons" "icon0" {stage="beta", type="PS4AppIcon", source="Data/Images/System/Sky_AppIcon_Beta.png"}
resource "Icons" "icon0" {stage="live", type="PS4AppIcon", source="Data/Images/System/Sky_AppIcon_Live_evergreen.png"}

-- Windows
resource "Icons" "Sky" {stage="dev", type="WindowsAppIcon", source="Data/Images/System/Sky_AppIcon_Dev.png"}
resource "Icons" "Sky" {stage="beta", type="WindowsAppIcon", source="Data/Images/System/Sky_AppIcon_Beta.png"}
resource "Icons" "Sky" {stage="live", type="WindowsAppIcon", source="Data/Images/System/Sky_AppIcon_Live.png"}
