//
//  TweetTableViewCell.m
//  Twitter
//
//  Created by Ankush Raina on 11/9/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import "TweetTableViewCell.h"

@interface TweetTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end

@implementation TweetTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setTweet:(Tweet *)tweet {
    _tweet = tweet;

    self.tweetLabel.text = self.tweet.text;
    self.dateLabel.text = [NSString stringWithFormat:@"%@", self.tweet.createdAt];
    
    [self.tweetLabel sizeToFit];
    [self.dateLabel sizeToFit];
}

@end
