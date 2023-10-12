------------------------------------------------------------------------------------------
-- Sound Resources -----------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Notes: Lists all sound definition/ sound resources to be loaded at program startup and
--			remain loaded until program termination.
--
------------------------------------------------------------------------------------------

if _G["SKY_ENABLE_RETAIL_DEMO"] == nil then
	SKY_ENABLE_RETAIL_DEMO = os.getenv("SKY_ENABLE_RETAIL_DEMO")
end

SUNSET_MUSIC_BUNDLE = "sunset"
if SKY_ENABLE_RETAIL_DEMO then
	SUNSET_MUSIC_BUNDLE = ""
end

-- Fmod Studio Resources
-- Master string must be the first to load

resource "FmodStudioFile" "FmodStudioMaster" { source = "MasterBank.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioMasterAssets" { source = "MasterBank.assets.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioMasterStreams" { source = "MasterBank.streams.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioStr" { source = "MasterBank.strings.bank", bundle = "" }

-- Initial Downloading Banks
resource "FmodStudioFile" "FmodStudioSFXCommonInitial" { source = "SFX_Common_Initial.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXCommonInitialAssets" { source = "SFX_Common_Initial.assets.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXCommonInitialStreams" { source = "SFX_Common_Initial.streams.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXCommonInitial21k" { source = "SFX_Common_Initial21k.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXCommonInitial21kAssets" { source = "SFX_Common_Initial21k.assets.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXCommonInitial21kStreams" { source = "SFX_Common_Initial21k.streams.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXAvatarAnimInitial" { source = "SFX_AvatarAnim_Initial.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXAvatarAnimInitialAssets" { source = "SFX_AvatarAnim_Initial.assets.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXAvatarAnimInitialStreams" { source = "SFX_AvatarAnim_Initial.streams.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXEmoteInitial" { source = "SFX_Emote_Initial.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXEmoteInitialAssets" { source = "SFX_Emote_Initial.assets.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXEmoteInitialStreams" { source = "SFX_Emote_Initial.streams.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXDawn" { source = "SFX_Dawn.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXDawnAssets" { source = "SFX_Dawn.assets.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXDawnStreams" { source = "SFX_Dawn.streams.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXPreload" { source = "SFX_Preload.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXPreloadAssets" { source = "SFX_Preload.assets.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXPreloadStreams" { source = "SFX_Preload.streams.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXMainStreet" { source = "SFX_MainStreet.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXMainStreetAssets" { source = "SFX_MainStreet.assets.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioSFXMainStreetStreams" { source = "SFX_MainStreet.streams.bank", bundle = "" }
if not SKY_ENABLE_RETAIL_DEMO then
	resource "FmodStudioFile" "FmodStudioSFXLightCratureInitial" { source = "SFX_LightCrature_Initial.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioSFXLightCratureInitialAssets" { source = "SFX_LightCrature_Initial.assets.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioSFXLightCratureInitialStreams" { source = "SFX_LightCrature_Initial.streams.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioSFXCandleSpaceInitial" { source = "SFX_CandleSpace_Initial.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioSFXCandleSpaceInitialAssets" { source = "SFX_CandleSpace_Initial.assets.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioSFXCandleSpaceInitialStreams" { source = "SFX_CandleSpace_Initial.streams.bank", bundle = "" }
end

-- Persistent Banks
resource "FmodStudioFile" "FmodStudioSFXCommon" { source = "SFX_Common.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXCommonAssets" { source = "SFX_Common.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXCommonStreams" { source = "SFX_Common.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXEmote" { source = "SFX_Emote.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXEmoteAssets" { source = "SFX_Emote.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXEmoteStreams" { source = "SFX_Emote.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXInstrument" { source = "SFX_Instrument.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXInstrumentAssets" { source = "SFX_Instrument.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXInstrumentStreams" { source = "SFX_Instrument.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXShout" { source = "SFX_Shout.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXShoutAssets" { source = "SFX_Shout.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXShoutStreams" { source = "SFX_Shout.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXAvatarAnim" { source = "SFX_AvatarAnim.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXAvatarAnimAssets" { source = "SFX_AvatarAnim.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXAvatarAnimStreams" { source = "SFX_AvatarAnim.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXSpiritAnim" { source = "SFX_SpiritAnim.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXSpiritAnimAssets" { source = "SFX_SpiritAnim.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXSpiritAnimStreams" { source = "SFX_SpiritAnim.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXLightCrature" { source = "SFX_LightCrature.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXLightCratureAssets" { source = "SFX_LightCrature.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXLightCratureStreams" { source = "SFX_LightCrature.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXDarkCreature" { source = "SFX_DarkCreature.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXDarkCreatureAssets" { source = "SFX_DarkCreature.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXDarkCreatureStreams" { source = "SFX_DarkCreature.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXCandleSpace" { source = "SFX_CandleSpace.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXCandleSpaceAssets" { source = "SFX_CandleSpace.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXCandleSpaceStreams" { source = "SFX_CandleSpace.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXDawnExtra" { source = "SFX_Dawn_Extra.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXDawnExtraAssets" { source = "SFX_Dawn_Extra.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXDawnExtraStreams" { source = "SFX_Dawn_Extra.streams.bank", bundle = "audioExtra" }

-- resource "FmodStudioFile" "FmodStudioSFXIgnored" { source = "SFX_Ignored.bank", bundle = "audioUnused" }
-- resource "FmodStudioFile" "FmodStudioSFXIgnoredAssets" { source = "SFX_Ignored.assets.bank", bundle = "audioUnused" }
-- resource "FmodStudioFile" "FmodStudioSFXUnused" { source = "SFX_Unused.bank", bundle = "audioUnused" }
-- resource "FmodStudioFile" "FmodStudioSFXUnusedAssets" { source = "SFX_Unused.assets.bank", bundle = "audioUnused" }

-- Level Banks
resource "FmodStudioFile" "FmodStudioSFXPrairie" { source = "SFX_Prairie.bank", bundle = "prairie" }
resource "FmodStudioFile" "FmodStudioSFXPrairieAssets" { source = "SFX_Prairie.assets.bank", bundle = "prairie" }
resource "FmodStudioFile" "FmodStudioSFXPrairieStreams" { source = "SFX_Prairie.streams.bank", bundle = "prairie" }
resource "FmodStudioFile" "FmodStudioSFXRain" { source = "SFX_Rain.bank", bundle = "rain" }
resource "FmodStudioFile" "FmodStudioSFXRainAssets" { source = "SFX_Rain.assets.bank", bundle = "rain" }
resource "FmodStudioFile" "FmodStudioSFXRainStreams" { source = "SFX_Rain.streams.bank", bundle = "rain" }
resource "FmodStudioFile" "FmodStudioSFXSunset" { source = "SFX_Sunset.bank", bundle = "sunset" }
resource "FmodStudioFile" "FmodStudioSFXSunsetAssets" { source = "SFX_Sunset.assets.bank", bundle = "sunset" }
resource "FmodStudioFile" "FmodStudioSFXSunsetStreams" { source = "SFX_Sunset.streams.bank", bundle = "sunset" }
resource "FmodStudioFile" "FmodStudioSFXDusk" { source = "SFX_Dusk.bank", bundle = "dusk" }
resource "FmodStudioFile" "FmodStudioSFXDuskAssets" { source = "SFX_Dusk.assets.bank", bundle = "dusk" }
resource "FmodStudioFile" "FmodStudioSFXDuskStreams" { source = "SFX_Dusk.streams.bank", bundle = "dusk" }
resource "FmodStudioFile" "FmodStudioSFXNight" { source = "SFX_Night.bank", bundle = "night" }
resource "FmodStudioFile" "FmodStudioSFXNightAssets" { source = "SFX_Night.assets.bank", bundle = "night" }
resource "FmodStudioFile" "FmodStudioSFXNightStreams" { source = "SFX_Night.streams.bank", bundle = "night" }
resource "FmodStudioFile" "FmodStudioSFXStorm" { source = "SFX_Storm.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioSFXStormAssets" { source = "SFX_Storm.assets.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioSFXStormStreams" { source = "SFX_Storm.streams.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioSFXOrbit" { source = "SFX_Orbit.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioSFXOrbitAssets" { source = "SFX_Orbit.assets.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioSFXOrbitStreams" { source = "SFX_Orbit.streams.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioSFXAurora" { source = "SFX_Aurora.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXAuroraAssets" { source = "SFX_Aurora.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioSFXAuroraStreams" { source = "SFX_Aurora.streams.bank", bundle = "audioExtra" }

-- Music Banks
resource "FmodStudioFile" "FmodStudioMusicAP11" { source = "Music_AP11.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP11Assets" { source = "Music_AP11.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP11Streams" { source = "Music_AP11.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP15" { source = "Music_AP15.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP15Assets" { source = "Music_AP15.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP15Streams" { source = "Music_AP15.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP16" { source = "Music_AP16.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP16Assets" { source = "Music_AP16.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP16Streams" { source = "Music_AP16.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP17" { source = "Music_AP17.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP17Assets" { source = "Music_AP17.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP17Streams" { source = "Music_AP17.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP18" { source = "Music_AP18.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP18Assets" { source = "Music_AP18.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP18Streams" { source = "Music_AP18.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP19" { source = "Music_AP19.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP19Assets" { source = "Music_AP19.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP19Streams" { source = "Music_AP19.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP20" { source = "Music_AP20.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP20Assets" { source = "Music_AP20.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicAP20Streams" { source = "Music_AP20.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicDawn" { source = "Music_Dawn.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioMusicDawnAssets" { source = "Music_Dawn.assets.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioMusicDawnStreams" { source = "Music_Dawn.streams.bank", bundle = "" }
--resource "FmodStudioFile" "FmodStudioMusicOrbitOldTest" { source = "skytest1_tempVince_SkyMusicOrbit.bank", bundle = "audioUnused" }
--resource "FmodStudioFile" "FmodStudioMusicOrbitOldTestAssets" { source = "skytest1_tempVince_SkyMusicOrbit.assets.bank", bundle = "audioUnused" }
--resource "FmodStudioFile" "FmodStudioMusicOrbitOldTestStreams" { source = "skytest1_tempVince_SkyMusicOrbit.streams.bank", bundle = "audioUnused" }
resource "FmodStudioFile" "FmodStudioMusicTitleWater" { source = "skytest1_tempVince_SkyMusicTitleWater.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioMusicTitleWaterAssets" { source = "skytest1_tempVince_SkyMusicTitleWater.assets.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioMusicTitleWaterStreams" { source = "skytest1_tempVince_SkyMusicTitleWater.streams.bank", bundle = "" }
resource "FmodStudioFile" "FmodStudioMusicAviary" { source = "Music_Aviary.bank", bundle = "prairie" }
resource "FmodStudioFile" "FmodStudioMusicAviaryAssets" { source = "Music_Aviary.assets.bank", bundle = "prairie" }
resource "FmodStudioFile" "FmodStudioMusicAviaryStreams" { source = "Music_Aviary.streams.bank", bundle = "prairie" }
resource "FmodStudioFile" "FmodStudioMusicNight" { source = "Music_Night.bank", bundle = "night" }
resource "FmodStudioFile" "FmodStudioMusicNightAssets" { source = "Music_Night.assets.bank", bundle = "night" }
resource "FmodStudioFile" "FmodStudioMusicNightStreams" { source = "Music_Night.streams.bank", bundle = "night" }
resource "FmodStudioFile" "FmodStudioMusicStorm" { source = "Music_Storm.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioMusicStormAssets" { source = "Music_Storm.assets.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioMusicStormStreams" { source = "Music_Storm.streams.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioMusicDusk" { source = "Music_Dusk.bank", bundle = "dusk" }
resource "FmodStudioFile" "FmodStudioMusicDuskAssets" { source = "Music_Dusk.assets.bank", bundle = "dusk" }
resource "FmodStudioFile" "FmodStudioMusicDuskStreams" { source = "Music_Dusk.streams.bank", bundle = "dusk" }
resource "FmodStudioFile" "FmodStudioMusicSunset" { source = "Music_Sunset.bank", bundle = SUNSET_MUSIC_BUNDLE }
resource "FmodStudioFile" "FmodStudioMusicSunsetAssets" { source = "Music_Sunset.assets.bank", bundle = SUNSET_MUSIC_BUNDLE }
resource "FmodStudioFile" "FmodStudioMusicSunsetStreams" { source = "Music_Sunset.streams.bank", bundle = SUNSET_MUSIC_BUNDLE }
resource "FmodStudioFile" "FmodStudioMusicRain" { source = "Music_Rain.bank", bundle = "rain" }
resource "FmodStudioFile" "FmodStudioMusicRainAssets" { source = "Music_Rain.assets.bank", bundle = "rain" }
resource "FmodStudioFile" "FmodStudioMusicRainStreams" { source = "Music_Rain.streams.bank", bundle = "rain" }
resource "FmodStudioFile" "FmodStudioMusicRainCave" { source = "Music_RainCave.bank", bundle = "rain" }
resource "FmodStudioFile" "FmodStudioMusicRainCaveAssets" { source = "Music_RainCave.assets.bank", bundle = "rain" }
resource "FmodStudioFile" "FmodStudioMusicRainCaveStreams" { source = "Music_RainCave.streams.bank", bundle = "rain" }
resource "FmodStudioFile" "FmodStudioMusicPrairie" { source = "Music_Prairie.bank", bundle = "prairie" }
resource "FmodStudioFile" "FmodStudioMusicPrairieAssets" { source = "Music_Prairie.assets.bank", bundle = "prairie" }
resource "FmodStudioFile" "FmodStudioMusicPrairieStreams" { source = "Music_Prairie.streams.bank", bundle = "prairie" }
resource "FmodStudioFile" "FmodStudioMusicOrbit" { source = "Music_Orbit.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioMusicOrbitAssets" { source = "Music_Orbit.assets.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioMusicOrbitStreams" { source = "Music_Orbit.streams.bank", bundle = "storm" }
resource "FmodStudioFile" "FmodStudioMusicCollectQuest" { source = "Music_CollectQuest.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicCollectQuestAssets" { source = "Music_CollectQuest.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicCollectQuestStreams" { source = "Music_CollectQuest.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicSheets" { source = "Music_Sheets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicSheetsAssets" { source = "Music_Sheets.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicSheetsStreams" { source = "Music_Sheets.streams.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicDawnExtra" { source = "Music_Dawn_Extra.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicDawnExtraAssets" { source = "Music_Dawn_Extra.assets.bank", bundle = "audioExtra" }
resource "FmodStudioFile" "FmodStudioMusicDawnExtraStreams" { source = "Music_Dawn_Extra.streams.bank", bundle = "audioExtra" }
if not SKY_ENABLE_RETAIL_DEMO then
	resource "FmodStudioFile" "FmodStudioMusic1" { source = "skytest1_tempVince_skytest1_tempVince_bank01.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioMusic1Assets" { source = "skytest1_tempVince_skytest1_tempVince_bank01.assets.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioMusic1Streams" { source = "skytest1_tempVince_skytest1_tempVince_bank01.streams.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioMusic2" { source = "skytest1_tempVince_skytest1_tempVince_bank02.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioMusic2Assets" { source = "skytest1_tempVince_skytest1_tempVince_bank02.assets.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioMusic2Streams" { source = "skytest1_tempVince_skytest1_tempVince_bank02.streams.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioMusicCandleSpace" { source = "skytest1_tempVince_SkyMusicCandleSpace.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioMusicCandleSpaceAssets" { source = "skytest1_tempVince_SkyMusicCandleSpace.assets.bank", bundle = "" }
	resource "FmodStudioFile" "FmodStudioMusicCandleSpaceStreams" { source = "skytest1_tempVince_SkyMusicCandleSpace.streams.bank", bundle = "" }
end
