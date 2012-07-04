//
//  calendarDate.m
//  birth
//
//  Created by 成基 朴 on 12/06/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "calendarDate.h"

@implementation calendarDate

@synthesize gyear;
@synthesize gmonth;
@synthesize gday;
@synthesize m_aday;
@synthesize m_bday;
@synthesize myArray;
@synthesize weekArray = _weekArray;
@synthesize dayOfWeekArray = _dayOfWeekArray;
@synthesize diaryWrite = _diaryWrite;
-(int)isLeapYear:(int)year{
    if(year %400 == 0)       return 1;
    else if(year % 100 == 0) return 0;
    else if(year % 4 == 0)   return 1;
    else                     return 0;
}

//해당 월의 마지막 날을 구하는 함수
-(int)getLastDay:(int)year month:(int)month{
    if(month == 2){
        if((BOOL)[self isLeapYear:year]) {return 29;}
        else {return 28;}
    }else if( month == 4 || month == 6 || month == 9 || month == 11) {return 30;}
    else {return 31;}
    return -1;
}

-(int)zeller:(int)year month:(int)month day:(int)day
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    [dateComponents setYear:year];
    [dateComponents setDay:day];
    [dateComponents setMonth:month];
    
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
   
    NSDate *date = [gregorian dateFromComponents:dateComponents];
    NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:date];
    return [weekdayComponents weekday] -1;
    
}


-(void)movePrevMonth{
    if(gyear >1 && gmonth > 1){
        if(gmonth > 1){
            gmonth --;
            //            if(gday > (m_aday = [self getLastDay:gyear month:gmonth])){
            //                gday = m_aday;
        }
    }else {
        gmonth = 12;
        gyear --;
    }
}

-(void)moveNextMonth{
    if(gyear < 9999 && gmonth < 12){
       
            gmonth ++;
                   
    }else if(gyear < 9999 && gmonth == 12){
        gmonth = 1;
        gyear ++;
       
    }
    else {
        gmonth = 1;
        gyear = 1;
    }
   
    
}

-(void)moveCurrentDate{
    NSDateComponents *today = [[NSCalendar currentCalendar]components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[NSDate date]];
    gyear = [today year];
    gmonth = [today month];
    gday = [today day];
}

-(NSString *)dayOfThwWeek:(int)aDayOfTheWeek{
    NSString *dayOfWeek;
    if (aDayOfTheWeek == 0) {
        dayOfWeek = @"Sun";
    }
    else if (aDayOfTheWeek == 1) {
        dayOfWeek = @"Mon";
    }
    else if (aDayOfTheWeek == 2) {
        dayOfWeek = @"Tue";
    }
    else if (aDayOfTheWeek == 3) {
        dayOfWeek = @"Wed";
    }
    else if (aDayOfTheWeek == 4) {
        dayOfWeek = @"Thu";
    }
    else if (aDayOfTheWeek == 5) {
        dayOfWeek = @"Fri";
    }
    else if (aDayOfTheWeek == 6) {
        dayOfWeek = @"Sat";
    }

    NSLog(@"%@",dayOfWeek);
    return dayOfWeek;
}



-(void)fastEnum:(int)year withMonth:(int)month{
   
    myArray  = [[NSMutableArray alloc]init];
    self.dayOfWeekArray = [[NSMutableArray alloc]init];
    for(int i = 0; i< [self getLastDay:year month:month];i++){
        NSString *temp = [NSString stringWithFormat:@"%i 일",i+1];
        int first_day_of_week = [self zeller:gyear month:gmonth day:i+1];
         
       
        [myArray addObject:temp];
        [self.dayOfWeekArray addObject:[self dayOfThwWeek:first_day_of_week]];
    }
    for(NSNumber *myNumber in myArray){
   //     NSLog(@"value : %i",[myNumber intValue]);
    }
    NSLog(@"%i %i %i",gyear,gmonth,gday);
}

@end
