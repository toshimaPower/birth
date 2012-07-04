//
//  babybirthDate.h
//  birth
//
//  Created by 成基 朴 on 12/06/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class babybirthDate;
@interface babybirthDate : NSObject

@property (nonatomic , strong) NSDate *birthDay;
@property (nonatomic , strong) NSString *babyName; 

/*
-(NSString *)getPath;
-(void)makePlist;
-(void)loadPlist;
-(void)savePlist;
 */

@property (nonatomic) int day;
@property (nonatomic) int hour;
@property (nonatomic) int minute;
@property (nonatomic) int second;
-(void)time:(NSDate *)aTime;
-(void)loadData;
-(void)persistWithName:(NSString *)name birthDay:(NSDate *)aBirthDay;
@end
