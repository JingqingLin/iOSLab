//
//  HealthViewController.m
//  Calculator
//
//  Created by 林靖清 on 2019/12/29.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "HealthViewController.h"
#import "Model/Calculator+Health.h"

@interface HealthViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtHeight;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvise;
@property (weak, nonatomic) IBOutlet UILabel *labelBMI;
@property (weak, nonatomic) IBOutlet UIButton *btnCalc;
@property (strong, nonatomic) Calculator *cal;
@end

@implementation HealthViewController

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == _txtHeight || textField == _txtWeight){
        [textField resignFirstResponder];
    }
    return YES;
}

-(Calculator *)cal{
    if(!_cal)
        _cal=[[Calculator alloc] init];
    return _cal;
    
}

- (IBAction)computeBMI:(UIButton *)sender {
    NSString *score=[_cal computeHeathWithHeight:_txtHeight.text andWeight:_txtWeight.text];
    if ([score floatValue] < 19)
        _labelAdvise.text = @"太苗条啦，增加营养";
    else if ([score floatValue] < 25)
        _labelAdvise.text = @"身材好棒";
    else if ([score floatValue] < 30)
        _labelAdvise.text = @"有点发福，多锻炼哦";
    else if ([score floatValue] < 39)
        _labelAdvise.text = @"有点胖了吃货，快点锻炼";
    else
        _labelAdvise.text = @"再不减肥，你和死神有个约会";
    _labelBMI.text = score;
}


- (void)viewDidLoad {
    _cal=[[Calculator alloc] init];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
