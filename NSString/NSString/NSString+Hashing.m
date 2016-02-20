//
//  NSString+Hashing.m
//  Network
//
//  Created by Bill on 12/18/15.
//  Copyright © 2015 zmcyou. All rights reserved.
//

#import "NSString+Hashing.h"

static NSString *hello = @"hello";

@implementation NSString (Hashing)

- (NSString *)md5
{
    return [self hashWithType:kHashTypeMD5];
}

- (NSString *)sha1
{
   return [self hashWithType:kHashTypeSHA1];
}

- (NSString *)sha256
{
   return [self hashWithType:kHashTypeSHA256];
}

- (NSString *)hashWithType:(HashType)type
{
    const char *ptr = [self UTF8String];
    NSInteger bufferSize;
    unsigned char *buffer;
    
    switch (type) {
        case kHashTypeMD5:
        {
            bufferSize = CC_MD5_DIGEST_LENGTH;
            buffer = malloc(sizeof(char) * bufferSize);
            CC_MD5(ptr, (int)strlen(ptr), buffer);
        }
            break;
        case kHashTypeSHA1:
        {
            bufferSize = CC_SHA1_DIGEST_LENGTH;
            buffer = malloc(sizeof(char) * bufferSize);
            CC_SHA1(ptr, (int)strlen(ptr), buffer);
        }
            break;
        case kHashTypeSHA256:
        {
            bufferSize = CC_SHA256_DIGEST_LENGTH;
            buffer = malloc(sizeof(char) * bufferSize);
            CC_SHA256(ptr, (int)strlen(ptr), buffer);
        }
            break;
            
        default:
            break;
    }
    
    NSMutableString *hashString = [NSMutableString string];
    for (int i = 0; i < bufferSize; i++)
    {
        [hashString appendFormat:@"%02x", buffer[i]];
    }
    
    NSLog(@"the hash string is %@", hashString);
    
    free(buffer);
    return hashString;
}

@end
