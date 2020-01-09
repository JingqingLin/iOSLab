//
//  ViewController.m
//  SA19225242_wordCount
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "ViewController.h"
#import "Model/wordProcess.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *SA19225242_txt;
@property (strong, nonatomic) wordProcess *txt;
@end

@implementation ViewController
//- (IBAction)toPrecessPage:(UIBarButtonItem *)sender {
//    _txt.disp = [NSMutableString stringWithString:_SA19225242_txt.text];
//    NSLog(@"输入界面跳转时：%@", _txt.disp);
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _txt.disp = [NSMutableString stringWithString:_SA19225242_txt.text];
    [_SA19225242_txt resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    _txt.disp = [NSMutableString stringWithString:_SA19225242_txt.text];
    if (textField == _SA19225242_txt){
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"SecondViewSegue"]){
        _txt.disp = [NSMutableString stringWithString:_SA19225242_txt.text];
        NSLog(@"输入界面跳转时：%@", _txt.disp);
        if ([segue.destinationViewController isKindOfClass:[SecondViewController class]]){
            SecondViewController *avc = (SecondViewController *)segue.destinationViewController;
            avc.txt = _txt;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    _SA19225242_txt.text = _txt.disp;
    NSLog(@"输入界面加载中...");
}

- (wordProcess *)txt{
    if(!_txt)
        _txt = [[wordProcess alloc] init];
    return _txt;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _txt = [[wordProcess alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
