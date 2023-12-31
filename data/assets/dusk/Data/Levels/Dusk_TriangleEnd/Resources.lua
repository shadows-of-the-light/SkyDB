-- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT MODIFY THIS FILE!

-- Level objects
resource "LevelObjects" "Dusk_TriangleEnd" { level = "Dusk_TriangleEnd", source = "Levels/Dusk_TriangleEnd/Objects.level", sourcesCount = 4, sources = { "Levels/Dusk_TriangleEnd/Objects.level", "Levels/Dusk_TriangleEnd/LevelLink.level", "Levels/Dusk_TriangleEnd/ancestorenginemerge.level", "Levels/Dusk_TriangleEnd/temp.level" }, stripDebug = true }

-- Prefabs

-- Haptics

-- Meshes
resource "Mesh" "AP13DiveLine_01" { source = "AP13DiveLine_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CShrineManta_01" { source = "CShrineManta_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharSkyLeviathan" { source = "CharSkyLeviathan.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CharSkyRayMotherAnim" { source = "CharSkyRayMotherAnim.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Cube" { source = "Cube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "DCylinderCheapF" { source = "DCylinderCheapF.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = false, stripAnimation = false }
resource "Mesh" "Darkshroom_PlantA_03" { source = "Darkshroom_PlantA_03.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeA_01" { source = "Darkshroom_SporeA_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Darkshroom_SporeB_02_lo" { source = "Darkshroom_SporeB_02_lo.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "FishF" { source = "FishF.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "FishG" { source = "FishG.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "FishH" { source = "FishH.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "MoteKeyDiamond05" { source = "MoteKeyDiamond05.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }

-- Animations
resource "AnimationPack" "CharSpiritCinematicAnim_A" {}

-- Images
resourceref "Image" "AncestorBlue"
resourceref "Image" "AncestorBlueD1"
resourceref "Image" "Black"
resourceref "Image" "BlueL1"
resourceref "Image" "CharRampS13"
resourceref "Image" "Gray"
resourceref "Image" "GreenL2"
resourceref "Image" "Noise3Ch"
resourceref "Image" "Red"
resourceref "Image" "StoneBase"
resourceref "Image" "StoneBaseSh"
resourceref "Image" "UpNormal"
resourceref "Image" "White"

-- Required resources from level object metadata

-- Bake data
resource "LevelData" "Dusk_TriangleEnd" { source = "Levels/Dusk_TriangleEnd/BstBaked.meshes", lodToLoad = 0 }
