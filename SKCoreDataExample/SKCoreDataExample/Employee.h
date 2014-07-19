//
//  Employee.h
//  SKCoreDataExample
//
//  Created by Saroj Sharma on 19/07/14.
//  Copyright (c) 2014 Saroj Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Employee : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) id photo;
@property (nonatomic, retain) NSString * employeeID;
@property (nonatomic, retain) id department;

@end
