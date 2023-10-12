-------------------------------------------------------------------------------
-- Notes:  Routines to support live attribute update from Blue Sky Thinking to
--         the game.
--
--         Important note: BST's CreateGameObject.lua requires the LoadObject
--         function defined in this file, so you need to keep that in mind when
--         updating the interface or functionality.
--
-- Author: John Edwards (was Nick Clark)
-- Date C: 06-23-2014
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- LevelObjects registration functions
-------------------------------------------------------------------------------
__LevelObjects = __LevelObjects or {} -- Written this way to allow this file to be hot loaded without clearing __LevelObjects

function RegisterLevelObjectsForHotDate( name, objects )
	__LevelObjects[ name ] = objects
end

function UnregisterLevelObjectsForHotDate( name )
	__LevelObjects[ name ] = nil
end

-------------------------------------------------------------------------------
-- HotDate function for a single level object
-------------------------------------------------------------------------------
function HotDateLevelObject( hotDateType, levelName, objectName, objectData )
	assert( __LevelObjects[ levelName ], "Failed hot-dating "..objectName.." in "..levelName..". Couldn't find level." )
	local function LookUpObject( name )
		return __LevelObjects[ levelName ]:GetObjectByName( name )
	end
	local object = LookUpObject( objectName )
	if not object then
		return
	end

	if hotDateType == "full" then
		LoadObject( levelName.."."..objectName, object, objectData.Vars, LookUpObject )
	elseif hotDateType == "transform" then
		SetObjectTransform( object, objectData )
	elseif hotDateType == "enable" then
		SetObjectEnabled( object, true )
	end

	-- If the object wants to be told when it's been hot-dated, tell it
	if object.HotDate then object:HotDate() end
end

-------------------------------------------------------------------------------
-- Helpers
-------------------------------------------------------------------------------
function LoadObject( fullObjectName, object, luaData, LookUpObject )
	for varName, var in pairs( object.__vars ) do
		local luaValue = luaData[ varName ]
		if luaValue ~= nil then
			local success, msg = pcall( LoadValue, fullObjectName, object, varName, luaValue, LookUpObject )
			if not success then
				print( "*** WARNING: Failed hot dating "..fullObjectName.."."..varName.." with value: "..tostring( luaValue ).."." )
				print( "             Error: "..msg )
			end
		end
	end
end

function LoadValue( fullObjectName, object, varName, luaValue, LookUpObject )
	local var = object[ varName ]

	if not var.__isclass then
		var( object, luaValue )
	else
		if not var.__len then
			local ptrValue = LoadObjectPtr( var, luaValue, LookUpObject )
			if ptrValue ~= nil or var.__metadata.Tool_Nullable then
				var( object, ptrValue )
			end
		else
			-- Make sure the array is properly allocated
			local allocator = var.__metadata.ArrayAllocator
			local count = #luaValue
			object[ allocator ]( object, count )
			assert( var.__len( object ) == count )

			-- Load the elements
			for i = 1, count do
				if type( luaValue[ i ] ) == "table" then
					local elem = var[ i - 1 ]( object )
					local elemName = fullObjectName.."."..varName.."[ "..i.." ]"
					LoadObject( elemName, elem, luaValue[ i ], LookUpObject )
				else
					local ptrValue = LoadObjectPtr( var, luaValue[ i ], LookUpObject )
					if ptrValue ~= nil or var.__metadata.Tool_Nullable then
						var[ i - 1 ]( object, ptrValue )
					end
				end
			end
		end
	end
end

function LoadObjectPtr( var, luaValue, LookUpObject )
	local ptrValue = nil
	if type( luaValue ) == "string" then
		ptrValue = LookUpObject( luaValue )
	end
	if ptrValue and ptrValue ~= nil and not _G[ var.__ctype ].cast( ptrValue ) then
		if var.__ctype == "Clump" then
			local clumpType = var.__metadata.Tool_ClumpType
			assert( clumpType )
			if _G[ clumpType ] and _G[ clumpType ].cast( ptrValue ) then
				-- Wrap this pointer in a new single-item clump.
				-- This will exhaust the clumpBarn with enough pointer hotdating.
				local newClump = _G.game:clumpBarn():CreateClumpWithSize( 1 )
				newClump:SetAt( 0, ptrValue )
				ptrValue = newClump
			end
		else
			assert( false, "*** ERROR: pointer type mismatch. Expected "..var.__ctype..", got "..tostring( ptrValue ) )
		end
	end
	return ptrValue
end
