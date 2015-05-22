#import <UIKit/UIKit.h>

typedef void (^SLActionSheetCallback)(UIActionSheet *actionSheet, NSInteger buttonIndex);

@interface KKActionSheet : UIActionSheet <UIActionSheetDelegate>
@property (nonatomic, copy) SLActionSheetCallback callback;
@property (nonatomic, copy) SLActionSheetCallback dismissCallback;

- (void)showFromToolbar:(UIToolbar *)view callback:(SLActionSheetCallback)callback;

- (void)showFromTabBar:(UITabBar *)view callback:(SLActionSheetCallback)callback;

- (void)showFromBarButtonItem:(UIBarButtonItem *)item
					 animated:(BOOL)animated
					 callback:(SLActionSheetCallback)callback;

- (void)showFromRect:(CGRect)rect
			  inView:(UIView *)view
			animated:(BOOL)animated
			callback:(SLActionSheetCallback)callback;

- (void)showInView:(UIView *)view callback:(SLActionSheetCallback)callback;
- (void)showInView:(UIView *)view;

@end