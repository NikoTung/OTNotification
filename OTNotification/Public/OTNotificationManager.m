//
//  OTNotificationManager.m
//  OTNotificationDemo
//
//  Created by openthread on 8/15/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OTNotificationManager.h"
#import "ComOpenthreadOTNotificationMessageWindow.h"

@implementation OTNotificationManager
{
    ComOpenthreadOTNotificationMessageWindow *_window;
}

#pragma mark - Get notificatio manager instance

+ (OTNotificationManager *)defaultManager
{
    static OTNotificationManager *manager = nil;
    if (!manager)
    {
        manager = [[OTNotificationManager alloc] init];
    }
    return manager;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _window = [ComOpenthreadOTNotificationMessageWindow sharedInstance];
    }
    return self;
}

#pragma mark - Notification Methods

//Post notification message
- (void)postNotificationMessage:(OTNotificationMessage *)message
{
    [_window postNotificationMessage:message];
}

//Remove notification message
- (void)removeNotificationMessage:(OTNotificationMessage *)message
{
    [_window removeNotificationMessage:message];
}

//Post notification view
- (void)postNotificationView:(UIView/*<OTNotificationViewProtocol>*/ *)view
{
    [_window postNotificationView:view];
}

//Remove unappeared notification view. will take no effect on showing view and showed view.
- (void)removeNotificationView:(UIView *)view
{
    [_window removeNotificationView:view];
}

#pragma mark - Check if notification window is hidden.

//Check if notification window is hidden. Default is YES.
- (BOOL)isNotificationWindowHidden
{
    return _window.hidden;
}

#pragma mark - Rotating Methods

//Auto rotate, default is `YES`.
- (BOOL)shouldNotificationAutoRotateToInterfaceOrientation
{
    return _window.shouldAutoRotateToInterfaceOrientation;
}

- (void)setShouldNotificationAutoRotateToInterfaceOrientation:(BOOL)shouldNotificationAutoRotateToInterfaceOrientation
{
    _window.shouldAutoRotateToInterfaceOrientation = shouldNotificationAutoRotateToInterfaceOrientation;
}

//Manual rotate
- (void)setWindowOrientation:(UIInterfaceOrientation)o
{
    [_window setWindowOrientation:o];
}

- (void)setWindowOrientation:(UIInterfaceOrientation)o
                    animated:(BOOL)animated
{
    [_window setWindowOrientation:o animated:animated];
}
- (void)setWindowOrientation:(UIInterfaceOrientation)o
                    animated:(BOOL)animated
           animationDuration:(NSTimeInterval)animationDuration
{
    [_window setWindowOrientation:o animated:animated animationDuration:animationDuration];
}


@end
