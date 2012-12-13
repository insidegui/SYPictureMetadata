//
//  SYPictureDictionary.m
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYPictureDictionary.h"

@implementation SYPictureDictionary

-(id)initWithDic:(NSDictionary*)dic
{
    if(self = [super init])
    {
        self->_dic = dic;
    }
    
    if(!dic)
        return nil;
    
    return self;
}

-(NSDictionary *)getDictionary
{
    return self->_dic;
}


-(NSObject *)objectForKeyString:(NSString *)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    return (NSArray*)obj;
}
-(NSObject *)objectForKeyStringRef:(CFStringRef)key
{
    return [self arrayForKeyString:(__bridge NSString *)(key)];
}

-(NSString*)stringForKeyString:(NSString*)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    BOOL isString = [obj isKindOfClass:[NSString class]];
    if(!isString)
        NSLog(@"Wrong type for key \"%@\", not a string : %@", key, [[obj class] description]);
    
    return [obj description];
}
-(NSString*)stringForKeyStringRef:(CFStringRef)key
{
    return [self stringForKeyString:(__bridge NSString *)key];
}

-(NSNumber*)numberForKeyString:(NSString*)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    BOOL isNumber = [obj isKindOfClass:[NSNumber class]];
    if(!isNumber) {
        NSLog(@"Wrong type for key \"%@\", not a number : %@", key, [[obj class] description]);
        return nil;
    }
    
    return (NSNumber*)obj;
}
-(NSNumber*)numberForKeyStringRef:(CFStringRef)key
{
    return [self numberForKeyString:(__bridge NSString *)(key)];
}

-(NSArray*)arrayForKeyString:(NSString*)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    BOOL isArray = [obj isKindOfClass:[NSArray class]];
    if(!isArray) {
        NSLog(@"Wrong type for key \"%@\", not a array : %@", key, [[obj class] description]);
        return nil;
    }
    
    return (NSArray*)obj;
}
-(NSArray*)arrayForKeyStringRef:(CFStringRef)key
{
    return [self arrayForKeyString:(__bridge NSString *)(key)];
}

@end
