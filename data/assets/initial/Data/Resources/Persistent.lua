-------------------------------------------------------------------------------
-- Notes:  Lists all the resources that are loaded at program startup and
--         remain loaded until program termination.
--
-- Author: John Edwards
-- Date C: 5-25-2012
-------------------------------------------------------------------------------

if _G["SKY_ENABLE_RETAIL_DEMO"] == nil then
	SKY_ENABLE_RETAIL_DEMO = os.getenv("SKY_ENABLE_RETAIL_DEMO")
end

-------------------------------------------------------------------------------
-- SCRIPTS
-------------------------------------------------------------------------------

resource "Script" "Account"			{ source = "Scripts/Account.lua", stripDebug = false }

-------------------------------------------------------------------------------
-- FILES
-------------------------------------------------------------------------------
resource "AllLevelList" "AllLevels" {}

-- @HACK: For FluffyClouds
file "Data/Tex3D/CloudNoise.vol"
file "Data/Tex3D/CloudFluffy.vol"
file "Data/Tex3D/PerlinNoise.vol"

file "Data/Vars/Vars.lua"
file "Data/Vars/Vars_Live.lua"
file "Data/Vars/Vars_Stabilization.lua"
file "Data/Vars/Vars_Test.lua"
file "Data/Vars/Vars_AppleRetailDemo.lua"
file "Data/Vars/Vars_SwitchRC2.lua"

-- @HACK: These are only here because precompiled lua doesn't work for 64-bit platforms
--        (which is all of our platforms). Once we fix the compile pipeline these should be removed
file "Data/Scripts/LoadLevel.lua"
file "Data/Scripts/DebugFunctions.lua"
file "Data/Scripts/Account.lua"
--file "Data/Scripts/AllocatorTest.lua"

file "Data/Resources/AudienceEventDefs.json"
file "Data/Resources/CollectibleDefs.json"
file "Data/Resources/Constellations.json"
file "Data/Resources/DailyQuestDefs.json"
file "Data/Resources/NpcDefs.json"
file "Data/Resources/OutfitDefs.json"
file "Data/Resources/PlaceableDefs.json"
file "Data/Resources/MapDefs.json"
file "Data/Resources/QuestDefs.json"
file "Data/Resources/MessageTypes.json"
file "Data/Resources/SeasonTemplate.json"
file "Data/Resources/WorldQuestDefs.json"
file "Data/Resources/CreatureQuestDefs.json"
file "Data/Resources/CreatureQuestWaveDefs.json"
file "Data/Resources/StormSpawnerDefs.json"
file "Data/Resources/DarknessSpawnWaveDefs.json"
file "Data/Resources/DynamicMenuGroupDefs.json"
file "Data/Resources/DynamicMenuIODefs.json"
file "Data/Resources/SocialFeedPrompts.json"

-- Replays
-- file "Data/Replays/DayHub2Stitched.v2.replay"
if SKY_ENABLE_RETAIL_DEMO then
	file "Data/Replays/RetailDemoDawn.v2.replay"
	file "Data/Replays/RetailDemoSunset.v2.replay"
	file "Data/Replays/RetailDemoSunsetDownhill.v2.replay"
end

-------------------------------------------------------------------------------
-- FONTS
-------------------------------------------------------------------------------

resource "SlugFont" "Latin"							{ source = "Lato/Lato-Light.ttf", type = "regular", inlineImages = true }
resource "SlugFont" "Latin-Bold"					{ source = "Lato/Lato-Regular.ttf", type = "bold" }

-- these handle emote icons and CJK languages
if PLATFORM == "nx" or PLATFORM == "ps4" or PLATFORM == "win" or PLATFORM == "macosx" then
	resource "SlugFont" "Emoji"						{ source = "Twemoji/TwemojiMozilla.ttf", color = true, exclude = { "0x00020,0x0007E", "0x000A0,0x000FF" } }
	resource "SlugFont" "Korean-Jamo"				{ source = "NotoSans/NotoSansCJKjp-Regular.otf", include = { "0x1100,0x11FF", "0xAC00,0xD7A3", "0x3130,0x318F", "0xA960,0xA97F", "0xD7B0,0xD7FF" } }
	resource "SlugFont" "Japanese-Common"			{ source = "Marugame/MarugameHonmaruGothic-R.otf", include = { "0x3000,0x337F", "0xFF01,0xFF9F" } }
	resource "SlugFont" "UniHanA"					{ source = "NotoSans/NotoSansCJKjp-Regular.otf", include = { "0x3100,0x312F", "0x4E00,0x5E00" } }
	resource "SlugFont" "UniHanB"					{ source = "NotoSans/NotoSansCJKjp-Regular.otf", include = { "0x5E00,0x6E00" } }
	resource "SlugFont" "UniHanC"					{ source = "NotoSans/NotoSansCJKjp-Regular.otf", include = { "0x6E00,0x7E00" } }
	resource "SlugFont" "UniHanD"					{ source = "NotoSans/NotoSansCJKjp-Regular.otf", include = { "0x7E00,0x8E00" } }
	resource "SlugFont" "UniHanE"					{ source = "NotoSans/NotoSansCJKjp-Regular.otf", include = { "0x8E00,0x9FFC" } }
	resource "SlugFont" "Special"					{ source = "Thatgamefont/thatgamefont.ttf", include = { "0x2726,0x2726" } }
end

-------------------------------------------------------------------------------
-- SHADERS
-------------------------------------------------------------------------------

resource "Shader" "SkyboxCloud"						{ group = "Skybox", vs = "Skybox.vert", fs = "Skybox.frag", toolExport = true, neverCastShadows = true, defines="CLOUD" }

-- Avatar.frag (and a Ref variant if reflected in the final scene)
resource "Shader" "Avatar"							{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="PER_VERTEX_LIGHTING" }
resource "Shader" "AvatarRef"						{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="REFLECTED PER_VERTEX_LIGHTING" }
resource "Shader" "AvatarNormal"					{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="" }
resource "Shader" "AvatarNormalRef"					{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="REFLECTED" }
resource "Shader" "AvatarAlpha"						{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="PER_VERTEX_LIGHTING ALPHA" }
resource "Shader" "AvatarAlphaTest"					{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="PER_VERTEX_LIGHTING ALPHA_TEST" }
resource "Shader" "AvatarCham"						{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY PER_VERTEX_LIGHTING" }
resource "Shader" "AvatarChamRef"					{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="REFLECTED CHAM PER_VERTEX_LIGHTING" }
resource "Shader" "AvatarChamAlpha"					{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY PER_VERTEX_LIGHTING ALPHA" }
resource "Shader" "AvatarChamGlitterAlpha"			{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY PER_VERTEX_LIGHTING ALPHA GLITTER" }
resource "Shader" "AvatarChamButterfly"				{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY PER_VERTEX_LIGHTING ALPHA GLITTER BUTTERFLY" }
resource "Shader" "AvatarHair"						{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="HAIR" }
resource "Shader" "AvatarHairRef"					{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="REFLECTED HAIR" }
resource "Shader" "SpiritBody"						{ group = "Opaque", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="SPIRIT COLOR_UNIFORM" }
resource "Shader" "SpiritBodyAlphaTest"				{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="SPIRIT COLOR_UNIFORM ALPHA_TEST" }
resource "Shader" "SpiritBodyRef"					{ group = "Opaque", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="REFLECTED SPIRIT COLOR_UNIFORM" }
resource "Shader" "SpiritBodyAlpha"					{ group = "Blended", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="SPIRIT MEMORY_REVEAL ALPHA COLOR_UNIFORM MUSICAL_STARS MUSICAL_INFLATE" }
resource "Shader" "SpiritBodyMemoryOpaque"			{ group = "Opaque", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="SPIRIT MEMORY_REVEAL COLOR_UNIFORM MEMORY_OPAQUE" }
resource "Shader" "SpiritBodyAlphaRef"				{ group = "Blended", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="REFLECTED SPIRIT MEMORY_REVEAL ALPHA COLOR_UNIFORM" }
resource "Shader" "SpiritFrozen"					{ group = "Opaque", vs = "Avatar.vert", fs = "SpiritFrozen.frag", toolExport = false, defines="SPIRIT FROZEN COLOR_UNIFORM" }
resource "Shader" "SpiritCore"						{ group = "Ghostly", vs = "SpiritCore.vert", fs = "SpiritCore.frag", toolExport = false, defines="" }
resource "Shader" "SpiritParticle"					{ group = "Blended", vs = "SpiritParticle.vert", fs = "SpiritParticle.frag", toolExport = false, defines="" }
resource "Shader" "SpiritBodyDepthPrepass"			{ group = "DepthPrepass", vs = "Avatar.vert", fs = "Black.frag", toolExport = false, defines="SPIRIT MEMORY_REVEAL BLACK" }
resource "Shader" "AvatarDepthPrepass"				{ group = "DepthPrepass", vs = "Avatar.vert", fs = "Black.frag", toolExport = false, defines="BLACK" }
resource "Shader" "AvatarDiamond"					{ group = "Sprites", vs = "AvatarDiamond.vert", fs = "AvatarDiamond.frag", toolExport = false, defines="" }
resource "Shader" "AvatarFur" 						{ group = "OpaqueTwoFace", vs = "AvatarFur.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY PER_VERTEX_LIGHTING FUR FUR_STRAND" }
resource "Shader" "AvatarChamFurBase" 				{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY PER_VERTEX_LIGHTING FUR" }
resource "Shader" "AvatarFurMotion" 				{ group = "MotionTwoFace", vs = "AvatarFur.vert", fs = "MotionGen.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY PER_VERTEX_LIGHTING MOTION_VEC MESH FUR" }

if PLATFORM == "macosx" or PLATFORM == "win"  then
	resource "Shader" "AvatarWireframe" 				{ group = "Opaque", vs = "AvatarWireframe.vert", fs = "AvatarWireframe.frag", toolExport = false, defines="" }
end

-- Mesh.frag - @NOTE: All meshes in the game currently use the "Mesh" shader when baking, so we need the instance limit to be fairly high
resource "Shader" "MeshAlpha"						{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="DECAL" }
resource "Shader" "MeshShAlpha"						{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED DECAL" }
resource "Shader" "MeshShDecal"						{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines="BAKED DECAL" }
resource "Shader" "MeshShSl"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED SELF_LIT COLOR_UNIFORM" }
resource "Shader" "MeshRainSh"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED RAIN" }
resource "Shader" "MeshRainShAlpha"					{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED RAIN DECAL" }
resource "Shader" "MeshCham"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "CHAM SELF_LIT COLOR_UNIFORM" }
resource "Shader" "MeshDualCham"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "CHAM DUAL_CHAM SELF_LIT COLOR_UNIFORM" }
resource "Shader" "MeshHeightChamSh"				{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "CHAM HEIGHT_CHAM SELF_LIT COLOR_UNIFORM BAKED" }
resource "Shader" "MeshHeightChamSl"				{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "CHAM HEIGHT_CHAM SELF_LIT COLOR_UNIFORM" }
resource "Shader" "CreatureSl"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="SH_UNIFORM CREATURE SELF_LIT" }
resource "Shader" "AncestorEngine"					{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED SELF_LIT DECAL COLOR_UNIFORM" }
resource "Shader" "DarkStone"						{ group = "Opaque", vs = "DarkStone.vert", fs = "DarkStone.frag", toolExport = true, neverCastShadows = true, defines="BAKED" }
resource "Shader" "DarkStoneNoBake"					{ group = "Opaque", vs = "DarkStone.vert", fs = "DarkStone.frag", toolExport = true, neverCastShadows = true, defines="" }
resource "Shader" "MeteorDarkStoneNoBake"			{ group = "Opaque", vs = "DarkStone.vert", fs = "DarkStone.frag", toolExport = true, neverCastShadows = true, defines="METEOR" }
resource "Shader" "LightShroom"						{ group = "Opaque", vs = "LightShroom.vert", fs = "LightShroom.frag", toolExport = true, neverCastShadows = true, defines="" }
resource "Shader" "Spirit"							{ group = "Opaque", vs = "Spirit.vert", fs = "Spirit.frag", toolExport = true, neverCastShadows = true, defines="MESH SPIRIT" }
-- This shader is designed for compatibility with older outfit props that are now using the placeable system
resource "Shader" "MeshPlaceableProp"       		{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines="SELF_LIT COLOR_UNIFORM PLACEABLE_PROP NO_SHADOWS ETHEREAL" }
resource "Shader" "MeshPlaceablePropAlpha"       	{ group = "Blended", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines="SELF_LIT COLOR_UNIFORM PLACEABLE_PROP ALPHA NO_SHADOWS ETHEREAL" }

resource "Shader" "DazzleCham"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT" }
resource "Shader" "DazzleChamAlpha"					{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM DECAL SELF_LIT" }
resource "Shader" "ChamShAlpha"						{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT CHAMTIME DECAL BAKED" }
resource "Shader" "ChamAlphaDepth"					{ group = "BlendedWithBackfaces", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT CHAMTIME ALPHA" }
resource "Shader" "ChamAlphaDepthColor"				{ group = "BlendedWithBackfaces", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT CHAMTIME ALPHA COLOR_UNIFORM" }
resource "Shader" "MeshMagicGlow"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="COLOR_UNIFORM MAGIC_GLOW" }
resource "Shader" "Constellation"					{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM PULSE CONSTELLATION SELF_LIT CHAMTIME DECAL" }

-- Shader for LevelInstanceModel
resource "Shader" "LevelInstanceModel"				{ group = "Opaque", vs = "LevelInstanceModel.vert", fs = "LevelInstanceModel.frag", toolExport = true, defines="" }
-- Shader for Anni4TGCOffice DanceFloor
resource "Shader" "AnniversaryDanceLamp"			{ group = "Opaque", vs = "AnniversaryDanceLamp.vert", fs = "AnniversaryDanceLamp.frag", toolExport = true, defines="" }
-- Shader for Anni4TGCOffice DanceTriangle
resource "Shader" "AnniversaryTriangle"				{ group = "Opaque", vs = "AnniversaryTriangle.vert", fs = "AnniversaryTriangle.frag", toolExport = true, defines="" }
-- Shader for Anni4 Light
resource "Shader" "Anni4Light"						{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SOFT_ALPHA SELF_LIT COLOR_UNIFORM UVSCALE  UVSoft" }

-- Ocean
resource "Shader" "OceanOrbit"						{ group = "Ocean", vs = "Ocean.vert", fs = "Ocean.frag", defines="ORBIT" }
resource "Shader" "OceanDark"						{ group = "Ocean", vs = "Ocean.vert", fs = "Ocean.frag", defines="DARK" }
resource "Shader" "OceanMeshWet"					{ group = "OceanModel", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = true, neverCastShadows = true, defines="MODEL RAIN" }
resource "Shader" "OceanDarkMesh"					{ group = "OceanModel", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = true, neverCastShadows = true, defines="MODEL DARK" }
resource "Shader" "OceanDarkMeshWet"				{ group = "OceanModel", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = true, neverCastShadows = true, defines="MODEL DARK RAIN" }

-- Mote
resource "Shader" "MoteAnim"						{ group = "Opaque", vs = "Mote.vert", fs = "Mote.frag", toolExport = false }
resource "Shader" "MoteMotion"						{ group = "Motion", vs = "Mote.vert", fs = "MotionGen.frag", toolExport = false, defines="MOTION_VEC MESH" }

-- DarkstoneRain
resource "Shader" "DarkstoneRain"					{ group = "Opaque", vs = "DarkstoneRain.vert", fs = "DarkstoneRain.frag", toolExport = false }
resource "Shader" "DarkstoneRainMotion"				{ group = "Motion", vs = "DarkstoneRain.vert", fs = "MotionGen.frag", toolExport = false, defines="MOTION_VEC MESH" }

-- Fish School / Audience
resource "Shader" "InstancedFish"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED FISH" }
resource "Shader" "InstancedFishSh"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED FISH BAKED" }
resource "Shader" "InstancedFishSl"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED FISH SELF_LIT COLOR_UNIFORM" }
resource "Shader" "InstancedBirds"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED BIRD" }
resource "Shader" "InstancedBirdsSh"				{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED BIRD BAKED" }
resource "Shader" "InstancedMantas"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED MANTA" }
resource "Shader" "InstancedGhostMantas"			{ group = "Blended", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED MANTA ALPHA SELF_LIT" }
resource "Shader" "InstancedButterflies"			{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED BUTTERFLY" }
resource "Shader" "InstancedJellyfish"				{ group = "Blended", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED JELLYFISH ALPHA SELF_LIT" }
resource "Shader" "InstancedSkyKidFlying"			{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED SKY_KID_FLYING" }
resource "Shader" "InstancedSkyKidAbstract"			{ group = "Opaque", vs = "Mesh.vert", fs = "PaperLantern.frag", toolExport = false, defines = "INSTANCED SKY_KID_ABSTRACT" }
resource "Shader" "InstancedSkyKidAP18Masked" 		{ group = "Opaque", vs = "Mesh.vert", fs = "PaperLantern.frag", toolExport = false, defines = "INSTANCED SKY_KID_ABSTRACT AP18_MASKED" }
resource "Shader" "InstancedCrabs" 					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED CRAB" }

resource "Shader" "InstancedJellyfishMotion"		{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED JELLYFISH MESH MOTION_VEC" }
resource "Shader" "InstancedSkyKidAbstractMotion"	{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED SKY_KID_ABSTRACT MESH MOTION_VEC" }
resource "Shader" "InstancedSkyKidAP18MaskedMotion"	{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED SKY_KID_ABSTRACT AP18_MASKED MESH MOTION_VEC" }
resource "Shader" "InstancedSkyKidFlyingMotion"		{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED SKY_KID_FLYING MESH MOTION_VEC" }
resource "Shader" "InstancedBirdsMotion"			{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED BIRD MESH MOTION_VEC" }
resource "Shader" "InstancedMantasMotion"			{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED MANTA MESH MOTION_VEC" }
resource "Shader" "InstancedButterfliesMotion"		{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED BUTTERFLY MESH MOTION_VEC" }
resource "Shader" "InstancedCrabsMotion"					{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED CRAB MESH MOTION_VEC" }

resource "Shader" "InstancedSprites" 				{ group = "Opaque", vs = "InstancedSprites.vert", fs = "InstancedSprites.frag", toolExport = false }
resource "Shader" "InstancedSpritesMotion" 			{ group = "Motion", vs = "InstancedSprites.vert", fs = "InstancedSprites.frag", toolExport = false, defines = "MOTION_VEC" }
resource "Shader" "InstancedSpritesShout" 			{ group = "LensFlare", vs = "InstancedSprites.vert", fs = "InstancedSprites.frag", toolExport = false, defines = "SHOUT" }

resource "Shader" "AuroraEthereal"					{ group = "Blended", vs = "Mesh.vert", fs = "AuroraEthereal.frag", toolExport = true, defines = "AURORA ALPHA" }

resource "Shader" "BirdFlock"						{ group = "OpaqueTwoFace", vs = "Bird.vert", fs = "Bird.frag", toolExport = false }
resource "Shader" "Trail"							{ group = "Trails", vs = "Trail.vert", fs = "Trail.frag" }
resource "Shader" "Bub"								{ group = "Blended", vs = "Bub.vert", fs = "Bub.frag" }
resource "Shader" "Shout"							{ group = "BlendedWithBackfacesForeground", vs = "Shout.vert", fs = "Shout.frag" , toolExport = true } -- TARGET_FRAMEWORK_NAME edit by lishimin #32745  Export parameters for Deer normal shout
resource "Shader" "ProjectedCircleZone"				{ group = "BlendedBackfacesNoDepth", vs = "Shout.vert", fs = "ProjectedCircleZone.frag", defines="PROJECTED" }
resource "Shader" "DiscoLightGround"        		{ group = "BlendedBackfacesNoDepth", vs = "Shout.vert", fs = "DiscoLightGround.frag", defines="PROJECTED" }
resource "Shader" "LensFlareStar"					{ group = "LensFlare", vs = "LensFlare.vert", fs = "LensFlare.frag" }
resource "Shader" "LensFlareSunDog"					{ group = "LensFlare", vs = "LensFlareSunDog.vert", fs = "LensFlareSunDog.frag" }
resource "Shader" "LensFlareDot"					{ group = "LensFlare", vs = "LensFlareDot.vert", fs = "LensFlareDot.frag" }
resource "Shader" "Portal"							{ group = "BlendedWithBackfaces", vs = "Portal.vert", fs = "Portal.frag", toolExport = false, defines="" }
resource "Shader" "PortalGeo"						{ group = "BlendedWithBackfaces", vs = "Portal.vert", fs = "Portal.frag", toolExport = true, neverCastShadows = true, defines="MODEL FROM_PORTAL_INDEX" }
resource "Shader" "RepulsionField"					{ group = "BlendedWithBackfaces", vs = "RepulsionField.vert", fs = "RepulsionField.frag", toolExport = true, neverCastShadows = true, defines="" }
resource "Shader" "RepulsionFieldSphere"			{ group = "BlendedWithBackfaces", vs = "RepulsionField.vert", fs = "RepulsionField.frag", toolExport = true, neverCastShadows = true, defines="SPHERE" }
resource "Shader" "ShrineFence"						{ group = "BlendedWithBackfaces", vs = "ShrineFence.vert", fs = "ShrineFence.frag", toolExport = false }

-- DirectionalLighting.frag
resource "Shader" "LitAlphaFading"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, neverCastShadows = true, defines="ALPHA SELF_LIT LIT FADING" }
resource "Shader" "LitAlphaDual"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, neverCastShadows = true, defines="ALPHA SELF_LIT LIT DUAL" }
resource "Shader" "LitAlphaColorSoft"				{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, neverCastShadows = true, defines="ALPHA SOFT_ALPHA SELF_LIT LIT COLOR_UNIFORM UVSCALE" }


resource "Shader" "UnlitAlphaProjected"				{ group = "BlendedBackfacesNoDepth", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SELF_LIT PROJECTED" }
resource "Shader" "UnlitAlphaProjectedTint"			{ group = "BlendedBackfacesNoDepth", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA COLOR_UNIFORM SELF_LIT PROJECTED" }
resource "Shader" "UnlitColor"						{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="COLOR_UNIFORM" }
resource "Shader" "UnlitPoint"						{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", defines="POINT" }
resource "Shader" "UnlitCloudPoint"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", defines="POINT CLOUD_POINT" }
resource "Shader" "UnlitAlphaDual"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SELF_LIT DUAL" }
resource "Shader" "UnlitAlphaPoint"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", defines="ALPHA SELF_LIT POINT" }
resource "Shader" "UnlitAlphaSolid"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", defines="ALPHA SELF_LIT SOLID" }
resource "Shader" "UnlitAlphaColorSoft"				{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SOFT_ALPHA SELF_LIT COLOR_UNIFORM UVSCALE" }
resource "Shader" "UnlitAlphaCloudPoint"			{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", defines="ALPHA SELF_LIT POINT CLOUD_POINT" }
resource "Shader" "UnlitAlphaTestDual"				{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="SELF_LIT ALPHA_TEST COLOR_UNIFORM DUAL DUAL_ADD" }
resource "Shader" "DirectionalLighting"				{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="COLOR_UNIFORM SELF_LIT LIT" }
resource "Shader" "DirectionalLightingRail"			{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="LIT RAIL_SKIN" }
resource "Shader" "DepthPrepass"					{ group = "DepthPrepass", vs = "DepthPrepass.vert", fs = "Black.frag", toolExport = true }
resource "Shader" "CloudQuadFast"					{ group = "Blended", vs = "FlatCloud.vert", fs = "FlatCloud.frag" }
resource "Shader" "CloudQuadDiamond"				{ group = "Opaque", vs = "FlatCloud.vert", fs = "FlatCloud.frag", defines="DIAMOND" }
resource "Shader" "CloudQuadDiamondMotion"			{ group = "Motion", vs = "FlatCloud.vert", fs = "MotionGen.frag", defines="DIAMOND MESH MOTION" }
resource "Shader" "CloudQuadSoftFast"				{ group = "Blended", vs = "FlatCloud.vert", fs = "FlatCloud.frag", defines="SOFT_PARTICLES" }
resource "Shader" "CloudQuadFluffy"					{ group = "Blended", vs = "FlatCloud.vert", fs = "FlatCloud.frag", defines="SOFT_PARTICLES FLUFFY MINIMAL" }
resource "Shader" "CloudQuadParticleFluffy"			{ group = "Cloud", vs = "FlatCloud.vert", fs = "FlatCloud.frag", defines="SOFT_PARTICLES FLUFFY" }

resource "Shader" "Tail"							{ group = "BlendedWithBackfaces", vs = "Trail.vert", fs = "Trail.frag", defines="TAIL" }
resource "Shader" "TailMotion"						{ group = "Motion", vs = "Trail.vert", fs = "Trail.frag", defines="TAIL MOTION" }

-------------------------------------------------------------------------------
-- MESHES
-------------------------------------------------------------------------------

-- Notes
-- loadLazy will load into memory when worn
-- stripNormals will remove normals???
-- compueteOcclusions will calculate shadows
-- stripUv13 will remove tgc_uv1 and tgc_uv3

resource "Mesh" "ChestCore"								{ source = "Sphere_01.fbx", stripAnimation = false, computeOcclusions = true, computeEdges = false } -- Heart

-- Wing / Cape Diamonds
resource "Mesh" "AvatarStarDiamondInner"				{ source = "CapeStar.fbx" } -- Cape star (lower level version)
resource "Mesh" "AvatarStarDiamondOuter"				{ source = "CapeStarFrame.fbx" } -- Cape star (higher level outer frame)
resource "Mesh" "AvatarStarDiamondExtra"				{ source = "CapeStarExtra.fbx" } -- Cape star (higher level extra frame)
resource "Mesh" "AvatarBatDiamondInner"					{ source = "CapeBat.fbx" }
resource "Mesh" "AvatarBatDiamondOuter"					{ source = "CapeBatFrame.fbx" }
resource "Mesh" "AvatarBatDiamondExtra"					{ source = "CapeBatExtra.fbx" }
resource "Mesh" "AvatarDiamondDiamondInner"				{ source = "CapeDiamond.fbx" }
resource "Mesh" "AvatarDiamondDiamondOuter"				{ source = "CapeDiamondFrame.fbx" }
resource "Mesh" "AvatarDiamondDiamondExtra"				{ source = "CapeDiamondExtra.fbx" }
resource "Mesh" "AvatarSproutDiamondInner"				{ source = "CapeSprout.fbx" }
resource "Mesh" "AvatarSproutDiamondOuter"				{ source = "CapeSproutFrame.fbx" }
resource "Mesh" "AvatarSproutDiamondExtra"				{ source = "CapeSproutExtra.fbx" }
resource "Mesh" "AvatarSpiderDiamondInner"				{ source = "CapeSpider.fbx" }
resource "Mesh" "AvatarSpiderDiamondOuter"				{ source = "CapeSpiderFrame.fbx" }
resource "Mesh" "AvatarSpiderDiamondExtra"				{ source = "CapeSpiderExtra.fbx" }
resource "Mesh" "AvatarOceanDiamondInner"				{ source = "CapeOcean.fbx" }
resource "Mesh" "AvatarOceanDiamondOuter"				{ source = "CapeOceanFrame.fbx" }
resource "Mesh" "AvatarOceanDiamondExtra"				{ source = "CapeOceanExtra.fbx" }
resource "Mesh" "AvatarFlowDiamondInner"				{ source = "CapeFlow.fbx" }
resource "Mesh" "AvatarFlowDiamondOuter"				{ source = "CapeFlowFrame.fbx" }
resource "Mesh" "AvatarFlowDiamondExtra"				{ source = "CapeFlowExtra.fbx" }
resource "Mesh" "AvatarWitheredDiamondInner"			{ source = "CapeWithered.fbx" }
resource "Mesh" "AvatarWitheredDiamondOuter"			{ source = "CapeWitheredFrame.fbx" }
resource "Mesh" "AvatarWitheredDiamondExtra"			{ source = "CapeWitheredExtra.fbx" }
resource "Mesh" "AvatarRoseDiamondInner"				{ source = "CapeRose.fbx" }
resource "Mesh" "AvatarRoseDiamondOuter"				{ source = "CapeRoseFrame.fbx" }
resource "Mesh" "AvatarRoseDiamondExtra"				{ source = "CapeRoseExtra.fbx" }
resource "Mesh" "AvatarFiveStarDiamondInner"			{ source = "CapeFiveStar.fbx" }
resource "Mesh" "AvatarFiveStarDiamondOuter"			{ source = "CapeFiveStarFrame.fbx" }
resource "Mesh" "AvatarFiveStarDiamondExtra"			{ source = "CapeFiveStarExtra.fbx" }
resource "Mesh" "AvatarSnowDiamondInner"				{ source = "CapeSnow.fbx" }
resource "Mesh" "AvatarSnowDiamondOuter"				{ source = "CapeSnowFrame.fbx" }
resource "Mesh" "AvatarSnowDiamondExtra"				{ source = "CapeSnowExtra.fbx" }
resource "Mesh" "AvatarHexagonDiamondInner"				{ source = "CapeHexagon.fbx" }
resource "Mesh" "AvatarHexagonDiamondOuter"				{ source = "CapeHexagonFrame.fbx" }
resource "Mesh" "AvatarHexagonDiamondExtra"				{ source = "CapeHexagonExtra.fbx" }
resource "Mesh" "AvatarSphereDiamondInner"				{ source = "CapeSphere.fbx" }
resource "Mesh" "AvatarSphereDiamondOuter"				{ source = "CapeSphereFrame.fbx" }
resource "Mesh" "AvatarSphereDiamondExtra"				{ source = "CapeSphereExtra.fbx" }
resource "Mesh" "AvatarCoinDiamondInner"				{ source = "CapeCoin.fbx" }
resource "Mesh" "AvatarCoinDiamondOuter"				{ source = "CapeCoinFrame.fbx" }
resource "Mesh" "AvatarCoinDiamondExtra"				{ source = "CapeCoinExtra.fbx" }
resource "Mesh" "AvatarPlusDiamondInner"				{ source = "CapePlus.fbx" }
resource "Mesh" "AvatarPlusDiamondOuter"				{ source = "CapePlusFrame.fbx" }
resource "Mesh" "AvatarPlusDiamondExtra"				{ source = "CapePlusExtra.fbx" }
resource "Mesh" "AvatarMinusDiamondInner"				{ source = "CapeMinus.fbx" }
resource "Mesh" "AvatarMinusDiamondOuter"				{ source = "CapeMinusFrame.fbx" }
resource "Mesh" "AvatarMinusDiamondExtra"				{ source = "CapeMinusExtra.fbx" }
resource "Mesh" "AvatarRainbowDiamondInner"				{ source = "CapeRainbow.fbx" }
resource "Mesh" "AvatarRainbowDiamondOuter"				{ source = "CapeRainbowFrame.fbx" }
resource "Mesh" "AvatarRainbowDiamondExtra"				{ source = "CapeRainbowExtra.fbx" }
resource "Mesh" "AvatarTravelerDiamondInner"			{ source = "CapeTraveler.fbx" }
resource "Mesh" "AvatarTravelerDiamondOuter"			{ source = "CapeTravelerFrame.fbx" }
resource "Mesh" "AvatarTravelerDiamondExtra"			{ source = "CapeTravelerExtra.fbx" }
resource "Mesh" "AvatarAbyssDiamondInner"				{ source = "CapeAbyss.fbx" }
resource "Mesh" "AvatarAbyssDiamondOuter"				{ source = "CapeAbyssFrame.fbx" }
resource "Mesh" "AvatarAbyssDiamondExtra"				{ source = "CapeAbyssExtra.fbx" }
resource "Mesh" "AvatarHeartDiamondInner"				{ source = "CapeHeart.fbx" }
resource "Mesh" "AvatarHeartDiamondOuter"				{ source = "CapeHeartFrame.fbx" }
resource "Mesh" "AvatarHeartDiamondExtra"				{ source = "CapeHeartExtra.fbx" }
resource "Mesh" "AvatarCatDiamondInner"					{ source = "CapeCat.fbx" }
resource "Mesh" "AvatarCatDiamondOuter"					{ source = "CapeCatFrame.fbx" }
resource "Mesh" "AvatarCatDiamondExtra"					{ source = "CapeCatExtra.fbx" }
resource "Mesh" "AvatarCrabDiamondInner"				{ source = "CapeCrab.fbx" }
resource "Mesh" "AvatarCrabDiamondOuter"				{ source = "CapeCrabFrame.fbx" }
resource "Mesh" "AvatarCrabDiamondExtra"				{ source = "CapeCrabExtra.fbx" }
resource "Mesh" "AvatarDraculaDiamondInner"				{ source = "CapeDracula.fbx" }
resource "Mesh" "AvatarDraculaDiamondOuter"				{ source = "CapeDraculaFrame.fbx" }
resource "Mesh" "AvatarDraculaDiamondExtra"				{ source = "CapeDraculaExtra.fbx" }
resource "Mesh" "AvatarFireworksDiamondInner"		    { source = "CapeFireworks.fbx" }
resource "Mesh" "AvatarFireworksDiamondOuter"			{ source = "CapeFireworksFrame.fbx" }
resource "Mesh" "AvatarFireworksDiamondExtra"			{ source = "CapeFireworksExtra.fbx" }
resource "Mesh" "AvatarCrescentDiamondInner"            { source = "CapeCrescent.fbx" }
resource "Mesh" "AvatarCrescentDiamondOuter"            { source = "CapeCrescentFrame.fbx" }
resource "Mesh" "AvatarCrescentDiamondExtra"            { source = "CapeCrescentExtra.fbx" }

-- Default Bodies
resource "Mesh" "Outfit_None"					{ source = "Outfit_None.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_Ghost"					{ source = "Body_Ghost.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_ClassicPants"				{ source = "Body_ClassicPants.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_ClassicDress"				{ source = "Body_ClassicDress.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_ShortPants"				{ source = "Body_ShortPants.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_LongPants"				{ source = "Body_LongPants.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_SkinnyPants"				{ source = "Body_SkinnyPants.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_FlarePants"				{ source = "Body_FlarePants.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_PuffyShorts"				{ source = "Body_PuffyShorts.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_PuffyPants"				{ source = "Body_PuffyPants.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_WarriorPants"				{ source = "Body_WarriorPants.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Fortune
resource "Mesh" "Body_FortuneMuralist"			{ source = "Body_FortuneMuralist.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Bloom
resource "Mesh" "Body_Gardener"					{ source = "Body_Gardener.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Nature
-- Days of Color
resource "Mesh" "Body_RainbowLight"				{ source = "Body_RainbowLight.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_RainbowDark"            	{ source = "Body_RainbowDark.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Sunlight
-- Days of Mischief
resource "Mesh" "Body_Witch"					{ source = "Body_Witch.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_Goth"					    { source = "Body_Goth.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Feast
resource "Mesh" "Body_Snowman"            		{ source = "Body_Snowman.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Style
resource "Mesh" "Body_FashionJeans"			    { source = "Body_FashionJeans.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true } --uv1 used for normals
-- Special


-- Default Feet
resource "Mesh" "Feet_ClassicSocks"            	{ source = "Feet_ClassicSocks.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Fortune
-- Days of Bloom
-- Days of Nature
-- Days of Color
-- Days of Sunlight
resource "Mesh" "Feet_SunlightSandals"          { source = "Feet_SunlightSandals.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Mischief
resource "Mesh" "Feet_Witch"            		{ source = "Feet_Witch.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_GothBoots"            	{ source = "Feet_GothBoots.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Feast
resource "Mesh" "Feet_SnowBoots"            	{ source = "Feet_SnowBoots.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_YetiBoots"            	{ source = "Feet_YetiBoots.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Style
resource "Mesh" "Feet_BalletFlats"              { source = "Feet_BalletFlats.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_BunnySlippers"			{ source = "Feet_BunnySlippers.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Special
resource "Mesh" "Feet_AuroraSneakers"        	{ source = "Feet_AuroraSneakers.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }


-- Default Capes
resource "Mesh" "Wing_Classic"					{ source = "Wing_Classic.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_ClassicTrim"				{ source = "Wing_ClassicTrim.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Fortune
resource "Mesh" "Wing_Fortune"					{ source = "Wing_Fortune.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_FortuneFish"				{ source = "Wing_FortuneFish.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Bloom
resource "Mesh" "Wing_CherryBlossom"			{ source = "Wing_CherryBlossom.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Wisteria"					{ source = "Wing_Wisteria.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Tulip"					{ source = "Wing_Tulip.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Nature
resource "Mesh" "Wing_OceanWaves"				{ source = "Wing_OceanWaves.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_SeaTurtle"				{ source = "Wing_SeaTurtle.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_FishPattern"				{ source = "Wing_FishPattern.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Color
resource "Mesh" "Wing_RainbowLight"				{ source = "Wing_RainbowLight.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_RainbowDark"				{ source = "Wing_RainbowDark.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Sunlight
resource "Mesh" "Wing_SunlightTowelBlue"		{ source = "Wing_SunlightTowelBlue.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_SunlightTowelYellow"		{ source = "Wing_SunlightTowelYellow.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_SunlightTowelPink"		{ source = "Wing_SunlightTowelPink.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Mischief
resource "Mesh" "Wing_MischiefBat"				{ source = "Wing_MischiefBat.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_SpiderWeb"				{ source = "Wing_SpiderWeb.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Withered"					{ source = "Wing_Withered.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_MischiefCat"				{ source = "Wing_MischiefCat.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Crabula"				    { source = "Wing_Crabula.fbx", 			    sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Cobweb"					{ source = "Wing_Cobweb.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Feast
resource "Mesh" "Wing_Santa"					{ source = "Wing_Santa.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Snowflake"				{ source = "Wing_Snowflake.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_WinterElder"				{ source = "Wing_WinterElder.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_WinterPuffer"				{ source = "Wing_WinterPuffer.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_YetiFur"					{ source = "Wing_YetiFur.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Special
resource "Mesh" "Wing_Switch"					{ source = "Wing_Switch.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TravelerRed"				{ source = "Wing_TravelerRed.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TravelerWhite"			{ source = "Wing_TravelerWhite.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Flow"						{ source = "Wing_Flow.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }


-- Default Hairstyles
resource "Mesh" "Hair_SideBraid"				{ source = "Hair_SideBraid.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Afro"						{ source = "Hair_Afro.fbx",					sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_BackLong"					{ source = "Hair_BackLong.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Beard"					{ source = "Hair_Beard.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Bun"						{ source = "Hair_Bun.fbx", 					sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Buzz"						{ source = "Hair_Buzz.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_CurlyBun"					{ source = "Hair_CurlyBun.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_CurlyBunTwo"				{ source = "Hair_CurlyBunTwo.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_TightCurls"				{ source = "Hair_TightCurls.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Dreads"					{ source = "Hair_Dreads.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderDawn"				{ source = "Hair_ElderDawn.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderDay"					{ source = "Hair_ElderDay.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderRain"				{ source = "Hair_ElderRain.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderBro"					{ source = "Hair_ElderBro.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderSis"					{ source = "Hair_ElderSis.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderDusk"				{ source = "Hair_ElderDusk.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderNight"				{ source = "Hair_ElderNight.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Lion"						{ source = "Hair_Lion.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_LongBob"					{ source = "Hair_LongBob.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Mohawk"					{ source = "Hair_Mohawk.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Ponytail"					{ source = "Hair_Ponytail.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PonytailSide"				{ source = "Hair_PonytailSide.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PonytailShort"			{ source = "Hair_PonytailShort.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Puff"						{ source = "Hair_Puff.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Punk"						{ source = "Hair_Punk.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_OneSideS"					{ source = "Hair_OneSideS.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_OneSideM"					{ source = "Hair_OneSideM.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_OneSideL"					{ source = "Hair_OneSideL.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ShortBob"					{ source = "Hair_ShortBob.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ShortBobRound"			{ source = "Hair_ShortBobRound.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ShoulderLong"				{ source = "Hair_ShoulderLong.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_SideBraidLong"			{ source = "Hair_SideBraidLong.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_TopSharp"					{ source = "Hair_TopSharp.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Pigtail"					{ source = "Hair_Pigtail.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_BraidedPigtail"			{ source = "Hair_BraidedPigtail.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PigtailSmall"				{ source = "Hair_PigtailSmall.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PigtailPuffy"				{ source = "Hair_PigtailPuffy.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PigtailLow"				{ source = "Hair_PigtailLow.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Fortune
resource "Mesh" "Hair_DoubleBun"				{ source = "Hair_DoubleBun.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_WoolHat"					{ source = "Hair_WoolHat.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_LionDance"				{ source = "Hair_LionDance.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Fish"						{ source = "Hair_Fish.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Bloom
resource "Mesh" "Hair_BlossomPigtail"			{ source = "Hair_BlossomPigtail.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Nature
-- Days of Color
resource "Mesh" "Hair_RainbowBeanie"			{ source = "Hair_RainbowBeanie.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Music
resource "Mesh" "Hair_MarchingBand"				{ source = "Hair_MarchingBand.fbx",			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Sky Anniversary
-- Days of Sunlight
-- Days of Mischief
resource "Mesh" "Hair_Pumpkin"					{ source = "Hair_Pumpkin.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Spider"					{ source = "Hair_Spider.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_MessyWitch"				{ source = "Hair_MessyWitch.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_MischiefCat"				{ source = "Hair_MischiefCat.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Feast
resource "Mesh" "Hair_SantaHat"					{ source = "Hair_SantaHat.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_WinterBeanie"				{ source = "Hair_WinterBeanie.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_SnowmanHead"				{ source = "Hair_SnowmanHead.fbx",			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Style
-- Special
resource "Mesh" "Hair_KizunaAiRed"				{ source = "Hair_KizunaAiRed.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_KizunaAiPink"				{ source = "Hair_KizunaAiPink.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Elf"						{ source = "Hair_Elf.fbx", 					sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_TravelerRed"				{ source = "Hair_TravelerRed.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_TravelerWhite"			{ source = "Hair_TravelerWhite.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }


resource "Mesh" "CharSkyKid_Hair_WitchHat_01"			{ source = "CharSkyKid_Hair_WitchHat_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }



-- Default Masks
resource "Mesh" "Mask_BasicA"							{ source = "CharSkyKid_Mask_BasicA.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Mask_BasicQ"							{ source = "CharSkyKid_Mask_BasicQ.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_ElderDawn"				{ source = "CharSkyKid_Mask_ElderDawn.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_ElderDay"				{ source = "CharSkyKid_Mask_ElderDay.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_ElderRain"				{ source = "CharSkyKid_Mask_ElderRain.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_ElderDusk"				{ source = "CharSkyKid_Mask_ElderDusk.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_ElderSunsetA"			{ source = "CharSkyKid_Mask_ElderSunsetA.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_ElderSunsetB"			{ source = "CharSkyKid_Mask_ElderSunsetB.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_ElderNight"			{ source = "CharSkyKid_Mask_ElderNight.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_Bandana"				{ source = "CharSkyKid_Mask_Bandana.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_Smoke"					{ source = "CharSkyKid_Mask_Smoke.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_ElderDawn_02"			{ source = "CharSkyKid_Mask_ElderDawn_02.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_ElderDay_02"			{ source = "CharSkyKid_Mask_ElderDay_02.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_ElderRain_02"			{ source = "CharSkyKid_Mask_ElderRain_02.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_FortuneRabbit"			{ source = "CharSkyKid_Mask_FortuneRabbit.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_Rose"					{ source = "CharSkyKid_Mask_Rose.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_Ox"					{ source = "CharSkyKid_Mask_Ox.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_RedFace"				{ source = "CharSkyKid_Mask_RedFace.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_Tiger_01"				{ source = "CharSkyKid_Mask_Tiger_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_Traveler_01"			{ source = "CharSkyKid_Mask_Traveler_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_Traveler_02"			{ source = "CharSkyKid_Mask_Traveler_02.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_YetiGoggles"			{ source = "CharSkyKid_Horn_YetiGoggles.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_BlueSunglasses"		{ source = "CharSkyKid_Horn_BlueSunglasses.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Fortune
-- Days of Bloom
-- Days of Nature
-- Days of Color
-- Days of Sunlight
-- Days of Mischief
resource "Mesh" "Mask_Crabula"					{ source = "Mask_Crabula.fbx",			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Feast
-- Days of Style
resource "Mesh" "Mask_RunwayMakeup"				{ source = "Mask_RunwayMakeup.fbx",			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- Special


-- Horn
resource "Mesh" "CharSkyKid_Horn_TuneBand"				{ source = "CharSkyNPC_Prop_TuneBand.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_FlowerPoppy_01"		{ source = "CharSkyKid_Horn_FlowerPoppy_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_FlowerPoppy_02"		{ source = "CharSkyKid_Horn_FlowerPoppy_02.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_BirthdayHat_01"		{ source = "CharSkyKid_Horn_BirthdayHat_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_BirthdayHat_02"		{ source = "CharSkyKid_Horn_BirthdayHat_02.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_BirthdayHat_03"		{ source = "CharSkyKid_Horn_BirthdayHat_03.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_BirthdayHat_04"		{ source = "CharSkyKid_Horn_BirthdayHat_04.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_MusicNote_01"			{ source = "CharSkyKid_Horn_MusicNote_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_MusicNote_02"			{ source = "CharSkyKid_Horn_MusicNote_02.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_Elk"					{ source = "CharSkyKid_Horn_Elk.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_Orange"				{ source = "CharSkyKid_Horn_Orange.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_RainbowPoppy_01"		{ source = "CharSkyKid_Horn_RainbowPoppy_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_RainbowPoppy_02"		{ source = "CharSkyKid_Horn_RainbowPoppy_02.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_RainbowTassel_01"		{ source = "CharSkyKid_Horn_RainbowTassel_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_RainbowEarring_01"		{ source = "CharSkyKid_Horn_RainbowEarring_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_DarkRainbowEarring"		{ source = "CharSkyKid_Horn_DarkRainbowEarring.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_RainbowHeadphones_01"	{ source = "CharSkyKid_Horn_RainbowHeadphones_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_SummerHat_01"			{ source = "CharSkyKid_Horn_SummerHat_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_Shell_01"				{ source = "CharSkyKid_Horn_Shell_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_Bunny_01"				{ source = "CharSkyKid_Horn_Bunny_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_Coral_01"				{ source = "CharSkyKid_Horn_Coral_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_Withered_01"			{ source = "CharSkyKid_Horn_Withered_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_WitchHat_01"			{ source = "CharSkyKid_Horn_WitchHat_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_Snowflake_01"			{ source = "CharSkyKid_Horn_Snowflake_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_FlowerCrown_01"		{ source = "CharSkyKid_Horn_FlowerCrown_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_Fish_01"				{ source = "CharSkyKid_Horn_Fish_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_KizunaAi"				{ source = "CharSkyKid_Horn_KizunaAi.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_Qixi"					{ source = "CharSkyKid_Horn_Qixi.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Fortune
-- Days of Bloom
-- Days of Nature
-- Days of Color
-- Days of Sunlight
-- Days of Mischief
resource "Mesh" "Horn_PumpkinCrab"				{ source = "Horn_PumpkinCrab.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_WhiteFur"				{ source = "Horn_WhiteFur.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_HeadCrab"				{ source = "Horn_HeadCrab.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Feast
-- Days of Style
resource "Mesh" "Horn_StarSunglasses"			{ source = "Horn_StarSunglasses.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Horn_FlameSunglasses"			{ source = "Horn_FlameSunglasses.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Horn_HeartSunglasses"			{ source = "Horn_HeartSunglasses.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Horn_TopHat"					{ source = "Horn_TopHat.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- Special
resource "Mesh" "Horn_FlowerPS"					{ source = "Horn_FlowerPS.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_FireworkEarring"			{ source = "Horn_FireworkEarring.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Prop
resource "Mesh" "CharSkyKid_Prop_Harp"					{ source = "CharSkyKid_Prop_Harp.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Harp_02"				{ source = "CharSkyKid_Prop_Harp_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Horn"					{ source = "CharSkyKid_Prop_Horn.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_HeartStaff"					{ source = "CharSkyKid_Prop_HeartStaff.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Staff"					{ source = "CharSkyKid_Prop_Staff.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Drums"					{ source = "CharSkyKid_Prop_Drums.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Bass"					{ source = "CharSkyKid_Prop_Bass.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Saxophone"					{ source = "CharSkyKid_Prop_Saxophone.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Violin"					{ source = "CharSkyKid_Prop_Violin.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Chair"					{ source = "CharSkyKid_Prop_Chair.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Piano"					{ source = "CharSkyKid_Prop_Piano.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Umbrella"				{ source = "CharSkyKid_Prop_Umbrella.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "CharSkyKid_Prop_Umbrella02"			{ source = "CharSkyKid_Prop_Umbrella02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "CharSkyKid_Prop_Lantern"            	{ source = "CharSkyKid_Prop_Lantern.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_ChairXmas"				{ source = "CharSkyKid_Prop_ChairXmas.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_PianoXmas"				{ source = "CharSkyKid_Prop_PianoXmas.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Swing"					{ source = "CharSkyKid_Prop_Swing.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Seesaw"				{ source = "CharSkyKid_Prop_Seesaw.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_MarshmallowBundle"     { source = "CharSkyKid_Prop_MarshmallowBundle.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true}
resource "Mesh" "CharSkyKid_Prop_MarshmallowStick"      { source = "CharSkyKid_Prop_MarshmallowStick.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_TeaTable_01"			{ source = "CharSkyKid_Prop_TeaTable_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_PicnicBlanket_01"		{ source = "CharSkyKid_Prop_PicnicBlanket.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_FlowerArch"			{ source = "CharSkyKid_Prop_FlowerArch.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_WisteriaTea_01"		{ source = "CharSkyKid_Prop_WisteriaTea_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Ocarina_01"            { source = "CharSkyKid_Prop_Ocarina_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_SummerUmbrella_01"		{ source = "CharSkyKid_Prop_SummerUmbrella_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "CharSkyKid_Prop_SummerUmbrella_02"		{ source = "CharSkyKid_Prop_SummerUmbrella_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "CharSkyKid_Prop_MischiefChair"			{ source = "CharSkyKid_Prop_MischiefChair.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_VelvetBag_01"			{ source = "CharSkyKid_Prop_VelvetBag_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_FeastBall"				{ source = "CharSkyKid_Prop_FeastBall.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Gondola_01"			{ source = "CharSkyKid_Prop_Gondola_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Shield_01"				{ source = "CharSkyKid_Prop_Shield_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Snowman"               { source = "CharSkyKid_Prop_Snowman.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Wrench"                { source = "CharSkyKid_Prop_Wrench_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP19Camera"            { source = "CharSkyKid_Prop_Camera.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP19UltimateCamera"    { source = "CharSkyKid_Prop_AP19Camera.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_ScepterStaff"			{ source = "CharSkyKid_Prop_ScepterStaff.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_ScepterWand"			{ source = "CharSkyKid_Prop_ScepterWand.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- Neck Meshes
resource "Mesh" "Neck_Bow"						{ source = "Neck_Bow.fbx", 					sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_SeaTurtle"				{ source = "Neck_SeaTurtle.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_BlueConch"				{ source = "Neck_BlueConch.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_RibbonBib"				{ source = "Neck_RibbonBib.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_Jellyfish"				{ source = "Neck_Jellyfish.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_Holly"					{ source = "Neck_Holly.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_WinterScarf"				{ source = "Neck_WinterScarf.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_Crab"						{ source = "Neck_Crab.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_CrabBow"					{ source = "Neck_CrabBow.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_MedalGold"				{ source = "Neck_MedalGold.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_MedalSilver"				{ source = "Neck_MedalSilver.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_MedalBronze"				{ source = "Neck_MedalBronze.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- AP02 Gratitude Meshes
resource "Mesh" "Neck_AP02Pendant"				{ source = "Neck_AP02Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP02Fur"					{ source = "Wing_AP02Fur.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP02Tail"					{ source = "Wing_AP02Tail.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP02Stupa"				{ source = "Hair_AP02Stupa.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP02Bhutan"				{ source = "Hair_AP02Bhutan.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP02Cone"					{ source = "Hair_AP02Cone.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP02Bird_01"		{ source = "CharSkyKid_Mask_AP02Bird_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP02Bull_01"		{ source = "CharSkyKid_Mask_AP02Bull_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP02Crab_01"		{ source = "CharSkyKid_Mask_AP02Crab_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP02Deer_01"		{ source = "CharSkyKid_Mask_AP02Deer_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP02Fox_01"		{ source = "CharSkyKid_Mask_AP02Fox_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP02Weasel_01"		{ source = "CharSkyKid_Mask_AP02Weasel_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP02Bell_01"		{ source = "CharSkyKid_Prop_AP02Bell_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP02Bell_02"		{ source = "CharSkyKid_Prop_AP02Bell_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- AP03 Lightseeker Meshes
resource "Mesh" "Neck_AP03Pendant"				{ source = "Neck_AP03Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP03BiolumBlue"			{ source = "Wing_AP03BiolumBlue.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP03BiolumGlow"			{ source = "Wing_AP03BiolumGlow.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP03Petal"				{ source = "Wing_AP03Petal.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP03Victorian"			{ source = "Hair_AP03Victorian.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP03Samurai"				{ source = "Hair_AP03Samurai.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP03Barrette"				{ source = "Hair_AP03Barrette.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP03Upstyle"				{ source = "Hair_AP03Upstyle.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP03Umbrella"				{ source = "Hair_AP03Umbrella.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP03A"				{ source = "CharSkyKid_Mask_AP03A.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP03B"				{ source = "CharSkyKid_Mask_AP03B.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP03C"				{ source = "CharSkyKid_Mask_AP03C.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP03D"				{ source = "CharSkyKid_Mask_AP03D.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP03E"				{ source = "CharSkyKid_Mask_AP03E.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP03F"				{ source = "CharSkyKid_Mask_AP03F.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP03G"				{ source = "CharSkyKid_Mask_AP03G.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP03Umbrella_01"	{ source = "CharSkyKid_Prop_AP03Umbrella_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "CharSkyKid_Prop_AP03Umbrella_02" 	{ source = "CharSkyKid_Prop_AP03Umbrella_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "CharSkyKid_Prop_AP03Flute_01"		{ source = "CharSkyKid_Prop_AP03Flute_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP03PanFlute_01"	{ source = "CharSkyKid_Prop_AP03PanFlute_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- AP04 Belonging Meshes
resource "Mesh" "Neck_AP04Pendant"				{ source = "Neck_AP04Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP04Child"				{ source = "Wing_AP04Child.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP04Adult"				{ source = "Wing_AP04Adult.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP04Elder"				{ source = "Wing_AP04Elder.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP04CozyPants"			{ source = "Body_AP04CozyPants.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP04Ribbon"				{ source = "Hair_AP04Ribbon.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP04WavyBob"				{ source = "Hair_AP04WavyBob.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP04Child"				{ source = "CharSkyKid_Mask_AP04Child.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP04Adult"				{ source = "CharSkyKid_Mask_AP04Adult.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP04Mustache"			{ source = "CharSkyKid_Mask_AP04Mustache.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP04Beard"				{ source = "CharSkyKid_Mask_AP04Beard.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_AP04EarMuffs"			{ source = "CharSkyKid_Horn_AP04EarMuffs.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP04Ukulele_01"		{ source = "CharSkyKid_Prop_AP04Ukulele_01.fbx", computeOcclusions = true, computeEdges = false } -- note: disabled compression / normal stripping on AP04Ukulele_01 for now since it's used as a model
resource "Mesh" "CharSkyKid_Prop_AP04BonfireLogs_01"	{ source = "CharSkyKid_Prop_AP04BonfireLogs_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP04Guitar_01"			{ source = "CharSkyKid_Prop_AP04Guitar_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP04Guitar_02"			{ source = "CharSkyKid_Prop_AP04Guitar_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }

-- AP05 Rhythm Meshes
resource "Mesh" "Neck_AP05Pendant"				{ source = "Neck_AP05Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP05Juggler"				{ source = "Wing_AP05Juggler.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP05Director"				{ source = "Wing_AP05Director.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP05MerchantPants"		{ source = "Body_AP05MerchantPants.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP05DancerPants"			{ source = "Body_AP05DancerPants.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP05ActorPants"			{ source = "Body_AP05ActorPants.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP05JugglerPants"			{ source = "Body_AP05JugglerPants.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP05Director"				{ source = "Hair_AP05Director.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP05Dancer"				{ source = "Hair_AP05Dancer.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP05Juggler"				{ source = "Hair_AP05Juggler.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP05Musician"				{ source = "Hair_AP05Musician.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP05Musician_01"		{ source = "CharSkyKid_Mask_AP05Musician_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_APMerchant_01"			{ source = "CharSkyKid_Mask_APMerchant_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_APActor_01"			{ source = "CharSkyKid_Mask_APActor_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_APDirector_01"			{ source = "CharSkyKid_Mask_APDirector_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Mask_APDefault"				{ source = "CharSkyKid_Mask_AP05Default_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_APPiano_01"			{ source = "CharSkyKid_Prop_APPiano_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_APPiano_02"			{ source = "CharSkyKid_Prop_APPiano_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_AP05Xylophone_01"		{ source = "CharSkyKid_Prop_AP05Xylophone_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- AP06 Enchantment Meshes
resource "Mesh" "Neck_AP06Pendant"				{ source = "Neck_AP06Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP06Trim"					{ source = "Wing_AP06Trim.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP06Tassel"				{ source = "Wing_AP06Tassel.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP06LayeredPurple"		{ source = "Wing_AP06LayeredPurple.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP06LayeredYellow"		{ source = "Wing_AP06LayeredYellow.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06Turban"				{ source = "Hair_AP06Turban.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06Pigtails"				{ source = "Hair_AP06Pigtails.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06WizardHat"			{ source = "Hair_AP06WizardHat.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06ScoutHat"				{ source = "Hair_AP06ScoutHat.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06WizardHair"			{ source = "Hair_AP06WizardHair.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06BunRound"				{ source = "Hair_AP06BunRound.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06ConeHat"				{ source = "Hair_AP06ConeHat.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP06Tassel"			{ source = "CharSkyKid_Horn_AP06Tassel.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP06VeilA"				{ source = "CharSkyKid_Mask_AP06VeilA.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP06VeilB"				{ source = "CharSkyKid_Mask_AP06VeilB.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP06WizardBeard"		{ source = "CharSkyKid_Mask_AP06WizardBeard.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP06Scarf"				{ source = "CharSkyKid_Mask_AP06Scarf.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- AP07 Sanctuary Meshes
resource "Mesh" "Neck_AP07Pendant"				{ source = "Neck_AP07Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP07Aloha"				{ source = "Wing_AP07Aloha.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP07Shell"				{ source = "Wing_AP07Shell.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP07Butterfly"			{ source = "Wing_AP07Butterfly.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP07Manta"				{ source = "Wing_AP07Manta.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP07Jumpsuits"			{ source = "Body_AP07Jumpsuit.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP07CargoPants"			{ source = "Body_AP07CargoPants.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_AP07BowTie"				{ source = "Neck_AP07BowTie.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP07Jellyfish"			{ source = "Hair_AP07Jellyfish.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP07Braid"				{ source = "Hair_AP07Braid.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP07BowlCut"				{ source = "Hair_AP07BowlCut.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP07Balding"				{ source = "Hair_AP07Balding.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP07Undercut"				{ source = "Hair_AP07Undercut.fbx",			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP07StrawHat"  		    { source = "Hair_AP07StrawHat.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true } -- Hat
resource "Mesh" "CharSkyKid_Mask_AP07ThickBrows"		{ source = "CharSkyKid_Mask_AP07ThickBrows_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP07Sunglasses"		{ source = "CharSkyKid_Horn_AP07Sunglasses.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_AP07HandPan"			{ source = "CharSkyKid_Prop_AP07HandPan_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP07HandPan_02"		{ source = "CharSkyKid_Prop_AP07HandPan_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }

-- AP08 Prophecy Meshes
resource "Mesh" "Neck_AP08Pendant"				{ source = "Neck_AP08Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP08Bat"					{ source = "Wing_AP08Bat.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP08Turtle"				{ source = "Wing_AP08Turtle.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP08Spider"				{ source = "Wing_AP08Spider.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP08BaggyPants"			{ source = "Body_AP08BaggyPants.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP08ShortDreads"			{ source = "Hair_AP08ShortDreads.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP08Ponytail"				{ source = "Hair_AP08Ponytail.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP08Braid"				{ source = "Hair_AP08Braid.fbx",			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP08DoubleBun"			{ source = "Hair_AP08DoubleBun.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP08Turtle"			{ source = "CharSkyKid_Mask_AP08Turtle.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP08Wolf"				{ source = "CharSkyKid_Mask_AP08Wolf.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP08Bat"				{ source = "CharSkyKid_Mask_AP08Bat.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP08Spider"			{ source = "CharSkyKid_Mask_AP08Spider.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP08Lion"				{ source = "CharSkyKid_Mask_AP08Lion.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_AP08Dundun"            { source = "CharSkyKid_Prop_AP08Dundun.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP08Dundun_02"         { source = "CharSkyKid_Prop_AP08Dundun_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }

-- AP09 Dreams Meshes
resource "Mesh" "Neck_AP09Pendant"				{ source = "Neck_AP09Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP09Waves"				{ source = "Wing_AP09Waves.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP09Robe"					{ source = "Wing_AP09Robe.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP09Fur"					{ source = "Wing_AP09Fur.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP09Phoenix"				{ source = "Wing_AP09Phoenix.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP09Yeti"					{ source = "Body_AP09Yeti.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP09Uniform"				{ source = "Body_AP09Uniform.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP09Hat"					{ source = "Hair_AP09Hat.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP09Yeti"					{ source = "Hair_AP09Yeti.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP09MultiBuns"			{ source = "Hair_AP09MultiBuns.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP09BambooHat"			{ source = "Hair_AP09BambooHat.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP09Yeti_01"			{ source = "CharSkyKid_Horn_AP09Yeti_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP09Rabbit_01"			{ source = "CharSkyKid_Mask_AP09Rabbit_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP09Phoenix_01"		{ source = "CharSkyKid_Mask_AP09Phoenix_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP09Pigeon_01"			{ source = "CharSkyKid_Mask_AP09Pigeon_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP09Quail_01"			{ source = "CharSkyKid_Mask_AP09Quail_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_AP09Lute_01"			{ source = "CharSkyKid_Prop_AP09Lute_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- AP10 Assembly Meshes
resource "Mesh" "Neck_AP10Pendant"				{ source = "Neck_AP10Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP10YellowCape"			{ source = "Wing_AP10YellowCape.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP10GreenCape"			{ source = "Wing_AP10GreenCape.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP10Overalls"				{ source = "Body_AP10Overalls.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_AP10Overalls"            	{ source = "Feet_AP10Overalls.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP10PotHat"				{ source = "Hair_AP10PotHat.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10StrawCrown"			{ source = "Hair_AP10StrawCrown.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10Bandana"				{ source = "Hair_AP10Bandana.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10PonytailDreads"		{ source = "Hair_AP10PonytailDreads.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10LongBangs"			{ source = "Hair_AP10LongBangs.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10FrontBraids"			{ source = "Hair_AP10FrontBraids.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP10MaskA_01"			{ source = "CharSkyKid_Mask_AP10MaskA_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP10MaskB_01"			{ source = "CharSkyKid_Mask_AP10MaskB_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP10MaskC_01"			{ source = "CharSkyKid_Mask_AP10MaskC_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP10MaskD_01"			{ source = "CharSkyKid_Mask_AP10MaskD_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP10QuestGiver_01"		{ source = "CharSkyKid_Mask_AP10QuestGiver_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP10Eyepatch_01"		{ source = "CharSkyKid_Mask_AP10Eyepatch_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP10Sticks_01"			{ source = "CharSkyKid_Mask_AP10Sticks_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_AP10Bugle_01"			{ source = "CharSkyKid_Prop_AP10Bugle_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP10Bugle_02"			{ source = "CharSkyKid_Prop_AP10Bugle_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_AP10Bugle_03"			{ source = "CharSkyKid_Prop_AP10Bugle_03.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_Backpack_01"			{ source = "CharSkyKid_Prop_Backpack_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP10Hammock_01" 		{ source = "CharSkyKid_Prop_AP10Hammock_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP10Tent_01"			{ source = "CharSkyKid_Prop_AP10Tent_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP10Tent_03"			{ source = "CharSkyKid_Prop_AP10Tent_03.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP10Hoop_01"			{ source = "CharSkyKid_Prop_AP10Hoop_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Cannon_01"       		{ source = "CharSkyKid_Prop_Cannon_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Prop_Bookshelf"						{ source = "CharSkyKid_Prop_AP10Bookshelf_02.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Hammock"							{ source = "CharSkyKid_Prop_AP10Hammock_02.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Torch"									{ source = "CharSkyKid_Prop_AP10Torch_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Tent"								{ source = "CharSkyKid_Prop_AP10Tent_02.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Spotlight"								{ source = "CharSkyKid_Prop_AP10Spotlight_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Hoop"								{ source = "CharSkyKid_Prop_AP10Hoop_02.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_Brazier"							{ source = "CharSkyKid_Prop_AP10Brazier_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Jar"								{ source = "CharSkyKid_Prop_AP10Jar_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Pillow"							{ source = "CharSkyKid_Prop_AP10Pillow_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PillowXmas_Persistent"			{ source = "Prop_WinterPillow_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP11 The Little Prince Meshes
resource "Mesh" "Neck_AP11Pendant"				{ source = "Neck_AP11Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP11Tattered"				{ source = "Wing_AP11Tattered.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11HeavyFur"				{ source = "Wing_AP11HeavyFur.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11Wrinkled"				{ source = "Wing_AP11Wrinkled.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11Uniform"				{ source = "Wing_AP11Uniform.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11GreenCoat"			{ source = "Wing_AP11GreenCoat.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11Scarf"				{ source = "Wing_AP11Scarf.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP11Ancestor"				{ source = "Body_AP11Ancestor.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP11Sword"				{ source = "Body_AP11Sword.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP11GreenPajama"			{ source = "Body_AP11GreenPajama.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_AP11Ascot"				{ source = "Neck_AP11Ascot.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP11ConeHat"				{ source = "Hair_AP11ConeHat.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11Messy"				{ source = "Hair_AP11Messy.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11LongWavy"				{ source = "Hair_AP11LongWavy.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11Crown"				{ source = "Hair_AP11Crown.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11UniformHat"			{ source = "Hair_AP11UniformHat.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11Prince"				{ source = "Hair_AP11Prince.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP11Frog_01"			{ source = "CharSkyKid_Mask_AP11Frog_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_AP11Fox_01"			{ source = "CharSkyKid_Prop_AP11Fox_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }

-- AP12 Flight Meshes
resource "Mesh" "Neck_AP12Pendant"				{ source = "Neck_AP12Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_AP12Scales"				{ source = "Neck_AP12Scales.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP12BlueWing"				{ source = "Wing_AP12BlueWing.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP12TwoTone"				{ source = "Wing_AP12TwoTone.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP12GradientTunic"		{ source = "Body_AP12GradientTunic.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP12DarkTunic"			{ source = "Body_AP12DarkTunic.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP12YellowTunic"			{ source = "Body_AP12YellowTunic.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP12BlueTunic"			{ source = "Body_AP12BlueTunic.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP12FeatherHat"			{ source = "Hair_AP12FeatherHat.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP12RuffledLong"			{ source = "Hair_AP12RuffledLong.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP12RuffledShort"			{ source = "Hair_AP12RuffledShort.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP12Goggles"				{ source = "Hair_AP12Goggles.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP12SideFeather_01"	{ source = "CharSkyKid_Horn_AP12SideFeather_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP12DoubleFeather_01"	{ source = "CharSkyKid_Horn_AP12DoubleFeather_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP12DeluxeFeather_01"	{ source = "CharSkyKid_Horn_AP12DeluxeFeather_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP12Dove_01"			{ source = "CharSkyKid_Horn_AP12Dove_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_AP12Kalimba_01"		{ source = "CharSkyKid_Prop_AP12Kalimba_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- AP13 Abyss Meshes
resource "Mesh" "Neck_AP13Pendant"				{ source = "Neck_AP13Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP13Coat"					{ source = "Wing_AP13Coat.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP13Shawl"				{ source = "Wing_AP13Shawl.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP13Shoulder"				{ source = "Wing_AP13Shoulder.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP13NobleCloak"			{ source = "Wing_AP13NobleCloak.fbx",		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP13LeatherScales"		{ source = "Wing_AP13LeatherScales.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP13Tunic_01"				{ source = "Body_AP13Tunic.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP13BucketHat"			{ source = "Hair_AP13BucketHat.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP13LongBraids" 		    { source = "Hair_AP13LongBraids.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP13TattooBraids"  		{ source = "Hair_AP13TattooBraids.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP13Braids_01"			{ source = "CharSkyKid_Horn_AP13Braids_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP13FullBeard_01"		{ source = "CharSkyKid_Mask_AP13FullBeard_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP13Cracked_01"     	{ source = "CharSkyKid_Mask_AP13Cracked_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP13BraidedBeard_01"   { source = "CharSkyKid_Mask_AP13BraidedBeard_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP13AcornHat_01"     	{ source = "CharSkyKid_Horn_AP13AcornHat_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP13Snorkel_01"     	{ source = "CharSkyKid_Mask_AP13Snorkel_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP13ScarA_01"    	 	{ source = "CharSkyKid_Mask_AP13ScarA_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP13ScarB_01"     		{ source = "CharSkyKid_Mask_AP13ScarB_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP13SnorkelLite_01"    { source = "CharSkyKid_Mask_AP13SnorkelLite_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP14LongTufts_01"     	{ source = "CharSkyKid_Mask_AP14LongTufts_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP14 Performance Meshes
resource "Mesh" "Neck_AP14Pendant"				{ source = "Neck_AP14Pendant.fbx",			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP14Jester"				{ source = "Wing_AP14Jester.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP14Tuxedo"				{ source = "Wing_AP14Tuxedo.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP14TatteredScarf"		{ source = "Wing_AP14TatteredScarf.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP14ShadowPants"			{ source = "Body_AP14ShadowPants.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP14DancerSkirt"			{ source = "Body_AP14DancerSkirt.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP14JesterPants"			{ source = "Body_AP14JesterPants.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP14JesterHood"			{ source = "Hair_AP14JesterHood.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP14ShadowHood"			{ source = "Hair_AP14ShadowHood.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP14HeadWrap"				{ source = "Hair_AP14HeadWrap.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP14CurlyLong"			{ source = "Hair_AP14CurlyLong.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP14TuftedDirector"		{ source = "Hair_AP14TuftedDirector.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_AP14Guitar_01"			{ source = "CharSkyKid_Prop_AP14Guitar_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_AP14Guitar_02"			{ source = "CharSkyKid_Prop_AP14Guitar_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Mask_AP14Determined_01"		{ source = "CharSkyKid_Mask_AP14Determined_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP14Surprised_01"		{ source = "CharSkyKid_Mask_AP14Surprised_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP14Focused_01"		{ source = "CharSkyKid_Mask_AP14Focused_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP14Happy_01"			{ source = "CharSkyKid_Mask_AP14Happy_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP14Sad_01"			{ source = "CharSkyKid_Mask_AP14Sad_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP14VaseBouquet_01_Persistent"	{ source = "CharSkyKid_Prop_AP14VaseBouquet_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP15 Shattering Meshes
resource "Mesh" "Neck_AP15Pendant"				{ source = "Neck_AP15Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP15Krill"				{ source = "Wing_AP15Krill.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP15BigManta"				{ source = "Wing_AP15BigManta.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP15BabyManta"			{ source = "Wing_AP15BabyManta.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP15DarkPlant"			{ source = "Wing_AP15DarkPlant.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP15Jellyfish"			{ source = "Wing_AP15Jellyfish.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP15LightCreature"		{ source = "Body_AP15LightCreature.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_AP15Crab"					{ source = "Neck_AP15Crab.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP15DarkHorn_01"		{ source = "CharSkyKid_Prop_AP15DarkHorn_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP15DarkPlant_01"		{ source = "CharSkyKid_Mask_AP15DarkPlant_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP15DarkPlant_01"		{ source = "CharSkyKid_Horn_AP15DarkPlant_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP15Krill_01"			{ source = "CharSkyKid_Hair_AP15Krill_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP15Manta_01"			{ source = "CharSkyKid_Hair_AP15Manta_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP15Butterfly_01"		{ source = "CharSkyKid_Horn_AP15Butterfly_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP15Jellyfcish_01"		{ source = "CharSkyKid_Hair_AP15Jellyfish_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP16 Aurora Meshes
resource "Mesh" "Neck_AP16Pendant"				{ source = "Neck_AP16Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true  }
resource "Mesh" "Wing_AP16Fire"					{ source = "Wing_AP16Fire.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16Wind"					{ source = "Wing_AP16Wind.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16Water"				{ source = "Wing_AP16Water.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16Earth"				{ source = "Wing_AP16Earth.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16OrangeLove"			{ source = "Wing_AP16OrangeLove.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16ButterflyBlue"		{ source = "Wing_AP16ButterflyBlue.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16ButterflyYellow"		{ source = "Wing_AP16ButterflyYellow.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP16WhiteCropTop"			{ source = "Body_AP16WhiteCropTop.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true  }
resource "Mesh" "Body_AP16SlateRunaway"			{ source = "Body_AP16SlateRunaway.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true  }
resource "Mesh" "Body_AP16OrangeLove"			{ source = "Body_AP16OrangeLove.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true  }
resource "Mesh" "Body_AP16BlueSeed"				{ source = "Body_AP16BlueSeed.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true  }
resource "Mesh" "Body_AP16GreenCure"			{ source = "Body_AP16GreenCure.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true  }
resource "Mesh" "CharSkyKid_Mask_AP16Fire"				{ source = "CharSkyKid_Mask_AP16Fire.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP16Water"				{ source = "CharSkyKid_Mask_AP16Water.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP16Wind"				{ source = "CharSkyKid_Mask_AP16Wind.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP16Earth"				{ source = "CharSkyKid_Mask_AP16Earth.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP16CureForMe"			{ source = "CharSkyKid_Mask_AP16CureForMe.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP16MoonStar"    		{ source = "CharSkyKid_Horn_AP16MoonStar.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP16Fire"				{ source = "CharSkyKid_Hair_AP16Fire.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP16Water"				{ source = "CharSkyKid_Hair_AP16Water.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP16Wind"				{ source = "CharSkyKid_Hair_AP16Wind.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP16Earth"				{ source = "CharSkyKid_Hair_AP16Earth.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP16RunawayBob"		{ source = "CharSkyKid_Hair_AP16RunawayBob.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP16ClassicAurora"		{ source = "CharSkyKid_Hair_AP16ClassicAurora.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_AP16Microphone"		{ source = "CharSkyKid_Prop_AP16Microphone.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }

-- AP17 Remembrance Meshes
resource "Mesh" "Neck_AP17Pendant"				{ source = "Neck_AP17Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP17TiedShawl"			{ source = "Wing_AP17TiedShawl.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP17UniformCloak"			{ source = "Wing_AP17UniformCloak.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP17InjuredSoldier"		{ source = "Wing_AP17InjuredSoldier.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP17Injured"				{ source = "Body_AP17Injured.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP17Apron"				{ source = "Body_AP17Apron.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP17RaggedTunic"			{ source = "Body_AP17RaggedTunic.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_AP17RaggedTunic"			{ source = "Feet_AP17RaggedTunic.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_AP17Scarf"				{ source = "Neck_AP17Scarf.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_AP17Sash"					{ source = "Neck_AP17Sash.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP17PuffyBeard"		{ source = "CharSkyKid_Mask_AP17PuffyBeard.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP17Injured"			{ source = "CharSkyKid_Mask_AP17Injured.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP17PaperboyCap"		{ source = "CharSkyKid_Hair_AP17PaperboyCap.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP17Genius"			{ source = "CharSkyKid_Hair_AP17Genius.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP17BandanaBraid"		{ source = "CharSkyKid_Hair_AP17BandanaBraid.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP17Chimes"						{ source = "CharSkyKid_Prop_AP17Chimes.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP17Plants"						{ source = "CharSkyKid_Prop_AP17Plants.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP17Kettle"						{ source = "CharSkyKid_Prop_AP17Kettle.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_AP17Chimes_01" 	    { source = "WindChime_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AP17Crab"							{ source = "CharSkyKid_Prop_AP17Crab.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AP17Manta"						{ source = "CharSkyKid_Prop_AP17Manta.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- AP18 Passage Meshes
resource "Mesh" "Neck_AP18Pendant"				{ source = "Neck_AP18Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP18FauxPelt"				{ source = "Wing_AP18FauxPelt.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP18FurryGuard"			{ source = "Wing_AP18FurryGuard.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP18RaccoonTail"			{ source = "Wing_AP18RaccoonTail.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP18LightRobe"			{ source = "Body_AP18LightRobe.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP18DarkRobe"				{ source = "Body_AP18DarkRobe.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_AP18FluffyRuff"			{ source = "Neck_AP18FluffyRuff.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Mask_AP18Bear"				{ source = "CharSkyKid_Mask_AP18Bear.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP18Serow"				{ source = "CharSkyKid_Mask_AP18Serow.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP18Boar"				{ source = "CharSkyKid_Mask_AP18Boar.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP18Raccoon"			{ source = "CharSkyKid_Mask_AP18Raccoon.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP18Monkey"			{ source = "CharSkyKid_Mask_AP18Monkey.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP18Tusk"				{ source = "CharSkyKid_Horn_AP18Tusk.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP18FabricStrip"		{ source = "CharSkyKid_Horn_AP18FabricStrip.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP18Spiky"				{ source = "CharSkyKid_Hair_AP18Spiky.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP18MediumBob"			{ source = "CharSkyKid_Hair_AP18MediumBob.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP18SlickBack"			{ source = "CharSkyKid_Hair_AP18SlickBack.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP18SideFade"			{ source = "CharSkyKid_Hair_AP18SideFade.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_AP18Ocarina"			{ source = "CharSkyKid_Prop_AP18Ocarina.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP18Ball"				{ source = "CharSkyKid_Prop_AP18Ball.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- AP19 Moments Meshes
resource "Mesh" "Neck_AP19Pendant"				{ source = "Neck_AP19Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP19Poncho"				{ source = "Wing_AP19Poncho.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP19MonkRobe"				{ source = "Body_AP19MonkRobe.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP19CargoShorts"			{ source = "Body_AP19CargoShorts.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_AP19CargoShorts"			{ source = "Feet_AP19CargoShorts.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Horn_AP19Glasses"			{ source = "CharSkyKid_Horn_AP19Glasses.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP19Straw"			{ source = "CharSkyKid_Horn_AP19Straw.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Horn_AP19Dew"				{ source = "CharSkyKid_Horn_AP19Dew.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Hair_AP19DoubleBraidBack"	{ source = "CharSkyKid_Hair_AP19DoubleBraidBack.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP19Scruffy"				{ source = "CharSkyKid_Mask_AP19Scruffy.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP19Skull"				{ source = "CharSkyKid_Hair_AP19Skull.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP19SkullJaw"			{ source = "CharSkyKid_Horn_AP19SkullJaw.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP19TriangleHat"		{ source = "CharSkyKid_Horn_AP19TriangleHat.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_AP19WesternHat"		{ source = "CharSkyKid_Horn_AP19WesternHat.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Mask_AP19Blindfold"			{ source = "CharSkyKid_Mask_AP19Blindfold.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_AP19HeadTattoo"          { source = "CharSkyKid_Hair_AP19HeadTattoo.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, stripUv13 = true }
resource "Mesh" "Prop_AP19CrystalJar"					{ source = "CharSkyKid_Prop_AP19CrystalJar.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP20 Revival Meshes
resource "Mesh" "Neck_AP20Pendant"				{ source = "Neck_AP20Pendant.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hair_AP20SlickBowlCut"			{ source = "Hair_AP20SlickBowlCut.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP20Beads"			    { source = "Hair_AP20Beads.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP20Maypole"			    { source = "Hair_AP20Maypole.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP20MaypoleNoRibbons"		{ source = "Hair_AP20MaypoleNoRibbons.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP20MaypoleScarf"			{ source = "Neck_AP20MaypoleScarf.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_AP20RobeSandals"			{ source = "Feet_AP20RobeSandals.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_AP20ShortStraps"			{ source = "Feet_AP20ShortStraps.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_AP20LongStraps"			{ source = "Feet_AP20LongStraps.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_AP20Robe"					{ source = "Body_AP20Robe.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Horn_AP20MessageBoat"			{ source = "Horn_AP20MessageBoat.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Horn_AP20Ribbon"				{ source = "Horn_AP20Ribbon.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AP20Rhythm"			    { source = "Wing_AP20Rhythm.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP20Gratitude"		    { source = "Wing_AP20Gratitude.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP20Enchantment"		    { source = "Wing_AP20Enchantment.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP20Abyss"			    { source = "Wing_AP20Abyss.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP20MaypoleScarf"			{ source = "Wing_AP20MaypoleScarf.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Wing_Moth"			    		{ source = "Wing_Moth.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_MothAntenna"			    { source = "Horn_MothAntenna.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Sparrow"			    	{ source = "Wing_Sparrow.fbx", 				sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_SparrowCheeks"			{ source = "Mask_SparrowCheeks.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_Pinecone"			    { source = "Horn_Pinecone.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }


-- Mischief 2.0 Meshes
resource "Mesh" "CharSkyKid_Mask_MischiefCat"			{ source = "CharSkyKid_Mask_MischiefCat.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Hair_MischiefSmoked"		{ source = "CharSkyKid_Hair_MischiefSmoked.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_MischiefCat"       	{ source = "CharSkyKid_Prop_MischiefCat.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Prop_MischiefCat"                      { source = "Prop_MischiefCat.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

resource "Mesh" "CurrencyCandy"                			{ source = "CurrencyCandy.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- Anniversary4 Meshes
resource "Mesh" "Prop_BirthdayOreo"             { source = "Prop_BirthdayOreo.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CupGlass"            		{ source = "Prop_CupGlass.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CupUmbrella"            { source = "UmbrellaPick_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CupDrink"            		{ source = "Prop_CupDrink.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CocoaCup"            		{ source = "Prop_CocoaCup.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_DiscoLight"            		{ source = "Prop_DiscoLight.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Anni4BirthdayCakeS"           { source = "Prop_Anni4BirthdayCakeS.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Horn_BalloonCrown"      { source = "CharSkyKid_Horn_BalloonCrown.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_BalloonCrab"            { source = "CharSkyKid_Horn_BalloonCrab.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_BalloonJellyfish"            { source = "CharSkyKid_Horn_BalloonJellyfish.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_BalloonKrill"            { source = "CharSkyKid_Horn_BalloonKrill.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Horn_BalloonManta"            { source = "CharSkyKid_Horn_BalloonManta.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }


-- NPC MESHES --
resource "Mesh" "NPC_KidLongPantsBody"				{ source = "NPC_KidLongPantsBody.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

resource "Mesh" "NPC_CivilianMaleBody"				{ source = "NPC_CivilianMaleBody.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_CivilianMaleShoulder"			{ source = "NPC_CivilianMaleShoulder.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_CivilianFemaleBody"			{ source = "NPC_CivilianFemaleBody.fbx", 		sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_CivilianFemaleShoulder"		{ source = "NPC_CivilianFemaleShoulder.fbx", 	sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_CivilianShoes"					{ source = "NPC_CivilianShoes.fbx", 			sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }


resource "Mesh" "CharSkyNPC_Body_FatLabor"				{ source = "CharSkyNPC_Body_FatLabor.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_FatLaborWave"			{ source = "CharSkyNPC_Body_FatLaborWave.fbx", sharedSkeleton = "CharSkyNPC_Body_FatLaborWave.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_StrongLabor"			{ source = "CharSkyNPC_Body_StrongLabor.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_StrongLaborHammer"		{ source = "CharSkyNPC_Body_StrongLaborHammer.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_FatLaborChild"			{ source = "CharSkyNPC_Body_FatLaborChild.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_FatLaborStaff"			{ source = "CharSkyNPC_Body_FatLaborStaff.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_FemaleCivilian"		{ source = "CharSkyNPC_Body_FemaleCivilian.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_MaleCivilian"			{ source = "CharSkyNPC_Body_MaleCivilian.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_ShadowChildren"		{ source = "CharSkyNPC_Body_ShadowChildren.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_SkinnyIntellectual"	{ source = "CharSkyNPC_Body_SkinnyIntellectual.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_StrongKnight"			{ source = "CharSkyNPC_Body_StrongKnight.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_MerchantRig"			{ source = "CharSkyNPC_Body_MerchantRig.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_ActorRig"				{ source = "CharSkyNPC_Body_ActorRig.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_DirectorRig"			{ source = "CharSkyNPC_Body_DirectorRig.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_DancerRig"				{ source = "CharSkyNPC_Body_DancerRig.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_JugglerRig"			{ source = "CharSkyNPC_Body_JugglerRig.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_MusicianRig"			{ source = "CharSkyNPC_Body_MusicianRig.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP07CargoPants_01"		{ source = "CharSkyNPC_Body_AP07CargoPants_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP07Jumpsuits_01"		{ source = "CharSkyNPC_Body_AP07Jumpsuits_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP08BaggyPants_01"		{ source = "CharSkyNPC_Body_AP08BaggyPants_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_YoungFemaleRig"		{ source = "CharSkyNPC_Body_YoungFemaleRig.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP09Yeti_01"        	{ source = "CharSkyNPC_Body_AP09Yeti_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_RobedLadyRig"			{ source = "CharSkyNPC_Body_RobedLadyRig.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_Invisible"				{ source = "CharSkyNPC_Body_Invisible.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_YoungChubbyRig"		{ source = "CharSkyNPC_Body_YoungChubbyRig.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP11Kid_01"			{ source = "CharSkyNPC_Body_AP11Kid_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP11KidSpirit_01"		{ source = "CharSkyNPC_Body_AP11KidSpirit_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP11Narcissist"		{ source = "CharSkyNPC_Body_AP11Narcissist.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_FatLaborDress"			{ source = "CharSkyNPC_Body_FatLaborDress.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP12YellowTunic_01"    { source = "CharSkyNPC_Body_AP12YellowTunic_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP12BlueTunic_01"      { source = "CharSkyNPC_Body_AP12BlueTunic_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP12GradientTunic_01"  { source = "CharSkyNPC_Body_AP12GradientTunic_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP12DarkTunic_01"      { source = "CharSkyNPC_Body_AP12DarkTunic_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP13Tunic_01"        	{ source = "CharSkyNPC_Body_AP13Tunic_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP14ShadowPants_01"    { source = "CharSkyNPC_Body_AP14ShadowPants_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP14DancerSkirt_01"    { source = "CharSkyNPC_Body_AP14DancerSkirt_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP14JesterPants_01"    { source = "CharSkyNPC_Body_AP14JesterPants_01.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP16WhiteCropTop"		{ source = "CharSkyNPC_Body_AP16WhiteCropTop.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP16BlueSeed"			{ source = "CharSkyNPC_Body_AP16BlueSeed.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP16SlateRunaway"		{ source = "CharSkyNPC_Body_AP16SlateRunaway.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP16GreenCure"			{ source = "CharSkyNPC_Body_AP16GreenCure.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP16OrangeLove"		{ source = "CharSkyNPC_Body_AP16OrangeLove.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP17Apron"				{ source = "CharSkyNPC_Body_AP17Apron.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP17Injured"			{ source = "CharSkyNPC_Body_AP17Injured.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP18LightRobe"			{ source = "CharSkyNPC_Body_AP18LightRobe.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
--resource "Mesh" "CharSkyNPC_Body_AP18DarkRobe"			{ source = "CharSkyNPC_Body_AP18LDarkRobe.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP19MonkRobe"			{ source = "CharSkyNPC_Body_AP19MonkRobe.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Wing_Director"				{ source = "CharSkyNPC_Wing_Director.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Hair
resource "Mesh" "CharSkyNPC_Hair_FatLaborBun"				{ source = "CharSkyNPC_Hair_FatLaborBun.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Hair_SkinnyIntellectualCrown"	{ source = "CharSkyNPC_Hair_SkinnyIntellectualCrown.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Horn_SkinnyIntellectualCrown"	{ source = "CharSkyNPC_Horn_SkinnyIntellectualCrown.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Horn_FatLaborChains"			{ source = "CharSkyNPC_Horn_FatLaborChains.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Horn_MCivilianChains"			{ source = "CharSkyNPC_Horn_MCivilianChains.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Horn_FatLaborChains_02"			{ source = "CharSkyNPC_Horn_FatLaborChains_02.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Horn_SkinnyIntellectualChains"	{ source = "CharSkyNPC_Horn_SkinnyIntellectualChains.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Horn_StrongLaborChains"			{ source = "CharSkyNPC_Horn_StrongLaborChains.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Mask
resource "Mesh" "CharSkyKid_Mask_NPC"					{ source = "CharSkyKid_Mask_NPC.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Mask_KnightHelmet"			{ source = "CharSkyNPC_Mask_KnightHelmet.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Mask_FatLaborMask"			{ source = "CharSkyNPC_Mask_FatLaborMask.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- Prop
resource "Mesh" "CharSkyNPC_Prop_Book"					{ source = "CharSkyNPC_Prop_Book.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Booze"					{ source = "CharSkyNPC_Prop_Booze.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_ButterflyNet"			{ source = "CharSkyNPC_Prop_ButterflyNet.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Clipboard"				{ source = "CharSkyNPC_Prop_Clipboard.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_FireStick"				{ source = "CharSkyNPC_Prop_FireStick.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Flag"					{ source = "CharSkyNPC_Prop_Flag.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Horn"					{ source = "CharSkyNPC_Prop_Horn.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Jar"					{ source = "CharSkyNPC_Prop_Jar.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, registerCollision = true }
resource "Mesh" "CharSkyNPC_Prop_Oar"					{ source = "CharSkyNPC_Prop_Oar.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_PickAxe"				{ source = "CharSkyNPC_Prop_PickAxe.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_PowerGlove"			{ source = "CharSkyNPC_Prop_PowerGlove.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Shield"				{ source = "CharSkyNPC_Prop_Shield.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Spear"					{ source = "CharSkyNPC_Prop_Spear.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Sword"					{ source = "CharSkyNPC_Prop_Sword.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Event Meshes
resource "Mesh" "UnitDisc"							{ source = "UnitDisc.fbx", registerCollision = true }
resource "Mesh" "UnitCube"							{ source = "UnitCube.fbx", registerCollision = true, computeOcclusions = true }
resource "Mesh" "UnitCylinder"						{ source = "UnitCylinder.fbx", computeOcclusions = true }
resource "Mesh" "UnitPlane"							{ source = "UnitPlane.fbx", computeOcclusions = true }
resource "Mesh" "SpUnitBall"						{ source = "SpUnitBall.fbx", computeOcclusions = true }
resource "Mesh" "UnitSphereFlipped"					{ source = "UnitSphereFlipped.fbx", loadAsync = false, registerCollision = false, computeOcclusions = false }

resource "Mesh" "FxFlameRingBase"					{ source = "FxFlameRingBase.fbx", loadAsync = false, registerCollision = false } -- Gift Aura
resource "Mesh" "SecretObject_Persistent"			{ source = "SecretObject_01.fbx" } -- Mario Star
resource "Mesh" "CharFlyBeingMiniAAnim"				{ source = "CharFlyBeingMiniAAnim.fbx" } -- Butterfly

resource "Mesh" "SpTableA"							{ source = "SpTableA.fbx", loadAsync = false, registerCollision = true } -- Picnic Table
resource "Mesh" "SpChairA"							{ source = "SpChairA.fbx", loadAsync = false, registerCollision = true } -- Picnic Chair

resource "Mesh" "SpTableXmas"						{ source = "SpTableXmas.fbx", loadAsync = false, registerCollision = true } -- Picnic Table
resource "Mesh" "SpChairXmas"						{ source = "SpChairXmas.fbx", loadAsync = false, registerCollision = true } -- Picnic Chair

resource "Mesh" "Prop_SequencerLight_01"			{ source = "Prop_SequencerLight_01.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLight_02"			{ source = "Prop_SequencerLight_02.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLight_03"			{ source = "Prop_SequencerLight_03.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLight_04"			{ source = "Prop_SequencerLight_04.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats

resource "Mesh" "Prop_SequencerLightAnni_01"		{ source = "Prop_SequencerLightAnni_01.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLightAnni_02"		{ source = "Prop_SequencerLightAnni_02.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLightAnni_03"		{ source = "Prop_SequencerLightAnni_03.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLightAnni_04"		{ source = "Prop_SequencerLightAnni_04.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats

resource "Mesh" "Prop_SequencerStation"				{ source = "CharSkyKid_Prop_SequencerStation.fbx", loadAsync = false, registerCollision = true } -- Sequencer Table Harmony
resource "Mesh" "Prop_SequencerAnni"				{ source = "CharSkyKid_Prop_SequencerAnni.fbx", loadAsync = false, registerCollision = true } -- Sequencer Table Anniversary

resource "Mesh" "Prop_BigMantaPlush"				{ source = "Prop_BigMantaPlush.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true }

resource "Mesh" "Bonfire"							{ source = "CharSkyKid_Prop_AP04Bonfire_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "BonfireSeat"						{ source = "CharSkyKid_Prop_AP04BonfireSeat_01.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "Swing"								{ source = "SpSwingSetFrame.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "SpSwingSetSeatAnim"				{ source = "SpSwingSetSeatAnim.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "SeesawAnim"						{ source = "SeesawAnim.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "RainbowSpell"						{ source = "RainbowSpell.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "DOSLightBoat_01"            		{ source = "DOSLightBoat_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "MessageLantern"            		{ source = "MessageLantern.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "MessageLotus"            			{ source = "MessageLotus.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "MessageCranePersistent"            { source = "MessageCrane.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FortuneLanternPersistent"          { source = "FortuneLantern.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "SpringFestivalDragon_Decoration"   { source = "SpringFestivalDragon_Decoration.fbx",  loadAsync = false, registerCollision = false, computeOcclusions = true }

resource "Mesh" "Firecracker"            			{ source = "Firecracker.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Firecracker_big"            		{ source = "Firecracker_big.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "WingBuffChild_05"					{ source = "WingBuffChild_05.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "CShrineCivilian_01"				{ source = "CShrineCivilian_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "MiniAncestorStatue_01_Persistent"	{ source = "MiniAncestorStatue_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "FriendshipStatue_01_Persistent"	{ source = "FriendshipStatue_01.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "Prop_TeaSet"						{ source = "Prop_TeaSet.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_TeaSet_Cup"					{ source = "Prop_TeaSet_Cup.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_TeaSet_Tea"					{ source = "Prop_TeaSet_Tea.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "Prop_MusicShell"					{ source = "Prop_MusicShell.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MusicShellOffice"				{ source = "Prop_MusicShellOffice.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PicnicBlanket"				{ source = "Prop_PicnicBlanket.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_PicnicBlanketFood"			{ source = "Prop_PicnicBlanketFood.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "Archway_DoL_01"					{ source = "Archway_DoL_01.fbx", loadAsync = false, computeOcclusions = true, registerCollision = false }

resource "Mesh" "Prop_ButterflyFountain"			{ source = "Prop_ButterflyFountain.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_ButterflyFountain_Lights"		{ source = "Prop_ButterflyFountain_Lights.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_ButterflyFountain_Petals"		{ source = "Prop_ButterflyFountain_Petals.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

resource "Mesh" "CharSkyKid_Prop_ButterflyFountain"	{ source = "CharSkyKid_Prop_ButterflyFountain.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

resource "Mesh" "Prop_WisteriaTea_01"				{ source = "Prop_WisteriaTea_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_WisteriaTea_Cup_01"			{ source = "Prop_WisteriaTea_Cup_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_WisteriaTea_Saucer_01"		{ source = "Prop_WisteriaTea_Saucer_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_WisteriaTea_Food_01"			{ source = "Prop_WisteriaTea_Food_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_WisteriaTea_Tea_01"			{ source = "Prop_WisteriaTea_Tea_01.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "Prop_Pinwheel"						{ source = "Prop_Pinwheel.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Pinwheel_Handle"				{ source = "Prop_Pinwheel_Handle.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "Prop_BirthdayHat"					{ source = "CharSkyKid_Horn_BirthdayHat_01.fbx", loadAsync = false, registerCollision = false  }
resource "Mesh" "Prop_Fox"							{ source = "PropFox_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_Rose"							{ source = "Prop_Rose.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_RoseGlass"					{ source = "Prop_RoseGlass.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_StarLamp"						{ source = "CharSkyKid_Prop_AP11Star_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowGlobe"					{ source = "Prop_SnowGlobe_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_SnowGlobeFlake"				{ source = "Prop_SnowGlobeFlake_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_SnowGlobeGlass"				{ source = "Prop_SnowGlobeGlass_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_MuralElement"					{ source = "DecalStar_02.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

resource "Mesh" "Prop_BirthdayCakeS"				{ source = "PropBirthdayCakeS.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_BirthdayCakeM"				{ source = "PropBirthdayCakeM.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_BirthdayCakeL"				{ source = "PropBirthdayCakeL.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_BirthdayFlags"				{ source = "PropBirthdayFlags.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_BirthdayFlagPoles"			{ source = "PropBirthdayFlagPoles.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_BeachBall"					{ source = "SummerBeachBall.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowBall"						{ source = "Snowball_02.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_BeachRecliner"				{ source = "Prop_BeachRecliner.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_BeachChairWood"				{ source = "Prop_BeachChairWood.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_BeachChairCloth"				{ source = "Prop_BeachChairCloth.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Brazier2"						{ source = "Prop_Brazier2.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Brazier3"						{ source = "StoneBrazier_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Spell"						{ source = "SphereCheap_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Pipe"							{ source = "Prop_Pipe.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PipeMotif"					{ source = "Prop_PipeMotif.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_MischiefChair"				{ source = "Prop_MischiefChair.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MischiefTable"				{ source = "Prop_MischiefTable.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_MischiefPumpkin"				{ source = "Prop_MischiefPumpkin.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Gondola_01"					{ source = "Prop_Gondola_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_Marshmallow_01"      			{ source = "Prop_Marshmallow_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_Tent_01"      			    { source = "Prop_Tent_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBall"      					{ source = "FeastBall.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBallGateBlue"      			{ source = "FeastBallGateBlue.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "FeastBallWoodRed"      			{ source = "FeastBallWoodRed.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "FeastBallWoodBlue"      			{ source = "FeastBallWoodBlue.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "FeastBallScore_01"      			{ source = "FeastBallScore_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBallScore_02"      			{ source = "FeastBallScore_02.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBallScore_03"      			{ source = "FeastBallScore_03.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBallScore_04"      			{ source = "FeastBallScore_04.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Feast_RacingArch"      			{ source = "Feast_RacingArch.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Feast_RacingStart"      			{ source = "Feast_RacingStart.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Feast_RacingFinish"      			{ source = "Feast_RacingFinish.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Feast_RacingFinishFlag"      		{ source = "Feast_RacingFinishFlag.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Feast_RacingRibbon"      			{ source = "Feast_RacingRibbon.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SunlightBoard"                { source = "Prop_SunlightBoard.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Snowboard"             		{ source = "Prop_Snowboard.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CompanionCube"				{ source = "Prop_CompanionCube.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }


resource "Mesh" "ConstellationAchievementFriendsMadeCenter"     { source = "ConstellationAchievementFriendsMadeCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementBoatCenter"      		{ source = "ConstellationAchievementBoatCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementFlameTouchedCenter"    { source = "ConstellationAchievementFlameTouchedCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementHeartCenter"      		{ source = "ConstellationAchievementHeartCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementHugsCenter"      		{ source = "ConstellationAchievementHugsCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementCrabCenter"      		{ source = "ConstellationAchievementCrabCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementJellyfishCenter"      	{ source = "ConstellationAchievementJellyfishCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "JellyFishPose_03"      						{ source = "JellyFishPose_03.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Crab_03"      									{ source = "Crab_03.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "CrabCenter_03"      							{ source = "CrabCenter_03.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "MantaA_Rotated"      							{ source = "MantaA_Rotated.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "Prop_AP16Symbol"      							{ source = "Prop_AP16Symbol.fbx", loadAsync = false, registerCollision = false, loadLazy = true }

-- Constellation Progress Mesh (Constellation Gate)
resource "Mesh" "ConstellationDawn_01"				{ source = "ConstellationDawn_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationDay_01"				{ source = "ConstellationDay_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationRain_01"				{ source = "ConstellationRain_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationSunset_01"			{ source = "ConstellationSunset_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationDusk_01"				{ source = "ConstellationDusk_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationNight_01"				{ source = "ConstellationNight_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationStorm_01"				{ source = "ConstellationStorm_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationWingBuff_01"			{ source = "ConstellationWingBuff_01.fbx", loadAsync = false, registerCollision = false }

-- AP Constellation Progress Mesh (Constellation Gate)
resource "Mesh" "ConstellationAP"					{ source = "ConstellationAP_06.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationAP02"					{ source = "ConstellationAP_02.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationAP03"					{ source = "ConstellationAP_03.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationAP04"					{ source = "ConstellationAP_04.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationAP06"					{ source = "ConstellationAP_06.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "ConstellationGateMesh"				{ source = "ForceFieldUnit.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "DarkstoneGib"						{ source = "DarkstoneGib.fbx", loadAsync = false, registerCollision = false }

-- Procedurally-generated darkstone crystals
resource "Mesh" "DarkstoneMeteorSpiked01"			{ source = "DarkStoneMeteorSpiked_01Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkStoneGroundRubble01"			{ source = "DarkStoneGroundRubble_01Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkStoneCrystal03"				{ source = "DarkStoneCrystal_03.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "DarkStoneMeteor04"					{ source = "DarkStoneMeteor_04Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkStoneMeteorDestroyed01"		{ source = "DarkStoneMeteorDestroyed_01Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkStoneMeteorInner01"			{ source = "DarkStoneMeteorInner_01Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkStoneMeteor05"					{ source = "DarkStoneMeteor_05Persistent.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "FlyingRockA"						{ source = "SpRockA_Persistent.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FlyingRockB"						{ source = "SpRockB_Persistent.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FlyingRockC"						{ source = "SpRockC_Persistent.fbx", loadAsync = false, registerCollision = false }

-- Procedurally-generated darkstone plants
resource "Mesh" "DarkshroomPlantA01"				{ source = "Darkshroom_PlantA_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkshroomSporeA01lo"				{ source = "Darkshroom_SporeA_01_lo.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkshroomPlantASpore01"			{ source = "Darkshroom_PlantA_Spore_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Darkseed"							{ source = "Darkseed_01.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "DarkStoneRainDrop"					{ source = "DarkStoneRainDrop.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "StupaBellCham"						{ source = "StupaBellCham.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "PropChestAnim"						{ source = "PropChestAnim.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "PropLoot"							{ source = "Prop_APLootBox_01.fbx", loadAsync = false }

resource "Mesh" "PremiumCandleShaft"				{ source = "PremiumCandleShaft.fbx", loadAsync = false, registerCollision = false } -- Gift Light Shaft
resource "Mesh" "GodLightItem"						{ source = "GodLightItem.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false } -- Collectible drop beam
resource "Mesh" "GodLight3b"						{ source = "GodLight3b.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false } -- Collectible drop beam
resource "Mesh" "GodLightNetease"               { source = "GodLightNetease.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false }

-- Crab
resource "Mesh" "CharCrabBAnimPersistent"			{ source = "CharCrabBAnim.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "CrabRock_01Persistent"				{ source = "CrabRock_01.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }

-- Light shroom
resource "Mesh" "CharEnvMushroomPersistent"			{ source = "CharEnvMushroom.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }

-- Season Meditation Shrine
resource "Mesh" "PropSpiritBackpackPersistent"		{ source = "PropSpiritBackpack.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "PropAPShrineTop"					{ source = "PropAP02ShrineTop.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "PropAP10ShrineTop"					{ source = "PropAP10ShrineTop.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "MemoryShrine"						{ source = "MemoryShrine.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "MapShrine_01"						{ source = "MapShrine_01.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "MapShrine_02"						{ source = "MapShrine_02.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "MapShrineSymbol"					{ source = "MapShrineSymbol.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "SharedShrine"						{ source = "DiamondStone.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "SharedLantern"						{ source = "SharedLantern.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "MemoryLantern"						{ source = "MemoryLantern.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }


-- Creature quest husk
resource "Mesh" "CShrineManta_01_Persistent"		{ source = "CShrineManta_01.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "CharSkyRayCAnim_Persistent" 		{ source = "CharSkyRayCAnim.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "CharEnvJellyfishAnim_Persistent" 	{ source = "CharEnvJellyfishAnim.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }

-- Core meshes
resource "Mesh" "ElderMaskB"						{ source = "ElderMaskB.fbx", registerCollision = false }

-- Storm void mesh
resource "Mesh" "StormEndStarBroken_02Anim"			{ source = "StormEndStarBroken_02Anim.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }

-- UI Tutorial Hand
resource "Mesh" "HandyAnim"							{ source = "HandyAnim.fbx", loadAsync = false, registerCollision = false }

-- Spirit ball mesh
resource "Mesh" "SpiritBall"						{ source = "Geosphere.fbx", registerCollision = false }

-- UI Constellation
resource "Mesh" "GUICylinder"						{ source = "UICylinder.fbx", registerCollision = false }

-- Placeable Props
resource "Mesh" "Prop_APFlagAnim_Persistent" 		{ source = "Prop_APFlagAnim_Persistent.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "NightBook_01_Persistent" 			{ source = "NightBook_01_Persistent.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "IslandUmbrella_01_Persistent" 		{ source = "IslandUmbrella_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Balloon_01_Persistent"        { source = "Prop_Balloon_01_Persistent.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_LightFence_Persistent"        { source = "Prop_LightFence_Persistent.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Cannon_01_Persistent"         { source = "Prop_Cannon_01_Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_MarshmallowSet_01" 			{ source = "Prop_MarshmallowSet_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Snowman"						{ source = "Prop_Snowman.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowCrab"						{ source = "Prop_SnowCrab.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowHermit"					{ source = "Prop_SnowHermit.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_BreakedSnowman"				{ source = "Prop_BreakedSnowman.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_JarRound"						{ source = "CharSkyKid_Prop_JarRound.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Ladder"						{ source = "CharSkyKid_Prop_Ladder.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_LanternPost"					{ source = "CharSkyKid_Prop_LanternPost.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Brick"						{ source = "CharSkyKid_Prop_Brick.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_JarTall"						{ source = "CharSkyKid_Prop_JarTall.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Stool"						{ source = "CharSkyKid_Prop_Stool.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MemoryBook"					{ source = "CharSkyKid_Prop_AP17UltimateMemoryBook.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP19Camera"					{ source = "Prop_Camera.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP19UltimateCamera"			{ source = "Prop_AP19Camera.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_HangingLights"				{ source = "Prop_HangingLights.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Bucket"						{ source = "Prop_Bucket.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }



-- Fish School
resource "Mesh" "Cone_01"							{ source = "Cone_01.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "FishH"								{ source = "FishH.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BirdA"								{ source = "BirdA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "CrabA"								{ source = "CrabA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "MantaA"							{ source = "MantaA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "ButterflyA"						{ source = "ButterflyA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "JellyfishA"						{ source = "JellyfishA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "SkyKidFlyingA"						{ source = "SkyKidFlyingA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "SkyKidAbstractA"					{ source = "SkyKidAbstractA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "NightMantaLite"					{ source = "NightMantaLite.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP18SerowAbstract"					{ source = "AP18SerowAbstract.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP18BoarAbstract"					{ source = "AP18BoarAbstract.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP18BearAbstract"					{ source = "AP18BearAbstract.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP18MonkeyAbstract"				{ source = "AP18MonkeyAbstract.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP18RaccoonAbstract"				{ source = "AP18RaccoonAbstract.fbx", registerCollision = false, loadLazy = true }

-- Test Art Book
resource "Mesh" "CharSkyKid_Prop_SkyArtBook01_Closed"						{ source = "Prop_SkyArtBook01_Closed.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_SkyArtBook01_Open"						{ source = "Prop_SkyArtBook01_Open.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Instrument extras
resource "Mesh" "Prop_ViolinBow"							{ source = "Prop_ViolinBow.fbx", loadAsync = false, registerCollision = false }

-------------------------------------------------------------------------------
-- ANIMATION
-------------------------------------------------------------------------------

-- Make animation list
resource "CompiledAnimationList" "AnimationList" { noPack = true }

-- Avatar Animation
resource "AnimationPack" "CharKidAnimFlyState"				{}
resource "AnimationPack" "CharKidAnimAdd"					{ additive = true }
resource "AnimationPack" "CharKidAnimBlink"					{ additive = true }
resource "AnimationPack" "CharKidAnimGroundAct"				{}
resource "AnimationPack" "CharKidAnimFlyAct"				{}
resource "AnimationPack" "CharKidAnimSceneAct"				{}
resource "AnimationPack" "CharKidAnimSceneAct_A"			{}
resource "AnimationPack" "CharKidAnimEmote_B"				{}
resource "AnimationPack" "CharKidAnimEmote_D"				{}
resource "AnimationPack" "CharKidAnimEmote_E"				{}
resource "AnimationPack" "CharKidAnimEmote_F"				{}
resource "AnimationPack" "CharKidAnimEmote_G"				{}
resource "AnimationPack" "CharKidAnimWeakNav"				{}
resource "AnimationPack" "CineCharBirthDawn"				{}
resource "AnimationPack" "CineCharGongDawn"					{}
resource "AnimationPack" "CineCharStormWakeup"				{}
resource "AnimationPack" "CharKidAnimOrbitFlyAct"			{}
resource "AnimationPack" "CharKidAnimProps"					{}
resource "AnimationPack" "CineDeathStormEndAvatar"			{}
resource "AnimationPack" "CineDeathStormEndAvatarApproach"	{}
resource "AnimationPack" "CineCandleSpaceEndAvatar"			{}
resource "AnimationPack" "CineAncestorRainAvatar"			{}
resource "AnimationPack" "CineAncestorDuskSkyKid"			{}
resource "AnimationPack" "CineAncestorNightSkyKid"			{}
resource "AnimationPack" "CineAncestorSunsetSkykid"			{}
resource "AnimationPack" "SpiritFatLaborEmotes"				{}
resource "AnimationPack" "SpiritKnightEmotes"				{}
resource "AnimationPack" "SpiritCivFEmotes"					{}
resource "AnimationPack" "SpiritCivMEmotes"					{}
resource "AnimationPack" "SpiritIntellectualEmotes"			{}

-- Skeletons
resource "AnimationPack" "CharSkyNPC_Skeleton_Actor"		{}
resource "AnimationPack" "CharSkyNPC_Skeleton_Director"		{}
resource "AnimationPack" "CharSkyNPC_Skeleton_Dancer"		{}
resource "AnimationPack" "CharSkyNPC_Skeleton_Juggler"		{}
resource "AnimationPack" "CharSkyNPC_Skeleton_Musician"		{}
resource "AnimationPack" "CharSkyNPC_Skeleton_YoungFemale"	{}
resource "AnimationPack" "CharSkyNPC_Skeleton_RobedLady"	{}

-------------------------------------------------------------------------------
-- IMAGES
-------------------------------------------------------------------------------

-- Logos
resourceref "Image" "AWSLogoLight"
resourceref "Image" "FMODLogoLight"
resourceref "Image" "AMBERLogo"
resourceref "Image" "FacebookLogo"
resourceref "Image" "MirrativLogo"
resourceref "Image" "Funtap18plus"
resourceref "Image" "RolandTR909Logo"

-- Diffuse Textures
resourceref "Image" "CharRampAvatar"
resourceref "Image" "CharRampSpirit"


-- Attribute Textures
resourceref "Image" "Attrib_General"
resourceref "Image" "Attrib_GlowRamp"
resourceref "Image" "Attrib_GlossRamp"
resourceref "Image" "Attrib_Fabric"
-- resourceref "Image" "Attrib_FabricRough"
resourceref "Image" "Attrib_Leather"
resourceref "Image" "Attrib_Scales"
resourceref "Image" "Attrib_CrabLace"


-- Masking Textures
resourceref "Image" "Mask_General"
resourceref "Image" "Mask_Wing"



resourceref "Image" "CharSkyKid_General_Att"
resourceref "Image" "CharSkyKid_VelvetTassel_Att"
resourceref "Image" "CharSkyKid_Velvet_Att"
resourceref "Image" "CharSkyKid_SemiVelvet_Att"




-- Creature ramps
resourceref "Image" "CreatureRamp"
resourceref "Image" "GhostCreatureRamp"



resourceref "Image" "Noise2Ch"
resourceref "Image" "DeerSpotSDF"


-- ENVIRONMENT --

resourceref "Image" "CreatureMotif"
resourceref "Image" "CloudThinTex"
resourceref "Image" "ThreeDee"
resourceref "Image" "ThreeDeeCauliflower"

resourceref "Image" "CloudFinTex"
resourceref "Image" "MetalBeatenSh"
resourceref "Image" "FabricSh"
resourceref "Image" "WoodBase"
resourceref "Image" "WoodBaseSh"

resourceref "Image" "ConstellationImageDawn"
resourceref "Image" "ConstellationImageDay"
resourceref "Image" "ConstellationImageRain"
resourceref "Image" "ConstellationImageSunset"
resourceref "Image" "ConstellationImageDusk"
resourceref "Image" "ConstellationImageNight"
resourceref "Image" "ConstellationImageStorm"
resourceref "Image" "ConstellationImageFriendButterflies"
resourceref "Image" "ConstellationImageFriendCrab"
resourceref "Image" "ConstellationImageFriendCrown"
resourceref "Image" "ConstellationImageFriendDrum"
resourceref "Image" "ConstellationImageFriendManta"
resourceref "Image" "ConstellationImageFriendUmbrella"
resourceref "Image" "ConstellationImageFriendKids"
resourceref "Image" "ConstellationImageFriendHarp"
resourceref "Image" "ConstellationImageFriendMonument"
resourceref "Image" "ConstellationImageFriendJellyfish"
resourceref "Image" "ConstellationImageAP"
resourceref "Image" "ConstellationImageAP02"
resourceref "Image" "ConstellationImageAP03"
resourceref "Image" "ConstellationImageAP04"
resourceref "Image" "ConstellationImageAP05"
resourceref "Image" "ConstellationImageAP06"
resourceref "Image" "ConstellationImageAP07"
resourceref "Image" "ConstellationImageAP08"
resourceref "Image" "ConstellationImageAP09"
resourceref "Image" "ConstellationImageAP10"
resourceref "Image" "ConstellationImageAP11"
resourceref "Image" "ConstellationImageAP12"
resourceref "Image" "ConstellationImageAP13"
resourceref "Image" "ConstellationImageAP14"
resourceref "Image" "ConstellationImageAP15"
resourceref "Image" "ConstellationImageAP16"
resourceref "Image" "ConstellationImageAP17"
resourceref "Image" "ConstellationImageAP18"
resourceref "Image" "ConstellationImageAP19"
resourceref "Image" "ConstellationImageAP21"
resourceref "Image" "UIRing"
resourceref "Image" "UIRingBloom"
resourceref "Image" "UIRingBigThin"
resourceref "Image" "UIRingBigThinner"
resourceref "Image" "UIRingBigMedium"
resourceref "Image" "UIRingBigThick"
resourceref "Image" "UIBorderThin"
resourceref "Image" "UIBorderThinFill"
resourceref "Image" "UIStepHoop"
resourceref "Image" "ShoutRingBloom"
resourceref "Image" "UIArrowUp"
resourceref "Image" "UIEye"
resourceref "Image" "UIFingerSingle"
resourceref "Image" "UIFingerSingleShadow"
resourceref "Image" "UIFingerDouble"
resourceref "Image" "UIBar"
resourceref "Image" "UIFade"
resourceref "Image" "UIFadeLine"
resourceref "Image" "UISphereFade"
resourceref "Image" "UiButtonGlow"
resourceref "Image" "UiBorderGlowSoft"
resourceref "Image" "UiBorderGlowHard"
resourceref "Image" "UiBorderGlowThinSoft"
resourceref "Image" "UiBorderGlowThinHard"
resourceref "Image" "UiBorderGlowThickSoft"
resourceref "Image" "UiBorderGlowThickHard"
resourceref "Image" "UiBubbleButtonBorder"
resourceref "Image" "UiButtonBorderThin"
resourceref "Image" "UiMenuTabHighlight"
resourceref "Image" "UiButtonToggledEdge"
resourceref "Image" "UiMenuGradientEdge"
resourceref "Image" "UiMenuGradientLinear"
resourceref "Image" "UiMiscGradientNineSlice"
resourceref "Image" "UiMapTintOverlay"
resourceref "Image" "UiVignette"
resourceref "Image" "UiGradientShout_Quarter"
resourceref "Image" "UiMiscDropShadowCircle"
resourceref "Image" "UiMiscDropShadowCircleSmall"
resourceref "Image" "UiMaskCircleGlow"
resourceref "Image" "UiMapCloud_Tile"
resourceref "Image" "UiMapInkblot"
resourceref "Image" "UiAlbumAurora"
resourceref "Image" "DarkstoneNorTex"
resourceref "Image" "Wisteria"
resourceref "Image" "FlowerTex"

resourceref "Image" "Portal"
resource "ImageRegion" "PortalDawn"			{ image = "Portal", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "PortalDay"			{ image = "Portal", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "PortalRain"			{ image = "Portal", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "PortalSunset"		{ image = "Portal", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "PortalDusk"			{ image = "Portal", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "PortalNight"		{ image = "Portal", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "PortalStorm"		{ image = "Portal", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "PortalAP"			{ image = "Portal", uv = { 1/3, 2/3, 2/3, 3/3 } }
resource "ImageRegion" "PortalPrairie"		{ image = "Portal", uv = { 2/3, 2/3, 3/3, 3/3 } }
resource "ImageRegion" "PortalCandleSpace"	{ image = "Portal", uv = { 2/3, 2/3, 3/3, 3/3 } }
resource "ImageRegion" "PortalWhite"		{ image = "Portal", uv = { 0.5, 0, 0.6, 0.1 } }

-- COLOR TEX -- Note : Red and OrangeL1 are in boot.lua for Candlespace release loading

resourceref "Image" "GreenGray"
resourceref "Image" "AncestorBlueD1"
resourceref "Image" "AncestorBlueL1"
resourceref "Image" "Magenta"
resourceref "Image" "MagentaD3"
resourceref "Image" "MagentaD2"
resourceref "Image" "MagentaD1"
resourceref "Image" "MagentaL3"
resourceref "Image" "MagentaL2"
resourceref "Image" "MagentaL1"
resourceref "Image" "OrangeD3"
resourceref "Image" "OrangeD2"
resourceref "Image" "OrangeD1"
resourceref "Image" "OrangeL3"
resourceref "Image" "PurpleD3"
resourceref "Image" "Yellow"
resourceref "Image" "YellowD3"
resourceref "Image" "YellowD1"
resourceref "Image" "YellowL3"
resourceref "Image" "YellowL2"
resourceref "Image" "YellowL1"
resourceref "Image" "Cyan"
resourceref "Image" "CyanD3"
resourceref "Image" "CyanD2"
resourceref "Image" "CyanD1"
resourceref "Image" "CyanL3"
resourceref "Image" "CyanL2"
resourceref "Image" "CyanL1"
resourceref "Image" "Lime"
resourceref "Image" "LimeD3"
resourceref "Image" "LimeD2"
resourceref "Image" "LimeD1"
resourceref "Image" "LimeL3"
resourceref "Image" "LimeL2"
resourceref "Image" "LimeL1"
resourceref "Image" "Blue"
resourceref "Image" "BlueD3"
resourceref "Image" "BlueD2"
resourceref "Image" "BlueD1"
resourceref "Image" "BlueL3"
resourceref "Image" "BlueL1"
resourceref "Image" "Brown"
resourceref "Image" "Green"
resourceref "Image" "GreenD3"
resourceref "Image" "GreenD2"
resourceref "Image" "GreenD1"
resourceref "Image" "GreenL3"
resourceref "Image" "GreenL2"
resourceref "Image" "GreenL1"
resourceref "Image" "RedD5"
resourceref "Image" "RedD4"
resourceref "Image" "RedD2"
resourceref "Image" "RedD1"
resourceref "Image" "RedL3"
resourceref "Image" "RedL1"
resourceref "Image" "GrayD2"
resourceref "Image" "GrayL1"

resourceref "Image" "PaintBlue"
resourceref "Image" "PaintBlueL1"
resourceref "Image" "PaintBlueL2"
resourceref "Image" "PaintBlueL3"
resourceref "Image" "PaintBlueD1"
resourceref "Image" "PaintBlueD2"
resourceref "Image" "PaintBlueD3"
resourceref "Image" "StoneBlue"
resourceref "Image" "StoneBlueL2"
resourceref "Image" "StoneBlueL3"
resourceref "Image" "StoneBlueD1"
resourceref "Image" "StoneBlueD2"

resourceref "Image" "ColElementWater"
resourceref "Image" "ColElementEarth"
resourceref "Image" "ColElementAir"
resourceref "Image" "ColElementFire"

resourceref "Image" "ElementWater"
resourceref "Image" "ElementEarth"
resourceref "Image" "ElementAir"
resourceref "Image" "ElementFire"
resourceref "Image" "ElementVoid"
resourceref "Image" "ElementMind"

resourceref "Image" "RainbowBelt"

-- UI COLOR TEX --

resourceref "Image" "UiOrangeL3"
resourceref "Image" "UiGrayL1"

-- PARTICLES --

resourceref "Image" "ParticleAtlas"
resourceref "Image" "ParticleAtlas02"
resourceref "Image" "AudienceEmotesAtlas"

-- format is { lower left u, lower left v, upper right u, upper right v }
-- 1st row, left to right
resource "ImageRegion" "crl1"	{ image = "ParticleAtlas02", uv = { 0, 0, 2/8, 2/8 } }
resource "ImageRegion" "crl2"	{ image = "ParticleAtlas02", uv = { 2/8, 0, 4/8, 2/8 } }
resource "ImageRegion" "dot1"	{ image = "ParticleAtlas02", uv = { 4/8, 0, .75, 2/8 } }
resource "ImageRegion" "dot2"	{ image = "ParticleAtlas02", uv = { 6/8, 0, 1, 2/8 } }
-- 2nd row, left to right
resource "ImageRegion" "sqr1"	{ image = "ParticleAtlas02", uv = { 0, 2/8, 2/8, 4/8 } }
resource "ImageRegion" "sqr2"	{ image = "ParticleAtlas02", uv = { 2/8, 2/8, 4/8, 4/8 } }
resource "ImageRegion" "dmd1"	{ image = "ParticleAtlas02", uv = { 4/8, 2/8, .75, 4/8 } }
resource "ImageRegion" "tri1"	{ image = "ParticleAtlas02", uv = { 6/8, 2/8, 1, 4/8 } }
-- 3rd row, left to right
resource "ImageRegion" "dst1"	{ image = "ParticleAtlas02", uv = { 0, 4/8, 2/8, 6/8 } }
resource "ImageRegion" "dst2"	{ image = "ParticleAtlas02", uv = { 2/8, 4/8, 4/8, 6/8 } }
resource "ImageRegion" "cld1"	{ image = "ParticleAtlas02", uv = { 4/8, 4/8, .75, 6/8 } }
resource "ImageRegion" "cld2"	{ image = "ParticleAtlas02", uv = { 6/8, 4/8, 1, 6/8 } }
-- 4th row, left to right
resource "ImageRegion" "clrH"	{ image = "ParticleAtlas02", uv = { 0, 6/8, 2/8, 1 } }
resource "ImageRegion" "dmdH"	{ image = "ParticleAtlas02", uv = { 2/8, 6/8, 4/8, 1 } }
resource "ImageRegion" "sqrH"	{ image = "ParticleAtlas02", uv = { 4/8, 6/8, .75, 1 } }
resource "ImageRegion" "triH"	{ image = "ParticleAtlas02", uv = { 6/8, 6/8, 1, 1 } }



-- Before --
--resourceref "Image" "Before_Env_NM"
--resourceref "Image" "Before_Foliage"
--resourceref "Image" "Before_PalmTreeBark"

-- AVATAR --

resourceref "Image" "HandyTex"
resourceref "Image" "HairNormalTex"
resourceref "Image" "FeatherNoise"
resourceref "Image" "GlitterNoiseBlue"
resourceref "Image" "CoinNoise"
resourceref "Image" "HeartNoise"
resourceref "Image" "CapeIntegrity"

resourceref "Image" "AvatarChamBodyTex"

resourceref "Image" "CharSkyKid_Atlas_Att"

-- Avatar body
resourceref "Image" "CharSkyKid_Body_Ghost_Tex"
resourceref "Image" "SpiritAtlas"
resourceref "Image" "CharRampS2"
resourceref "Image" "CharRampS3"
resourceref "Image" "CharRampS4"
resourceref "Image" "CharRampS6"
resourceref "Image" "CharRampS7"
resourceref "Image" "CharRampFlowersS7"
resourceref "Image" "CharRampS8"
resourceref "Image" "CharRampS9"
resourceref "Image" "CharRampS10"
resourceref "Image" "CharRampS11"
resourceref "Image" "CharRampS12"
resourceref "Image" "CharRampS13"
resourceref "Image" "CharRampS14"
resourceref "Image" "CharRampS16"
resourceref "Image" "CharRampS16Aurora"
resourceref "Image" "CharRampAuroraNPC"
resourceref "Image" "CharRampAuroraNPC2"
resourceref "Image" "CharRampS16Misc"
resourceref "Image" "CharRampS17"
resourceref "Image" "CharRampS18"
resourceref "Image" "CharRampS19"
resourceref "Image" "CharRampS20"


resourceref "Image" "CharRampAlpha1"
resourceref "Image" "CharRampAlpha2"
resourceref "Image" "CharRampEvents"
resourceref "Image" "CharRampEvents2"
resourceref "Image" "CharRampFish"
resourceref "Image" "CharRampRainbow"
resourceref "Image" "CharRampKizunaAi"
resourceref "Image" "CharRampXmas_Tex"
resourceref "Image" "CharRampXmas_Att"
resourceref "Image" "CharRampLNY"
resourceref "Image" "CharRampLNY1"
resourceref "Image" "CharRampLNY2"
resourceref "Image" "CharRampLNY_Att"
resourceref "Image" "CharRampMisc1"
resourceref "Image" "CharRampCrabLace"
resourceref "Image" "SkyRayCTex"

-- Avatar hair/mask/horn/neck
resourceref "Image" "CharSkyKid_All_Grad_Tex"
resourceref "Image" "CharSkyKid_Mask_Grad_Tex"

-- Avatar attribute textures
resource "ImageRegion" "CharSkyKid_Hair_Default_Att"	{ image = "CharSkyKid_Atlas_Att", uv = { 0/8, 2/8, 1/8, 3/8 } }
resource "ImageRegion" "CharSkyKid_All_Default_Att"		{ image = "CharSkyKid_Atlas_Att", uv = { 1/8, 2/8, 2/8, 3/8 } }
resourceref "Image" "CharSkyKid_Mask_Simple_Att"

-- UI ATLASES --

-- UIAtlas3
resourceref "Image" "UIAtlas3"
resource "ImageRegion" "UIShopButtonCircle1"			{ image = "UIAtlas3", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UIShopButtonCircle2"			{ image = "UIAtlas3", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UIShopButtonCircle3"			{ image = "UIAtlas3", uv = { 2/3, 0/3, 3/3, 1/3 } }
--resource "ImageRegion" "UIShopButtonCircle4"			{ image = "UIAtlas3", uv = { 0/3, 1/3, 1/3, 2/3 } }
--resource "ImageRegion" "UIShopButtonCircle5"			{ image = "UIAtlas3", uv = { 1/3, 1/3, 2/3, 2/3 } }

-- UIAtlas4
resourceref "Image" "UIAtlas4"
resource "ImageRegion" "UIRainbowHeart"					{ image = "UIAtlas4", uv = { 0/2, 0/2, 1/2, 1/2 } }
resource "ImageRegion" "UIRainbowGift"					{ image = "UIAtlas4", uv = { 1/2, 0/2, 2/2, 1/2 } }

-- UITutorialAtlases
resourceref "Image" "UITutorialAtlasAP"
resource "ImageRegion" "UISeasonPassPromoAP"			{ image = "UITutorialAtlasAP", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "UISeasonPassPromo2AP"			{ image = "UITutorialAtlasAP", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "UISeasonPassPromo3AP"			{ image = "UITutorialAtlasAP", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "UISeasonPassPromo4AP"			{ image = "UITutorialAtlasAP", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UISeasonPassPromo5AP"			{ image = "UITutorialAtlasAP", uv = { 0/3, 0/3, 1/3, 1/3 } }

resource "ImageRegion" "UITutorialUnravelMystery"		{ image = "UITutorialAtlasAP", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "UITutorialSaveSpirits"			{ image = "UITutorialAtlasAP", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "UITutorialFlyHigher"			{ image = "UITutorialAtlasAP", uv = { 1/3, 2/3, 2/3, 3/3 } }
resource "ImageRegion" "UITutorialAscendToStorm"		{ image = "UITutorialAtlasAP", uv = { 2/3, 2/3, 3/3, 3/3 } }

resourceref "Image" "UISeasonPassPromoAP15"
resourceref "Image" "UISeasonPassPromoAP16"
resourceref "Image" "UISeasonPassPromoAP17"
resourceref "Image" "UISeasonPassPromoAP18"
resourceref "Image" "UISeasonPassPromoAP19"
resourceref "Image" "UISeasonPassPromoAP20"

--temporal fix for spellshop tutorial
resourceref "Image" "UISeasonPassPreoderPromoAP06"

-- UITutorialAtlases - SharedSpace
resourceref "Image" "UITutorialAtlasSharedSpaces"
resource "ImageRegion" "UISharedSpacesShareMagic"		{ image = "UITutorialAtlasSharedSpaces", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UISharedSpacesExploreWorld"		{ image = "UITutorialAtlasSharedSpaces", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UISharedSpacesUniqueItems"		{ image = "UITutorialAtlasSharedSpaces", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "UISharedSpacesBeCreative"		{ image = "UITutorialAtlasSharedSpaces", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "UISharedSpacesShareTutorial1"	{ image = "UITutorialAtlasSharedSpaces", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "UISharedSpacesShareTutorial2"	{ image = "UITutorialAtlasSharedSpaces", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "UISharedSpacesShareTutorial3"	{ image = "UITutorialAtlasSharedSpaces", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "UISharedSpacesShareTutorial4"	{ image = "UITutorialAtlasSharedSpaces", uv = { 1/3, 2/3, 2/3, 3/3 } }

resourceref "Image" "UITutorialAtlas02"
resource "ImageRegion" "UITutorialHeal"					{ image = "UITutorialAtlas02", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UITutorialBetterTogether"		{ image = "UITutorialAtlas02", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UITutorialGrowCloser"			{ image = "UITutorialAtlas02", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "UITutorialStayInTouch"			{ image = "UITutorialAtlas02", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "UITutorialShowAppreciation"		{ image = "UITutorialAtlas02", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "UITutorialExpressYourself"		{ image = "UITutorialAtlas02", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "UITutorialUnlockGates"			{ image = "UITutorialAtlas02", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "UITutorialFindAll"				{ image = "UITutorialAtlas02", uv = { 1/3, 2/3, 2/3, 3/3 } }
resource "ImageRegion" "UITutorialAscendFriendship"		{ image = "UITutorialAtlas02", uv = { 2/3, 2/3, 3/3, 3/3 } }

resourceref "Image" "UITutorialAtlas03"
resource "ImageRegion" "UITutorialEnhanceExpressions"	{ image = "UITutorialAtlas03", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UITutorialReceiveBlessing"		{ image = "UITutorialAtlas03", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UITutorialCompleteConstellation"{ image = "UITutorialAtlas03", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "UITutorialDressUp"				{ image = "UITutorialAtlas03", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "UITutorialAdventureAwaits"		{ image = "UITutorialAtlas03", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "UITutorialEachKingdom"			{ image = "UITutorialAtlas03", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "UITutorialFindSpirits"			{ image = "UITutorialAtlas03", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "UITutorialOfferHearts"			{ image = "UITutorialAtlas03", uv = { 1/3, 2/3, 2/3, 3/3 } }
resource "ImageRegion" "UITutorialDressUp2"				{ image = "UITutorialAtlas03", uv = { 2/3, 2/3, 3/3, 3/3 } }

resourceref "Image" "UITutorialAtlas04"
resource "ImageRegion" "UITutorialVisitingSpirits"      { image = "UITutorialAtlas04", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UITutorialPerformTogether"      { image = "UITutorialAtlas04", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UITutorialUnlockRewards"        { image = "UITutorialAtlas04", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "UITutorialFindSpirits2"         { image = "UITutorialAtlas04", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "UITutorialRequirePass"          { image = "UITutorialAtlas04", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "UITutorialPreview"              { image = "UITutorialAtlas04", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "UITutorialVariousForms"         { image = "UITutorialAtlas04", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "UITutorialEventCurrency"        { image = "UITutorialAtlas04", uv = { 1/3, 2/3, 2/3, 3/3 } }
--resource "ImageRegion" ""                             { image = "UITutorialAtlas04", uv = { 2/3, 2/3, 3/3, 3/3 } }

resourceref "Image" "UICollectible_Day01_"
resource "ImageRegion" "UICollectible_Day02"			{ image = "UICollectible_Day01_", uv = { 0, 0, 1, 1/2 } }
resource "ImageRegion" "UICollectibleLine"				{ image = "UICollectible_Day01_", uv = { 0, 1/2, 1, 5/8 } }
resource "ImageRegion" "UICollectibleStarFx"			{ image = "UICollectible_Day01_", uv = { 0, 5/8, 3/8, 1 } }
resource "ImageRegion" "UICollectibleStar"				{ image = "UICollectible_Day01_", uv = { 3/8, 5/8, 4/8, 6/8 } }
resource "ImageRegion" "UICollectibleStarGlow"			{ image = "UICollectible_Day01_", uv = { 3/8, 6/8, 5/8, 8/8 } }

-- UiMiscCircle being used here is temporary, we'll add an actual atlas soon!
resourceref "Image" "UiMiscCircle"
resource "ImageRegion" "TguiMaskWhite"					{ image = "UiMiscCircle", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "TguiMaskCircle"					{ image = "UiMiscCircle", uv = { 0, 0, 1, 1 } }

-- UiMiscCircle being used here is temporary, we'll add an actual atlas soon!
resourceref "Image" "UIPremulAtlas1"
resourceref "Image" "UIPremulAtlas2"
resourceref "Image" "UIPremulAtlas3"
resourceref "Image" "UIPremulAtlas4"
resource "ImageRegion" "UiMenuDialGradient" { image = "UIPremulAtlas4", uv = { 0/512, 78/512, (0+422)/512, (78+78)/512 } }
resource "ImageRegion" "UiMenuDialLine" { image = "UIPremulAtlas4", uv = { 0/512, 0/512, (0+422)/512, (0+78)/512 } }
resource "ImageRegion" "UiMenuSpeechBg" { image = "UIPremulAtlas1", uv = { 193/512, 303/512, (193+82)/512, (303+82)/512 } }
resource "ImageRegion" "UiMenuSpeechOutline" { image = "UIPremulAtlas1", uv = { 193/512, 221/512, (193+82)/512, (221+82)/512 } }
resource "ImageRegion" "UiMenuSpeechShadow" { image = "UIPremulAtlas1", uv = { 275/512, 221/512, (275+86)/512, (221+82)/512 } }
resource "ImageRegion" "UiMenuSpinner" { image = "UIPremulAtlas1", uv = { 254/512, 85/512, (254+64)/512, (85+64)/512 } }
resource "ImageRegion" "UiMenuSpinnerThin" { image = "UIPremulAtlas1", uv = { 190/512, 85/512, (190+64)/512, (85+64)/512 } }
resource "ImageRegion" "UiMenuSpinner_Small" { image = "UIPremulAtlas1", uv = { 0/512, 16/512, (0+32)/512, (16+32)/512 } }
resource "ImageRegion" "UiMenuStar" { image = "UIPremulAtlas1", uv = { 126/512, 149/512, (126+67)/512, (149+67)/512 } }
resource "ImageRegion" "UiMenuStarHeartBg" { image = "UIPremulAtlas1", uv = { 193/512, 149/512, (193+78)/512, (149+72)/512 } }
resource "ImageRegion" "UiMenuStarHeartFg" { image = "UIPremulAtlas1", uv = { 126/512, 85/512, (126+64)/512, (85+64)/512 } }
resource "ImageRegion" "UiMenuStarOutlineSmall" { image = "UIPremulAtlas1", uv = { 66/512, 85/512, (66+60)/512, (85+60)/512 } }
resource "ImageRegion" "UiMiscCircleShadow" { image = "UIPremulAtlas1", uv = { 66/512, 49/512, (66+36)/512, (49+36)/512 } }
resource "ImageRegion" "UiMiscCircleShadowSmall" { image = "UIPremulAtlas1", uv = { 32/512, 49/512, (32+34)/512, (49+34)/512 } }
resource "ImageRegion" "UiMiscCircleShadowSmallFaint" { image = "UIPremulAtlas1", uv = { 32/512, 16/512, (32+33)/512, (16+33)/512 } }
resource "ImageRegion" "UiMiscCircleShadowVerySmall" { image = "UIPremulAtlas1", uv = { 0/512, 0/512, (0+16)/512, (0+16)/512 } }
resource "ImageRegion" "UiMiscParticleFuzzy" { image = "UIPremulAtlas1", uv = { 16/512, 0/512, (16+17)/512, (0+16)/512 } }
resource "ImageRegion" "UiMiscR2Shadow" { image = "UIPremulAtlas1", uv = { 0/512, 48/512, (0+32)/512, (48+32)/512 } }
resource "ImageRegion" "UiMiscRTShadow" { image = "UIPremulAtlas1", uv = { 0/512, 80/512, (0+32)/512, (80+32)/512 } }
resource "ImageRegion" "UiStarBg" { image = "UIPremulAtlas1", uv = { 275/512, 303/512, (275+174)/512, (303+174)/512 } }
resource "ImageRegion" "UiStarBgLarge" { image = "UIPremulAtlas3", uv = { 256/512, 0/512, (256+256)/512, (0+256)/512 } }
resource "ImageRegion" "UiStarFg" { image = "UIPremulAtlas2", uv = { 0/512, 0/512, (0+174)/512, (0+174)/512 } }
resource "ImageRegion" "UiStarFgLarge" { image = "UIPremulAtlas2", uv = { 174/512, 174/512, (174+256)/512, (174+256)/512 } }
resource "ImageRegion" "UiStarLitBg" { image = "UIPremulAtlas2", uv = { 0/512, 174/512, (0+174)/512, (174+175)/512 } }
resource "ImageRegion" "UiStarLitBgLarge" { image = "UIPremulAtlas3", uv = { 0/512, 0/512, (0+256)/512, (0+256)/512 } }
resource "ImageRegion" "UiStarLitFg" { image = "UIPremulAtlas2", uv = { 174/512, 0/512, (174+174)/512, (0+174)/512 } }
resource "ImageRegion" "UiStarLitFgLarge" { image = "UIPremulAtlas3", uv = { 0/512, 256/512, (0+256)/512, (256+256)/512 } }

-- UIFullLumAtlas (doesn't stomp our luminance) ( coord order goes left, top, right, bottom )
resourceref "Image" "UIFullLumAtlas1"
resourceref "Image" "UIFullLumAtlas2"
resource "ImageRegion" "UIBorderFilledSmall" { image = "UIFullLumAtlas1", uv = { 0/1024, 0/1024, (0+10)/1024, (0+10)/1024 } }
resource "ImageRegion" "UIRingThick" { image = "UIFullLumAtlas2", uv = { 0/1024, 256/1024, (0+128)/1024, (256+128)/1024 } }
resource "ImageRegion" "UiAnalogLeftPushDownNx" { image = "UIFullLumAtlas1", uv = { 826/1024, 652/1024, (826+128)/1024, (652+128)/1024 } }
resource "ImageRegion" "UiAnalogLeftPushLeftNx" { image = "UIFullLumAtlas1", uv = { 570/1024, 652/1024, (570+128)/1024, (652+128)/1024 } }
resource "ImageRegion" "UiAnalogLeftPushRightNx" { image = "UIFullLumAtlas1", uv = { 570/1024, 268/1024, (570+128)/1024, (268+128)/1024 } }
resource "ImageRegion" "UiAnalogLeftPushUpNx" { image = "UIFullLumAtlas1", uv = { 698/1024, 268/1024, (698+128)/1024, (268+128)/1024 } }
resource "ImageRegion" "UiAnalogRightPushDownNx" { image = "UIFullLumAtlas1", uv = { 314/1024, 396/1024, (314+128)/1024, (396+128)/1024 } }
resource "ImageRegion" "UiAnalogRightPushLeftNx" { image = "UIFullLumAtlas1", uv = { 314/1024, 652/1024, (314+128)/1024, (652+128)/1024 } }
resource "ImageRegion" "UiAnalogRightPushRightNx" { image = "UIFullLumAtlas1", uv = { 442/1024, 396/1024, (442+128)/1024, (396+128)/1024 } }
resource "ImageRegion" "UiAnalogRightPushUpNx" { image = "UIFullLumAtlas1", uv = { 570/1024, 396/1024, (570+128)/1024, (396+128)/1024 } }
resource "ImageRegion" "UiBorderFlatBottom" { image = "UIFullLumAtlas2", uv = { 128/1024, 0/1024, (128+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiBorderThickSmall" { image = "UIFullLumAtlas1", uv = { 16/1024, 226/1024, (16+32)/1024, (226+32)/1024 } }
resource "ImageRegion" "UiBorderThinLarge" { image = "UIFullLumAtlas2", uv = { 256/1024, 0/1024, (256+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiBorderThinMedium" { image = "UIFullLumAtlas2", uv = { 512/1024, 0/1024, (512+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiBorderThinSmall" { image = "UIFullLumAtlas2", uv = { 640/1024, 0/1024, (640+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiButtonANx" { image = "UIFullLumAtlas1", uv = { 16/1024, 66/1024, (16+32)/1024, (66+32)/1024 } }
resource "ImageRegion" "UiButtonANxSmall" { image = "UIFullLumAtlas1", uv = { 0/1024, 10/1024, (0+16)/1024, (10+16)/1024 } }
resource "ImageRegion" "UiButtonBNx" { image = "UIFullLumAtlas1", uv = { 16/1024, 290/1024, (16+32)/1024, (290+32)/1024 } }
resource "ImageRegion" "UiButtonBNxSmall" { image = "UIFullLumAtlas1", uv = { 0/1024, 42/1024, (0+16)/1024, (42+16)/1024 } }
resource "ImageRegion" "UiButtonDownNx" { image = "UIFullLumAtlas1", uv = { 352/1024, 204/1024, (352+64)/1024, (204+64)/1024 } }
resource "ImageRegion" "UiButtonL3Nx" { image = "UIFullLumAtlas1", uv = { 96/1024, 140/1024, (96+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiButtonLeftNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 204/1024, (96+64)/1024, (204+64)/1024 } }
resource "ImageRegion" "UiButtonMinusNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 268/1024, (96+64)/1024, (268+64)/1024 } }
resource "ImageRegion" "UiButtonPlusNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 332/1024, (96+64)/1024, (332+64)/1024 } }
resource "ImageRegion" "UiButtonR3Nx" { image = "UIFullLumAtlas1", uv = { 96/1024, 396/1024, (96+64)/1024, (396+64)/1024 } }
resource "ImageRegion" "UiButtonRightNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 460/1024, (96+64)/1024, (460+64)/1024 } }
resource "ImageRegion" "UiButtonUpNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 524/1024, (96+64)/1024, (524+64)/1024 } }
resource "ImageRegion" "UiButtonXNx" { image = "UIFullLumAtlas1", uv = { 16/1024, 130/1024, (16+32)/1024, (130+32)/1024 } }
resource "ImageRegion" "UiButtonXNxSmall" { image = "UIFullLumAtlas1", uv = { 0/1024, 58/1024, (0+16)/1024, (58+16)/1024 } }
resource "ImageRegion" "UiButtonYNx" { image = "UIFullLumAtlas1", uv = { 16/1024, 194/1024, (16+32)/1024, (194+32)/1024 } }
resource "ImageRegion" "UiButtonYNxSmall" { image = "UIFullLumAtlas1", uv = { 16/1024, 162/1024, (16+32)/1024, (162+32)/1024 } }
resource "ImageRegion" "UiCandleGlow" { image = "UIFullLumAtlas1", uv = { 698/1024, 652/1024, (698+128)/1024, (652+128)/1024 } }
resource "ImageRegion" "UiCandleGlowMasked" { image = "UIFullLumAtlas1", uv = { 570/1024, 780/1024, (570+128)/1024, (780+128)/1024 } }
resource "ImageRegion" "UiCandleLensFlare" { image = "UIFullLumAtlas1", uv = { 442/1024, 652/1024, (442+128)/1024, (652+128)/1024 } }
resource "ImageRegion" "UiGradientShout" { image = "UIFullLumAtlas1", uv = { 224/1024, 268/1024, (224+90)/1024, (268+90)/1024 } }
resource "ImageRegion" "UiGradientShout_Large" { image = "UIFullLumAtlas2", uv = { 128/1024, 128/1024, (128+256)/1024, (128+256)/1024 } }
resource "ImageRegion" "UiHudChevronBroken" { image = "UIFullLumAtlas1", uv = { 288/1024, 140/1024, (288+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiHudChevronBrokenPartial" { image = "UIFullLumAtlas1", uv = { 352/1024, 140/1024, (352+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiHudChevronGlow" { image = "UIFullLumAtlas1", uv = { 698/1024, 396/1024, (698+128)/1024, (396+128)/1024 } }
resource "ImageRegion" "UiHudChevronGlowLvl1" { image = "UIFullLumAtlas1", uv = { 140/1024, 34/1024, (140+46)/1024, (34+46)/1024 } }
resource "ImageRegion" "UiHudChevronGlowLvl2" { image = "UIFullLumAtlas1", uv = { 48/1024, 34/1024, (48+46)/1024, (34+46)/1024 } }
resource "ImageRegion" "UiHudChevronGlowLvl3" { image = "UIFullLumAtlas1", uv = { 94/1024, 34/1024, (94+46)/1024, (34+46)/1024 } }
resource "ImageRegion" "UiHudChevronMed" { image = "UIFullLumAtlas1", uv = { 672/1024, 140/1024, (672+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiHudChevronPulse" { image = "UIFullLumAtlas1", uv = { 314/1024, 524/1024, (314+128)/1024, (524+128)/1024 } }
resource "ImageRegion" "UiHudChevronSmall" { image = "UIFullLumAtlas1", uv = { 16/1024, 10/1024, (16+24)/1024, (10+24)/1024 } }
resource "ImageRegion" "UiHudDiamondFill" { image = "UIFullLumAtlas1", uv = { 864/1024, 140/1024, (864+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiHudDiamondOutline" { image = "UIFullLumAtlas1", uv = { 928/1024, 140/1024, (928+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiHudShatterTri" { image = "UIFullLumAtlas1", uv = { 16/1024, 34/1024, (16+32)/1024, (34+32)/1024 } }
resource "ImageRegion" "UiLeftButtonNx" { image = "UIFullLumAtlas1", uv = { 160/1024, 268/1024, (160+64)/1024, (268+64)/1024 } }
resource "ImageRegion" "UiLeftTriggerNx" { image = "UIFullLumAtlas1", uv = { 160/1024, 332/1024, (160+64)/1024, (332+64)/1024 } }
resource "ImageRegion" "UiMenuAccountBadge" { image = "UIFullLumAtlas1", uv = { 160/1024, 396/1024, (160+64)/1024, (396+64)/1024 } }
resource "ImageRegion" "UiMenuBadgePen" { image = "UIFullLumAtlas1", uv = { 160/1024, 460/1024, (160+64)/1024, (460+64)/1024 } }
resource "ImageRegion" "UiMenuCandleInnerGlow1" { image = "UIFullLumAtlas1", uv = { 160/1024, 524/1024, (160+64)/1024, (524+64)/1024 } }
resource "ImageRegion" "UiMenuCandleInnerGlow2" { image = "UIFullLumAtlas1", uv = { 160/1024, 588/1024, (160+64)/1024, (588+64)/1024 } }
resource "ImageRegion" "UiMenuCandleInnerGlow3" { image = "UIFullLumAtlas1", uv = { 160/1024, 652/1024, (160+64)/1024, (652+64)/1024 } }
resource "ImageRegion" "UiMenuConstellationArrowRight" { image = "UIFullLumAtlas1", uv = { 48/1024, 80/1024, (48+48)/1024, (80+48)/1024 } }
resource "ImageRegion" "UiMenuDiamondSmall" { image = "UIFullLumAtlas1", uv = { 0/1024, 26/1024, (0+16)/1024, (26+16)/1024 } }
resource "ImageRegion" "UiMenuDivingShadow" { image = "UIFullLumAtlas1", uv = { 442/1024, 268/1024, (442+128)/1024, (268+128)/1024 } }
resource "ImageRegion" "UiMenuFly" { image = "UIFullLumAtlas1", uv = { 314/1024, 268/1024, (314+128)/1024, (268+128)/1024 } }
resource "ImageRegion" "UiMenuFlyShadow" { image = "UIFullLumAtlas2", uv = { 0/1024, 0/1024, (0+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiMenuFriendsTab" { image = "UIFullLumAtlas1", uv = { 224/1024, 204/1024, (224+64)/1024, (204+64)/1024 } }
resource "ImageRegion" "UiMenuHover" { image = "UIFullLumAtlas2", uv = { 896/1024, 0/1024, (896+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiMenuHoverShadow" { image = "UIFullLumAtlas1", uv = { 442/1024, 524/1024, (442+128)/1024, (524+128)/1024 } }
resource "ImageRegion" "UiMenuInfo" { image = "UIFullLumAtlas1", uv = { 160/1024, 908/1024, (160+64)/1024, (908+64)/1024 } }
resource "ImageRegion" "UiMenuLinkAccount" { image = "UIFullLumAtlas1", uv = { 160/1024, 844/1024, (160+64)/1024, (844+64)/1024 } }
resource "ImageRegion" "UiMenuNewWindow" { image = "UIFullLumAtlas1", uv = { 160/1024, 780/1024, (160+64)/1024, (780+64)/1024 } }
resource "ImageRegion" "UiMenuNextArrow" { image = "UIFullLumAtlas1", uv = { 160/1024, 716/1024, (160+64)/1024, (716+64)/1024 } }
resource "ImageRegion" "UiMenuNx" { image = "UIFullLumAtlas1", uv = { 160/1024, 204/1024, (160+64)/1024, (204+64)/1024 } }
resource "ImageRegion" "UiMenuPerson" { image = "UIFullLumAtlas1", uv = { 800/1024, 140/1024, (800+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuPlus" { image = "UIFullLumAtlas1", uv = { 736/1024, 140/1024, (736+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuQRWhite" { image = "UIFullLumAtlas1", uv = { 608/1024, 140/1024, (608+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuRandomize" { image = "UIFullLumAtlas1", uv = { 544/1024, 140/1024, (544+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuSwimmingShadow" { image = "UIFullLumAtlas1", uv = { 314/1024, 780/1024, (314+128)/1024, (780+128)/1024 } }
resource "ImageRegion" "UiMenuTabArrow" { image = "UIFullLumAtlas1", uv = { 480/1024, 140/1024, (480+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuTabCreateInvite" { image = "UIFullLumAtlas1", uv = { 416/1024, 140/1024, (416+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuTabOnlineFriends" { image = "UIFullLumAtlas1", uv = { 224/1024, 140/1024, (224+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuTabReceivedInvite" { image = "UIFullLumAtlas1", uv = { 160/1024, 140/1024, (160+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuTabSentInvite" { image = "UIFullLumAtlas1", uv = { 96/1024, 908/1024, (96+64)/1024, (908+64)/1024 } }
resource "ImageRegion" "UiMenuUnlinkAccount" { image = "UIFullLumAtlas1", uv = { 96/1024, 844/1024, (96+64)/1024, (844+64)/1024 } }
resource "ImageRegion" "UiMessageTypeContent" { image = "UIFullLumAtlas1", uv = { 442/1024, 780/1024, (442+128)/1024, (780+128)/1024 } }
resource "ImageRegion" "UiMessageTypeEvent" { image = "UIFullLumAtlas1", uv = { 570/1024, 524/1024, (570+128)/1024, (524+128)/1024 } }
resource "ImageRegion" "UiMessageTypeMisc" { image = "UIFullLumAtlas1", uv = { 698/1024, 524/1024, (698+128)/1024, (524+128)/1024 } }
resource "ImageRegion" "UiMessageTypeUrgent" { image = "UIFullLumAtlas1", uv = { 826/1024, 524/1024, (826+128)/1024, (524+128)/1024 } }
resource "ImageRegion" "UiMiscCheckSmall" { image = "UIFullLumAtlas1", uv = { 16/1024, 258/1024, (16+32)/1024, (258+32)/1024 } }
resource "ImageRegion" "UiMiscCheckWhite" { image = "UIFullLumAtlas1", uv = { 96/1024, 780/1024, (96+64)/1024, (780+64)/1024 } }
resource "ImageRegion" "UiMiscGradientSlice" { image = "UIFullLumAtlas1", uv = { 40/1024, 10/1024, (40+64)/1024, (10+16)/1024 } }
resource "ImageRegion" "UiMiscInteractOuter" { image = "UIFullLumAtlas1", uv = { 16/1024, 322/1024, (16+32)/1024, (322+32)/1024 } }
resource "ImageRegion" "UiMiscLensFlare" { image = "UIFullLumAtlas1", uv = { 826/1024, 780/1024, (826+128)/1024, (780+128)/1024 } }
resource "ImageRegion" "UiMiscParticle" { image = "UIFullLumAtlas1", uv = { 224/1024, 358/1024, (224+90)/1024, (358+90)/1024 } }
resource "ImageRegion" "UiMiscPhone" { image = "UIFullLumAtlas1", uv = { 96/1024, 716/1024, (96+64)/1024, (716+64)/1024 } }
resource "ImageRegion" "UiMiscXWhite" { image = "UIFullLumAtlas1", uv = { 96/1024, 652/1024, (96+64)/1024, (652+64)/1024 } }
resource "ImageRegion" "UiPulse" { image = "UIFullLumAtlas2", uv = { 384/1024, 0/1024, (384+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiRightButtonNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 588/1024, (96+64)/1024, (588+64)/1024 } }
resource "ImageRegion" "UiRightTriggerNx" { image = "UIFullLumAtlas1", uv = { 288/1024, 204/1024, (288+64)/1024, (204+64)/1024 } }
resource "ImageRegion" "UiRingGradientOuter" { image = "UIFullLumAtlas2", uv = { 768/1024, 0/1024, (768+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiTagBg" { image = "UIFullLumAtlas1", uv = { 96/1024, 80/1024, (96+60)/1024, (80+60)/1024 } }
resource "ImageRegion" "UiToggleBgShadow" { image = "UIFullLumAtlas1", uv = { 826/1024, 396/1024, (826+128)/1024, (396+128)/1024 } }
resource "ImageRegion" "UiToggleButtonShadow" { image = "UIFullLumAtlas2", uv = { 0/1024, 128/1024, (0+128)/1024, (128+128)/1024 } }

resourceref "Image" "UiMapBgAtlas"
resource "ImageRegion" "UiMap_Pattern_Hills04" { image = "UiMapBgAtlas", uv = {0, 0.749, 0.1787, 1} }
resource "ImageRegion" "UiMapOreo01" { image = "UiMapBgAtlas", uv = {0.7915, 0.8604, 0.9997, 0.9998} }
resource "ImageRegion" "UiMap_Pattern_Mountain03" { image = "UiMapBgAtlas", uv = {0.1914, 0.8765, 0.4424, 1} }
resource "ImageRegion" "UiMapBirdSingle4" { image = "UiMapBgAtlas", uv = {0.3887, 0.7603, 0.409, 0.7723} }
resource "ImageRegion" "UiMapWhale02" { image = "UiMapBgAtlas", uv = {0.8262, 0.6982, 0.9995, 0.8535} }
resource "ImageRegion" "UiMap_Pattern_Waves02" { image = "UiMapBgAtlas", uv = {0.709, 0.7021, 0.8193, 0.8413} }
resource "ImageRegion" "UiMap_Environment_Sunset_Town1" { image = "UiMapBgAtlas", uv = {0.6245, 0.6514, 0.7002, 0.7695} }
resource "ImageRegion" "UiMap_Pattern_PointyMountain05" { image = "UiMapBgAtlas", uv = {0.4502, 0.7827, 0.7012, 1} }
resource "ImageRegion" "UiMap_Pattern_Desert04" { image = "UiMapBgAtlas", uv = {0.1914, 0.7861, 0.4424, 0.8682} }
resource "ImageRegion" "UiMap_Environment_Sunset_FlyRace_City1" { image = "UiMapBgAtlas", uv = {0.1914, 0.749, 0.2144, 0.7778} }
resource "ImageRegion" "UiMap_Environment_Sunset_Town3" { image = "UiMapBgAtlas", uv = {0.3843, 0.7236, 0.4031, 0.75} }
resource "ImageRegion" "UiMapEnvironment_Sunset_Citadel" { image = "UiMapBgAtlas", uv = {0.5269, 0.6528, 0.6157, 0.769} }
resource "ImageRegion" "UiMap_Environment_Sunset_FlyRace_City2" { image = "UiMapBgAtlas", uv = {0.3379, 0.605, 0.4526, 0.687} }
resource "ImageRegion" "UiMap_Environment_Sunset_Race" { image = "UiMapBgAtlas", uv = {0.2271, 0.6992, 0.3748, 0.7712} }
resource "ImageRegion" "UiMapManta07" { image = "UiMapBgAtlas", uv = {0.8745, 0.5693, 0.9998, 0.6415} }
resource "ImageRegion" "UiMapBirdSingle2" { image = "UiMapBgAtlas", uv = {0.8428, 0.6025, 0.8612, 0.6248} }
resource "ImageRegion" "UiMapDuskTriangleCreature" { image = "UiMapBgAtlas", uv = {0.7139, 0.5718, 0.8359, 0.6938} }
resource "ImageRegion" "UiMap_Environment_Night_Desert" { image = "UiMapBgAtlas", uv = {0.5312, 0.5459, 0.6992, 0.6436} }
resource "ImageRegion" "UiMapKrill02" { image = "UiMapBgAtlas", uv = {0.1841, 0.5176, 0.5003, 0.5926} }
resource "ImageRegion" "UiMap_Pattern_Trees01" { image = "UiMapBgAtlas", uv = {0, 0.6006, 0.2134, 0.7373} }
resource "ImageRegion" "UiMapBirdSingle1" { image = "UiMapBgAtlas", uv = {0.8433, 0.5718, 0.8644, 0.5958} }
resource "ImageRegion" "UiMapRainCreature02" { image = "UiMapBgAtlas", uv = {0.186, 0.4507, 0.2671, 0.5112} }
resource "ImageRegion" "UiMapJellyfish05" { image = "UiMapBgAtlas", uv = {0.71, 0.4434, 0.7603, 0.4937} }
resource "ImageRegion" "UiMapManta01" { image = "UiMapBgAtlas", uv = {0.7192, 0.5103, 0.7998, 0.5624} }
resource "ImageRegion" "UiMap_Environment_Sunset_Town2" { image = "UiMapBgAtlas", uv = {0.7681, 0.4438, 0.7938, 0.4873} }
resource "ImageRegion" "UiMapRainCreature01" { image = "UiMapBgAtlas", uv = {0.8076, 0.4414, 0.9997, 0.5621} }
resource "ImageRegion" "UiMapCloud23" { image = "UiMapBgAtlas", uv = {0.4526, 0.1756, 0.6284, 0.4932} }
resource "ImageRegion" "UiMapCloud14" { image = "UiMapBgAtlas", uv = {0.3081, 0.1756, 0.4461, 0.4727} }
resource "ImageRegion" "UiMapKrill04" { image = "UiMapBgAtlas", uv = {0.248, 0.2255, 0.3021, 0.4326} }
resource "ImageRegion" "UiMapManta02" { image = "UiMapBgAtlas", uv = {0.2271, 0.6035, 0.3296, 0.687} }
resource "ImageRegion" "UiMapCloud05" { image = "UiMapBgAtlas", uv = {0, 0.2251, 0.2425, 0.4429} }
resource "ImageRegion" "UiMapCloud20" { image = "UiMapBgAtlas", uv = {0, 0.4507, 0.1752, 0.5878} }
resource "ImageRegion" "UiMapManta04" { image = "UiMapBgAtlas", uv = {0.9116, 0.3442, 0.9995, 0.4321} }
resource "ImageRegion" "UiMapBirdSingle3" { image = "UiMapBgAtlas", uv = {0.4868, 0.7598, 0.4994, 0.7709} }
resource "ImageRegion" "UiMapCrab03" { image = "UiMapBgAtlas", uv = {0.4282, 0.7373, 0.4682, 0.7711} }
resource "ImageRegion" "UiMapCrab02" { image = "UiMapBgAtlas", uv = {0.4238, 0.7021, 0.4735, 0.7289} }
resource "ImageRegion" "UiMap_Environment_Sunset_YetiPark" { image = "UiMapBgAtlas", uv = {0.481, 0.7017, 0.5063, 0.751} }
resource "ImageRegion" "UiMapCloud15" { image = "UiMapBgAtlas", uv = {0.9263, 0.0002, 0.9993, 0.2715} }
resource "ImageRegion" "UiMapManta06" { image = "UiMapBgAtlas", uv = {0.8638, 0.1676, 0.9221, 0.2598} }
resource "ImageRegion" "UiMapCloud17" { image = "UiMapBgAtlas", uv = {0.6367, 0.2637, 0.8999, 0.4375} }
resource "ImageRegion" "UiMapBirdSingle6" { image = "UiMapBgAtlas", uv = {0.6382, 0.1792, 0.6502, 0.209} }
resource "ImageRegion" "UiMapCloud_Small6_Trimmed" { image = "UiMapBgAtlas", uv = {0.8447, 0, 0.9214, 0.1631} }
resource "ImageRegion" "UiMapCloud_Tiny2" { image = "UiMapBgAtlas", uv = {0.8066, 0.0003, 0.8394, 0.126} }
resource "ImageRegion" "UiMapCloud_Tiny1" { image = "UiMapBgAtlas", uv = {0.7656, 0.0007, 0.8012, 0.1245} }
resource "ImageRegion" "UiMapCloud12" { image = "UiMapBgAtlas", uv = {0.686, 0.1318, 0.8407, 0.2406} }
resource "ImageRegion" "UiMapCloud_Tiny4" { image = "UiMapBgAtlas", uv = {0.5508, 0.1172, 0.6504, 0.163} }
resource "ImageRegion" "UiMap_Pattern_Star06" { image = "UiMapBgAtlas", uv = {0.6729, 0.0938, 0.7007, 0.1216} }
resource "ImageRegion" "UiMapJellyfish02" { image = "UiMapBgAtlas", uv = {0.7051, 0.0693, 0.7604, 0.1247} }
resource "ImageRegion" "UiMap_Pattern_Star04" { image = "UiMapBgAtlas", uv = {0.6782, 0.0698, 0.6963, 0.0879} }
resource "ImageRegion" "UiMapCloud_Tiny3" { image = "UiMapBgAtlas", uv = {0.5493, 0.0684, 0.6687, 0.1134} }
resource "ImageRegion" "UiMapCloud_Small5_Trimmed" { image = "UiMapBgAtlas", uv = {0.5498, 0, 0.761, 0.0635} }
resource "ImageRegion" "UiMapCloud09" { image = "UiMapBgAtlas", uv = {0.3062, 0, 0.5444, 0.1699} }
resource "ImageRegion" "UiMapCloud02" { image = "UiMapBgAtlas", uv = {0, 0, 0.3018, 0.2192} }

-- ICONS WITH NO GLOWING OUTLINE --

resourceref "Image" "UiTutorialFootprints"
resourceref "Image" "UiTutorialFogBackdrop"

resourceref "Image" "Icon_discord"
resourceref "Image" "Icon_facebook"
resourceref "Image" "Icon_instagram"
resourceref "Image" "Icon_tiktok"
resourceref "Image" "Icon_twitch"
resourceref "Image" "Icon_twitter"
resourceref "Image" "Icon_youtube"

resourceref "Image" "UiAccountLocal"
resourceref "Image" "UiAccountGameCenter"
resourceref "Image" "UiAccountGoogle"
resourceref "Image" "UiAccountApple"
resourceref "Image" "UiAccountNintendo"
resourceref "Image" "UiAccountHuawei"
resourceref "Image" "UiAccountSony"

resourceref "Image" "UiAccountGameCenterBadge"
resourceref "Image" "UiAccountLocalBadge"
resourceref "Image" "UiAccountGoogleBadge"
resourceref "Image" "UiAccountAppleBadge"
resourceref "Image" "UiAccountNintendoBadge"
resourceref "Image" "UiAccountFacebookBadge"
resourceref "Image" "UiAccountHuaweiBadge"
resourceref "Image" "UiAccountSonyBadge"
resourceref "Image" "UiAccountSteamBadge"

resourceref "Image" "UiBrandPlayStationBadge"
resourceref "Image" "UiBrandPlayStationBadge_Small"
resourceref "Image" "UiBrandPlayStationBadgeColor"
resourceref "Image" "UiBrandAppleColor"

resourceref "Image" "UiShopFog"
resourceref "Image" "UiMiscBubbleA"
resourceref "Image" "UiMiscBubbleB"
resourceref "Image" "UiMiscRoundBox"
resourceref "Image" "UiMiscBoxButton"
resourceref "Image" "UiMiscBoxButtonGlow"
resourceref "Image" "UiMiscStarCluster"
resourceref "Image" "UiMiscOneSixth"
--resourceref "Image" "UiMiscCircle"
resourceref "Image" "UiMiscCircleFade"
resourceref "Image" "UiMiscStarFull"
resourceref "Image" "UiMiscTempleDawn"
resourceref "Image" "UiMiscTempleDay"
resourceref "Image" "UiMiscTempleRain"
resourceref "Image" "UiMiscTempleSunset"
resourceref "Image" "UiMiscTempleDusk"
resourceref "Image" "UiMiscTempleNight"
resourceref "Image" "UiMiscTempleStorm"

resourceref "Image" "UiBuddyAsk"
resourceref "Image" "UiBuddyCancel"

resourceref "Image" "UiMaskEdit"

-- ICONS NOT RUN THROUGH UI ATLAS TOOL GOES HERE --

-- AP pendant icons
resourceref "Image" "UiOutfitPendant"
resourceref "Image" "UiOutfitPendantAP02"
resourceref "Image" "UiOutfitPendantAP03"
resourceref "Image" "UiOutfitPendantAP04"
resourceref "Image" "UiOutfitPendantAP05"
resourceref "Image" "UiOutfitPendantAP06"
resourceref "Image" "UiOutfitPendantAP07"
resourceref "Image" "UiOutfitPendantAP08"
resourceref "Image" "UiOutfitPendantAP09"
resourceref "Image" "UiOutfitPendantAP10"
resourceref "Image" "UiOutfitPendantAP11"
resourceref "Image" "UiOutfitPendantAP12"
resourceref "Image" "UiOutfitPendantAP13"
resourceref "Image" "UiOutfitPendantAP14"
resourceref "Image" "UiOutfitPendantAP15"
resourceref "Image" "UiOutfitPendantAP16"
resourceref "Image" "UiOutfitPendantAP17"
resourceref "Image" "UiOutfitPendantAP18"
resourceref "Image" "UiOutfitPendantAP19"
resourceref "Image" "UiOutfitPendantAP20"
-- AP mask icons
resourceref "Image" "UiSeasonMaskAP02"
resourceref "Image" "UiSeasonMaskAP03"
resourceref "Image" "UiSeasonMaskAP04"
resourceref "Image" "UiSeasonMaskAP05"
resourceref "Image" "UiSeasonMaskAP06"
resourceref "Image" "UiSeasonMaskAP07"
resourceref "Image" "UiSeasonMaskAP09"
resourceref "Image" "UiSeasonMaskAP10"
resourceref "Image" "UiSeasonMaskAP11"
resourceref "Image" "UiSeasonMaskAP12"
resourceref "Image" "UiSeasonMaskAP13"
resourceref "Image" "UiSeasonMaskAP14"
-- Snowball prop
resourceref "Image" "GlitterSh"

resourceref "Image" "UIConstellationButtonGlow"
resourceref "Image" "UIStarGlow"
resourceref "Image" "UIBGGalaxy"
resourceref "Image" "UICircleTrailGlow"

resourceref "Image" "UiMiscInteractOutline"
resourceref "Image" "UiMenuCircleShadowHeavy"

-- Markup images
resourceref "Image" "UiAnalogStickLit"
resourceref "Image" "UiButtonLeft"
resourceref "Image" "UiButtonTop"
resourceref "Image" "UiButtonBottom"
resourceref "Image" "UiButtonRight"
resourceref "Image" "UiLeftButton"
resourceref "Image" "UiLeftTrigger"
resourceref "Image" "UiRightButton"
resourceref "Image" "UiSeasonQuest"

-- STILL USED IN GAME/SERVR DATA, TO BE DELETED EVENTUALLY --

resourceref "Image" "UISit" -- to be deleted (UISit still used in levels)
resourceref "Image" "UIGift" -- to be deleted (UIGift in Server Data)
resourceref "Image" "UIHand" -- to be deleted (UIHand still used in levels)
resourceref "Image" "UIHint" -- to be deleted (UIHint in Server Data)
resourceref "Image" "UIChair" -- to be deleted (UIChair in Server Data)

-- ANIMATED ICONS - MUST COME AFTER ICONS --

resource "ImageAnim" "UiEmoteSitAnim"				{ prefix = "UiEmoteSit", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteFlameAnim"				{ prefix = "UiEmoteFlame", frames = "0, 1, 2, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5", frameTime = 0.13 }
resource "ImageAnim" "UiEmoteWaveAnim"				{ prefix = "UiEmoteWave", frames = "0, 1", frameTime = 0.35 }
resource "ImageAnim" "UiMenuPlaceCandleAnim"		{ prefix = "UiMenuPlaceCandle", frames = "2, 2, 2, 2, 0, 0, 1", frameTime = 0.16 }
resource "ImageAnim" "UiSocialReceiveHeartAnim"		{ prefix = "UiSocialReceiveHeart", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 }
resource "ImageAnim" "UiSocialOfferCandleAnim"		{ prefix = "UiSocialOfferCandle", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 }
resource "ImageAnim" "UIAcceptGiftAnim"				{ prefix = "UiSocialReceiveHeart", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 } -- in server data
resource "ImageAnim" "UIOfferGiftAnim"				{ prefix = "UiSocialOfferCandle", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 } -- in server data
resource "ImageAnim" "UiEmoteAP06NodAnim"			{ prefix = "UiEmoteAP06Nod", frames = "0, 2, 0, 1, 1", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAP09ShowDanceAnim"		{ prefix = "UiEmoteAP09ShowDance", frames = "0, 1, 2, 1", frameTime = 0.35 }
resource "ImageAnim" "UiEmoteAP11BeckonAnim"		{ prefix = "UiEmoteAP11Beckon", frames = "1, 0, 1, 0, 0", frameTime = 0.35 }
resource "ImageAnim" "UiEmoteAP13WaitAnim"			{ prefix = "UiEmoteAP13Wait", frames = "1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAP13EvilLaughAnim"		{ prefix = "UiEmoteAP13EvilLaugh", frames = "1, 0, 1, 0, 1, 0, 0, 0", frameTime = 0.25 }
resource "ImageAnim" "UiEmoteAP14HeadBobAnim"		{ prefix = "UiEmoteAP14HeadBob", frames = "0, 1, 1, 2, 3, 3, 2, 1, 1", frameTime = 0.16 }
resource "ImageAnim" "UiMenuStageCurtainOpenAnim"	{ prefix = "UiMenuStageCurtain", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 }
resource "ImageAnim" "UiMenuStageCurtainCloseAnim"	{ prefix = "UiMenuStageCurtain", frames = "2, 2, 1, 0, 0, 0, 0, 0, 0", frameTime = 0.16 }
resource "ImageAnim" "UiOfferHealAnim"				{ prefix = "UiSocialOfferHeal", frames = "0, 1, 2, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5", frameTime = 0.13 }
resource "ImageAnim" "UiHudStarSplitAnim"			{ prefix = "UiHudStarSplit", frames = "0, 1, 1, 2, 3, 4, 5, 6, 7", frameTime = 0.13 }
resource "ImageAnim" "UiHudShieldSplitAnim"			{ prefix = "UiHudShieldSplit", frames = "0, 1, 1, 2, 3, 4, 5, 6, 7", frameTime = 0.13 }
resource "ImageAnim" "UiEmoteAP16ArmWaveAnim"			{ prefix = "UiEmoteAP16ArmWave", frames = "0, 1, 2, 3, 4, 5", frameTime = 0.35 }
resource "ImageAnim" "UiEmoteAP16ConductAnim"			{ prefix = "UiEmoteAP16Conduct", frames = "0, 0, 0, 1, 2, 3, 3, 3, 2, 1", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAP16RhythmicClapAnim"			{ prefix = "UiEmoteAP16RhythmicClap", frames = "0, 1, 2, 2, 3, 4, 5, 5", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAP16RaiseTheRoofAnim"			{ prefix = "UiEmoteAP16RaiseTheRoof", frames = "0, 1", frameTime = 0.25 }
resource "ImageAnim" "UiEmoteAP16SilentClapAnim"			{ prefix = "UiEmoteAP16SilentClap", frames = "0, 1, 0, 1, 0, 2, 3, 4, 3, 4, 3, 5", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAuroraPenguinDanceAnim"			{ prefix = "UiEmoteAuroraPenguinDance", frames = "0, 1, 2, 3, 4, 5, 6, 7", frameTime = 0.25 }


if CONFIG ~= "Gold" then

resource "Shader" "Before_Foliage"			{ group = "OpaqueTwoFace", vs = "BeforeFoliage.vert", fs = "BeforeFoliage.frag", toolExport = true, defines="SELF_LIT LIT ALPHA_TEST WINDY_TREE" }

resource "Shader" "Before_Environment"			{ group = "Opaque", vs = "BeforeFoliage.vert", fs = "BeforeFoliage.frag", toolExport = true, defines="SELF_LIT LIT" }

end

if os.getenv("TGC_FEATURE_BEFORE") then

resourceref "Image" "Before_Boar_Masks"
resourceref "Image" "BeforeBullMasks"
resourceref "Image" "Before_Bull_Large_Masks"
resourceref "Image" "Before_Deer_Masks"
resourceref "Image" "Before_Horse_Masks"
resourceref "Image" "Before_Moa_Masks"
resourceref "Image" "Before_Mammoth_Masks"
resourceref "Image" "Before_Boar_Normal"
resourceref "Image" "Before_Boar_Tusk_Normal"
resourceref "Image" "Before_Bull_Large_Normal"
resourceref "Image" "Before_Deer_Normal"
resourceref "Image" "Before_Deer_Antlers_Normal"
resourceref "Image" "Before_Mammoth_Tusk_Normal"
resourceref "Image" "Before_Moa_Normal"
resourceref "Image" "Before_Horse_Normal"
resourceref "Image" "Before_Boar_Diffuse"
resourceref "Image" "Before_Boar_Tusk_Diffuse"
resourceref "Image" "Before_Deer_Large_Diffuse"
resourceref "Image" "Before_Deer_Lighting"
resourceref "Image" "Before_Deer_Antlers_Lighting"
resourceref "Image" "Before_Torn_Pants_Normal"
resourceref "Image" "Before_Torn_Pants_Diffuse"
resourceref "Image" "Before_Torn_Pants_Opacity"
resourceref "Image" "Before_Torn_Shirt_Diffuse"
resourceref "Image" "Before_Torn_Shirt_Normal"
resourceref "Image" "Before_Headband_Diffuse"
resourceref "Image" "Before_Headband_Normal"
resourceref "Image" "Before_Fur_Cloak_Normal"
resourceref "Image" "Before_Fur_Cloak_Diffuse"
resourceref "Image" "Before_Fur_Cloak_Masks"
resourceref "Image" "Before_Shoes_Diffuse"
resourceref "Image" "Before_Shoes_Normal"
resourceref "Image" "Before_Shoes_Opacity"
resourceref "Image" "Before_Kid_Body_Diffuse"
resourceref "Image" "Before_Kid_Body_Normal"
resourceref "Image" "Before_Bull_Saddle_Normal"
resourceref "Image" "Before_Bull_Saddle_Diffuse"
resourceref "Image" "Before_Whale_Skeleton_Diffuse"
resourceref "Image" "Before_Whale_Skeleton_Normal"
resourceref "Image" "Before_MrBigglesWorth_NM"
resourceref "Image" "Before_MrBigglesWorth_DM"

resource "Mesh" "Before_BullIdle_01"				{ source = "Before_BullIdle_01.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_CamelWalkAnim"				{ source = "Before_CamelWalkAnim.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Horse"						{ source = "Before_Horse.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Boar_Body"					{ source = "Before_Boar_Body.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Boar_Tusk"					{ source = "Before_Boar_Tusk.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Moa"						{ source = "Before_Moa.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Mammoth"					{ source = "Before_Mammoth.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Mammoth_Tusk"				{ source = "Before_Mammoth_Tusk.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Deer_Large_Body"			{ source = "Before_Deer_Large_Body.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Deer_Large_Antlers"			{ source = "Before_Deer_Large_Antlers.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Bull_Large"					{ source = "Before_Bull_Large.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Bull_Large_HappyAnim"		{ source = "Before_Bull_Large_HappyAnim.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Bull_Large_Horn"			{ source = "Before_Bull_Large_Horn.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Bull_Saddle"				{ source = "Before_Bull_Saddle.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Before_Fur_Cloak"					{ source = "Before_Fur_Cloak.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Before_Torn_Pants"					{ source = "Before_Torn_Pants.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Before_Torn_Shirt"					{ source = "Before_Torn_Shirt.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Before_Headband"					{ source = "Before_Headband.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Before_Shoes"						{ source = "Before_Shoes.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Before_Kid_Body"					{ source = "Before_Kid_Body.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Before_Kid_PettingAnim"			{ source = "Before_Kid_PettingAnim.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Before_Whale_Skeleton"				{ source = "Before_Whale_Skeleton.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_MrBigglesWorth"				{ source = "Before_MrBigglesWorth_Low.fbx", registerCollision = true, loadLazy = true }
--resource "Mesh" "Before_Bull_Large_WalkAnim"		{ source = "Before_Bull_Large_WalkAnim.fbx", registerCollision = true, loadLazy = true }
--resource "Mesh" "Before_Bull_Large_DownedAnim"		{ source = "Before_Bull_Large_DownedAnim.fbx", registerCollision = true, loadLazy = true }
--resource "Mesh" "Before_Bull_Large_WalkLaboredAnim"		{ source = "Before_Bull_Large_WalkLaboredAnim.fbx", registerCollision = true, loadLazy = true }
--resource "Mesh" "Before_Bull_Large_WalkHappyTrotAnim"		{ source = "Before_Bull_Large_WalkHappyTrotAnim.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Bull_Large_PettingFlankAnim"		{ source = "Before_Bull_Large_PettingFlankAnim_02.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Bull_Large_PettingHeadAnim"		{ source = "Before_Bull_Large_PettingHeadAnim.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Kid_PettingFlankAnim"		{ source = "Before_Kid_PettingFlankAnim_02.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_Kid_PettingHeadAnim"		{ source = "Before_Kid_PettingHeadAnim.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "Before_HaastEagle_Body"				{ source = "Before_HaastEagle_Body.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Before_HaastEagle_Feathers"				{ source = "Before_HaastEagle_Feathers.fbx", registerCollision = false, loadLazy = true }

resource "Shader" "InstancedFur" 					{ group = "OpaqueTwoFace", vs = "InstancedFur.vert", fs = "InstancedFur.frag", toolExport = false, defines="MASKS FUR_TOUCH MODEL_MATRIX FRAGMENT_LIGHTING" }
--resource "Shader" "InstancedFurMotion" 			{ group = "Motion", vs = "InstancedFur.vert", fs = "InstancedFur.frag", toolExport = false, defines="FUR_TOUCH MODEL_MATRIX MESH MOTION_VEC" }
resource "Shader" "InstancedFurNoMasks"				{ group = "OpaqueTwoFace", vs = "InstancedFur.vert", fs = "InstancedFur.frag", toolExport = false, defines="FUR_TOUCH MODEL_MATRIX FRAGMENT_LIGHTING" }
resource "Shader" "FurBase" 						{ group = "Opaque", vs = "Mesh.vert", fs = "MeshToon.frag", toolExport = false, defines="MASKS" }
resource "Shader" "MeshToon" 						{ group = "Opaque", vs = "Mesh.vert", fs = "MeshToon.frag", toolExport = false, defines="" }	
resource "Shader" "MeshToonAlphaTest" 				{ group = "Opaque", vs = "Mesh.vert", fs = "MeshToon.frag", toolExport = false, defines="ALPHA_TEST" }	
resource "Shader" "MeshWindyTree"					{ group = "Opaque", vs = "MeshToon.vert", fs = "Mesh.frag", toolExport = true, defines="WINDY_TREE" }
resource "Shader" "MeshWindyTreeSl"					{ group = "Opaque", vs = "MeshToon.vert", fs = "Mesh.frag", toolExport = true, defines="SELF_LIT COLOR_UNIFORM WINDY_TREE" }
resource "Shader" "LitAlphaTestWindyTree"			{ group = "OpaqueTwoFace", vs = "CardToon.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="SELF_LIT LIT ALPHA_TEST COLOR_UNIFORM WINDY_TREE" }
resource "Shader" "ShadowMap"						{ group = "ShadowMap", vs = "MeshToon.vert", fs = "ShadowMap.frag", defines="SHADOW_MAP" }
resource "Shader" "ShadowMapWindyTree"				{ group = "ShadowMap", vs = "MeshToon.vert", fs = "ShadowMap.frag", defines="SHADOW_MAP WINDY_TREE" }
resource "Shader" "AlphaTestWindyTreeShadowMap"		{ group = "ShadowMap", vs = "CardToon.vert", fs = "ShadowMap.frag", defines="SHADOW_MAP ALPHA_TEST WINDY_TREE" }

end
---Days of Fortune Ne start
resource "Mesh" "CharSkyKid_Horn_FortuneDragon"        { source = "CharSkyKid_Horn_FortuneDragon.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Body_FortuneDragonRobe"            { source = "CharSkyKid_Body_FortuneDragonRobe.fbx",         sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_DrumtStick"         { source = "CharSkyKid_Prop_DrumStick.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_FortuneDrum"         { source = "CharSkyKid_Prop_FortuneDrum.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Wing_FortuneDragon"                { source = "CharSkyKid_Wing_FortuneDragon.fbx",             sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- LineUpOutfit
resource "Mesh" "CharSkyKid_Neck_DragonDanceBodyBlack"					{ source = "CharSkyKid_Neck_DragonDanceBodyBlack.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Neck_DragonDanceHeadBlack"					{ source = "CharSkyKid_Neck_DragonDanceHeadBlack.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Neck_DragonDanceTailBlack"					{ source = "CharSkyKid_Neck_DragonDanceTailBlack.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Neck_DragonDanceBodyWhite"					{ source = "CharSkyKid_Neck_DragonDanceBodyWhite.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Neck_DragonDanceHeadWhite"					{ source = "CharSkyKid_Neck_DragonDanceHeadWhite.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Neck_DragonDanceTailWhite"					{ source = "CharSkyKid_Neck_DragonDanceTailWhite.fbx", sharedSkeleton = "CharKidAnimFlyState.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "AvatarFortuneDragonDiamondInner"            { source = "CapeFortuneDragon.fbx" }
resource "Mesh" "AvatarFortuneDragonDiamondOuter"            { source = "CapeFortuneDragonFrame.fbx" }
resource "Mesh" "AvatarFortuneDragonDiamondExtra"            { source = "CapeFortuneDragonExtra.fbx" }
---Days of Fortune Ne end
-- resourceref "Image" "StoryGeneral"
-- resource "ImageRegion" "CresentR"        { image = "StoryGeneral", uv = { 592/1024, 528/1024, 656/1024, 592/1024 } }
resource "ImageRegion" "CresentR"        { image = "ParticleAtlas", uv = { 2/16, 15/16, 3/16, 1 } }
resourceref "Image" "CharRampS21"
resourceref "Image" "AP21_Deer_Diffuse"
resource "Shader" "AP21NineColor"                 { group = "Opaque", vs = "AP21NineColor.vert", fs = "AP21NineColor.frag", toolExport = true, defines="" }
resource "Shader" "AP21DeerShout"                 { group = "BlendedWithBackfaces", vs = "AP21DeerShout.vert", fs = "AP21DeerShout.frag", toolExport = true, defines="" }  -- TARGET_FRAMEWORK_NAME edit by lishimin #32745  AP21 addShader for Deer special shout


