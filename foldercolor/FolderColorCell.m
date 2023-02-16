#import "Preferences.h"

@interface FolderColorCell : PSTableCell{
    UILabel *heading;
    UILabel *subtitle;
}
@end

@implementation FolderColorCell

- (void)layoutSubviews {
    [super layoutSubviews];
    heading.frame = CGRectMake(0, 00, self.frame.size.width, 60);
    subtitle.frame = CGRectMake(0, 35, self.frame.size.width, 60);
}

- (id)initWithSpecifier:(PSSpecifier *)specifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"nameCell" specifier:specifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        int width = [[UIScreen mainScreen] bounds].size.width;
        
        CGRect frame = CGRectMake(0,0,width,60);
        CGRect subFrame = CGRectMake(0,35,width,60);
        heading = [[UILabel alloc] initWithFrame:frame];
        [heading setNumberOfLines:1];
        heading.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
        [heading setText:@"Folder Color"];
        [heading setBackgroundColor:[UIColor clearColor]];
        heading.textColor = [UIColor grayColor];
        heading.textAlignment = NSTextAlignmentCenter;
        
        subtitle = [[UILabel alloc] initWithFrame:subFrame];
        [subtitle setNumberOfLines:1];
        subtitle.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:16];
        [subtitle setText:@"Support iOS 13.x ~ iOS 16.x"];
        [subtitle setBackgroundColor:[UIColor clearColor]];
        subtitle.textColor = [UIColor grayColor];
        subtitle.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:heading];
        [self.contentView addSubview:subtitle];
    }
    
    return self;
}

- (CGFloat)preferredHeightForWidth:(double)arg1 inTableView:(id)arg2 {
    CGFloat prefHeight =90.0;
    return prefHeight;
}
@end
