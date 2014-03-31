//
//  AnimatedLabel.h
//  AnimatedLabelExample
//
//  Created by Gregoire on 3/28/14.
//  Copyright (c) 2014 jhurrayApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClearTextLabel.h"


typedef NS_ENUM(NSInteger, LabelAnimationType) {

    LabelAnimationTypeSlide,
    LabelAnimationTypeBounce,
    LabelAnimationTypeBounceDissapearing
};


@interface AnimatedLabel : UIView

@property (nonatomic, strong) ClearTextLabel *textLabel;
@property (nonatomic, strong)UIView *worker;
@property BOOL restarts;


- (id)initWithFrame:(CGRect)frame andAnimationType:(LabelAnimationType)type;

@end
