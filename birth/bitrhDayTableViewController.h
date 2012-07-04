//
//  bitrhDayTableViewController.h
//  birth
//
//  Created by 成基 朴 on 12/06/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "diaryDetailViewController.h"

@class diaryData;
@class calendarDate ;
@interface bitrhDayTableViewController : UITableViewController

@property (nonatomic, strong) calendarDate *calendar;
@property (nonatomic, strong) diaryData *diary;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@end
