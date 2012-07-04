//
//  bitrthDetailViewController.h
//  birth
//
//  Created by 成基 朴 on 12/06/25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "calendarDate.h"
#import "babybirthDate.h"

@class bitrthDetailViewController;

@protocol bitrthDetailViewControllerDelegate <NSObject>

-(void)detailViewController:(bitrthDetailViewController *)viewController didChangeCalendarDate:(calendarDate *)diaryList;

@end


@interface bitrthDetailViewController : UIViewController<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, strong) babybirthDate *babyDiaryDataList;
@property (nonatomic, strong) calendarDate *calendarDiary;

@property (nonatomic, weak) id<bitrthDetailViewControllerDelegate> delegate; 
@end
