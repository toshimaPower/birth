//
//  bitrhDayTableViewController.m
//  birth
//
//  Created by 成基 朴 on 12/06/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "bitrhDayTableViewController.h"
#import "calendarDate.h"
#import "bitrthDetailViewController.h"
#import "diaryData.h"
@interface bitrhDayTableViewController ()<bitrthDetailViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *diaryListData;

@end

@implementation bitrhDayTableViewController
@synthesize calendar = _calendar;
@synthesize dayLabel = _dayLabel;
@synthesize diaryListData = _diaryListData;
@synthesize diary = _diary;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
-(diaryData *)diary{
    if(!_diary){
        _diary = [[diaryData alloc]init];
    }
    return _diary;
}

-(calendarDate *)calendar{
    if(!_calendar){
        _calendar = [[calendarDate alloc]init];
        [_calendar moveCurrentDate];
        NSLog(@"init %i",_calendar.gday);
        [self.calendar moveCurrentDate];
    
    }
    return _calendar;
}

-(NSMutableArray *)diaryListData{
    if(!_diaryListData){
        _diaryListData = [NSMutableArray array];
    }
    return _diaryListData;
}

- (void)viewDidLoad
{
//    self.calendar = [[calendarDate alloc]init];
//    [self.calendar moveCurrentDate];
    NSLog(@"viewDidLoad %i",self.calendar.gday);
    [self.calendar fastEnum:self.calendar.gyear withMonth:self.calendar.gmonth];
    self.navigationItem.title = [NSString stringWithFormat:@"%i 년 %i 월 ",self.calendar.gyear,self.calendar.gmonth];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
}

- (void)viewDidUnload
{
    [self setCalendar:nil];
    [self setDayLabel:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.calendar getLastDay:self.calendar.gyear month:self.calendar.gmonth];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    NSString *text = [self.calendar.myArray objectAtIndex:indexPath.row];
    
    NSString *text2 = [self.calendar.dayOfWeekArray objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    cell.detailTextLabel.text = text2;
        return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier]isEqualToString:@"show_detail"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow ];
        babybirthDate *diarydaTa = [self.calendar.myArray objectAtIndex:indexPath.row];
        bitrthDetailViewController *viewController = segue.destinationViewController;
        viewController.babyDiaryDataList = diarydaTa;
        viewController.delegate = self;
        

    }
}


-(void)detailViewController:(bitrthDetailViewController *)viewController didChangeCalendarDate:(diaryData *)diaryList{
    [self.diaryListData addObject:diaryList];
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark - Table view delegate
- (IBAction)prevDay:(UIBarButtonItem *)sender {
    [self.calendar movePrevMonth];
  
    [self.calendar getLastDay:self.calendar.gyear month:self.calendar.gmonth];
    [self.calendar fastEnum:self.calendar.gyear withMonth:self.calendar.gmonth];
    self.navigationItem.title = [NSString stringWithFormat:@"%i 년 %i 월 ",self.calendar.gyear,self.calendar.gmonth];

    NSLog(@"%i 년 %i 월 ",self.calendar.gyear,self.calendar.gmonth);
    [self.tableView reloadData];
    
    
    
}

- (IBAction)next:(UIBarButtonItem *)sender {
    [self.calendar moveNextMonth];
   
    [self.calendar fastEnum:self.calendar.gyear withMonth:self.calendar.gmonth];
    self.navigationItem.title = [NSString stringWithFormat:@"%i 년 %i 월 ",self.calendar.gyear,self.calendar.gmonth];

    
     [self.calendar getLastDay:self.calendar.gyear month:self.calendar.gmonth];
    [self.tableView reloadData];
        
}

@end
