//
//  Teacher+CoreDataProperties.h
//  
//
//  Created by CJQ on 2018/10/8.
//
//

#import "Teacher+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Teacher (CoreDataProperties)

+ (NSFetchRequest<Teacher *> *)fetchRequest;

@property (nonatomic) int16_t id;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
