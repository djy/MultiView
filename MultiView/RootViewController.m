//
//  RootViewController.m
//  MultiView
//
//  Created by djy dda on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation RootViewController

@synthesize firstViewController;
@synthesize secondViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)switchView:(id)sender{
    [UIView beginAnimations:@"View Filp" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if (self.secondViewController.view.superview == nil) {
        if (self.secondViewController == nil) {
            self.secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        [self.firstViewController.view removeFromSuperview];
        [self.view insertSubview:self.secondViewController.view atIndex:0];
    }else{
        if (self.firstViewController == nil) {
            self.firstViewController = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
        }
        [UIView setAnimationTransition:	UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
        [self.secondViewController.view removeFromSuperview];
        [self.view insertSubview:self.firstViewController.view atIndex:0];
    }
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    if (self.firstViewController.view.superview == nil) {
        self.firstViewController = nil;
    } else {
        self.secondViewController = nil;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.firstViewController = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    
    [self.view insertSubview:self.firstViewController.view atIndex:0];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
