@import UIKit;

@class KKAlertView;
void SLShowAlertView(NSString *title, NSString *message, NSString *cancelButton);
void SLShowAlertViewIfNetworkReachable(NSString *title, NSString *message, NSString *cancelButton);

typedef void(^SLAlertCallback)(UIAlertView *alertView, NSInteger clickedButtonAtIndex);

@interface KKAlertView : UIAlertView
@property (copy, nonatomic) SLAlertCallback callback;
@property (copy, nonatomic) SLAlertCallback dismissCallback;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message callback:(SLAlertCallback)callback cancelButton:(NSString *)cancelText otherButton:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
- (void)showWithCallback:(SLAlertCallback)callback;
@end
