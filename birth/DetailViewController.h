//
//  DetailViewController.h
//  birth
//
//  Created by 成基 朴 on 12/06/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class babybirthDate;
@interface DetailViewController : UIViewController

@property (nonatomic, strong) babybirthDate *date;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *time;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *minuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *pergnancy;
@end
