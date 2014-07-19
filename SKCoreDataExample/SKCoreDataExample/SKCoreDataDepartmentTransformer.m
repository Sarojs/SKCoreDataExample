//
//  SKCoreDataDepartmentTransformer.m
//  SKCoreDataExample
//
//  Created by Saroj Sharma on 19/07/14.
//  Copyright (c) 2014 Saroj Sharma. All rights reserved.
//

#import "SKCoreDataDepartmentTransformer.h"

@implementation SKCoreDataDepartmentTransformer

+ (BOOL)allowsReverseTransformation
{
	return YES;
}

+ (Class)transformedValueClass
{
	return [Department class];
}

- (id)transformedValue:(id)value
{
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:value];
	return data;
}

- (id)reverseTransformedValue:(id)value
{
	Department *dept = [NSKeyedUnarchiver unarchiveObjectWithData:value];
	return dept;
}

@end
