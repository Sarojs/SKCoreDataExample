//
//  Department.m
//  SKCoreDataExample
//
//  Created by Saroj Sharma on 19/07/14.
//  Copyright (c) 2014 Saroj Sharma. All rights reserved.
//

#import "Department.h"

@implementation Department

@synthesize departmentID;
@synthesize departmentName;

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:departmentID forKey:@"departmentID"];
    [aCoder encodeObject:departmentName forKey:@"departmentName"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    self.departmentID = [aDecoder decodeObjectForKey:@"departmentID"];
    self.departmentName = [aDecoder decodeObjectForKey:@"departmentName"];
    return self;
}

@end
