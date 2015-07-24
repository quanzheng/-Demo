//
//  ViewController.m
//  Time
//
//  Created by 全政 on 15/6/10.
//  Copyright (c) 2015年 全政. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *hourHand;
    UIView *minuteHand;
    UIView *secondHand;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *timeView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-150, self.view.frame.size.height/2-150, 300, 300)];
    timeView.layer.masksToBounds = YES;
    timeView.layer.cornerRadius = 150;
    timeView.backgroundColor = [UIColor clearColor];
    timeView.layer.borderColor = [UIColor blackColor].CGColor;
    timeView.layer.borderWidth = 1;
    [self.view addSubview:timeView];
    
    secondHand = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 130)];
    secondHand.center = timeView.center;
    secondHand.backgroundColor = [UIColor redColor];
    secondHand.layer.anchorPoint = CGPointMake(0.5f, 0.9);
    [self.view addSubview:secondHand];
    
    minuteHand = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 100)];
    minuteHand.center = timeView.center;
    minuteHand.backgroundColor = [UIColor blackColor];
    minuteHand.layer.anchorPoint = CGPointMake(0.5f, 0.9);
    [self.view addSubview:minuteHand];

    hourHand = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 70)];
    hourHand.center = timeView.center;
    hourHand.backgroundColor = [UIColor blackColor];
    hourHand.layer.anchorPoint = CGPointMake(0.5f, 0.9);
    [self.view addSubview:hourHand];
    
    
    UILabel *twelve = [[UILabel alloc] initWithFrame:CGRectMake(timeView.bounds.size.width/2-15, 0, 30, 30)];
    twelve.text = @"12";
    [timeView addSubview:twelve];
    
    UILabel *three = [[UILabel alloc] initWithFrame:CGRectMake(timeView.bounds.size.width-15, timeView.bounds.size.height/2-15, 30, 30)];
    three.text = @"3";
    [timeView addSubview:three];
    
    UILabel *six = [[UILabel alloc] initWithFrame:CGRectMake(timeView.bounds.size.width/2-15, timeView.bounds.size.height-30, 30, 30)];
    six.text = @"6";
    [timeView addSubview:six];
    
    UILabel *nine = [[UILabel alloc] initWithFrame:CGRectMake(0, timeView.bounds.size.height/2-15, 30, 30)];
    nine.text = @"9";
    [timeView addSubview:nine];

    
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tranfor) userInfo:nil repeats:YES];
    [timer fire];
}

#pragma mark - Animation 
- (void)tranfor {
    NSLog(@"1");
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    //calculate hour hand angle //calculate minute hand angle
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    //calculate second hand angle
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    //rotate hands
    hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
    minuteHand.transform = CGAffineTransformMakeRotation(minsAngle);
    secondHand.transform = CGAffineTransformMakeRotation(secsAngle);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
