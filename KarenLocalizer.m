#import "KarenLocalizer.h"

@implementation KarenLocalizer
-(instancetype) initWithKarenLocalizerBundle:(NSString *)bundleName {
	self = [super init];
	if (self) {
		_karenBundle = [NSBundle bundleWithPath:[NSString stringWithFormat:@"/Library/KarenLocalizer/%@.bundle", bundleName]];
	}
	return self;
}

-(NSString *) karenLocalizeString:(NSString *)key {
	return (_karenBundle) ? [_karenBundle localizedStringForKey:key value:@"" table:nil] : key;
}
@end