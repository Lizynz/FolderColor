#import <libcolorpicker.h>

#define prefPath @"/User/Library/Preferences/com.lizynz.foldercolor.plist"

@interface _UICascadingTextStorage : UIView
@end

@interface SBFolderIconImageView : UIView 
@property (nonatomic, retain) UIView *backgroundView;
@end

@interface SBFolderBackgroundView : UIView
+ (double)cornerRadiusToInsetContent;
@end

static NSMutableDictionary *prefs  = nil;
static NSString *kTitleColor = nil;
static NSString *kFIColor = nil;
static NSString *kFBColor = nil;


static void loadPrefs()
{
    prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:prefPath];
    kTitleColor = [prefs objectForKey:@"Title"];
    kFIColor = [prefs objectForKey:@"FI"];
    kFBColor = [prefs objectForKey:@"FB"];
}

static void receivedNotification(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
    loadPrefs();
}

int NameColor = 1;

%hook _UICascadingTextStorage // имя папки

-(void)setTextColor:(id)color {

    if (prefs) {

        NameColor = [prefs objectForKey:@"NC"] ? [[prefs objectForKey:@"NC"] intValue] : NameColor;
    }

    if (NameColor == 1) {

        %orig;
    }

    if (NameColor == 2) {

    color = LCPParseColorString(kTitleColor, @"#FFFFFF");
    %orig(color);

    }

    return %orig;
}

%end

int FolderColor = 1;

%hook SBFolderBackgroundView // папка

- (void)layoutSubviews {

    if (prefs) {

        FolderColor = [prefs objectForKey:@"FC"] ? [[prefs objectForKey:@"FC"] intValue] : FolderColor;
    }

    if (FolderColor == 1) {

        return %orig;
    }

    if (FolderColor == 2) {
    
        [self setBackgroundColor:LCPParseColorString(kFBColor, @"#FFFFFF")];
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = [%c(SBFolderBackgroundView) cornerRadiusToInsetContent];
    }
}

%end

int IconColor = 1;

%hook SBFolderIconImageView

- (void)setBackgroundView:(UIView *)arg1 {

    if (prefs) {

        IconColor = [prefs objectForKey:@"IC"] ? [[prefs objectForKey:@"IC"] intValue] : IconColor;
    }

    if (IconColor == 1) {
    %orig;
    }

    if (IconColor == 2) {

    [self.backgroundView setBackgroundColor:LCPParseColorString(kFIColor, @"#FFFFFF")];
    
    self.backgroundView.layer.masksToBounds = YES;
    self.backgroundView.layer.cornerRadius = 13.5;
    
    }
}

%end

%ctor {

    CFNotificationCenterAddObserver(
        CFNotificationCenterGetDarwinNotifyCenter(),
        NULL,
        receivedNotification,
        CFSTR("com.lizynz.foldercolor/settingsChanged"),
        NULL,
        CFNotificationSuspensionBehaviorCoalesce);

    loadPrefs();
}