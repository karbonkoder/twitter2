//
//  HamburgerViewController.m
//  Twitter
//
//  Created by Ankush Raina on 11/19/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import "HamburgerViewController.h"

@interface HamburgerViewController ()
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginConstraint;

@property(assign, nonatomic) CGFloat originalLeftMargin;

@end

@implementation HamburgerViewController

@synthesize menuViewController = _menuViewController;

- (void) setMenuViewController:(UIViewController *)menuViewController {
    [self.view layoutIfNeeded];
    
    _menuViewController = menuViewController;
    self.menuViewController.view.frame = self.menuView.bounds;
    [self.menuView addSubview:self.menuViewController.view];
}

@synthesize contentViewController = _contentViewController;

- (void) setContentViewController:(UIViewController *)contentViewController {
    [self.view layoutIfNeeded];
    
    _contentViewController = contentViewController;
    self.contentViewController.view.frame = self.contentView.bounds;
    [self.contentView addSubview:self.contentViewController.view];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.leftMarginConstraint.constant = 0;
        [self.view layoutIfNeeded];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPanGesture:(UIPanGestureRecognizer *)sender {
    CGPoint translation = [sender translationInView:self.view];
    CGPoint velocity = [sender velocityInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.originalLeftMargin = self.leftMarginConstraint.constant;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        self.leftMarginConstraint.constant = self.originalLeftMargin + translation.x;
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.3 animations:^{
            if (velocity.x > 0) {
                self.leftMarginConstraint.constant = self.view.frame.size.width - 50;
            } else {
                self.leftMarginConstraint.constant = 0;
            }
            
            [self.view layoutIfNeeded];
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
