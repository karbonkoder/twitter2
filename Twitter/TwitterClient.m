//
//  TwitterClient.m
//  Twitter
//
//  Created by Ankush Raina on 11/8/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import "TwitterClient.h"

NSString * const kTwitterConsumerKey = @"7IptNkyYQ8rLVx5Dj3gzhIERF";
NSString * const kTwitterConsumerSecret = @"bazSgeLPXiiIMFYTRbsKVWdDbC7EHLwbodQXBn9ZEr9F6Whqbd";
NSString * const kTwitterBaseUrl = @"https://api.twitter.com";

@implementation TwitterClient

+ (TwitterClient *)sharedInstance {
    static TwitterClient *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString:kTwitterBaseUrl] consumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
        }
    });
    
    return instance;
}

@end
