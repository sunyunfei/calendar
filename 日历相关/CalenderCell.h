//
//  CalenderCell.h
//  日历相关
//
//  Created by 孙云 on 16/4/12.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalenderCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *lunarLabel;

@end
