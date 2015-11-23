//
//  TweetsViewController.m
//  Twitter
//
//  Created by Ankush Raina on 11/9/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import "TweetsViewController.h"
#import "User.h"
#import "TwitterClient.h"
#import "Tweet.h"
#import "TweetTableViewCell.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "ComposeViewController.h"
#import "TweetDetailViewController.h"
#import "ProfileViewController.h"

typedef enum{
    HomeTimeLine, MentionsTimeLine, UserTimeLine
} TimeLine;

@interface TweetsViewController () <UITableViewDataSource, UITableViewDelegate, TweetTableCellDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) TimeLine timeLine;

@property (strong, nonatomic) NSArray *tweets;

@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation TweetsViewController

- (void) showHomeTimeLine {
    self.timeLine = HomeTimeLine;
    [self showTimeLine];
}

- (void) showMentionsTimeLine {
    self.timeLine = MentionsTimeLine;
    [self showTimeLine];
}

- (void) showUserTimeLine {
    self.timeLine = UserTimeLine;
    [self showTimeLine];
}

- (void) showTimeLine {
    switch (self.timeLine) {
        case HomeTimeLine: {
            [[TwitterClient sharedInstance] homeTimelineWithParams:nil completion:^(NSArray *tweets, NSError *error) {
                self.tweets = tweets;
                
                [self.tableView reloadData];
            }];
            break;
        }
            
        case MentionsTimeLine: {
            [[TwitterClient sharedInstance] mentionsTimelineWithParams:nil completion:^(NSArray *tweets, NSError *error) {
                self.tweets = tweets;
                
                [self.tableView reloadData];
            }];
            break;
        }
            
        case UserTimeLine: {
            [[TwitterClient sharedInstance] userTimelineWithParams:nil completion:^(NSArray *tweets, NSError *error) {
                self.tweets = tweets;
                
                [self.tableView reloadData];
            }];
            break;
        }
            
        default:
            break;
    }
}

- (IBAction)onLogout:(id)sender {
    [User logout];
}

- (IBAction)onTweet:(id)sender {
    [self presentViewController:[[ComposeViewController alloc] init] animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];

    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil] forCellReuseIdentifier:@"TweetTableViewCell"];
    
    self.tableView.estimatedRowHeight = 2.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    User *user = [User currentUser];
    self.userNameLabel.text = user.name;
    [self.profileImageView setImageWithURL:[NSURL URLWithString:user.profileImageUrl]];
    
    [self showTimeLine];
}


-(void) onRefresh {
    [self showTimeLine];
    
    [self.refreshControl endRefreshing];
}

#pragma mark - Table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetTableViewCell"];
    
    cell.delegate = self;
    cell.tweet = self.tweets[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TweetDetailViewController *tweetDetailViewController = [[TweetDetailViewController alloc] init];
    tweetDetailViewController.tweet = self.tweets[indexPath.row];

    [self presentViewController:tweetDetailViewController animated:YES completion:nil];
}

#pragma mark - TweetTableViewCellDelegate

- (void)tweetTableViewCell:(TweetTableViewCell *)cell didTapOnUser:(User *)user {
    ProfileViewController *pvc = [[ProfileViewController alloc] initWithUser:user];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:pvc];
    
    [self presentViewController:nvc animated:YES completion:nil];
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
