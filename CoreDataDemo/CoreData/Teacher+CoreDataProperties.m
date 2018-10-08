//
//  Teacher+CoreDataProperties.m
//  
//
//  Created by CJQ on 2018/10/8.
//
//

#import "Teacher+CoreDataProperties.h"

@implementation Teacher (CoreDataProperties)

+ (NSFetchRequest<Teacher *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Teacher"];
}

@dynamic id;
@dynamic name;

@end
