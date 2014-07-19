//
//  Department.h
//  SKCoreDataExample
//
//  Created by Saroj Sharma on 19/07/14.
//  Copyright (c) 2014 Saroj Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Department : NSObject <NSCoding>

@property(nonatomic,retain) NSString *departmentID;
@property(nonatomic,retain) NSString *departmentName;

@end
