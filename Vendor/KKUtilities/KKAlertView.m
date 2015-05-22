#import "KKAlertView.h"
#import <Reachability/Reachability.h>

void SLShowAlertView(NSString *title, NSString *message, NSString *cancelButton)
{
	KKAlertView *alertView = [[KKAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButton otherButtonTitles:nil];
	[alertView show];
}

void SLShowAlertViewIfNetworkReachable(NSString *title, NSString *message, NSString *cancelButton)
{
	if ([Reachability reachabilityForInternetConnection].currentReachabilityStatus == NotReachable) {
		return;
	}
	KKAlertView *alertView = [[KKAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButton otherButtonTitles:nil];
	[alertView show];
}

@interface SLAlertViewManager : NSObject <UIAlertViewDelegate>
+ (SLAlertViewManager *)sharedManager;
@end

@interface KKAlertView ()
@end

@implementation KKAlertView

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message callback:(SLAlertCallback)callback cancelButton:(NSString *)cancelText otherButton:(NSString *)otherButtonTitles, ...
{
	id delegete = [SLAlertViewManager sharedManager];
	KKAlertView *alertView = [[KKAlertView alloc] initWithTitle:title message:message delegate:delegete cancelButtonTitle:cancelText otherButtonTitles:otherButtonTitles, nil];
	alertView.callback = callback;
	[alertView show];
}

- (void)dealloc
{
	_callback = nil;
	_dismissCallback = nil;
}

- (void)showWithCallback:(SLAlertCallback)callback
{
	if(callback){
		self.delegate = self;
		self.callback = callback;
	}
	[self show];
}

#pragma mark - UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(self.callback) {
		self.callback(alertView, buttonIndex);
	}
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if(self.dismissCallback) {
		self.dismissCallback(alertView, buttonIndex);
	}
}

@end

@implementation SLAlertViewManager

+ (SLAlertViewManager *)sharedManager
{
	static SLAlertViewManager *instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[SLAlertViewManager alloc] init];
	});
	return instance;
}

#pragma mark -

- (void)alertView:(KKAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if (alertView.callback) {
		alertView.callback(alertView, buttonIndex);
	}
}

@end
