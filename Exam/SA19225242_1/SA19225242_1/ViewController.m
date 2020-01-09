//
//  ViewController.m
//  SA19225242_1
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *SA242_txt;

@end

@implementation ViewController
- (IBAction)SA242_backgroundToRed:(UIButton *)sender {
    UIColor *red = [UIColor redColor];
    _SA242_txt.backgroundColor = red;
    
}
- (IBAction)SA242_backgroundToYellow:(UIButton *)sender {
    UIColor *yellow = [UIColor yellowColor];
    _SA242_txt.backgroundColor = yellow;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_SA242_txt resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
