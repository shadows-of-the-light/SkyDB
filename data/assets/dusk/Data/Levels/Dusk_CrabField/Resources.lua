-- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT MODIFY THIS FILE!

-- Level objects
resource "LevelObjects" "Dusk_CrabField" { level = "Dusk_CrabField", source = "Levels/Dusk_CrabField/Objects.level", sourcesCount = 33, sources = { "Levels/Dusk_CrabField/Objects.level", "Levels/Dusk_CrabField/AP3.level", "Levels/Dusk_CrabField/AncestorEvents.level", "Levels/Dusk_CrabField/Ap13.level", "Levels/Dusk_CrabField/Art.level", "Levels/Dusk_CrabField/Audio.level", "Levels/Dusk_CrabField/Background.level", "Levels/Dusk_CrabField/BasinArt.level", "Levels/Dusk_CrabField/Bench.level", "Levels/Dusk_CrabField/BoatEvents.level", "Levels/Dusk_CrabField/CameraGuides.level", "Levels/Dusk_CrabField/Candles.level", "Levels/Dusk_CrabField/CloudsArt.level", "Levels/Dusk_CrabField/Collectibles.level", "Levels/Dusk_CrabField/CreatureEvents.level", "Levels/Dusk_CrabField/Creatures.level", "Levels/Dusk_CrabField/DesertRuinsArt.level", "Levels/Dusk_CrabField/DoorEvents.level", "Levels/Dusk_CrabField/EnvNodes.level", "Levels/Dusk_CrabField/FogPlanes.level", "Levels/Dusk_CrabField/Import.level", "Levels/Dusk_CrabField/LocatedAudioSources.level", "Levels/Dusk_CrabField/Map.level", "Levels/Dusk_CrabField/PlayerContainment.level", "Levels/Dusk_CrabField/Quests.level", "Levels/Dusk_CrabField/Script.level", "Levels/Dusk_CrabField/Scripting.level", "Levels/Dusk_CrabField/Spirits.level", "Levels/Dusk_CrabField/StormEvents.level", "Levels/Dusk_CrabField/SunsetRuinsArt.level", "Levels/Dusk_CrabField/VistaArt.level", "Levels/Dusk_CrabField/Wingbuff.level", "Levels/Dusk_CrabField/WorldEvent.level" }, stripDebug = true }

-- Prefabs
resource "LevelObjects" "BlobPrefab_SandDeepDune_30" { level = "SandDeepDune_30", source = "BlobPrefabs/SandDeepDune_30/Objects.level", sourcesCount = 1, sources = { "BlobPrefabs/SandDeepDune_30/Objects.level" }, stripDebug = true }

-- Haptics

-- Meshes
resource "Mesh" "BoatDayAnim_01" { source = "BoatDayAnim_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "BoatDayMotif_01" { source = "BoatDayMotif_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharCrabAAnim" { source = "CharCrabAAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "CharCrabBAnim" { source = "CharCrabBAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Cube" { source = "Cube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Cube1x1x1" { source = "Cube1x1x1.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Cube5x5x5_Bevel" { source = "Cube5x5x5_Bevel.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DArch" { source = "DArch.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCube" { source = "DCube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCylinderCheap" { source = "DCylinderCheap.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_PlantA_01" { source = "Darkshroom_PlantA_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeA_01_lo" { source = "Darkshroom_SporeA_01_lo.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeA_02_lo" { source = "Darkshroom_SporeA_02_lo.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskDebrisBrick_01" { source = "DuskDebrisBrick_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskDebris_02" { source = "DuskDebris_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskFinalTempleEntrance_01" { source = "DuskFinalTempleEntrance_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskGiantPillar_01" { source = "DuskGiantPillar_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskGiantPillar_02" { source = "DuskGiantPillar_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskPillarAged_01" { source = "DuskPillarAged_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskPillarAged_02" { source = "DuskPillarAged_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskPillarAged_03" { source = "DuskPillarAged_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskPillar_01" { source = "DuskPillar_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskStatue_01" { source = "DuskStatue_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskStupaDebris_01" { source = "DuskStupaDebris_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskWall_01" { source = "DuskWall_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskWall_02" { source = "DuskWall_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DuskWall_03" { source = "DuskWall_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorDistant_03" { source = "ExtractorDistant_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorDistant_07" { source = "ExtractorDistant_07.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorDistant_10" { source = "ExtractorDistant_10.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeEnd_01" { source = "ExtractorPipeEnd_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeEnd_02" { source = "ExtractorPipeEnd_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeMotif_03" { source = "ExtractorPipeMotif_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "ExtractorPipeShapeI_01" { source = "ExtractorPipeShapeI_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeShapeI_02" { source = "ExtractorPipeShapeI_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeShapeI_03" { source = "ExtractorPipeShapeI_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeShapeI_03_Flipped" { source = "ExtractorPipeShapeI_03_Flipped.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeShapeL_01" { source = "ExtractorPipeShapeL_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeShapeL_02" { source = "ExtractorPipeShapeL_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeShapeL_03" { source = "ExtractorPipeShapeL_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeShapeS_01" { source = "ExtractorPipeShapeS_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeShapeT_01" { source = "ExtractorPipeShapeT_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "ExtractorPipeSleeve_01" { source = "ExtractorPipeSleeve_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "LightningBolt" { source = "LightningBolt.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "MachuPicchuStairsA" { source = "MachuPicchuStairsA.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MiniAncestorStatue_01" { source = "MiniAncestorStatue_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MoteKey07" { source = "MoteKey07.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MoteKeyDiamond05" { source = "MoteKeyDiamond05.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropAP02ShrineBase" { source = "PropAP02ShrineBase.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "PropSpiritDuskCoverPillarAnim" { source = "PropSpiritDuskCoverPillarAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "ScrollingFog_01" { source = "ScrollingFog_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "SpRockF" { source = "SpRockF.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SpStoneLantern2" { source = "SpStoneLantern2.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SpStoneRing" { source = "SpStoneRing.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Sphere_02" { source = "Sphere_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneBoat_03" { source = "StoneBoat_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneKeyLevel1OuterDiamond" { source = "StoneKeyLevel1OuterDiamond.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StoneLantern_02" { source = "StoneLantern_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "StormCardGlow_01" { source = "StormCardGlow_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "SunsetPillarAged_01" { source = "SunsetPillarAged_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SunsetPillar_02" { source = "SunsetPillar_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SunsetSkatingRinkCenter_02" { source = "SunsetSkatingRinkCenter_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "SunsetSkatingRinkPillars_01" { source = "SunsetSkatingRinkPillars_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }

-- Animations
resource "AnimationPack" "CharKidAnimEmote_C" {}
resource "AnimationPack" "ColFatLaborGlobal" {}
resource "AnimationPack" "ColYawnDayFatLabor" {}
resource "AnimationPack" "MemAP03Poses" {}
resource "AnimationPack" "MemDuskSalute" {}

-- Images
resourceref "Image" "AncestorBlue"
resourceref "Image" "BasicGeoAtlas4"
resourceref "Image" "Black"
resourceref "Image" "CloudFarTex"
resourceref "Image" "Gray"
resourceref "Image" "GrayD1"
resourceref "Image" "StoneBase"
resourceref "Image" "StoneBaseMotif"
resourceref "Image" "StoneBaseMotifSh"
resourceref "Image" "StoneBaseSh"
resourceref "Image" "StoneGrunge2"
resourceref "Image" "StoneRamp"
resourceref "Image" "StormCard2"
resourceref "Image" "StupaBell"
resourceref "Image" "StupaBellSh"
resourceref "Image" "UpNormal"
resourceref "Image" "WallBrick"
resourceref "Image" "WallBrickSh"
resourceref "Image" "White"

-- Required resources from level object metadata
resourceref "Mesh" "CharDarkCreatureAnim"

-- Bake data
resource "LevelData" "Dusk_CrabField" { source = "Levels/Dusk_CrabField/BstBaked.meshes", lodToLoad = 0 }
