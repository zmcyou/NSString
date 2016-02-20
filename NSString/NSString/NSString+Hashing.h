//
//  NSString+Hashing.h
//  Network
//
//  Created by Bill on 12/18/15.
//  Copyright © 2015 zmcyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

typedef NS_ENUM(NSInteger, HashType)
{
    kHashTypeMD5,
    kHashTypeSHA1,
    kHashTypeSHA256,
};

@interface NSString (Hashing)

- (NSString *)md5;
- (NSString *)sha1;
- (NSString *)sha256;

@end
