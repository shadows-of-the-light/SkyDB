-- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT MODIFY THIS FILE!

-- Level objects
resource "LevelObjects" "Rain_BaseCamp" { level = "Rain_BaseCamp", source = "Levels/Rain_BaseCamp/Objects.level", sourcesCount = 26, sources = { "Levels/Rain_BaseCamp/Objects.level", "Levels/Rain_BaseCamp/Art.level", "Levels/Rain_BaseCamp/Audio.level", "Levels/Rain_BaseCamp/CandlesWax.level", "Levels/Rain_BaseCamp/IntroLogic.level", "Levels/Rain_BaseCamp/Map.level", "Levels/Rain_BaseCamp/Music.level", "Levels/Rain_BaseCamp/NPCs_for_outro.level", "Levels/Rain_BaseCamp/OutroLogic.level", "Levels/Rain_BaseCamp/StormEvent.level", "Levels/Rain_BaseCamp/Wingbuffs.level", "Levels/Rain_BaseCamp/ap10_Outro_Part_1.level", "Levels/Rain_BaseCamp/ap10_quest01_Dissolve.level", "Levels/Rain_BaseCamp/ap10_quest01_Permanent.level", "Levels/Rain_BaseCamp/ap10_quest02_Dissolve.level", "Levels/Rain_BaseCamp/ap10_quest02_Permanent.level", "Levels/Rain_BaseCamp/ap10_quest03_Dissolve.level", "Levels/Rain_BaseCamp/ap10_quest03_Permanent.level", "Levels/Rain_BaseCamp/ap10_quest04_Dissolve.level", "Levels/Rain_BaseCamp/ap10_quest04_Permanent.level", "Levels/Rain_BaseCamp/ap10_quest05_Dissolve.level", "Levels/Rain_BaseCamp/ap10_quest05_Permanent.level", "Levels/Rain_BaseCamp/ap10_quest06_Dissolve.level", "Levels/Rain_BaseCamp/ap10_quest06_Permanent.level", "Levels/Rain_BaseCamp/ap10_questLogic.level", "Levels/Rain_BaseCamp/ap10outroB.level" }, stripDebug = true }

-- Prefabs
resource "LevelObjects" "BlobPrefab_TreeFab01" { level = "TreeFab01", source = "BlobPrefabs/TreeFab01/Objects.level", sourcesCount = 1, sources = { "BlobPrefabs/TreeFab01/Objects.level" }, stripDebug = true }

-- Haptics

-- Meshes
resource "Mesh" "AP10Bugle" { source = "AP10Bugle.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "BaseCampEntranceCloth_01" { source = "BaseCampEntranceCloth_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "BaseCampTreeRoof_01" { source = "BaseCampTreeRoof_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "BasecampHangingCloth_03" { source = "BasecampHangingCloth_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Candles_02" { source = "Candles_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharBirdLowAnim" { source = "CharBirdLowAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharEnvJellyfishAnim" { source = "CharEnvJellyfishAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharSkyRayCAnim" { source = "CharSkyRayCAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "Cube" { source = "Cube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCube" { source = "DCube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCube2" { source = "DCube2.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCubeLOD" { source = "DCubeLOD.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCylinderCheap" { source = "DCylinderCheap.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "FallenStump_01" { source = "FallenStump_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "FallenStump_03" { source = "FallenStump_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "GodLight3b" { source = "GodLight3b.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "HangingCloth_01" { source = "HangingCloth_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "IslandHammock_01" { source = "IslandHammock_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "IslandWaterfall_02" { source = "IslandWaterfall_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "JarMediumLo" { source = "JarMediumLo.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MapShrineSymbol" { source = "MapShrineSymbol.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "MapShrine_03" { source = "MapShrine_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MapShrine_04" { source = "MapShrine_04.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10Fireplace_01" { source = "PropAP10Fireplace_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10HangingLantern_01" { source = "PropAP10HangingLantern_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10HangingLantern_02" { source = "PropAP10HangingLantern_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10HangingLights_01" { source = "PropAP10HangingLights_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10RainForestGateL_01" { source = "PropAP10RainForestGateL_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10RainForestGateR_01" { source = "PropAP10RainForestGateR_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10RainForestJar_01" { source = "PropAP10RainForestJar_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10RainGrate_01" { source = "PropAP10RainGrate_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropBookshelf_01" { source = "PropBookshelf_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropDesk_01" { source = "PropDesk_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropHammockSticks_01" { source = "PropHammockSticks_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropHoop_01" { source = "PropHoop_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "PropSpotlight_01" { source = "PropSpotlight_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropTent_01" { source = "PropTent_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropTikiTorch_01" { source = "PropTikiTorch_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainCenterStage_01" { source = "RainCenterStage_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainDayBed_01" { source = "RainDayBed_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainMapTapestryMural_01" { source = "RainMapTapestryMural_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainMapTapestryMural_02" { source = "RainMapTapestryMural_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainMapTapestry_01" { source = "RainMapTapestry_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainSimpleLog_01" { source = "RainSimpleLog_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainSimpleRug_01" { source = "RainSimpleRug_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeCards_01" { source = "RainTreeCards_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeNub_01" { source = "RainTreeNub_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeNub_03" { source = "RainTreeNub_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeNub_04" { source = "RainTreeNub_04.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RockSimple_05" { source = "RockSimple_05.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RockSimple_07" { source = "RockSimple_07.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RockSimple_08" { source = "RockSimple_08.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RockSimple_09" { source = "RockSimple_09.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RockSimple_10" { source = "RockSimple_10.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Sheep1" { source = "Sheep1.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SpStoneLantern2" { source = "SpStoneLantern2.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneBench_01" { source = "StoneBench_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneBrazier_01" { source = "StoneBrazier_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SunsetVillageCanope_02" { source = "SunsetVillageCanope_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SunsetVillageCanope_03" { source = "SunsetVillageCanope_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SunsetVillageCanope_04" { source = "SunsetVillageCanope_04.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeHouseWoodFrontRoof_01" { source = "TreeHouseWoodFrontRoof_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeHouseWoodLSidePlatform_01" { source = "TreeHouseWoodLSidePlatform_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeTallRainC" { source = "TreeTallRainC.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "WaterfallRipple_01" { source = "WaterfallRipple_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }

-- Animations
resource "AnimationPack" "CharKidAnimEmote_C" {}
resource "AnimationPack" "CharKidAnimSceneAct" {}
resource "AnimationPack" "CharSpiritCinematicAnim_A" {}
resource "AnimationPack" "CharSpiritCinematicAnim_B" {}
resource "AnimationPack" "CharSpiritMemoryPoses" {}
resource "AnimationPack" "ColFatLaborGlobal" {}
resource "AnimationPack" "GenericMemoryPoses" {}
resource "AnimationPack" "SpiritFatLaborScene" {}

-- Images
resourceref "Image" "AncestorBlue"
resourceref "Image" "AncestorBlueD1"
resourceref "Image" "BasicGeoAtlas1"
resourceref "Image" "CharRampS10"
resourceref "Image" "CharSkyRayBasicTex"
resourceref "Image" "CharSkyRayBasicTexSh"
resourceref "Image" "Clear"
resourceref "Image" "CloudFinTex"
resourceref "Image" "Grates"
resourceref "Image" "Gray"
resourceref "Image" "GrayL1"
resourceref "Image" "Noise3Ch"
resourceref "Image" "SkyRayCTex"
resourceref "Image" "StoneBase"
resourceref "Image" "StoneBaseSh"
resourceref "Image" "StoneGrunge2"
resourceref "Image" "StoneRamp"
resourceref "Image" "StoneRampGray"
resourceref "Image" "StoryGeneral"
resourceref "Image" "StoryGeneral2"
resourceref "Image" "UpNormal"
resourceref "Image" "WaterfallScrolling"
resourceref "Image" "White"

-- Required resources from level object metadata

-- Bake data
resource "LevelData" "Rain_BaseCamp" { source = "Levels/Rain_BaseCamp/BstBaked.meshes", lodToLoad = 0 }
