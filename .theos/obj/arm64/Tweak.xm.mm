#line 1 "Tweak.xm"
#import "Tweak.h"
#import <AudioToolbox/AudioServices.h>

BOOL enabled;
HBPreferences *preferences;
UIImageView *playingImageView;
UIImageView *pausedImageView;

@implementation UIImage (Resize)

- (UIImage*)scaleToSize:(CGSize)size {
UIGraphicsBeginImageContext(size);

CGContextRef context = UIGraphicsGetCurrentContext();
CGContextTranslateCTM(context, 0.0, size.height);
CGContextScaleCTM(context, 1.0, -1.0);

CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, size.width, size.height), self.CGImage);

UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();

UIGraphicsEndImageContext();

return scaledImage;
}

@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SPTNowPlayingNextTrackButton; @class SPTNowPlayingPlayButtonV2; @class SPTNowPlayingPreviousTrackButton; 


#line 29 "Tweak.xm"
static CGSize (*_logos_orig$SpotifyUI$SPTNowPlayingPlayButtonV2$circleSize)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST, SEL); static CGSize _logos_method$SpotifyUI$SPTNowPlayingPlayButtonV2$circleSize(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$SpotifyUI$SPTNowPlayingPlayButtonV2$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST, SEL); static void _logos_method$SpotifyUI$SPTNowPlayingPlayButtonV2$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$SpotifyUI$SPTNowPlayingNextTrackButton$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST, SEL); static void _logos_method$SpotifyUI$SPTNowPlayingNextTrackButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$SpotifyUI$SPTNowPlayingPreviousTrackButton$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST, SEL); static void _logos_method$SpotifyUI$SPTNowPlayingPreviousTrackButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST, SEL); 




static CGSize _logos_method$SpotifyUI$SPTNowPlayingPlayButtonV2$circleSize(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return CGSizeMake(0, 0);
}


static void _logos_method$SpotifyUI$SPTNowPlayingPlayButtonV2$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (!self.isPlaying) {
    UIImage *playingImage = [UIImage systemImageNamed:@"play.circle.fill"];
    for (UIImageView *subview in [((UIButton *)self) subviews]) {
    if([subview isEqual:[[((UIButton *)self) subviews] objectAtIndex:0]]) {
    subview.contentMode = UIViewContentModeScaleAspectFit;
    }
    }
    [self setBackgroundImage:playingImage forState:UIControlStateNormal];
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    self.tintColor = self.fillColor;
    } else {
    UIImage *pausedImage = [UIImage systemImageNamed:@"pause.circle.fill"];
    for (UIImageView *subview in [((UIButton *)self) subviews]) {
    if([subview isEqual:[[((UIButton *)self) subviews] objectAtIndex:0]]) {
    subview.contentMode = UIViewContentModeScaleAspectFit;
    }
    }
    [self setBackgroundImage:pausedImage forState:UIControlStateNormal];
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    self.tintColor = self.fillColor;
    }
    _logos_orig$SpotifyUI$SPTNowPlayingPlayButtonV2$layoutSubviews(self, _cmd);
}






static void _logos_method$SpotifyUI$SPTNowPlayingNextTrackButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$SpotifyUI$SPTNowPlayingNextTrackButton$layoutSubviews(self, _cmd);
    UIImage *nextImage = [UIImage systemImageNamed:@"forward.end.fill"];
    UIImage *blankImage = [[UIImage alloc] init];
    for (UIImageView *subview in [((UIButton *)self) subviews]) {
    if([subview isEqual:[[((UIButton *)self) subviews] objectAtIndex:0]]) {
    subview.contentMode = UIViewContentModeScaleAspectFit;
    }
    }
    [self setImage:blankImage forState:UIControlStateNormal];
    [self setBackgroundImage:nextImage forState:UIControlStateNormal];
}






static void _logos_method$SpotifyUI$SPTNowPlayingPreviousTrackButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$SpotifyUI$SPTNowPlayingPreviousTrackButton$layoutSubviews(self, _cmd);
    UIImage *previousImage = [UIImage systemImageNamed:@"backward.end.fill"];
    UIImage *blankImage = [[UIImage alloc] init];
    for (UIImageView *subview in [((UIButton *)self) subviews]) {
    if([subview isEqual:[[((UIButton *)self) subviews] objectAtIndex:0]]) {
    subview.contentMode = UIViewContentModeScaleAspectFit;
    }
    }
    [self setImage:blankImage forState:UIControlStateNormal];
    UIImage* newPreviousImage = [previousImage scaleToSize:CGSizeMake(50.0f,50.0f)];
    [self setBackgroundImage:newPreviousImage forState:UIControlStateNormal];
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    self.tintColor = self.iconColor;
}






static __attribute__((constructor)) void _logosLocalCtor_7fe63bfc(int __unused argc, char __unused **argv, char __unused **envp) {

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.nahtedetihw.spotifyuiprefs"];
    [preferences registerBool:&enabled default:NO forKey:@"enabled"];
    
    
    if (enabled) {
    {Class _logos_class$SpotifyUI$SPTNowPlayingPlayButtonV2 = objc_getClass("SPTNowPlayingPlayButtonV2"); { MSHookMessageEx(_logos_class$SpotifyUI$SPTNowPlayingPlayButtonV2, @selector(circleSize), (IMP)&_logos_method$SpotifyUI$SPTNowPlayingPlayButtonV2$circleSize, (IMP*)&_logos_orig$SpotifyUI$SPTNowPlayingPlayButtonV2$circleSize);}{ MSHookMessageEx(_logos_class$SpotifyUI$SPTNowPlayingPlayButtonV2, @selector(layoutSubviews), (IMP)&_logos_method$SpotifyUI$SPTNowPlayingPlayButtonV2$layoutSubviews, (IMP*)&_logos_orig$SpotifyUI$SPTNowPlayingPlayButtonV2$layoutSubviews);}Class _logos_class$SpotifyUI$SPTNowPlayingNextTrackButton = objc_getClass("SPTNowPlayingNextTrackButton"); { MSHookMessageEx(_logos_class$SpotifyUI$SPTNowPlayingNextTrackButton, @selector(layoutSubviews), (IMP)&_logos_method$SpotifyUI$SPTNowPlayingNextTrackButton$layoutSubviews, (IMP*)&_logos_orig$SpotifyUI$SPTNowPlayingNextTrackButton$layoutSubviews);}Class _logos_class$SpotifyUI$SPTNowPlayingPreviousTrackButton = objc_getClass("SPTNowPlayingPreviousTrackButton"); { MSHookMessageEx(_logos_class$SpotifyUI$SPTNowPlayingPreviousTrackButton, @selector(layoutSubviews), (IMP)&_logos_method$SpotifyUI$SPTNowPlayingPreviousTrackButton$layoutSubviews, (IMP*)&_logos_orig$SpotifyUI$SPTNowPlayingPreviousTrackButton$layoutSubviews);}}
    
    return;
    
    }

    return;

}
