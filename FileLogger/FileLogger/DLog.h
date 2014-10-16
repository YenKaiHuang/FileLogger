//
//  DLog.h
//  
//
//  Created by yenkai huang on 2014/10/16.
//  Copyright (c) 2014年 yenkai huang. All rights reserved.
//

#import "FileLog.h"

#define DEBUG_MODE 1

#if(DEBUG_MODE)
#define DLog( s, ... ) \
    NSLog( @"<%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] ); \
    [[FileLog sharedInstance] log:@"<%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__]]
#else
#define DLog( s, ... )
#endif

#define Microsecond(code) \
double t1 = [[NSDate date] timeIntervalSince1970];\
code;\
double t2 = [[NSDate date] timeIntervalSince1970];\
DLog(@"%f", t2 - t1)