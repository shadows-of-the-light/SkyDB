-- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT MODIFY THIS FILE!

-- Level objects
resource "LevelObjects" "RainEnd" { level = "RainEnd", source = "Levels/RainEnd/Objects.level", sourcesCount = 22, sources = { "Levels/RainEnd/Objects.level", "Levels/RainEnd/AdventurePass2.level", "Levels/RainEnd/AncestorCine.level", "Levels/RainEnd/Background.level", "Levels/RainEnd/Candles.level", "Levels/RainEnd/ChatBench.level", "Levels/RainEnd/Collectibles.level", "Levels/RainEnd/DarkCreatures.level", "Levels/RainEnd/DarkMatter.level", "Levels/RainEnd/FarmersMarket.level", "Levels/RainEnd/GreatEngineArt.level", "Levels/RainEnd/IntroArt.level", "Levels/RainEnd/LocatedAudioSources.level", "Levels/RainEnd/Map.level", "Levels/RainEnd/Music.level", "Levels/RainEnd/Quests.level", "Levels/RainEnd/Shop.level", "Levels/RainEnd/StormEvents.level", "Levels/RainEnd/Survey.level", "Levels/RainEnd/TempleExitEvents.level", "Levels/RainEnd/TempleInteriorArt.level", "Levels/RainEnd/Wingbuff.level" }, stripDebug = true }

-- Prefabs
resource "LevelObjects" "BlobPrefab_TreeFab01" { level = "TreeFab01", source = "BlobPrefabs/TreeFab01/Objects.level", sourcesCount = 1, sources = { "BlobPrefabs/TreeFab01/Objects.level" }, stripDebug = true }
resource "LevelObjects" "BlobPrefab_TreeLarge_01" { level = "TreeLarge_01", source = "BlobPrefabs/TreeLarge_01/Objects.level", sourcesCount = 1, sources = { "BlobPrefabs/TreeLarge_01/Objects.level" }, stripDebug = true }

-- Haptics
resource "HapticFile" "BumpLargeShort" { source = "BumpLargeShort" }
resource "HapticFile" "BumpMedShort" { source = "BumpMedShort" }
resource "HapticFile" "BumpSmallMedShort" { source = "BumpSmallMedShort" }
resource "HapticFile" "HammerHit1" { source = "HammerHit1" }
resource "HapticFile" "HitShortDecay" { source = "HitShortDecay" }
resource "HapticFile" "L11_LowFreqLoop1" { source = "L11_LowFreqLoop1" }
resource "HapticFile" "LoopHard" { source = "LoopHard" }
resource "HapticFile" "LoopSmooth1" { source = "LoopSmooth1" }
resource "HapticFile" "ThumpMed1" { source = "ThumpMed1" }
resource "HapticFile" "ThumpMed2" { source = "ThumpMed2" }
resource "HapticFile" "WhooshShort1" { source = "WhooshShort1" }

-- Meshes
resource "Mesh" "AncestorStatuePlatform_01" { source = "AncestorStatuePlatform_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "AncestorStatueRain_01" { source = "AncestorStatueRain_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharCrabAAnim" { source = "CharCrabAAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharEnvJellyfishAnim" { source = "CharEnvJellyfishAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharSkyRayCAnim" { source = "CharSkyRayCAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharSpiritFatLaborAnimEmotes" { source = "CharSpiritFatLaborAnimEmotes.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CineAncestorRainAnvil" { source = "CineAncestorRainAnvil.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CineAncestorRainBattery" { source = "CineAncestorRainBattery.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CineAncestorRainElder" { source = "CineAncestorRainElder.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CineAncestorRainHammer" { source = "CineAncestorRainHammer.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ConstellationRain_01" { source = "ConstellationRain_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "Cube" { source = "Cube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Cube1x1x1" { source = "Cube1x1x1.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCube" { source = "DCube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCube2" { source = "DCube2.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_PlantA_01" { source = "Darkshroom_PlantA_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_PlantA_02" { source = "Darkshroom_PlantA_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_PlantA_03" { source = "Darkshroom_PlantA_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeA_01" { source = "Darkshroom_SporeA_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeA_01_lo" { source = "Darkshroom_SporeA_01_lo.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeA_02" { source = "Darkshroom_SporeA_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeB_02_lo" { source = "Darkshroom_SporeB_02_lo.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DayEndPillar_01" { source = "DayEndPillar_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DiamondStone" { source = "DiamondStone.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Engine_BaseSmall" { source = "Engine_BaseSmall.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Engine_RingL1" { source = "Engine_RingL1.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "GodLightTemple" { source = "GodLightTemple.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "Grate_04L" { source = "Grate_04L.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Grate_04R" { source = "Grate_04R.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MapShrineSymbol_01" { source = "MapShrineSymbol_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "MapShrine_03" { source = "MapShrine_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MapShrine_04" { source = "MapShrine_04.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MoteKey01" { source = "MoteKey01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MoteKey07" { source = "MoteKey07.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MoteKeyBase_01" { source = "MoteKeyBase_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MoteKeyDiamond05" { source = "MoteKeyDiamond05.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "NightPlatform_03" { source = "NightPlatform_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "NightPlatform_04" { source = "NightPlatform_04.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Plane" { source = "Plane.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "PlatformRain_01" { source = "PlatformRain_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP02ShrineBase" { source = "PropAP02ShrineBase.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndDiamond_01" { source = "RainEndDiamond_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndEngineGems_01" { source = "RainEndEngineGems_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndEngineGems_02" { source = "RainEndEngineGems_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndEngineGems_03" { source = "RainEndEngineGems_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndEngineGold_01" { source = "RainEndEngineGold_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndEngineGold_02" { source = "RainEndEngineGold_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndEngineGold_03" { source = "RainEndEngineGold_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndEngineStand" { source = "RainEndEngineStand.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndEngine_01" { source = "RainEndEngine_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndEngine_02" { source = "RainEndEngine_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndGrateFrame_01" { source = "RainEndGrateFrame_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndGrate_01" { source = "RainEndGrate_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndPlatform_01" { source = "RainEndPlatform_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndPlatform_02" { source = "RainEndPlatform_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndPlatform_02b" { source = "RainEndPlatform_02b.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndPlatform_03a" { source = "RainEndPlatform_03a.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndPlatform_03b" { source = "RainEndPlatform_03b.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndPlatform_03b_Floor" { source = "RainEndPlatform_03b_Floor.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndPlatform_03b_GateL" { source = "RainEndPlatform_03b_GateL.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndPlatform_03b_GateR" { source = "RainEndPlatform_03b_GateR.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndTileFloor_01" { source = "RainEndTileFloor_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainFinalTemple_02" { source = "RainFinalTemple_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainGateMotif_01" { source = "RainGateMotif_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainGearTeeth_01" { source = "RainGearTeeth_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainGear_01" { source = "RainGear_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainGrateL_02" { source = "RainGrateL_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainGrateR_02" { source = "RainGrateR_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTempleIntDoorFrame_01" { source = "RainTempleIntDoorFrame_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTempleIntDoorL_01" { source = "RainTempleIntDoorL_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTempleIntDoorR_01" { source = "RainTempleIntDoorR_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeCards_01" { source = "RainTreeCards_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeStump_02" { source = "RainTreeStump_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SpStoneLantern2" { source = "SpStoneLantern2.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneBench_01" { source = "StoneBench_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneLantern_01" { source = "StoneLantern_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeTallRainC" { source = "TreeTallRainC.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }

-- Animations
resource "AnimationPack" "ColFatLaborGlobal" {}

-- Images
resourceref "Image" "AncestorBlue"
resourceref "Image" "AvatarMaskBasicChamTex"
resourceref "Image" "AvatarMaskBasicTex"
resourceref "Image" "BasicGeoAtlas1"
resourceref "Image" "Black"
resourceref "Image" "CharSkyRayBasicTex"
resourceref "Image" "CharSkyRayBasicTexSh"
resourceref "Image" "Clear"
resourceref "Image" "DawnIntroGate"
resourceref "Image" "DawnIntroGateSh"
resourceref "Image" "FeatherNoise"
resourceref "Image" "Grates3"
resourceref "Image" "GratesDusk"
resourceref "Image" "Gray"
resourceref "Image" "GrayL2"
resourceref "Image" "Noise3Ch"
resourceref "Image" "OrangeL1"
resourceref "Image" "OrangeL2"
resourceref "Image" "SkyRayCTex"
resourceref "Image" "StoneBase"
resourceref "Image" "StoneBaseMotif"
resourceref "Image" "StoneBaseMotifSh"
resourceref "Image" "StoneBaseSh"
resourceref "Image" "StoneGrunge"
resourceref "Image" "StoneGrunge2"
resourceref "Image" "StoneRamp"
resourceref "Image" "StupaBell"
resourceref "Image" "StupaBellSh"
resourceref "Image" "TileFloor"
resourceref "Image" "TileFloorSh"
resourceref "Image" "UISpot"
resourceref "Image" "UpNormal"
resourceref "Image" "WallBrick"
resourceref "Image" "WallBrickSh"
resourceref "Image" "White"

-- Required resources from level object metadata

-- Bake data
resource "LevelData" "RainEnd" { source = "Levels/RainEnd/BstBaked.meshes", lodToLoad = 0 }
