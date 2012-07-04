//
//  bitrthDetailViewController.m
//  birth
//
//  Created by 成基 朴 on 12/06/25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "bitrthDetailViewController.h"

@interface bitrthDetailViewController ()

@end

@implementation bitrthDetailViewController
@synthesize textView = _textView;
@synthesize delegate = _delegate;
@synthesize calendarDiary = _calendarDiary;
@synthesize babyDiaryDataList = _babyDiaryDataList;

-(babybirthDate *)babyDiaryDataList{
    if(!_babyDiaryDataList){
        _babyDiaryDataList = [[babybirthDate alloc]init];
        NSLog(@"_babyDiaryDataList");
    }
    NSLog(@"babydiaryData world");
    return _babyDiaryDataList;
}
-(calendarDate *)calendarDiary{
    if(_calendarDiary == nil){
        _calendarDiary = [[calendarDate alloc]init];
    }
    return _calendarDiary;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    self.textView = [[[UITextView alloc] initWithFrame:self.view.frame] autorelease];
		// this will cause automatic vertical resize when the table is resized
}


- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)saveAction:(UIBarButtonItem *)sender {
    NSLog(@"first");
    [self.delegate detailViewController:self didChangeCalendarDate:self.calendarDiary ];
    NSLog(@"second");
    [self.textView resignFirstResponder];
    NSLog(@"third");
    
    NSString *ns= [NSString stringWithFormat:@"%@",self.textView.text];
    
    NSLog(@"ns %@",ns);
  //  [self.navigationController popViewControllerAnimated:YES];
    self.calendarDiary.diaryWrite = [ns copy];

    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
