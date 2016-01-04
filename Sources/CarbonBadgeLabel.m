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

#import "CarbonBadgeLabel.h"

@implementation CarbonBadgeLabel

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
        [self commonInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}


- (void)commonInit {
    _circleShadow = YES;
    _padding = CGSizeMake(5, 2);
    _circleFillColor = [UIColor redColor];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [super sizeThatFits:size];
    newSize.width += _padding.width * 2;
    newSize.height += _padding.height * 2;
    return newSize;
}

- (void)layoutSubviews {
	CGRect rect = self.bounds;
    rect.size = [self sizeThatFits:CGSizeZero];
	self.bounds = rect;
}

- (void)drawRect:(CGRect)rect {
	// Draw circle
	[self drawCircleInRect:rect];
	
	// Draw label
	[super drawRect:rect];
}

- (void)drawCircleInRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	
	if (_circleShadow) {
		// Draw shadow
		CGColorRef shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.4].CGColor;
		CGContextSetShadowWithColor(context, CGSizeMake(0, 0.4), 0.8, shadowColor);
	}
	
	// Set fill color
	[_circleFillColor set];
	
	// Draw rounded rect
	rect = UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(1, 1, 1, 1));
	[[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:CGRectGetHeight(rect)] fill];
	
	CGContextRestoreGState(context);
}

@end
