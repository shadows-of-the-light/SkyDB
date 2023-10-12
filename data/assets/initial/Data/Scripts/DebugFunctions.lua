-------------------------------------------------------------------------------
-- Notes:  Debug Functions for SkyNet
--
-- Author: Asher Vollmer
-- Date C: 02-07-2013
-------------------------------------------------------------------------------

function SetController( controllerName )
	game:controller():SetController( controllerName, game:soundManager() )
end

function LoadLevelTest( levelName )
	local e = game:eventBarn():AddEventByMetaName( "TestLevel" )
	e:levelName( levelName )
	e:Start()
end

function LoadLevel( levelName )
	local e = game:eventBarn():AddEventByMetaName( "ChangeLevel" )
	e:levelName( levelName )
	e:Start()
end

function ReloadLevel()
	local e = game:eventBarn():AddEventByMetaName( "ChangeLevel" )
	e:levelName( game:levelName() )
	e:Start()
end

function TweakActivate( tweakName )
	game:debugHud():TweakSetToggle( tweakName, true )
end

function TweakToggle( tweakName )
	game:debugHud():TweakToggle( tweakName, true )
end

function TweakSetToggle( tweakName, value )
	game:debugHud():TweakSetToggle( tweakName, value )
end

function TweakSetValue( tweakName, value )
	game:debugHud():TweakSetValue( tweakName, value )
end

function TweakSetIntValue( tweakName, value )
	game:debugHud():TweakSetIntValue( tweakName, value )
end

function ShowText( text, scale, duration )
	print( "'" .. text .. "'" )

	if ( scale == nil ) then scale = 24 end
	if ( duration == nil ) then duration = 10 end

	local e = game:eventBarn():AddEventByMetaName( "DisplayText" )
	e:duration( duration )
	e:text( text )
	e:scale( scale )
	e:color( { 1.0, 0.7, 1.0 } )
	e:alpha( 0.5 )
	e:usePixelSizeFont( true )
	e:Start()
end

function ViewMemReport()
	ViewMemoryReport( game )
end

function Kill( msg )
	if ( msg == nil ) then msg = "NOPE" end

	ShowText( msg, 24 )
	local e = game:eventBarn():AddEventByMetaName( "Delay" )
	e:delay( 0.5 )
	e:events( nil )
	e:Start()
end

function SkyRespond( msg )
	if type( msg ) ~= "string" then
		msg = tostring( msg )
	end

	game:skyNetClient():SendCommandResponse( msg )
end

function SkyRespondJson( json )
	game:skyNetClient():SendCommandResponseJson( json )
end

function InitiateRuneDuel( ipAddress )
	local e = game:eventBarn():AddEventByMetaName( "RuneDuel" )
	e:Start()
end
