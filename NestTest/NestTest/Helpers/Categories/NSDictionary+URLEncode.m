//
//  NSDictionary+URLEncode.m
//  NestTest
//
//  Created by HereTrix on 11/27/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "NSDictionary+URLEncode.h"

@implementation NSDictionary (URLEncode)


- (NSString*) urlEncodedString
{
    NSMutableString *encodedString = [NSMutableString new];
    
    for (NSString *key in self.keyEnumerator)
    {
        
        [encodedString appendFormat: @"%@=%@&", key, self[key]];
    }
    
    if (encodedString.length > 0)
    {
        [encodedString deleteCharactersInRange: NSMakeRange([encodedString length]-1, 1)];
    }
        
    return [encodedString stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]];
}


@end