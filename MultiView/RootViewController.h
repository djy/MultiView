//
//  RootViewController.h
//  MultiView
//
//  Created by djy dda on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FirstViewController;
@class SecondViewController;

@interface RootViewController : UIViewController
@property (strong,nonatomic) FirstViewController *firstViewController;
@property (strong,nonatomic) SecondViewController *secondViewController;

- (IBAction)switchView:(id)sender;

@end
