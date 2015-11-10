//
//  TweetDetailViewController.m
//  Twitter
//
//  Created by Ankush Raina on 11/9/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import "TweetDetailViewController.h"
#import "TwitterClient.h"

@interface TweetDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;

@end

@implementation TweetDetailViewController

- (IBAction)onCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onRetweet:(id)sender {
    [[TwitterClient sharedInstance] reTweet:self.tweet completion:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Retweeted success");
        } else {
            NSLog(@"Retweet error %@", error);
        }
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onFavorite:(id)sender {
    [[TwitterClient sharedInstance] favorite:self.tweet completion:^(NSError *error) {
        if (error != nil) {
            NSLog(@"onFavorite success");
        } else {
            NSLog(@"onFavorite error %@", error);
        }
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onReply:(id)sender {
    // TODO launch ComposeViewController here.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tweetLabel.text = self.tweet.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
