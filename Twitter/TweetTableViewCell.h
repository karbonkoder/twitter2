//
//  TweetTableViewCell.h
//  Twitter
//
//  Created by Ankush Raina on 11/9/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "User.h"

@class TweetTableViewCell;

@protocol TweetTableCellDelegate <NSObject>

- (void)tweetTableViewCell:(TweetTableViewCell *)cell didTapOnUser:(User *)user;

@end

@interface TweetTableViewCell : UITableViewCell

@property (strong, nonatomic) Tweet *tweet;
@property (nonatomic, weak) id<TweetTableCellDelegate> delegate;

@end
