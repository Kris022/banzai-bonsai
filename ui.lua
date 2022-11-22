local widget = require( "widget" )

-- Function to handle button events
local function handleButtonEvent( event )
 
    if ( "ended" == event.phase ) then
        generate()
        turtle()
    end
end
 
-- Create the widget
local button1 = widget.newButton(
    {
        width = 100,
        height = 25,
        left = 0,
        top = 225,
        id = "button1",
        label = "Default",
        onEvent = handleButtonEvent,
        shape = "roundedRect",
        fillColor = { default={ 1, 0.2, 0.5, 0.7 }, over={ 1, 0.2, 0.5, 1 } },
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)