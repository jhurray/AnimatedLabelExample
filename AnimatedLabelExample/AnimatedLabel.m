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
#define SPLITVAL 0.5
#define FONT @"Times-Bold"
#define ANIMATIONDURATION 1.7
#define DISSAPEARRATIO 1.5

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
        [textLabel setText:@"Slide to unlock..."];
        [textLabel setFont:[UIFont fontWithName:FONT size:30]];
        [textLabel setAdjustsFontSizeToFitWidth:YES];
        [textLabel setAlpha:1.0];
        [textLabel setNeedsDisplay];
        
        // configure worker
        worker = [[UIImageView alloc] initWithFrame:CGRectMake(-frame.size.width/(SPLITVAL*2), 0, frame.size.width/SPLITVAL, frame.size.height-2)];
        [worker setBackgroundColor:FLASHCOLOR];
        //for rounded edges
        //[worker.layer setCornerRadius:worker.frame.size.width/4];
        UIImage *rainbowGradient = [UIImage imageNamed:@"blueGradient.png"];
        [worker setImage:rainbowGradient];
        [worker.layer setMasksToBounds:YES];
        [self addSubview:worker];
        [self addSubview:textLabel];
        
        self.type = type;
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

/*
 This function should be called in view will appear of a view controller
*/
-(void)restartAnimations
{
    // remove animations
    [self.worker.layer removeAllAnimations];
    // add them again
    switch (self.type) {
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

-(void)setColor:(UIColor *)color orImageNamed:(NSString *)imageName
{
    if (color) {
        [worker setBackgroundColor:color];
    }
    if (imageName) {
        worker.image = [UIImage imageNamed:imageName];
    }
}

-(void)animateWorkerSlideThrough
{
    CGFloat offset = worker.frame.size.width;
    CABasicAnimation *slide = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [slide setRepeatCount:HUGE_VALF];
    [slide setDuration:ANIMATIONDURATION*DISSAPEARRATIO];
    [slide setToValue:[NSNumber numberWithFloat:DEVICEWIDTH+offset]];
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
    [bounce setDuration:ANIMATIONDURATION*DISSAPEARRATIO];
    [bounce setAutoreverses:YES];
    [bounce setToValue:[NSNumber numberWithFloat:DEVICEWIDTH+offset]];
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
