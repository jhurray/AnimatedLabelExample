//
//  AnimatedLabel.m
//  AnimatedLabelExample
//
//  Created by Gregoire on 3/28/14.
//  Copyright (c) 2014 jhurrayApps. All rights reserved.
//

#define CLEAR [UIColor clearColor]
#define BACKGROUNDCOLOR [UIColor darkGrayColor]
#define FLASHCOLOR [UIColor blueColor]
#define SPLITVAL 2
#define FONT @"Times"

#import "AnimatedLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation AnimatedLabel
@synthesize textLabel, worker;


- (id)initWithFrame:(CGRect)frame andAnimationType:(LabelAnimationType)type
{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        //configure self
        [self setBackgroundColor:FRONTCOLOR];
        [self setRestarts:YES];
        
        //configure text label
        textLabel = [[ClearTextLabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [textLabel setTextAlignment:NSTextAlignmentCenter];
        [textLabel setTextColor:FRONTCOLOR];
        [textLabel setBackgroundColor:CLEAR];
        [textLabel setText:@"Loading dat shit nigga..."];
        [textLabel setFont:[UIFont fontWithName:FONT size:30]];
        [textLabel setAdjustsFontSizeToFitWidth:YES];
        [textLabel setAlpha:1.0];
        [textLabel setNeedsDisplay];
        
        // configure worker
        worker = [[UILabel alloc] initWithFrame:CGRectMake(-frame.size.width/(SPLITVAL*2), 0, frame.size.width/SPLITVAL, frame.size.height)];
        [worker setBackgroundColor:FLASHCOLOR];
        [worker.layer setCornerRadius:worker.frame.size.width/2];
        [self addSubview:worker];
        [self addSubview:textLabel];
        
        switch (type) {
            case LabelAnimationTypeBounce:
                
                [self animateWorkerBackAndForthWithDissapears:NO];
                
                break;
            case LabelAnimationTypeSlide:
                
                [self animateWorkerSlideThrough];
                
                break;
            case LabelAnimationTypeBounceDissapearing:
                
                [self animateWorkerBackAndForthWithDissapears:YES];
                
                break;
            default:
                assert(0);
                break;
        }
    }
    return self;
}


-(void)animateWorkerSlideThrough
{
    CGFloat offset = worker.frame.size.width;
    CABasicAnimation *slide = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [slide setRepeatCount:HUGE_VALF];
    [slide setDuration:1.7];
    [slide setToValue:[NSNumber numberWithFloat:320+offset]];
    [slide setFromValue:[NSNumber numberWithFloat:-offset]];
    [worker.layer addAnimation:slide forKey:@"slide"];
    
}

-(void)animateWorkerBackAndForthWithDissapears:(BOOL)dissapears
{
    CGFloat offset = 0;
    if (dissapears) {
        offset = worker.frame.size.width;
    }
    
    CABasicAnimation *bounce = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [bounce setRepeatCount:HUGE_VALF];
    [bounce setDuration:1.0];
    [bounce setAutoreverses:YES];
    [bounce setToValue:[NSNumber numberWithFloat:320+offset]];
    [bounce setFromValue:[NSNumber numberWithFloat:-offset]];
    [worker.layer addAnimation:bounce forKey:@"bounce"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
