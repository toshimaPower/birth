//
//  babybirthDate.m
//  birth
//
//  Created by 成基 朴 on 12/06/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "babybirthDate.h"

#define MY_PROPERTIES @"my_properties.plist"

@interface babybirthDate()

@end

@implementation babybirthDate
@synthesize birthDay = _birthDay;
@synthesize babyName = _babyName;
@synthesize day = _day;
@synthesize hour = _hour;
@synthesize second = _second;
@synthesize minute = _minute;


/*
-(void)setBabyName:(NSString *)ababyName{
   
    if(!_babyName){
        _babyName = nil;
       
    }
     _babyName = [NSString stringWithFormat:ababyName];
    NSLog(@"%@",_babyName);
}

-(void)setBirthDay:(NSDate *)abirthDay{
    if(!_birthDay){
        _birthDay = nil;
    }
    _birthDay = abirthDay;
}
*/
/*
-(void)loadData{
    NSString *plistOrPath = [[NSBundle mainBundle]pathForResource:@"babyProperties" ofType:@"plist"];
    NSString *plistPath = [(NSString *)[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"babyProperties.plist"];
    NSDictionary *myDic = [NSDictionary dictionaryWithContentsOfFile:plistOrPath];
    self.birthDay= [myDic objectForKey:@"birthDay"];
    self.babyName = [myDic objectForKey:@"babyName"];


}
*/

-(void)time:(NSDate *)aTime{
    NSDate *currentDate = aTime;
    NSDate *today = [NSDate date];
   // NSDate *yesterDay = [NSDate dateWithTimeIntervalSinceNow:-280*24*60*60];
    NSDate *yesterDay = [NSDate dateWithTimeInterval:-280*24*60*60 sinceDate:aTime];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    int unitFlags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    int unitFlagx =  NSWeekCalendarUnit | NSDayCalendarUnit; 
    int unitFlag = NSMonthCalendarUnit ;
    NSDateComponents *components = [gregorian components:unitFlags fromDate:today toDate:currentDate options:0];
    NSLog(@"%02d Days, %02d Hours, %02d Minutes, %02d Seconds", components.day, components.hour, components.minute, components.second );

    self.day = components.day;
    self.hour = components.hour;
    self.minute = components.minute;
    self.second = components.second;
    NSLog(@"280일 전은 %@",yesterDay);
    NSDateComponents *components2 = [gregorian components:unitFlagx fromDate:yesterDay toDate:today options:0];
    NSDateComponents *components3 = [gregorian components:unitFlag fromDate:yesterDay toDate:today options:0];
    NSLog(@" %02d Weeks, %02d Days",components2.week,components2.day);
    NSLog(@" %02d Months",components3.month + 1);
}

-(void)persistWithName:(NSString *)name birthDay:(NSDate *)aBirthDay{
    
    NSString *path = nil;
    
    path = [(NSString *)[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:MY_PROPERTIES];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy - MM - dd"];
    self.babyName = name;
    self.birthDay = aBirthDay;
//    NSString *time = [formatter stringFromDate:self.birthDay];
    NSLog(@"%@",self.babyName);
    NSLog(@"time is %@",self.birthDay);
    
    NSDictionary *myDict = [NSDictionary dictionaryWithObjectsAndKeys:name,@"name",aBirthDay,@"birthDay", nil];
  //  NSDictionary *myDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:self.babyName,self.birthDay, nil] forKeys:[NSArray arrayWithObjects:@"name",@"birthDay", nil]];
    
    [myDict writeToFile:path atomically:NO];
    
}


-(void)loadData{
    NSString *path = nil;
    
    path = [(NSString *)[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:MY_PROPERTIES];
    
    NSDictionary *myProperties = [NSDictionary dictionaryWithContentsOfFile:path];
    if(myProperties){
        self.babyName = [myProperties valueForKey:@"name"];
        self.birthDay = [myProperties valueForKey:@"birthDay"];
        NSLog(@"baby Name is %@",self.babyName);
        NSLog(@"baby BirthDay is %@",self.birthDay);
       
    }
 //   return self;
    
}
/*
-(NSString *)getPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucumentPath = [paths objectAtIndex:0];
    NSString *path = [doucumentPath stringByAppendingPathComponent:@"birthDate.plist"];
    
    return path;
}

-(void)makePlist:(NSString *)aPath{
 //   NSError error;
    NSString *path = aPath;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:path]){
        NSString *bundle = [[NSBundle mainBundle]pathForResource:@"birthDate" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath:path error:nil];
    }
}

-(void)loadPlist:(NSString *)aPath{
    NSMutableDictionary *saveStock = [[NSMutableDictionary alloc]initWithContentsOfFile:aPath];
    self.birthDay= [saveStock objectForKey:@"birthDay"];
    self.babyName = [saveStock objectForKey:@"babyName"];
}

-(void)savePlist{
    NSString *path = [self getPath];
    NSMutableDictionary *data = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    [data setObject:[self.birthDay copy] forKey:@"birthDay"];
    [data setObject:[self.babyName copy] forKey:@"babyName"];
    
}
 */


@end
