//
//  bitrhViewController.m
//  birth
//
//  Created by 成基 朴 on 12/06/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "bitrhViewController.h"
#import "babybirthDate.h"
@interface bitrhViewController () <UITextFieldDelegate>

@end

@implementation bitrhViewController
@synthesize nameTextfield = _nameTextfield;
@synthesize birthDate = _birthDate;
@synthesize datePicker = _datePicker;
@synthesize babyBirthDate = _babyBirthDate;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.nameTextfield.delegate = self;
}

-(babybirthDate *)babyBirthDate{
    if(!_babyBirthDate){
        _babyBirthDate =[[babybirthDate alloc]init];
    }
    
    return _babyBirthDate;
}

- (void)viewDidUnload
{
    [self setNameTextfield:nil];
    [self setBirthDate:nil];
    [self setDatePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
- (IBAction)changeDatePicker:(UIDatePicker *)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy 년 MM 월 dd 일"];
    self.birthDate.text = [formatter stringFromDate:sender.date];
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)saveDate:(UIBarButtonItem *)sender {
    
    
    
    self.babyBirthDate.babyName = self.nameTextfield.text;
  //  [[self babyBirthDate]setBabyName:self.nameTextfield.text];
    self.babyBirthDate.birthDay = self.datePicker.date;
    
    
    
}
 
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
            
        [[self nameTextfield]resignFirstResponder];
        

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(!self.babyBirthDate){
        self.babyBirthDate = [[babybirthDate alloc]init];
        self.babyBirthDate.babyName = self.nameTextfield.text;
        self.babyBirthDate.birthDay = self.datePicker.date;
    }
    [[self babyBirthDate]persistWithName:self.nameTextfield.text birthDay:self.datePicker.date];
    NSLog(@"23");
   


}
@end
