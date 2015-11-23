//
//  User.h
//  Twitter
//
//  Created by Ankush Raina on 11/9/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const UserDidLoginNotification;
extern NSString * const UserDidLogoutNotification;

@interface User : NSObject

@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) NSString* screenname;
@property(strong, nonatomic) NSString* profileImageUrl;
@property(strong, nonatomic) NSString* profileBackgroundUrl;
@property(strong, nonatomic) NSString* tagline;
@property(strong, nonatomic) NSNumber* tweetCount;
@property(strong, nonatomic) NSNumber* followingCount;
@property(strong, nonatomic) NSNumber* followersCount;
@property(strong, nonatomic) NSNumber* favouritesCount;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (User *)currentUser;
+ (void)setCurrentUser:(User *)currentUser;

+ (void)logout;

@end
