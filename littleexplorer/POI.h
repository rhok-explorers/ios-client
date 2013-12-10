#import <CoreLocation/CLLocation.h>

@interface POI : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;

@property (nonatomic) CLLocationCoordinate2D coordinate;

@end