//
//  Student+CoreDataProperties.m
//  
//
//  Created by CJQ on 2018/10/8.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Student"];
}

@dynamic id;
@dynamic name;

@end
