//
//  ViewController.m
//  HelloWorld
//
//  Created by 林靖清 on 2019/12/19.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "ViewController.h"
#import "Model/HelloWorld.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *centerBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@end

@implementation ViewController

- (IBAction)sayHelloWorldBtn:(UIButton *)sender {
    self.outputLabel.text = [HelloWorld sayHelloWorld];
}

- (IBAction)sayiOSWorldBtn:(UIButton *)sender {
    HelloWorld *h = [[HelloWorld alloc] init];
    self.outputLabel.text = [h sayHello:@"iOS world"];
}

- (IBAction)inputButton:(UIButton *)sender {
    HelloWorld *h = [[HelloWorld alloc] init];
    h.something = self.inputText.text;
    self.outputLabel.text = [h saySomething];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.inputText) {
        [textField resignFirstResponder];
        //[self.view endEditing:YES];
        //[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        NSLog(@"键盘收起");
    }
    return YES;
}

@end
