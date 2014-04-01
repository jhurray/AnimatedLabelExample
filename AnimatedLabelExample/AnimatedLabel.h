//
//  AnimatedLabel.h
//  AnimatedLabelExample
//
//  Created by Gregoire on 3/28/14.
//  Copyright (c) 2014 jhurrayApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClearTextLabel.h"

#define DEVICEHEIGHT [[UIScreen mainScreen] bounds].size.height
#define DEVICEWIDTH [[UIScreen mainScreen] bounds].size.width


typedef NS_ENUM(NSInteger, LabelAnimationType) {

    LabelAnimationTypeSlide,
    LabelAnimationTypeBounce,
    LabelAnimationTypeBounceDissapearing
};


@interface AnimatedLabel : UIView

@property (nonatomic, strong) ClearTextLabel *textLabel;
@property (nonatomic, strong)UIImageView *worker;
@property BOOL restarts;
@property LabelAnimationType type;


- (id)initWithFrame:(CGRect)frame andAnimationType:(LabelAnimationType)type;
-(void)setColor:(UIColor *)color orImageNamed:(NSString *)imageName;
-(void)restartAnimations;

@end
