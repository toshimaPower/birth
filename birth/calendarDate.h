//
//  calendarDate.h
//  birth
//
//  Created by 成基 朴 on 12/06/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calendarDate : NSObject


@property int gyear;
@property int gmonth;
@property int gday;
@property int m_aday;
@property int m_bday;
@property (nonatomic, strong) NSMutableArray *dayOfWeekArray;
@property (nonatomic, strong) NSArray *weekArray;
@property (nonatomic, strong) NSMutableArray *myArray;
@property (nonatomic , strong) NSMutableArray *diaryWrite;


-(int)isLeapYear:(int)year;
-(int)getLastDay:(int)year month:(int)month;
-(int)zeller:(int)year month:(int)month day:(int)day;



-(void)movePrevMonth;
-(void)moveNextMonth;



-(void)moveCurrentDate;
-(void)fastEnum:(int)year withMonth:(int)month;

@end
