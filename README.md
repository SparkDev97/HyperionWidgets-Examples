# HyperionWidgets
HyperionWidgets is new in Hyperion version 0.2 and onwards.

Hyperion supports two types of widgets:
1. Full Widgets - Written in Objective-C, giving the power of a full tweak. It is recommended to create tweaks like this to have full functionality including access to music, weather, and more.
2. HTML Widgets - These are simple HTML pages. These can make use of HTML, CSS, and JavaScript. These widgets could potentially fetch data and be more complex, but are intended mainly as cosmetic widgets (e.g. an image).

I've tried to make creating your own HyperionWidgets as simple as possible, and to have Hyperion provide relevant data to widgets to improve efficiency with multiple widgets running. (Having multiple widgets polling for the same data could become very inefficient and battery consuming).

## Get Started with Full Widgets
If you have any experience with objective-c/tweak development, it's super easy to get started with Full HyperionWidgets. Let's get going!

#### Pre-Requirements
```
Hyperion >= 0.2 (Available from: http://beta.sparkservers.co.uk)
```

### Simple Implementation

Included in this git is a 'HyperionWidgetsTemplate' which contains a fully compilable template of a simple HyperionWidget.

The template simply displays a red box on the screen, so take a look at this.

HyperionWidgets must conform to the 'HyperionWidget' protocol. This is included in the 'HyperionWidgets.h' API header file.

```
// This is the protocol that your HyperionWidget class must conform to
@protocol HyperionWidget <NSObject>

// These are the required methods
@required
-(void)setup; // The setup method is used to initially layout your contentView
-(UIView*)contentView; // Your contentView must be returned using this method
-(void)layoutForPreview; // This is called when a user accesses the 'HyperionWidget Manager', so make your widget look nice in the manager here.

// Optional methods
@optional
-(void)updateTime:(NSDate*)time; // This provides the current date as an NSDate when Hyperion updates it
-(void)updateWeather:(NSDictionary*)info; // This provides current weather information when Hyperion updates it
-(void)updateMusic:(NSDictionary*)info; // This provides music information when Hyperion updates it
-(void)updateBattery:(NSDictionary*)info; // This provides battery information when Hyperion updates it
-(void)didAppear; // This method is called when Hyperion will become visible
-(void)didHide; // This method is called when Hyperion is dismissed

@end
```

A quick example of a class that would conform to this protocol would be as follows:
```
@interface ExampleHyperionWidget : NSObject <HyperionWidget>

@property (nonatomic, retain) UIView* contentView; // This is required and where your widgets view/subviews must be.

@end

@implementation ExampleHyperionWidget
    -(void)setup
    {
        self.contentView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 100, 100)];
    }

    -(void)layoutForPreview
    {

    }
    
@end
```

Once you have a class that conforms to the HyperionWidgets protocol, you need an Info.plist file to tell Hyperion about your widget.
This is formatted like so:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <!-- This is the bundle identifier for your widget. It must be unique, else it will collide with other widgets. -->
        <key>CFBundleIdentifier</key>
        <string>com.spark.hyperionwidgets.example</string>

        <!-- This is the name that is displayed in the widget manager -->
        <key>CFBundleDisplayName</key>
        <string>ExampleHyperionWidget</string>
       
       <!-- This must be identical to the name of the class conforming to the HyperionWidgets protocol -->
        <key>HyperionWidgetClass</key>
        <string>ExampleHyperionWidget</string>
        
        <!-- Version number of the current HyperionWidgets. Unlikely to change, so leave as 1 for now. -->
        <key>HyperionWidgetsVersion</key>
        <integer>1</integer>
    </dict>
</plist>
```

This Info.plist file but be in your bundle alongside the binary, so see the 'Makefile' in the template if you do not know how to copy this over.

## Getting Started with HTML Widgets

## Authors
SparkDev 2018

## License
All example code is under the MIT License
