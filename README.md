首先上运行结果：
![运行结果](http://img.blog.csdn.net/20160412185235537)
# 前言
我们项目最近需要写一个日历的功能，我在这之前也是没有写过这个。然后自己就去查API，去看别人的讲解。貌似通了一些，又貌似没通。哈哈，把我写的我们的最初定的实现效果拿出来，大家如果有需要可以看一下。自己写一下，不要做拿来党，不然到时候如果运行有错误，你改都不知道去哪修改。

# 思想
其实日历比较好写的，因为苹果已经把你所需要的API都给你提供了，你只需要调用就行了。我个人感觉只是在把当月天数排布的时候麻烦一点点，我个人采用一个数组加载所有的数据的形式去展示。当然八仙过海，各显神通，这个看个人的理解。
我的排布代码：
```
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

```
# 结束
至此结束，哈哈

#内链
2016.5.24 重新布局，增加了左右滑动翻月的功能，把功能类进行了封装，如果有兴趣，[传送门](https://github.com/sunyunfei/YFCalendar.git)
