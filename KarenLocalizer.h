#import <Foundation/Foundation.h>

@interface KarenLocalizer : NSObject
@property (nonatomic, retain) NSBundle *karenBundle;
-(instancetype) initWithKarenLocalizerBundle:(NSString *)bundleName;
-(NSString *) karenLocalizeString:(NSString *)key;
@end