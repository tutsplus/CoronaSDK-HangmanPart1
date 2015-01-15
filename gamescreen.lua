local composer = require( "composer" )
local scene = composer.newScene()
local widget = require ("widget")
local growText = require("growtext") -- A module providing a pulsating text effect
local words5 = {} -- Holds words 5 characters or less in length
local words9 = {} -- Holds words 9 characters or less in length
local words13 = {} -- Holds words 13 characters or less in length
local hangmanGroup 
local alphabetArray = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
local guessWordText
local theWord
local guessWord
local numWrong = 0
local gameButtons = {}
local winLoseText
local wonGame = false
function scene:create( event )
	local group = self.view	drawChalkBoard(1,1,1)
	hangmanGroup = display.newGroup()
	group:insert(hangmanGroup)
	hangmanGroup.x = 180
	hangmanGroup.y = 180
	drawGallows()

end


function scene:show( event )
	local phase = event.phase
    local previousScene = composer.getSceneName( "previous" )
	if(previousScene~=nil) then

		composer.removeScene(previousScene)
	end
   if ( phase == "did" ) then
		print("Working")
   end
end

function scene:hide( event )
		local phase = event.phase
		if ( phase == "will" ) then
    		
		end
end

function drawChalkBoard(r,g,b)
local chalkBoard = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
		 chalkBoard:setFillColor(r,g,b)
		 chalkBoard.anchorX = 0
		chalkBoard.anchorY = 0
		scene.view:insert(chalkBoard)
end

function drawGallows()
	local gallows = display.newLine( hangmanGroup,20,380,360, 380)
	gallows:append(290,380,290,50,180,50,180,90)

    gallows:setStrokeColor(0, 0, 0)
     gallows.strokeWidth = 3
end

function drawHead()
 		local head = display.newCircle(hangmanGroup,150,90,30)
 		head:setStrokeColor(0,0,0)
 		head:setFillColor(0,0,0,0)
 		head.strokeWidth = 3
         head.anchorX = 0
 		head.anchorY = 0
 end
 
function drawBody()
	local body = display.newLine(hangmanGroup,180,150,180,300) 
	body:setStrokeColor(0, 0, 0)
    body.strokeWidth = 3
end

function drawArm1()
	local arm = display.newLine(hangmanGroup,180,200,130,190)
	arm:setStrokeColor(0, 0, 0)
    arm.strokeWidth = 3

end

function drawArm2()
	local arm= display.newLine(hangmanGroup,180,200,230,190)
	arm:setStrokeColor(0, 0, 0)
    arm.strokeWidth = 3

end

function drawLeg1()
	local leg = display.newLine(hangmanGroup,180,300,130,330)

	leg:setStrokeColor(0, 0, 0)
    leg.strokeWidth = 3
end

function drawLeg2()
	local leg = display.newLine(hangmanGroup,180,300,230,330)

	leg:setStrokeColor(0, 0, 0)
    leg.strokeWidth = 3
end



scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )




return scene
