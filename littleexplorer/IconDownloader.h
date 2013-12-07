@class Walking;


@interface IconDownloader : NSObject

@property (nonatomic, strong) Walking *walk;
@property (nonatomic, copy) void (^completionHandler)(void);

- (void)startDownload;
- (void)cancelDownload;

@end
