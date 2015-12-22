//
//  ViewController.m
//  CarbonBadgeLabelExamples
//
//  Created by Ermal Kaleci on 22/12/15.
//  Copyright © 2015 Ermal Kaleci. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CarbonBadgeLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UILabel *messagesLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [_yellowView createCarbonBadgeWithText:@"2"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CarbonBadgeLabel *carbonBadgeLabel
    = [_messagesLabel createCarbonBadgeWithText:@"+99"];
    
    carbonBadgeLabel.alpha = 0;
    carbonBadgeLabel.transform = CGAffineTransformMakeScale(0, 0);
    
    [UIView
     animateWithDuration:.4
     delay:2
     usingSpringWithDamping:0.6
     initialSpringVelocity:0.4
     options:UIViewAnimationOptionCurveEaseOut
     animations:^{
         carbonBadgeLabel.alpha = 1;
         carbonBadgeLabel.transform = CGAffineTransformMakeScale(1, 1);
     } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)yellowViewTapped:(id)sender {
    if (_yellowView.carbonBadgeLabel.alpha == 0) {
        [UIView
         animateWithDuration:.4
         delay:0
         usingSpringWithDamping:0.6
         initialSpringVelocity:0.4
         options:UIViewAnimationOptionCurveEaseOut
         animations:^{
             _yellowView.carbonBadgeLabel.alpha = 1;
             _yellowView.carbonBadgeLabel.transform = CGAffineTransformMakeScale(1, 1);
         } completion:nil];
    } else {
        [UIView
         animateWithDuration:.4
         delay:0
         usingSpringWithDamping:0.6
         initialSpringVelocity:0.4
         options:UIViewAnimationOptionCurveEaseIn
         animations:^{
             _yellowView.carbonBadgeLabel.alpha = 0;
             _yellowView.carbonBadgeLabel.transform = CGAffineTransformMakeScale(0.1, 0.1);
         } completion:^(BOOL finished) {
             int badge = [_yellowView.carbonBadgeLabel.text intValue];
             _yellowView.carbonBadgeLabel.text = [NSString stringWithFormat:@"%d", badge + 1];
         }];
    }
}

@end
