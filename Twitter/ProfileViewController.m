//
//  ProfileViewController.m
//  Twitter
//
//  Created by Ankush Raina on 11/22/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import "ProfileViewController.h"
#import "TwitterClient.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *taglineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *profileBackgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *tweetCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *favouritesCountLabel;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    User *user = [User currentUser];
    self.nameLabel.text = user.name;
    self.screeNameLabel.text = user.screenname;
    [self.profileImageView setImageWithURL:[NSURL URLWithString:user.profileImageUrl]];
    [self.profileBackgroundImageView setImageWithURL:[NSURL URLWithString:user.profileBackgroundUrl]];
    self.taglineLabel.text = user.tagline;
    self.tweetCountLabel.text = [[NSString alloc] initWithFormat:@"%@", user.tweetCount];
    self.followingCountLabel.text = [[NSString alloc] initWithFormat:@"%@", user.followingCount];
    self.followersCountLabel.text = [[NSString alloc] initWithFormat:@"%@", user.followersCount];
    self.favouritesCountLabel.text = [[NSString alloc] initWithFormat:@"%@", user.favouritesCount];
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
