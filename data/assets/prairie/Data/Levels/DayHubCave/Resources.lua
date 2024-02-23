-- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT MODIFY THIS FILE!

-- Level objects
resource "LevelObjects" "DayHubCave" { level = "DayHubCave", source = "Levels/DayHubCave/Objects.level", sourcesCount = 15, sources = { "Levels/DayHubCave/Objects.level", "Levels/DayHubCave/Art.level", "Levels/DayHubCave/Candles.level", "Levels/DayHubCave/Cinematics.level", "Levels/DayHubCave/Collectibles.level", "Levels/DayHubCave/Event_Currency.level", "Levels/DayHubCave/Event_DaysOfRainbow2023.level", "Levels/DayHubCave/Event_DaysOfSpring2024.level", "Levels/DayHubCave/Event_DaysOfSpring2024_Art.level", "Levels/DayHubCave/F4_Collectible.level", "Levels/DayHubCave/FarmersMarket_Utility.level", "Levels/DayHubCave/LocatedAudioSources.level", "Levels/DayHubCave/Map.level", "Levels/DayHubCave/Oreo.level", "Levels/DayHubCave/Wingbuff.level" }, stripDebug = true }

-- Prefabs
resource "LevelObjects" "BlobPrefab_TreeLargeRoot_01" { level = "TreeLargeRoot_01", source = "BlobPrefabs/TreeLargeRoot_01/Objects.level", sourcesCount = 1, sources = { "BlobPrefabs/TreeLargeRoot_01/Objects.level" }, stripDebug = true }

-- Haptics

-- Meshes
resource "Mesh" "AP14Backpack_01" { source = "AP14Backpack_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "AncestorShrine_06" { source = "AncestorShrine_06.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "AncestorShrine_07" { source = "AncestorShrine_07.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "AuroraCard_01" { source = "AuroraCard_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "AuroraCard_02" { source = "AuroraCard_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "BirdTemple_01" { source = "BirdTemple_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "BonfireSeatLog_01" { source = "BonfireSeatLog_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CandleSpaceEndSpiralStaircase_02" { source = "CandleSpaceEndSpiralStaircase_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CandleSpaceMerchClothRoll_01" { source = "CandleSpaceMerchClothRoll_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CanopyTentPack" { source = "CanopyTentPack.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharBirdLowAnim" { source = "CharBirdLowAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharEnvFlowerAnim" { source = "CharEnvFlowerAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharEnvFlowerGroupAnim" { source = "CharEnvFlowerGroupAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharEnvJellyfishAnim" { source = "CharEnvJellyfishAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharEnvJellyfishGroupAnim" { source = "CharEnvJellyfishGroupAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharFishGroupAnim" { source = "CharFishGroupAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharOreoAAnim" { source = "CharOreoAAnim.fbx", computeOcclusions = true, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharSkyRayCAnim" { source = "CharSkyRayCAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharSkyRayMotherAnim" { source = "CharSkyRayMotherAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CloudRing_01" { source = "CloudRing_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "ColLaughAtDayJars" { source = "ColLaughAtDayJars.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ConstellationAchievementStarField" { source = "ConstellationAchievementStarField.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "Cube" { source = "Cube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CurrencyBubble" { source = "CurrencyBubble.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "DCube" { source = "DCube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCube2" { source = "DCube2.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DOCRainbow" { source = "DOCRainbow.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "DOCRainbowBridge" { source = "DOCRainbowBridge.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DORTempleDecal" { source = "DORTempleDecal.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "DayEndPillar_01" { source = "DayEndPillar_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DayIntroGate_01" { source = "DayIntroGate_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DiamondStone" { source = "DiamondStone.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DistantClouds_01" { source = "DistantClouds_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "Engine_BaseSmall" { source = "Engine_BaseSmall.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Engine_RingL1" { source = "Engine_RingL1.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "GodLight3c" { source = "GodLight3c.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "GodLight6" { source = "GodLight6.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "IntroGateSteps_01" { source = "IntroGateSteps_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "JarCrate" { source = "JarCrate.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "JarCrateLid" { source = "JarCrateLid.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "JarCrateb" { source = "JarCrateb.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "JarMedium" { source = "JarMedium.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "JarMedium2" { source = "JarMedium2.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "JarMediumLo" { source = "JarMediumLo.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "LightShaft_02" { source = "LightShaft_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "MSFrame_01" { source = "MSFrame_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MiniAncestorStatueCham_01" { source = "MiniAncestorStatueCham_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MiniAncestorStatue_01" { source = "MiniAncestorStatue_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MoteKey01" { source = "MoteKey01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MoteKeyDiamond05" { source = "MoteKeyDiamond05.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PaintBlob_01" { source = "PaintBlob_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PaintBlob_02" { source = "PaintBlob_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PaintBlob_03" { source = "PaintBlob_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PaintBlob_04" { source = "PaintBlob_04.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PaintBlob_05" { source = "PaintBlob_05.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Plane" { source = "Plane.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "PlatformRain_01" { source = "PlatformRain_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PlayerCustomCape" { source = "PlayerCustomCape.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "PropAP10Fireplace_01" { source = "PropAP10Fireplace_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropBundleOfSticks_02" { source = "PropBundleOfSticks_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropCanopy" { source = "PropCanopy.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropScreenYellow" { source = "PropScreenYellow.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndEngineStand" { source = "RainEndEngineStand.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Rainbow_01" { source = "Rainbow_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RockSimple_05" { source = "RockSimple_05.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SimpleBrick_01" { source = "SimpleBrick_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SimpleBrick_02" { source = "SimpleBrick_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SpTGCOfficeXmasLights" { source = "SpTGCOfficeXmasLights.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SphereCheap_01" { source = "SphereCheap_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "StoneBrazier_01" { source = "StoneBrazier_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneStack_01" { source = "StoneStack_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StupaSmallGems_02" { source = "StupaSmallGems_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StupaSmall_02" { source = "StupaSmall_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SunsetVillageCanope_03" { source = "SunsetVillageCanope_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Waterfall_01" { source = "Waterfall_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "WindCompassBase_01" { source = "WindCompassBase_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "WindCompassFish_01Anim" { source = "WindCompassFish_01Anim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "WireHangFlagAnimRainbow" { source = "WireHangFlagAnimRainbow.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }

-- Animations
resource "AnimationPack" "CharKidAnimEmote_B" {}
resource "AnimationPack" "CharKidAnimEmote_C" {}
resource "AnimationPack" "CharKidAnimGroundAct" {}
resource "AnimationPack" "CharKidAnimGroundState" {}
resource "AnimationPack" "CharKidAnimSceneAct" {}
resource "AnimationPack" "CharSpiritCinematicAnim_A" {}
resource "AnimationPack" "CharSpiritMemoryPoses" {}
resource "AnimationPack" "ColFatLaborGlobal" {}
resource "AnimationPack" "FatLaborAdventurePass" {}
resource "AnimationPack" "SpiritCivFDayHubCaveScene" {}
resource "AnimationPack" "SpiritCivMDayHubCaveScene" {}

-- Images
resourceref "Image" "AncestorBlueD1"
resourceref "Image" "AuroraBorealis"
resourceref "Image" "AvatarMaskBasicTex"
resourceref "Image" "BasicGeoAtlas1"
resourceref "Image" "BlueL1"
resourceref "Image" "BlueL2"
resourceref "Image" "CharRampDB01"
resourceref "Image" "CharRampEvents"
resourceref "Image" "CharRampEvents2"
resourceref "Image" "CharRampRainbow"
resourceref "Image" "CharRampS14"
resourceref "Image" "CharRampS3"
resourceref "Image" "CharRampS4"
resourceref "Image" "CharRampS9"
resourceref "Image" "CharSkyRayBasicTex"
resourceref "Image" "CharSkyRayBasicTexSh"
resourceref "Image" "Clear"
resourceref "Image" "CloudFarTex"
resourceref "Image" "Cyan"
resourceref "Image" "CyanL1"
resourceref "Image" "CyanL2"
resourceref "Image" "DayIntroGate"
resourceref "Image" "DayIntroGateSh"
resourceref "Image" "GrayD1"
resourceref "Image" "GrayL1"
resourceref "Image" "GreenL1"
resourceref "Image" "GreenL2"
resourceref "Image" "MagentaD1"
resourceref "Image" "MagentaL1"
resourceref "Image" "MagentaL2"
resourceref "Image" "MagentaL3"
resourceref "Image" "Noise3Ch"
resourceref "Image" "OrangeL1"
resourceref "Image" "OrangeL2"
resourceref "Image" "RainbowBelt"
resourceref "Image" "RedL1"
resourceref "Image" "RedL2"
resourceref "Image" "SkyRayCTex"
resourceref "Image" "StoneBase"
resourceref "Image" "StoneBaseMotif"
resourceref "Image" "StoneBaseMotifSh"
resourceref "Image" "StoneBaseSh"
resourceref "Image" "StoneBlueD3"
resourceref "Image" "StoneBlueL1"
resourceref "Image" "StoneGrunge2"
resourceref "Image" "StoneRamp"
resourceref "Image" "StormCard"
resourceref "Image" "StormParticles"
resourceref "Image" "StupaBell"
resourceref "Image" "StupaBellSh"
resourceref "Image" "TileFloor"
resourceref "Image" "TileFloorSh"
resourceref "Image" "UpNormal"
resourceref "Image" "WallBrick"
resourceref "Image" "WallBrickSh"
resourceref "Image" "WaterfallScrolling"
resourceref "Image" "White"
resourceref "Image" "YellowL1"
resourceref "Image" "YellowL2"

-- Required resources from level object metadata

-- Bake data
resource "LevelData" "DayHubCave" { source = "Levels/DayHubCave/BstBaked.meshes", lodToLoad = 0 }
