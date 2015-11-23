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

@property (strong, nonatomic) User *user;

@end

@implementation ProfileViewController

- (id) initWithUser:(User *)user {
    self = [super init];
    
    if (self) {
        self.user = user;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nameLabel.text = self.user.name;
    self.screeNameLabel.text = self.user.screenname;
    [self.profileImageView setImageWithURL:[NSURL URLWithString:self.user.profileImageUrl]];
    [self.profileBackgroundImageView setImageWithURL:[NSURL URLWithString:self.user.profileBackgroundUrl]];
    self.taglineLabel.text = self.user.tagline;
    self.tweetCountLabel.text = [[NSString alloc] initWithFormat:@"%@", self.user.tweetCount];
    self.followingCountLabel.text = [[NSString alloc] initWithFormat:@"%@", self.user.followingCount];
    self.followersCountLabel.text = [[NSString alloc] initWithFormat:@"%@", self.user.followersCount];
    self.favouritesCountLabel.text = [[NSString alloc] initWithFormat:@"%@", self.user.favouritesCount];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(backPressed:)];
    self.navigationItem.leftBarButtonItem = btn;
}

-(void)backPressed: (id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
