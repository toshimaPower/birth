//
//  bitrhViewController.h
//  birth
//
//  Created by 成基 朴 on 12/06/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class babybirthDate;

@interface bitrhViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;
@property (weak, nonatomic) IBOutlet UILabel *birthDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) babybirthDate *babyBirthDate;

@end
