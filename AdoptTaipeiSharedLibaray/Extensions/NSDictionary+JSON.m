#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

+ (NSDictionary *)dictionaryWithJSONFile:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
	if(!fileExists) {
		return nil;
	}
	
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:filePath];
    NSError *error = nil;
	if(data == nil || error) {
		return nil;
	}
	
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    return dict;
}

- (NSString *)jsonString
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"bv_jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}


@end
