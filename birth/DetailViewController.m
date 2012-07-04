//
//  DetailViewController.m
//  birth
//
//  Created by 成基 朴 on 12/06/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "babybirthDate.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize date = _date;
@synthesize name = _name;
@synthesize time = _time;
@synthesize dayLabel = _dayLabel;
@synthesize hourLabel = _hourLabel;
@synthesize minuteLabel = _minuteLabel;
@synthesize secondLabel = _secondLabel;
@synthesize pergnancy = _pergnancy;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(babybirthDate *)date{
    if(!_date){
        _date = [[babybirthDate alloc]init];
    }
    return _date;
}

/*
-(void)time:(NSDate *)aTime{
    NSDate *currentDate = aTime;
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    int unitFlags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit |NSSecondCalendarUnit;
    NSDateComponents *components = [gregorian components:unitFlags fromDate:today toDate:currentDate options:0];
    NSLog(@"%02d Days, %02d Hours, %02d Minutes, %02d Seconds", components.day, components.hour, components.minute, components.second );
}
*/
- (void)viewDidLoad
{
    [[self date]loadData];
    self.name = self.date.babyName;
    self.time = self.date.birthDay;
    NSLog(@"baby Name is %@",self.name);
     NSLog(@"baby BirthDay is %@",self.time);
    [super viewDidLoad];
    [self.date time:self.date.birthDay];
	// Do any additional setup after loading the view.
    
    self.dayLabel.text = [NSString stringWithFormat:@"%i 일",self.date.day];
    self.hourLabel.text = [NSString stringWithFormat:@"%i 시간",self.date.hour];
    self.minuteLabel.text = [NSString stringWithFormat:@"%i 분",self.date.minute];
    self.secondLabel.text = [NSString stringWithFormat:@"%i 초",self.date.second];
     
 //    NSTimer *tm = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(runTime) userInfo:nil repeats:YES];
}
/*
-(void)timer {
    NSTimer *tm = [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(runTime) userInfo:nil repeats:YES];
    NSLog(@"1");
}
*/
-(void)runTime{
    [self.date time:self.date.birthDay];
    self.dayLabel.text = [NSString stringWithFormat:@"%i 일",self.date.day];
    self.hourLabel.text = [NSString stringWithFormat:@"%i 시간",self.date.hour];
    self.minuteLabel.text = [NSString stringWithFormat:@"%i 분",self.date.minute];
    self.secondLabel.text = [NSString stringWithFormat:@"%i 초",self.date.second];
    NSLog(@"1");
}
- (void)viewDidUnload
{
    [self setName:nil];
    [self setTime:nil];
    [self setDayLabel:nil];
    [self setHourLabel:nil];
    [self setMinuteLabel:nil];
    [self setSecondLabel:nil];
    [self setPergnancy:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
