#FWTClock

![FWTClock screenshot](http://grab.by/h3N4)


FWTClock is a flexible and easy to customize analog clock. You can use FWTClock as a real clock or, for instance, you can use as a stamp to create dynamic images at runtime. 

##Requirements
* XCode 4.4.1 or higher
* iOS 5.0

##Features

FWTClock ticks on its own queue and will not lock the main loop. You can choose between different oscillator mode (animations): *mechanical, quartz and quartz with a small backward jump*.
FWTClock is the controller object and it contains the FWTClockView view. The controller is responsible for calculating the right rotation transformations for each of the clock’s hands and applying them with or without animation.
FWTClockView can be configured by accessing its public properties or by implementing the protocol.

This project is not yet ARC-ready.

##Initializing
You don't have to do much tinkering if you're happy with the default clock style:

	self.clock = [[FWTClock alloc] init];
    self.clock.oscillatorType = FWTClockOscillatorTypeMechanical; 
	self.clock.clockView.frame = CGRectMake(.0f, .0f, 300.0f, 300.0f);
	[self.view addSubview:self.clock.clockView];


##How to use FWTClock: configuration

* **clockView** the *readonly* clock view 
* **date** the date displayed by the clock
* **calendar** the calendar used by the clock
* **isTicking** returns a Boolean value indicating whether the tick animation is running
* **oscillatorType** the style of the animation for the second hand

##How to use FWTClockView: configuration

The FWTClockView is a basic container for all the views needed for the UI: the background, the clock's hands, the ring. The clock view, in the initial layout, reads the *subviewsMask* and, if needed, creates the default subviews; otherwise it simply sets the bounds and the center point to the subviews. You can access each of the default subviews and adjust their appearance (see below for further details) or you can easily replace them with your own custom UIView subclass. It's not mandatory but you can also specify the frame for each subview using a rectangle in the unit coordinate space.

* **backgroundView** the background of the clock
* **handHourView** the hour hand of the clock
* **handMinuteView** the minute hand of the clock
* **handSecondView** the second hand of the clock
* **ringView** the frontmost ring of the clock  
    
The view has few more properties to help you configure the clock appearance:

* **edgeInsets** use this property to resize and reposition the effective rectangle 
* **subviewsMask** an integer bit mask that determines which of the clock subviews should be enabled 
* **clockSubviewBlock** a block object that returns the subview for the given clockSubview


##FWTClockViewDefault

**FWTClockShapeView** the backing layer of this superclass is a *CAShapeLayer*. The view call the *updateShapePath* only when it's needed and relies on the *pathBlock* property to set the path property of the layer. Use the *edgeInsets* property to resize and reposition the effective rectangle.

**FWTClockBackgroundView** this class shows a possible background sample

**FWTClockHandView** the height of each hand matches the clockView height (the anchorPoint is the default one). There are two additional properties: *start* and *end*, the start and the end of the path when drawn in the layer’s coordinate space.

##Demo
See the sample project.


##Licensing
Apache License Version 2.0

##Support, bugs and feature requests
If you want to submit a feature request, please do so via the issue tracker on github.
If you want to submit a bug report, please also do so via the issue tracker, including a diagnosis of the problem and a suggested fix (in code).
