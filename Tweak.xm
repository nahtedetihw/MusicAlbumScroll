#import "Tweak.h"
#import <AudioToolbox/AudioServices.h>

BOOL enabled;
HBPreferences *preferences;
UIImageView *playingImageView;
UIImageView *pausedImageView;

%group SpotifyUI

%hook SPTNowPlayingPlayButtonV2

// Remove the existing Play/Pause Button image
- (CGSize)circleSize {
    return CGSizeMake(0, 0);
}

// Set a new Play/Pause Button image
-(void)layoutSubviews {
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
    %orig;
}

%end

%hook SPTNowPlayingNextTrackButton

// Set the Next Button image
-(void)layoutSubviews {
    %orig;
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

%end

%hook SPTNowPlayingPreviousTrackButton

// Set the Previous Button image
-(void)layoutSubviews {
    %orig;
    UIImage *previousImage = [UIImage systemImageNamed:@"backward.end.fill"];
    UIImage *blankImage = [[UIImage alloc] init];
    for (UIImageView *subview in [((UIButton *)self) subviews]) {
    if([subview isEqual:[[((UIButton *)self) subviews] objectAtIndex:0]]) {
    subview.contentMode = UIViewContentModeScaleAspectFit;
    }
    }
    [self setImage:blankImage forState:UIControlStateNormal];
    [self setBackgroundImage:previousImage forState:UIControlStateNormal];
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    self.tintColor = self.iconColor;
}

%end

%end


%ctor {

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.nahtedetihw.spotifyuiprefs"];
    [preferences registerBool:&enabled default:NO forKey:@"enabled"];
    
    
    if (enabled) {
    %init(SpotifyUI);
    
    return;
    
    }

    return;

}
