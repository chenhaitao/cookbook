//
//  ViewController.h
//  DeleteTableViewCell
//
//  Created by 陈 海涛 on 13-5-23.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTableView;
@end
