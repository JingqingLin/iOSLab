//
//  ViewController.m
//  StudentsScore
//
//  Created by 林靖清 on 2020/1/3.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "ViewController.h"
#import "Model/Student.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtID;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;
@property (weak, nonatomic) IBOutlet UITextField *txtScore;
@property (weak, nonatomic) IBOutlet UITextView *txtMemo;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_txtScore resignFirstResponder];
    [_txtName resignFirstResponder];
    [_txtID resignFirstResponder];
    [_txtMemo resignFirstResponder];
    [_txtAge resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _txtScore || textField == _txtName || textField == _txtID || textField == _txtAge || textField == _txtMemo){
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction)dataSave:(UIButton *)sender {
    TableViewController *tc = [[TableViewController alloc]init];
    //flag记录成绩是否合法
    BOOL flag = YES;
    if ([_txtScore.text floatValue] < 0)
        flag = NO;
    for (int i = 0;i < _txtScore.text.length;i++) {
        char ch = [_txtScore.text characterAtIndex:i];
        NSString *temp = [NSString stringWithFormat:@"%c",ch];
        if (![temp containsString:@"0"] &&![temp containsString:@"1"] &&![temp containsString:@"2"] &&![temp containsString:@"3"] &&![temp containsString:@"4"] &&![temp containsString:@"5"] &&![temp containsString:@"6"] &&![temp containsString:@"7"] &&![temp containsString:@"8"] &&![temp containsString:@"9"])
        {
            flag = NO;
        }
    }
    
    if (flag == NO)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入正确的成绩" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            self.txtScore.text = @"";
        }];
        [alertController addAction: okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else {
        Student *student = [[Student alloc]init];
        student.name = _txtName.text;
        student.number = _txtID.text;
        student.age = [_txtAge.text floatValue];
        student.score = [_txtScore.text floatValue];
        student.memo = _txtMemo.text;
        student.teacher = @"Tian Bai";
        
        if (_indexPath == nil) {
            [_students addObject:student];
            [tc writeToFile:_students filepath:_path];
        }
        else {
            //修改数据
            _students[_indexPath.row] = student;
            //数据写入，writeToFile 必须为 public
            [tc writeToFile:_students filepath:_path];
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
    }

}
- (IBAction)dataCancel:(UIButton *)sender {
    _txtID = nil;
    _txtAge = nil;
    _txtMemo = nil;
    _txtName = nil;
    _txtScore = nil;
}

-(void) viewWillAppear:(BOOL)animated{
    if (self.indexPath != nil) {
        Student *student = self.students[self.indexPath.row];
        _txtName.text = student.name;
        _txtID.text = student.number;
        _txtAge.text = [NSString stringWithFormat:@"%ld", (long)student.age];
        _txtScore.text = [NSString stringWithFormat:@"%ld",(long)student.score];
        _txtMemo.text = student.memo;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
