-- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT MODIFY THIS FILE!

-- Level objects
resource "LevelObjects" "RainForest" { level = "RainForest", source = "Levels/RainForest/Objects.level", sourcesCount = 29, sources = { "Levels/RainForest/Objects.level", "Levels/RainForest/AP10_quest02.level", "Levels/RainForest/AP10_quest04.level", "Levels/RainForest/AP18_Cinematics.level", "Levels/RainForest/AP18_Ritual.level", "Levels/RainForest/AP3.level", "Levels/RainForest/AdventurePass.level", "Levels/RainForest/BirdGuide.level", "Levels/RainForest/Candles.level", "Levels/RainForest/Collectibles.level", "Levels/RainForest/CrabQuest.level", "Levels/RainForest/Darkstone.level", "Levels/RainForest/EmotePresentCutscenes.level", "Levels/RainForest/ForestArt.level", "Levels/RainForest/IslandArt.level", "Levels/RainForest/LocatedAudioSources.level", "Levels/RainForest/MantaGuide.level", "Levels/RainForest/Map.level", "Levels/RainForest/MemQuestEww.level", "Levels/RainForest/MemQuestMarching.level", "Levels/RainForest/PauseCams.level", "Levels/RainForest/Prototype.level", "Levels/RainForest/Quests.level", "Levels/RainForest/SpiritFragmentQuests.level", "Levels/RainForest/SpiritPrototype.level", "Levels/RainForest/StormyEvents.level", "Levels/RainForest/Table.level", "Levels/RainForest/Wingbuff.level", "Levels/RainForest/WorldEvents.level" }, stripDebug = true }

-- Prefabs
resource "LevelObjects" "BlobPrefab_GrassWetHillShelter_01" { level = "GrassWetHillShelter_01", source = "BlobPrefabs/GrassWetHillShelter_01/Objects.level", sourcesCount = 1, sources = { "BlobPrefabs/GrassWetHillShelter_01/Objects.level" }, stripDebug = true }
resource "LevelObjects" "BlobPrefab_TreeFab01" { level = "TreeFab01", source = "BlobPrefabs/TreeFab01/Objects.level", sourcesCount = 1, sources = { "BlobPrefabs/TreeFab01/Objects.level" }, stripDebug = true }
resource "LevelObjects" "BlobPrefab_TreeFab02" { level = "TreeFab02", source = "BlobPrefabs/TreeFab02/Objects.level", sourcesCount = 1, sources = { "BlobPrefabs/TreeFab02/Objects.level" }, stripDebug = true }
resource "LevelObjects" "BlobPrefab_TreeFab03" { level = "TreeFab03", source = "BlobPrefabs/TreeFab03/Objects.level", sourcesCount = 1, sources = { "BlobPrefabs/TreeFab03/Objects.level" }, stripDebug = true }
resource "LevelObjects" "BlobPrefab_TreeLargeRoot_01" { level = "TreeLargeRoot_01", source = "BlobPrefabs/TreeLargeRoot_01/Objects.level", sourcesCount = 1, sources = { "BlobPrefabs/TreeLargeRoot_01/Objects.level" }, stripDebug = true }

-- Haptics

-- Meshes
resource "Mesh" "AP18SerowMask" { source = "AP18SerowMask.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "BoatRainAnim_01" { source = "BoatRainAnim_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharCrabAAnim" { source = "CharCrabAAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharCrabBAnim" { source = "CharCrabBAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharEnvFlowerAnim" { source = "CharEnvFlowerAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharEnvJellyfishAnim" { source = "CharEnvJellyfishAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharSkyNPC_Prop_Lightstone" { source = "CharSkyNPC_Prop_Lightstone.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharSkyNPC_Prop_LongPickaxe" { source = "CharSkyNPC_Prop_LongPickaxe.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharSkyNPC_Prop_Umbrella" { source = "CharSkyNPC_Prop_Umbrella.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharSkyNPC_Prop_WoodAxe" { source = "CharSkyNPC_Prop_WoodAxe.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharSkyRayCAnim" { source = "CharSkyRayCAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharSkyRayYoungAnim" { source = "CharSkyRayYoungAnim.fbx", computeOcclusions = true, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ClockHours_01" { source = "ClockHours_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ClockMinutes_01" { source = "ClockMinutes_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Clock_01" { source = "Clock_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CloudRing_03b" { source = "CloudRing_03b.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Cube" { source = "Cube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Cube1x1x1" { source = "Cube1x1x1.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CurrencyBubble" { source = "CurrencyBubble.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "DCube" { source = "DCube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCube2" { source = "DCube2.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCylinderCheap" { source = "DCylinderCheap.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_A_01" { source = "Darkshroom_A_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_PlantA_01" { source = "Darkshroom_PlantA_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_PlantA_03" { source = "Darkshroom_PlantA_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_PlantA_Spore_01" { source = "Darkshroom_PlantA_Spore_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeA_01" { source = "Darkshroom_SporeA_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeA_01_lo" { source = "Darkshroom_SporeA_01_lo.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeA_02_lo" { source = "Darkshroom_SporeA_02_lo.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DawnCaveMask_03" { source = "DawnCaveMask_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "DawnTempleStairsRail_01" { source = "DawnTempleStairsRail_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Feast_Tree_01" { source = "Feast_Tree_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Feast_Tree_02" { source = "Feast_Tree_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Feast_Tree_03" { source = "Feast_Tree_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "GodLight6" { source = "GodLight6.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "JarMediumBroken" { source = "JarMediumBroken.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "JarMediumBrokenA" { source = "JarMediumBrokenA.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "JarMediumLo" { source = "JarMediumLo.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "JarSmall" { source = "JarSmall.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MineCart_01" { source = "MineCart_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MiniAncestorStatueCham_01" { source = "MiniAncestorStatueCham_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "MoteKeyDiamond05" { source = "MoteKeyDiamond05.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MountainCard_01" { source = "MountainCard_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MushroomA" { source = "MushroomA.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Plane" { source = "Plane.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP02ShrineBase" { source = "PropAP02ShrineBase.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10Fireplace_01" { source = "PropAP10Fireplace_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10HangingLantern_01" { source = "PropAP10HangingLantern_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10HangingLantern_02" { source = "PropAP10HangingLantern_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10RainForestGateL_01" { source = "PropAP10RainForestGateL_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10RainForestGateR_01" { source = "PropAP10RainForestGateR_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP10RainForestJar_01" { source = "PropAP10RainForestJar_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropBasket_01" { source = "PropBasket_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropBowl_01" { source = "PropBowl_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropCoals_01" { source = "PropCoals_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropDesk_01" { source = "PropDesk_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropHammockBack_01" { source = "PropHammockBack_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropHammockCloth_01" { source = "PropHammockCloth_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropHammockSticks_01" { source = "PropHammockSticks_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropHammockSticks_02" { source = "PropHammockSticks_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropLadder_01" { source = "PropLadder_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropShelf_01" { source = "PropShelf_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropStool_01" { source = "PropStool_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropTentSticks_01" { source = "PropTentSticks_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropTikiTorchHandle_01" { source = "PropTikiTorchHandle_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropTikiTorchTip_01" { source = "PropTikiTorchTip_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropTikiTorch_01" { source = "PropTikiTorch_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainEndDiamond_01" { source = "RainEndDiamond_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainGateSteps_01" { source = "RainGateSteps_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainGate_03" { source = "RainGate_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainGear_01" { source = "RainGear_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainPillar_01" { source = "RainPillar_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainPillar_02" { source = "RainPillar_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainShelter_01" { source = "RainShelter_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainShelter_02" { source = "RainShelter_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeCards_01" { source = "RainTreeCards_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeNub_01" { source = "RainTreeNub_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeNub_01b" { source = "RainTreeNub_01b.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeNub_02" { source = "RainTreeNub_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeNub_03" { source = "RainTreeNub_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeNub_04" { source = "RainTreeNub_04.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RainTreeStump_02" { source = "RainTreeStump_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Rainbow_01" { source = "Rainbow_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "RockSimple_03" { source = "RockSimple_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RockSimple_05" { source = "RockSimple_05.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "RopeCoil_01" { source = "RopeCoil_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ScrollingFog_01" { source = "ScrollingFog_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "Sheep1" { source = "Sheep1.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SimpleBrick_01" { source = "SimpleBrick_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SimpleBrick_02" { source = "SimpleBrick_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SpStoneLantern" { source = "SpStoneLantern.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SpStoneLantern2" { source = "SpStoneLantern2.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SphereCheap_01" { source = "SphereCheap_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "StoneBench_01" { source = "StoneBench_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneBoat03Aged_04" { source = "StoneBoat03Aged_04.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneKeyLevel1InnerDiamond" { source = "StoneKeyLevel1InnerDiamond.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneKeyLevel1OuterDiamond" { source = "StoneKeyLevel1OuterDiamond.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneKeyLevel1WallNoBottom" { source = "StoneKeyLevel1WallNoBottom.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneLantern_01" { source = "StoneLantern_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SunsetYetiHouseAxe_01" { source = "SunsetYetiHouseAxe_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeA" { source = "TreeA.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeB" { source = "TreeB.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeC" { source = "TreeC.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeD" { source = "TreeD.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeE" { source = "TreeE.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeHouseChairSmall_01" { source = "TreeHouseChairSmall_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeHouseWoodFrontRoof_01" { source = "TreeHouseWoodFrontRoof_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeMushrooms_01" { source = "TreeMushrooms_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeMushrooms_02" { source = "TreeMushrooms_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeTallRainC" { source = "TreeTallRainC.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "TreeTallRainCheap_01" { source = "TreeTallRainCheap_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "UmbrellaAP03_01" { source = "UmbrellaAP03_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "UnitSphere" { source = "UnitSphere.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "WoodenBoardsCurved_01" { source = "WoodenBoardsCurved_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "WoodenBoardsCurved_03" { source = "WoodenBoardsCurved_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }

-- Animations
resource "AnimationPack" "CharKidAnimEmote_C" {}
resource "AnimationPack" "CharKidAnimEmote_E" {}
resource "AnimationPack" "CharKidAnimPlayerAct" {}
resource "AnimationPack" "CharSpiritMemoryPoses" {}
resource "AnimationPack" "ColFatLaborGlobal" {}
resource "AnimationPack" "MemAP03Poses" {}
resource "AnimationPack" "MemAPDance" {}
resource "AnimationPack" "MemDayWave" {}
resource "AnimationPack" "MemRainPout" {}
resource "AnimationPack" "MemRainSeek" {}
resource "AnimationPack" "MemRainShyF" {}
resource "AnimationPack" "MemRainShyM" {}
resource "AnimationPack" "SpiritCivFScene" {}
resource "AnimationPack" "SpiritCivMDuskScene" {}
resource "AnimationPack" "SpiritFatLaborEmotes" {}
resource "AnimationPack" "SpiritFatLaborRainForestScene" {}

-- Images
resourceref "Image" "AncestorBlue"
resourceref "Image" "BasicGeoAtlas1"
resourceref "Image" "BasicGeoAtlas4"
resourceref "Image" "Black"
resourceref "Image" "CharRampLNY2"
resourceref "Image" "CharRampRainbow"
resourceref "Image" "CharRampS18"
resourceref "Image" "CharSkyRayBasicTex"
resourceref "Image" "Clear"
resourceref "Image" "CloudFarTex"
resourceref "Image" "FriendshipStatue"
resourceref "Image" "FriendshipStatueSh"
resourceref "Image" "Gray"
resourceref "Image" "GrayL1"
resourceref "Image" "GrayL2"
resourceref "Image" "Noise3Ch"
resourceref "Image" "OrangeL1"
resourceref "Image" "Rainbow"
resourceref "Image" "Red"
resourceref "Image" "SkyRayCTex"
resourceref "Image" "StoneBase"
resourceref "Image" "StoneBaseMotif"
resourceref "Image" "StoneBaseMotifSh"
resourceref "Image" "StoneBaseSh"
resourceref "Image" "StoneBlue"
resourceref "Image" "StoneBlueD3"
resourceref "Image" "StoneGrunge2"
resourceref "Image" "StoneRamp"
resourceref "Image" "TileFloor"
resourceref "Image" "TileFloorSh"
resourceref "Image" "UpNormal"
resourceref "Image" "WallBrick"
resourceref "Image" "WallBrickSh"
resourceref "Image" "White"

-- Required resources from level object metadata

-- Bake data
resource "LevelData" "RainForest" { source = "Levels/RainForest/BstBaked.meshes", lodToLoad = 0 }
