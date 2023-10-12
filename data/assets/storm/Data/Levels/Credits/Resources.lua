-- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT MODIFY THIS FILE!

-- Level objects
resource "LevelObjects" "Credits" { level = "Credits", source = "Levels/Credits/Objects.level", sourcesCount = 4, sources = { "Levels/Credits/Objects.level", "Levels/Credits/Constellation_Credits.level", "Levels/Credits/Cutscene.level", "Levels/Credits/NetEase.level" }, stripDebug = true }

-- Prefabs

-- Haptics

-- Meshes
resource "Mesh" "BirdStripCurve" { source = "BirdStripCurve.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Circle" { source = "Circle.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "CreditsMantaSwirlingAnim_01" { source = "CreditsMantaSwirlingAnim_01.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "Cube" { source = "Cube.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "OrbitEndAdditiveCloud" { source = "OrbitEndAdditiveCloud.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "OrbitEndAsteroids_02" { source = "OrbitEndAsteroids_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "OrbitEndClouds" { source = "OrbitEndClouds.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "OrbitEndMegaBird" { source = "OrbitEndMegaBird.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "OrbitEndMegaConstellationStarField" { source = "OrbitEndMegaConstellationStarField.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "OrbitEndRockCluster_02" { source = "OrbitEndRockCluster_02.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "OrbitEndRockCluster_04" { source = "OrbitEndRockCluster_04.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "OrbitEndStar" { source = "OrbitEndStar.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "OrbitEndStarCluster" { source = "OrbitEndStarCluster.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }
resource "Mesh" "OrbitEndTilingFlameCard" { source = "OrbitEndTilingFlameCard.fbx", computeOcclusions = false, computeEdges = false, computeAdjacency = false, compressPositions = false, compressUvs = false, stripUv13 = false, stripNormals = false, forceIndex32 = false, registerCollision = true, stripAnimation = false }

-- Animations

-- Images
resourceref "Image" "BirdStripTex"
resourceref "Image" "Gray"
resourceref "Image" "OrbitCloudsNebula_01"
resourceref "Image" "OrbitCloudsSmall"
resourceref "Image" "OrbitCloudsSmoke"
resourceref "Image" "OrbitEndCelestialLightBirdStrip"
resourceref "Image" "OrbitEndFlameStrip_03"
resourceref "Image" "OrbitMegaBird"
resourceref "Image" "OrbitStarField2"
resourceref "Image" "OrbitStarField3"
resourceref "Image" "PaintBlue"
resourceref "Image" "StoneBase"
resourceref "Image" "StoneBaseSh"
resourceref "Image" "StoneBlueL3"
resourceref "Image" "UpNormal"
resourceref "Image" "White"

-- Required resources from level object metadata

-- Bake data
resource "LevelData" "Credits" { source = "Levels/Credits/BstBaked.meshes", lodToLoad = 0 }
