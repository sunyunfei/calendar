//
//  ViewController.m
//  日历相关
//
//  Created by 孙云 on 16/4/12.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ViewController.h"
#import "CalenderView.h"
#import "SSLunarDate.h"
@interface ViewController ()
{

    NSDate *date;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //当前时间
//    date = [NSDate date];
//    NSLog(@"%@",date);
//    
//    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
//    NSLog(@"天数===%ld",(long)[components day]);
//    
//    NSDateComponents *componentsMonth = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
//    NSLog(@"月数==%ld",(long)[componentsMonth month]);
//    
//    NSDateComponents *componentsYear = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
//    NSLog(@"年份===%ld",(long)[componentsYear year]);
//    
//    
//    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
//    NSLog(@"这个月有几天＝ %lu",(unsigned long)totaldaysInMonth.length);
//    
//    
//    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    [calendar setFirstWeekday:2];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
//    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
//    [comp setDay:1];
//    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
//    
//    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
//    NSLog(@"%lu",firstWeekday - 1);
//    switch (firstWeekday - 1) {
//        case 7:
//            NSLog(@"星期日");
//            break;
//        case 1:
//            NSLog(@"星期一");
//            break;
//        case 2:
//            NSLog(@"星期二");
//            break;
//        case 3:
//            NSLog(@"星期三");
//            break;
//        case 4:
//            NSLog(@"星期四");
//            break;
//        case 5:
//            NSLog(@"星期五");
//            break;
//        case 6:
//            NSLog(@"星期六");
//            break;
//            
//        default:
//            break;
//    }
//    
//    
//    
//    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
//    NSLog(@"%lu",(unsigned long)daysInLastMonth.length);
//    
//    
//    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
//    dateComponents.month = +1;
//    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
//    NSLog(@"时间=====%@",newDate);
    
    
    CalenderView *calenderView = [CalenderView createCalenderView];
    calenderView.frame = self.view.bounds;
    [self.view addSubview:calenderView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
