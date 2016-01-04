# CarbonBadgeLabel
#####CarbonBadgeLabel v0.1

![alt tag](https://github.com/ermalkaleci/CarbonBadgeLabel/blob/master/Screenshots/screenshot_2.png)

## Installation

CarbonBadgeLabel is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CarbonBadgeLabel", "~>0.1"
```

## SAMPLE CODE
```objective-c
#import "UIView+CarbonBadgeLabel.h"
```
```objective-c
[yourView createCarbonBadgeWithText:@"2"];
```

```objective-c
CarbonBadgeOptions options = {
	CarbonBadgeHorizontalPositionCenter,
	CarbonBadgeVerticalPositionTop
};
[yourView createCarbonBadgeWithText:@"3" options:options];
```

## Xcode Interface builder
![alt tag](https://github.com/ermalkaleci/CarbonBadgeLabel/blob/master/Screenshots/screenshot_1.png)

## LICENSE
[The MIT License (MIT)](https://github.com/ermalkaleci/CarbonBadgeLabel/blob/master/LICENSE)
