//
//  ViewController.m
//  SA19225242_2
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "ViewController.h"
#import "Model/transferSentence.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *SA242_txt;
@property (strong, nonatomic) transferSentence *SA242_transTxt;
@end

@implementation ViewController

//- (IBAction)toPrecessPage:(UIBarButtonItem *)sender {
//    _txt.disp = [NSMutableString stringWithString:_SA242_txt.text];
//    NSLog(@"输入界面跳转时：%@", SA242_transTxt.disp);
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_SA242_txt resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _SA242_txt){
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"SecondViewSegue"]) {
        _SA242_transTxt.disp = [NSMutableString stringWithString:_SA242_txt.text];
        NSLog(@"输入界面跳转时：%@", _SA242_transTxt.disp);
        if ([segue.destinationViewController isKindOfClass:[SecondViewController class]]){
            SecondViewController *avc = (SecondViewController *)segue.destinationViewController;
            avc.SA242_transTxt = _SA242_transTxt;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    _SA242_txt.text = _SA242_transTxt.disp;
    NSLog(@"输入界面加载中...");
}

- (transferSentence *)SA242_transTxt{
    if(!_SA242_transTxt)
        _SA242_transTxt = [[transferSentence alloc] init];
    return _SA242_transTxt;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _SA242_transTxt = [[transferSentence alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
