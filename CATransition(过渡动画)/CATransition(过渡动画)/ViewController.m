//
//  ViewController.m
//  CATransition(过渡动画)
//
//  Created by mac on 15-9-22.
//  Copyright (c) 2015年 Lispeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (nonatomic, assign) int index;

- (IBAction)previous;

- (IBAction)next;

@end
/* 过渡效果 fade     //交叉淡化过渡(不支持过渡方向) kCATransitionFade push     //新视图把旧视图推出去  kCATransitionPush
  moveIn   //新视图移到旧视图上面   kCATransitionMoveIn reveal   //将旧视图移开,显示下面的新视图  kCATransitionReveal cube     //立方体翻滚效果 oglFlip  //上下左右翻转效果 suckEffect   //收缩效果，如一块布被抽走(不支持过渡方向) rippleEffect //滴水效果(不支持过渡方向) pageCurl     //向上翻页效果 pageUnCurl   //向下翻页效果 cameraIrisHollowOpen  //相机镜头打开效果(不支持过渡方向) cameraIrisHollowClose //相机镜头关上效果(不支持过渡方向)*/
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)previous {
    
    self.index --;
    
    if (self.index == -1) {
        self.index = 8;
    }
    
    NSString *pagePrevious = [NSString stringWithFormat:@"%d.jpg",self.index + 1];
    
    self.iconView.image = [UIImage imageNamed:pagePrevious];
    
    CATransition *anim = [CATransition animation];
    
    anim.type = @"pageCurl";
    
    anim.duration = 2.0;
    
    anim.subtype = kCATransitionFromRight;
    
    anim.startProgress = 0.2;
    
    [self.iconView.layer addAnimation:anim forKey:nil];
}

- (IBAction)next {
    
    self.index ++;
    NSLog(@"self.index = %d",self.index);
    if (self.index == 9) {
        self.index = 0;
    }
    NSString *pagePrevious = [NSString stringWithFormat:@"%d.jpg",self.index + 1];
    
    self.iconView.image = [UIImage imageNamed:pagePrevious];
    
    CATransition *anim = [CATransition animation];
    
    anim.type = @"pageCurl";
    
    anim.startProgress = 0.7;
    
    anim.duration = 2.0;
    
    anim.subtype = kCATransitionFromLeft;
    
    [self.iconView.layer addAnimation:anim forKey:nil];
}
@end
