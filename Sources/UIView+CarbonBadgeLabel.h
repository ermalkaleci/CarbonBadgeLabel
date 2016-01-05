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

#import <UIKit/UIKit.h>

#import "CarbonBadgeLabel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CarbonBadgeHorizontalPosition) {
    CarbonBadgeHorizontalPositionRight  = NSLayoutAttributeRight,
    CarbonBadgeHorizontalPositionLeft   = NSLayoutAttributeLeft,
    CarbonBadgeHorizontalPositionCenter = NSLayoutAttributeCenterX
};

typedef NS_ENUM(NSInteger, CarbonBadgeVerticalPosition) {
    CarbonBadgeVerticalPositionTop      = NSLayoutAttributeTop,
    CarbonBadgeVerticalPositionBottom   = NSLayoutAttributeBottom,
    CarbonBadgeVerticalPositionCenter   = NSLayoutAttributeCenterY
};

typedef struct {
    CarbonBadgeHorizontalPosition horizontal;
    CarbonBadgeVerticalPosition vertical;
} CarbonBadgeOptions;

@interface UIView (CarbonBadgeLabel)

@property (strong, nonatomic, readonly, nullable) CarbonBadgeLabel *carbonBadgeLabel;
@property (weak, nonatomic, nullable) NSLayoutConstraint *badgeHorizontal; // Constraint for horizontal position
@property (weak, nonatomic, nullable) NSLayoutConstraint *badgeVertical; // Constraint for vertical position

/**
 *  Create CarbonBadgeLabel with text on right-top and return the created instance
 *
 *  @param text Badge text
 *
 *  @return CarbonBadgeLabel instance
 */
- (nonnull CarbonBadgeLabel *)createCarbonBadgeWithText:(nullable NSString *)text;

/**
 *  Create CarbonBadgeLabel with text and position and return the created instance
 *
 *  @param text    Badge text
 *  @param options Horizontal and vertical positions of CarbonBadgeLabel
 *
 *  @return CarbonBadgeLabel instance
 */
- (nonnull CarbonBadgeLabel *)createCarbonBadgeWithText:(nullable NSString *)text
                                                options:(CarbonBadgeOptions)options;

/**
 *  Remove CarbonBadgeLabel form view and destroy the instance
 */
- (void)removeCarbonBadge;

@end

NS_ASSUME_NONNULL_END