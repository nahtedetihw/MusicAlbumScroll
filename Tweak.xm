#import "Tweak.h"
#import <AudioToolbox/AudioServices.h>

BOOL enabled;
BOOL enableInNowPlaying;
HBPreferences *preferences;
static double horizontalSpacing;
static double verticalSpacing;
static double albumHeight;
static double albumWidth;
BOOL enableRoundedArtwork;
BOOL disableVerticalScrolling;
BOOL enableHorizontalScrolling;
BOOL enableUnlimitedRecentlyAdded;
UIImageView *musicImageView;

@implementation UIView (FindUIViewController)
- (UIViewController *) firstAvailableViewController {
    // convenience function for casting and to "mask" the recursive function
    return (UIViewController *)[self traverseResponderChainForViewController];
}

- (id) traverseResponderChainForViewController {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForViewController];
    } else {
        return nil;
    }
}
@end

%group MusicAlbumScroll

%hook UICollectionView

-(void)layoutSubviews {
if (enableHorizontalScrolling) {
    %orig;

    UICollectionView *collectionview = (UICollectionView *)self;
    if([NSStringFromClass([((UICollectionView *)self).dataSource class]) isEqualToString:@"MusicApplication.LibraryRecentlyAddedViewController"]) {
    %orig;
    collectionview.collectionViewLayout.scrollDirection = 1;
    collectionview.collectionViewLayout.sectionInset = UIEdgeInsetsMake(0,-314,0,0);
    collectionview.collectionViewLayout.itemSize = CGSizeMake(albumHeight, albumWidth);
    collectionview.collectionViewLayout.minimumLineSpacing = horizontalSpacing;
    collectionview.collectionViewLayout.minimumInteritemSpacing = verticalSpacing;
    collectionview.clipsToBounds = NO;
}
%orig;
}
%orig;
}

%end

%hook MPModelLibraryRequest

- (void)setContentRange:(NSRange)range {
if (enableUnlimitedRecentlyAdded) {
    range.length = 9000 * 900;
    %orig;
}
%orig;
}

%end

%hook MusicNowPlayingContentView

- (void)layoutSubviews {
%orig;
[((UIView *)self).layer setShadowOpacity:0];
}
%end

%hook MusicRecentlyAdded

- (void)layoutSubviews {
if (enableHorizontalScrolling) {
%orig;
    UIView *titleview = (UIView *)self;
    if([NSStringFromClass([((UIView *)self) class]) isEqualToString:@"MusicApplication.TitleSectionHeaderView"] && [NSStringFromClass([((UIView *)self).firstAvailableViewController class]) isEqualToString:@"MusicApplication.LibraryRecentlyAddedViewController"]) {
    titleview.hidden = YES;
}
%orig;
}
%orig;
}

%end

%hook UIImageView

- (void)layoutSubviews {
if (enableRoundedArtwork) {
if (enableInNowPlaying) {
%orig;
if([self isKindOfClass:[UIImageView class]] && [NSStringFromClass([self class]) isEqualToString:@"MusicApplication.ArtworkComponentImageView"] && ![NSStringFromClass([self.superview class]) isEqualToString:@"MusicApplication.PromotionalParallaxContentView"] && ![NSStringFromClass([self.superview.superview class]) isEqualToString:@"MusicApplication.FeaturedMusicVideoVerticalCell"] && ![NSStringFromClass([self.superview.superview class]) isEqualToString:@"MusicApplication.MusicVideoVerticalCell"]) {
UIImage *musicImage = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/musicalbumscrollprefs.bundle/mask.png"];
musicImageView = [[UIImageView alloc] initWithImage:musicImage];
musicImageView.frame = self.bounds;
self.maskView = musicImageView;
self.layer.masksToBounds = YES;
self.layer.shadowOpacity = 0.0;
self.layer.borderWidth = 0;
}
%orig;
} else {
%orig;
if([self isKindOfClass:[UIImageView class]] && [NSStringFromClass([self class]) isEqualToString:@"MusicApplication.ArtworkComponentImageView"] && ![NSStringFromClass([self.superview class]) isEqualToString:@"MusicApplication.NowPlayingContentView"] && ![NSStringFromClass([self.superview class]) isEqualToString:@"MusicApplication.PromotionalParallaxContentView"] && ![NSStringFromClass([self.superview.superview class]) isEqualToString:@"MusicApplication.FeaturedMusicVideoVerticalCell"] && ![NSStringFromClass([self.superview.superview class]) isEqualToString:@"MusicApplication.MusicVideoVerticalCell"]) {
UIImage *musicImage = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/musicalbumscrollprefs.bundle/mask.png"];
musicImageView = [[UIImageView alloc] initWithImage:musicImage];
musicImageView.frame = self.bounds;
self.maskView = musicImageView;
self.layer.masksToBounds = YES;
self.layer.shadowOpacity = 0.0;
self.layer.borderWidth = 0;
}
%orig;
}
%orig;
}
%orig;
}
%end

%hook UIScrollView
- (void)layoutSubviews {
if([NSStringFromClass([((UIScrollView *)self) class]) isEqualToString:@"_TtCC16MusicApplication27VerticalStackViewController10ScrollView"] && [NSStringFromClass([((_TtCC16MusicApplication27VerticalStackViewController10ScrollView *)self).firstAvailableViewController class]) isEqualToString:@"MusicApplication.LibraryViewController"]) {
%orig;
self.contentInset = UIEdgeInsetsMake(0,0,0,0);
if (disableVerticalScrolling) {
self.scrollEnabled = NO;
}
%orig;
}
%orig;
}
%end
%end


%ctor {

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.nahtedetihw.musicalbumscrollprefs"];
    [preferences registerBool:&enabled default:NO forKey:@"enabled"];
    [preferences registerDouble:&horizontalSpacing default:10 forKey:@"horizontalSpacing"];
    [preferences registerDouble:&verticalSpacing default:12 forKey:@"verticalSpacing"];
    [preferences registerDouble:&albumHeight default:150 forKey:@"albumHeight"];
    [preferences registerDouble:&albumWidth default:190 forKey:@"albumWidth"];
    [preferences registerBool:&enableRoundedArtwork default:NO forKey:@"enableRoundedArtwork"];
    [preferences registerBool:&disableVerticalScrolling default:NO forKey:@"disableVerticalScrolling"];
    [preferences registerBool:&enableHorizontalScrolling default:NO forKey:@"enableHorizontalScrolling"];
    [preferences registerBool:&enableUnlimitedRecentlyAdded default:NO forKey:@"enableUnlimitedRecentlyAdded"];
    [preferences registerBool:&enableInNowPlaying default:NO forKey:@"enableInNowPlaying"];
    
    
    if (enabled) {
    %init(MusicAlbumScroll, MusicRecentlyAdded = NSClassFromString(@"MusicApplication.TitleSectionHeaderView"), MusicNowPlayingContentView = NSClassFromString(@"MusicApplication.NowPlayingContentView"));
    
    return;
    
    }

    return;

}
