//
//  CalenderView.m
//  日历相关
//
//  Created by 孙云 on 16/4/12.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "CalenderView.h"
#import "CalenderCell.h"
static NSString * const CALENDER = @"CalenderCell";
@interface CalenderView()
{

    //对应的星期
    NSArray *timerArray;
    //本月的总天数
    NSMutableArray *allDayArray;
}
@end
@implementation CalenderView
/**
 *  构造方法
 *
 *  @return <#return value description#>
 */
+ (instancetype)createCalenderView{

    CalenderView *calenderView = [[[NSBundle mainBundle]loadNibNamed:@"CalenderView" owner:nil options:nil] lastObject];
    return calenderView;
}
- (void)awakeFromNib{
    
    timerArray = @[@"一",@"二",@"三",@"四",@"五",@"六",@"日"];
    
    _date = [NSDate date];
    [self setShowDateLabelString:_date];
    
    [self setCollectionViewLayout];
    //九宫格
    [_collectionView registerNib:[UINib nibWithNibName:CALENDER bundle:nil] forCellWithReuseIdentifier:CALENDER];
}
/**
 *  点击上月
 *
 *  @param sender <#sender description#>
 */
- (IBAction)clickPreBtn:(id)sender {
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:_date options:0];
    [self setShowDateLabelString:newDate];
    _date = newDate;
    [_collectionView reloadData];
}

- (IBAction)clickNextBtn:(id)sender {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:_date options:0];
    [self setShowDateLabelString:newDate];
    _date = newDate;
    [_collectionView reloadData];
}
/**
 *  设置九宫格的属性
 */
- (void)setCollectionViewLayout{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    layout.itemSize = CGSizeMake(width / 7, width / 10);
    layout.minimumLineSpacing = 0.0;
    layout.minimumInteritemSpacing = 0.0;
    
    [_collectionView setCollectionViewLayout:layout];
}
/**
 *  label的set方法
 *
 *  @param showDateLabel <#showDateLabel description#>
 */
- (void)setShowDateLabelString:(NSDate *)date{

    self.showDateLabel.text = [NSString stringWithFormat:@"%li年%li月",(long)[self currentYear:date],(long)[self currentMonth:date]];
}
/**
 *  获取当前月的年份
 */
- (NSInteger)currentYear:(NSDate *)date{

    NSDateComponents *componentsYear = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [componentsYear year];
}
/**
 *  获取当前月的月份
 */
- (NSInteger)currentMonth:(NSDate *)date{

    NSDateComponents *componentsMonth = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [componentsMonth month];
}
/**
 *  获取当前是哪一天
 *
 *  @param date <#date description#>
 *
 *  @return <#return value description#>
 */
- (NSInteger)currentDay:(NSDate *)date{

    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}
/**
 *  本月又几天
 *
 *  @param date <#date description#>
 *
 *  @return <#return value description#>
 */
- (NSInteger)currentMonthOfDay:(NSDate *)date{

    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return totaldaysInMonth.length;
}
/**
 *  本月第一天是星期几
 *
 *  @param date <#date description#>
 *
 *  @return <#return value description#>
 */
- (NSInteger)currentFirstDay:(NSDate *)date{

    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:2];//1.mon
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}
#pragma mark-----------------------------
#pragma mark-----表的代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * const ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:ID];
    }
    cell.textLabel.text = @"添加事件";
    return cell;
}
#pragma mark-----------------------------
#pragma mark---九宫格代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return timerArray.count;
    } else {
        return 42;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CalenderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CALENDER forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.dateLabel.text = timerArray[indexPath.row];
        cell.dateLabel.font = [UIFont systemFontOfSize:14];
        cell.dateLabel.textColor = [UIColor colorWithRed:1.0
                                                   green:0.0
                                                    blue:0.0
                                                   alpha:0.495803420608108];
    }else{
        cell.dateLabel.textColor = [UIColor colorWithRed:0.0
                                                   green:0.0
                                                    blue:0.0
                                                   alpha:0.495803420608108];
        //获得本月第一天在星期几
        allDayArray = [NSMutableArray array];
        NSInteger day = [self currentFirstDay:_date];
        for (NSInteger i = 0; i < day; i++){
            [allDayArray addObject:@""];
        }

            NSInteger days = [self currentMonthOfDay:_date];
            
            for (NSInteger i = 1; i <= days; i++) {
                [allDayArray addObject:@(i)];
            }
        //把剩下的空间置为空
        for (NSInteger i = allDayArray.count; i < 42; i ++) {
            [allDayArray addObject:@""];
        }
        cell.dateLabel.text = [NSString stringWithFormat:@"%@",allDayArray[indexPath.row]];

    }
    return cell;
}
/**
 *  选择单元格
 *
 *  @param collectionView <#collectionView description#>
 *  @param indexPath      <#indexPath description#>
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSString *cellString = allDayArray[indexPath.row];
    if (![cellString isEqual:@""]) {
        NSLog(@"%li年 %li月 %@日 ",(long)[self currentYear:_date],(long)[self currentMonth:_date],cellString);
    }
}
@end
