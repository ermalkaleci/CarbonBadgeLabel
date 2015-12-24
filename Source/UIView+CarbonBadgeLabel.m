//  The MIT License (MIT)
//
//  Copyright (c) 2015 - present Ermal Kaleci
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "UIView+CarbonBadgeLabel.h"

#import <objc/runtime.h>

static char kCarbonBadgeLabelKey;

@implementation UIView (CarbonBadgeLabel)

@dynamic carbonBadgeLabel;

- (void)setCarbonBadgeLabel:(CarbonBadgeLabel *)label {
    objc_setAssociatedObject(self, &kCarbonBadgeLabelKey, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CarbonBadgeLabel *)carbonBadgeLabel {
    return objc_getAssociatedObject(self, &kCarbonBadgeLabelKey);
}

- (CarbonBadgeLabel *)createCarbonBadgeWithText:(NSString *)text {
	if (!self.carbonBadgeLabel) {
        
        [self createCarbonBadgeLabel];
        
        [self setupConstraintsInHorizontal:CarbonBadgeHorizontalPositionRight
                                  vertical:CarbonBadgeVerticalPositionTop];
	}
	
	self.carbonBadgeLabel.text = text;
    
    return self.carbonBadgeLabel;
}

- (CarbonBadgeLabel *)createCarbonBadgeWithText:(NSString *)text
                                        options:(CarbonBadgeOptions)options {
    if (!self.carbonBadgeLabel) {
        
        [self createCarbonBadgeLabel];
        
        [self setupConstraintsInHorizontal:options.horizontal
                                  vertical:options.vertical];
    }
    
    self.carbonBadgeLabel.text = text;
    
    return self.carbonBadgeLabel;
}

- (void)removeCarbonBadge {
    [self.carbonBadgeLabel removeFromSuperview];
    self.carbonBadgeLabel = nil;
    objc_removeAssociatedObjects(self);
}

- (void)createCarbonBadgeLabel {
    self.carbonBadgeLabel = [[CarbonBadgeLabel alloc] init];
    self.carbonBadgeLabel.font = [UIFont boldSystemFontOfSize:12];
    self.carbonBadgeLabel.textColor = [UIColor whiteColor];
    self.carbonBadgeLabel.textAlignment = NSTextAlignmentCenter;
    [self.superview addSubview:self.carbonBadgeLabel];
}

- (void)setupConstraintsInHorizontal:(NSInteger)horizontal
                            vertical:(NSInteger)vertical {
    
    self.carbonBadgeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.superview addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.carbonBadgeLabel
      attribute:NSLayoutAttributeCenterX
      relatedBy:NSLayoutRelationEqual
      toItem:self
      attribute:horizontal
      multiplier:1
      constant:0]];
    
    [self.superview addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.carbonBadgeLabel
      attribute:NSLayoutAttributeCenterY
      relatedBy:NSLayoutRelationEqual
      toItem:self
      attribute:vertical
      multiplier:1
      constant:0]];
}

@end
