//
//  ViewController.m
//  SA19225242_3
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "ViewController.h"
#import "drawRect.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *SA242_imgView1;
@property (weak, nonatomic) IBOutlet UIImageView *SA242_imgView2;
@property (weak, nonatomic) IBOutlet UITextField *SA242_txt;

@end

@implementation ViewController
- (IBAction)pan1:(UIPanGestureRecognizer *)sender {
    if ((sender.state == UIGestureRecognizerStateChanged)||(sender.state == UIGestureRecognizerStateEnded))
    {
        CGPoint dist = [sender translationInView:self.view];
        _SA242_imgView1.center = CGPointMake(_SA242_imgView1.center.x+dist.x, _SA242_imgView1.center.y+dist.y);
        //视图原点设为左上角
        [sender setTranslation:CGPointZero inView:self.view];
        if (_SA242_imgView1.frame.origin.x>=57&&_SA242_imgView1.frame.origin.y>=320&&_SA242_imgView1.frame.origin.x<=317&&_SA242_imgView1.frame.origin.y<=460) {
            _SA242_txt.text = @"图片一移动成功";
        }
        else {
            _SA242_txt.text = @"图片一移动失败";
        }
    }
}
- (IBAction)pan2:(UIPanGestureRecognizer *)sender {
    if ((sender.state == UIGestureRecognizerStateChanged)||(sender.state == UIGestureRecognizerStateEnded))
    {
        CGPoint dist = [sender translationInView:self.view];
        _SA242_imgView2.center = CGPointMake(_SA242_imgView2.center.x+dist.x, _SA242_imgView2.center.y+dist.y);
        //视图原点设为左上角
        [sender setTranslation:CGPointZero inView:self.view];
        if (_SA242_imgView2.frame.origin.x>=57&&_SA242_imgView2.frame.origin.y>=470&&_SA242_imgView2.frame.origin.x<=317&&_SA242_imgView2.frame.origin.y<=610) {
            _SA242_txt.text = @"图片二移动成功";
        }
        else {
            _SA242_txt.text = @"图片二移动失败";
        }
    }
}

-(void)viewWillAppear:(BOOL)animated{
    drawRect *view1 = [[drawRect alloc]initWithFrame:CGRectMake(57, 320, 260, 140)];
    //背景色默认为边框颜色
    view1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view1];
    [view1 setUserInteractionEnabled:NO];
    drawRect *view2 = [[drawRect alloc]initWithFrame:CGRectMake(57, 470, 260, 140)];
    view2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view2];
    [view2 setUserInteractionEnabled:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_SA242_imgView1 setUserInteractionEnabled:YES];
    [_SA242_imgView2 setUserInteractionEnabled:YES];
    [self imageLoading:@"https://i.loli.net/2020/01/09/h41aUmpqk23GbKC.jpg" ImageView:_SA242_imgView1];
    [self imageLoading:@"https://mailustceducn-my.sharepoint.com/personal/jqlin_mail_ustc_edu_cn/_layouts/52/download.aspx?share=EX2eU05IQDdHqaIoC9bC3MMBbjzGU8WlyJnfETOterwefA" ImageView:_SA242_imgView2];
}

- (void)imageLoading:(NSString *)url ImageView:(UIImageView *)imgview {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSURL *urlStr = [NSURL URLWithString:url];
        NSData *data = [NSData dataWithContentsOfURL:urlStr];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{imgview.image = image;});
    });
}


@end
