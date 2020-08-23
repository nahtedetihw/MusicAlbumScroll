#line 1 "Tweak.xm"
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

@class MusicNowPlayingContentView; @class UIScrollView; @class UIImageView; @class MPModelLibraryRequest; @class UICollectionView; @class MusicRecentlyAdded; 


#line 35 "Tweak.xm"
static void (*_logos_orig$MusicAlbumScroll$UICollectionView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL UICollectionView* _LOGOS_SELF_CONST, SEL); static void _logos_method$MusicAlbumScroll$UICollectionView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UICollectionView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$MusicAlbumScroll$MPModelLibraryRequest$setContentRange$)(_LOGOS_SELF_TYPE_NORMAL MPModelLibraryRequest* _LOGOS_SELF_CONST, SEL, NSRange); static void _logos_method$MusicAlbumScroll$MPModelLibraryRequest$setContentRange$(_LOGOS_SELF_TYPE_NORMAL MPModelLibraryRequest* _LOGOS_SELF_CONST, SEL, NSRange); static void (*_logos_orig$MusicAlbumScroll$MusicNowPlayingContentView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$MusicAlbumScroll$MusicNowPlayingContentView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$MusicAlbumScroll$MusicRecentlyAdded$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$MusicAlbumScroll$MusicRecentlyAdded$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$MusicAlbumScroll$UIImageView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL UIImageView* _LOGOS_SELF_CONST, SEL); static void _logos_method$MusicAlbumScroll$UIImageView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UIImageView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$MusicAlbumScroll$UIScrollView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST, SEL); static void _logos_method$MusicAlbumScroll$UIScrollView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST, SEL); 



static void _logos_method$MusicAlbumScroll$UICollectionView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UICollectionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
if (enableHorizontalScrolling) {
    _logos_orig$MusicAlbumScroll$UICollectionView$layoutSubviews(self, _cmd);

    UICollectionView *collectionview = (UICollectionView *)self;
    if([NSStringFromClass([((UICollectionView *)self).dataSource class]) isEqualToString:@"MusicApplication.LibraryRecentlyAddedViewController"]) {
    _logos_orig$MusicAlbumScroll$UICollectionView$layoutSubviews(self, _cmd);
    collectionview.collectionViewLayout.scrollDirection = 1;
    collectionview.collectionViewLayout.sectionInset = UIEdgeInsetsMake(0,-314,0,0);
    collectionview.collectionViewLayout.itemSize = CGSizeMake(albumHeight, albumWidth);
    collectionview.collectionViewLayout.minimumLineSpacing = horizontalSpacing;
    collectionview.collectionViewLayout.minimumInteritemSpacing = verticalSpacing;
    collectionview.clipsToBounds = NO;
}
_logos_orig$MusicAlbumScroll$UICollectionView$layoutSubviews(self, _cmd);
}
_logos_orig$MusicAlbumScroll$UICollectionView$layoutSubviews(self, _cmd);
}





static void _logos_method$MusicAlbumScroll$MPModelLibraryRequest$setContentRange$(_LOGOS_SELF_TYPE_NORMAL MPModelLibraryRequest* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSRange range) {
if (enableUnlimitedRecentlyAdded) {
    range.length = 9000 * 900;
    _logos_orig$MusicAlbumScroll$MPModelLibraryRequest$setContentRange$(self, _cmd, range);
}
_logos_orig$MusicAlbumScroll$MPModelLibraryRequest$setContentRange$(self, _cmd, range);
}





static void _logos_method$MusicAlbumScroll$MusicNowPlayingContentView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
_logos_orig$MusicAlbumScroll$MusicNowPlayingContentView$layoutSubviews(self, _cmd);
[((UIView *)self).layer setShadowOpacity:0];
}




static void _logos_method$MusicAlbumScroll$MusicRecentlyAdded$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
if (enableHorizontalScrolling) {
_logos_orig$MusicAlbumScroll$MusicRecentlyAdded$layoutSubviews(self, _cmd);
    UIView *titleview = (UIView *)self;
    if([NSStringFromClass([((UIView *)self) class]) isEqualToString:@"MusicApplication.TitleSectionHeaderView"] && [NSStringFromClass([((UIView *)self).firstAvailableViewController class]) isEqualToString:@"MusicApplication.LibraryRecentlyAddedViewController"]) {
    titleview.hidden = YES;
}
_logos_orig$MusicAlbumScroll$MusicRecentlyAdded$layoutSubviews(self, _cmd);
}
_logos_orig$MusicAlbumScroll$MusicRecentlyAdded$layoutSubviews(self, _cmd);
}





static void _logos_method$MusicAlbumScroll$UIImageView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UIImageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
if (enableRoundedArtwork) {
if (enableInNowPlaying) {
_logos_orig$MusicAlbumScroll$UIImageView$layoutSubviews(self, _cmd);
if([self isKindOfClass:[UIImageView class]] && [NSStringFromClass([self class]) isEqualToString:@"MusicApplication.ArtworkComponentImageView"] && ![NSStringFromClass([self.superview class]) isEqualToString:@"MusicApplication.PromotionalParallaxContentView"] && ![NSStringFromClass([self.superview.superview class]) isEqualToString:@"MusicApplication.FeaturedMusicVideoVerticalCell"] && ![NSStringFromClass([self.superview.superview class]) isEqualToString:@"MusicApplication.MusicVideoVerticalCell"]) {
UIImage *musicImage = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/musicalbumscrollprefs.bundle/mask.png"];
musicImageView = [[UIImageView alloc] initWithImage:musicImage];
musicImageView.frame = self.bounds;
self.maskView = musicImageView;
self.layer.masksToBounds = YES;
self.layer.shadowOpacity = 0.0;
self.layer.borderWidth = 0;
}
_logos_orig$MusicAlbumScroll$UIImageView$layoutSubviews(self, _cmd);
} else {
_logos_orig$MusicAlbumScroll$UIImageView$layoutSubviews(self, _cmd);
if([self isKindOfClass:[UIImageView class]] && [NSStringFromClass([self class]) isEqualToString:@"MusicApplication.ArtworkComponentImageView"] && ![NSStringFromClass([self.superview class]) isEqualToString:@"MusicApplication.NowPlayingContentView"] && ![NSStringFromClass([self.superview class]) isEqualToString:@"MusicApplication.PromotionalParallaxContentView"] && ![NSStringFromClass([self.superview.superview class]) isEqualToString:@"MusicApplication.FeaturedMusicVideoVerticalCell"] && ![NSStringFromClass([self.superview.superview class]) isEqualToString:@"MusicApplication.MusicVideoVerticalCell"]) {
UIImage *musicImage = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/musicalbumscrollprefs.bundle/mask.png"];
musicImageView = [[UIImageView alloc] initWithImage:musicImage];
musicImageView.frame = self.bounds;
self.maskView = musicImageView;
self.layer.masksToBounds = YES;
self.layer.shadowOpacity = 0.0;
self.layer.borderWidth = 0;
}
_logos_orig$MusicAlbumScroll$UIImageView$layoutSubviews(self, _cmd);
}
_logos_orig$MusicAlbumScroll$UIImageView$layoutSubviews(self, _cmd);
}
_logos_orig$MusicAlbumScroll$UIImageView$layoutSubviews(self, _cmd);
}



static void _logos_method$MusicAlbumScroll$UIScrollView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
if([NSStringFromClass([((UIScrollView *)self) class]) isEqualToString:@"_TtCC16MusicApplication27VerticalStackViewController10ScrollView"] && [NSStringFromClass([((_TtCC16MusicApplication27VerticalStackViewController10ScrollView *)self).firstAvailableViewController class]) isEqualToString:@"MusicApplication.LibraryViewController"]) {
_logos_orig$MusicAlbumScroll$UIScrollView$layoutSubviews(self, _cmd);
self.contentInset = UIEdgeInsetsMake(0,0,0,0);
if (disableVerticalScrolling) {
self.scrollEnabled = NO;
}
_logos_orig$MusicAlbumScroll$UIScrollView$layoutSubviews(self, _cmd);
}
_logos_orig$MusicAlbumScroll$UIScrollView$layoutSubviews(self, _cmd);
}




static __attribute__((constructor)) void _logosLocalCtor_d0f2e29d(int __unused argc, char __unused **argv, char __unused **envp) {

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
    {Class _logos_class$MusicAlbumScroll$UICollectionView = objc_getClass("UICollectionView"); { MSHookMessageEx(_logos_class$MusicAlbumScroll$UICollectionView, @selector(layoutSubviews), (IMP)&_logos_method$MusicAlbumScroll$UICollectionView$layoutSubviews, (IMP*)&_logos_orig$MusicAlbumScroll$UICollectionView$layoutSubviews);}Class _logos_class$MusicAlbumScroll$MPModelLibraryRequest = objc_getClass("MPModelLibraryRequest"); { MSHookMessageEx(_logos_class$MusicAlbumScroll$MPModelLibraryRequest, @selector(setContentRange:), (IMP)&_logos_method$MusicAlbumScroll$MPModelLibraryRequest$setContentRange$, (IMP*)&_logos_orig$MusicAlbumScroll$MPModelLibraryRequest$setContentRange$);}Class _logos_class$MusicAlbumScroll$MusicNowPlayingContentView = NSClassFromString(@"MusicApplication.NowPlayingContentView"); { MSHookMessageEx(_logos_class$MusicAlbumScroll$MusicNowPlayingContentView, @selector(layoutSubviews), (IMP)&_logos_method$MusicAlbumScroll$MusicNowPlayingContentView$layoutSubviews, (IMP*)&_logos_orig$MusicAlbumScroll$MusicNowPlayingContentView$layoutSubviews);}Class _logos_class$MusicAlbumScroll$MusicRecentlyAdded = NSClassFromString(@"MusicApplication.TitleSectionHeaderView"); { MSHookMessageEx(_logos_class$MusicAlbumScroll$MusicRecentlyAdded, @selector(layoutSubviews), (IMP)&_logos_method$MusicAlbumScroll$MusicRecentlyAdded$layoutSubviews, (IMP*)&_logos_orig$MusicAlbumScroll$MusicRecentlyAdded$layoutSubviews);}Class _logos_class$MusicAlbumScroll$UIImageView = objc_getClass("UIImageView"); { MSHookMessageEx(_logos_class$MusicAlbumScroll$UIImageView, @selector(layoutSubviews), (IMP)&_logos_method$MusicAlbumScroll$UIImageView$layoutSubviews, (IMP*)&_logos_orig$MusicAlbumScroll$UIImageView$layoutSubviews);}Class _logos_class$MusicAlbumScroll$UIScrollView = objc_getClass("UIScrollView"); { MSHookMessageEx(_logos_class$MusicAlbumScroll$UIScrollView, @selector(layoutSubviews), (IMP)&_logos_method$MusicAlbumScroll$UIScrollView$layoutSubviews, (IMP*)&_logos_orig$MusicAlbumScroll$UIScrollView$layoutSubviews);}}
    
    return;
    
    }

    return;

}
