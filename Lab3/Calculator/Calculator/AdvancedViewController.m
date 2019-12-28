//
//  AdvancedViewController.m
//  Calculator
//
//  Created by 林靖清 on 2019/12/28.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "AdvancedViewController.h"

@interface AdvancedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *txtDisplay;
@property (weak, nonatomic) IBOutlet UIButton *btnLeftBracket;
@property (weak, nonatomic) IBOutlet UIButton *btnRightBracket;
@property (weak, nonatomic) IBOutlet UIButton *btnNaturalLogarithm;
@property (weak, nonatomic) IBOutlet UIButton *btnPi;

@end

@implementation AdvancedViewController
- (IBAction)inputKey:(UIButton *)sender {
    if (sender.tag==0 || sender.tag==1 || sender.tag==2 || sender.tag==3) {
        NSMutableString *str=[NSMutableString stringWithString:_txtDisplay.text];
        if([[[sender titleLabel] text] isEqualToString:@"e"]){
            [_advCal.disp appendString:@"2.71828"];
        }
        else if ([[[sender titleLabel] text] isEqualToString:@"π"]){
            [_advCal.disp appendString:@"3.14159"];
        }
        else{
            [_advCal.disp appendString:[[sender titleLabel] text]];
        }
        [str appendString:[[sender titleLabel] text]];
        _txtDisplay.text=str;
        _advCal.screen=str;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    _txtDisplay.text = _advCal.screen;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
