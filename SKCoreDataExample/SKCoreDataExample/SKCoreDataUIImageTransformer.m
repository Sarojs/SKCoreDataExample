//
//  SKCoreDataUIImageTransformer.m
//  SKCoreDataExample
//
//  Created by Saroj Sharma on 12/07/14.
//  Copyright (c) 2014 Saroj Sharma. All rights reserved.
//

#import "SKCoreDataUIImageTransformer.h"

@implementation SKCoreDataUIImageTransformer

+ (BOOL)allowsReverseTransformation
{
	return YES;
}

+ (Class)transformedValueClass
{
	return [NSData class];
}

- (id)transformedValue:(id)value
{
	NSData *data = UIImagePNGRepresentation(value);
	return data;
}

- (id)reverseTransformedValue:(id)value
{
	UIImage *uiImage = [[UIImage alloc] initWithData:value];
	return uiImage;
}

@end
