#import "KKActionSheet.h"

@implementation KKActionSheet

#pragma mark - LifeCycle
- (void)dealloc
{
	_callback = nil;
	_dismissCallback = nil;
}

- (void)showFromToolbar:(UIToolbar *)view callback:(SLActionSheetCallback)callback {
	if(callback) {
		self.delegate = self;
		self.callback = callback;
	}
	
	[self showFromToolbar:view];
}

- (void)showFromTabBar:(UITabBar *)view callback:(SLActionSheetCallback)callback {
	if(callback) {
		self.delegate = self;
		self.callback = callback;
	}
	
	[self showFromTabBar:view];
}

- (void)showFromBarButtonItem:(UIBarButtonItem *)item
					 animated:(BOOL)animated
					 callback:(SLActionSheetCallback)callback {
	if(callback) {
		self.delegate = self;
		self.callback = callback;
	}
	
	[self showFromBarButtonItem:item animated:animated];
}

- (void)showFromRect:(CGRect)rect
			  inView:(UIView *)view
			animated:(BOOL)animated
			callback:(SLActionSheetCallback)callback {
	if(callback) {
		self.delegate = self;
		self.callback = callback;
	}
	
	[self showFromRect:rect inView:view animated:animated];
}

- (void)showInView:(UIView *)view callback:(SLActionSheetCallback)callback {
	if(callback) {
		self.delegate = self;
		self.callback = callback;
	}
	
	[self showInView:view];
}

- (void)showInView:(UIView *)view
{
	if(self.callback){
		self.delegate = self;
	}
	[super showInView:view];
}

#pragma mark - UIActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(_callback) {
		_callback(self, buttonIndex);
	}
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if(_dismissCallback) {
		_dismissCallback(self, buttonIndex);
	}
}

@end
