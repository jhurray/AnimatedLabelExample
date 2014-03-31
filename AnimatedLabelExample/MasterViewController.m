//
//  MasterViewController.m
//  AnimatedLabelExample
//
//  Created by Gregoire on 3/28/14.
//  Copyright (c) 2014 jhurrayApps. All rights reserved.
//



#import "MasterViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

@synthesize animatedLabel1, animatedLabel2, animatedLabel3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
        animatedLabel1 = [[AnimatedLabel alloc] initWithFrame:CGRectMake(0, DEVICEHEIGHT/4, DEVICEWIDTH, DEVICEHEIGHT/5) andAnimationType:LabelAnimationTypeSlide];
        [self.view addSubview:animatedLabel1];
        
        animatedLabel2 = [[AnimatedLabel alloc] initWithFrame:CGRectMake(0, 2*DEVICEHEIGHT/4, DEVICEWIDTH, DEVICEHEIGHT/5) andAnimationType:LabelAnimationTypeBounceDissapearing];
        [self.view addSubview:animatedLabel2];
        
        animatedLabel3 = [[AnimatedLabel alloc] initWithFrame:CGRectMake(0, 3*DEVICEHEIGHT/4, DEVICEWIDTH, DEVICEHEIGHT/5) andAnimationType:LabelAnimationTypeBounce];
        [self.view addSubview:animatedLabel3];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
