//
//  ViewController.m
//  CoreDataDemo
//
//  Created by CJQ on 2018/9/29.
//  Copyright © 2018年 CL. All rights reserved.
//

#import "ViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Student+CoreDataClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NSString *filePath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
	NSLog(@"沙盒路径：%@", filePath);
}

#pragma mark - 插入数据
- (IBAction)insertAction:(id)sender {
	// MARK: - 保存数据 saveWithBlock:
	[MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
		for (int i=0; i<100; i++) {
			Student *user = [Student MR_createEntityInContext:localContext];
			user.id = i;
			user.name = [NSString stringWithFormat:@"name%d",i];
		}
	} completion:^(BOOL contextDidSave, NSError * _Nullable error) {
		if (error == nil) {
			NSLog(@"结束存储");
		}else{
			NSLog(@"存储失败");
		}
	}];
}

#pragma mark - 查询数据
- (IBAction)selectAction:(id)sender {
	// MARK: - 查询数据 MR_findByAttribute: withValue:
	NSArray *students = [Student MR_findByAttribute:@"name" withValue:@"name38"];
	if (students.count > 0) {
		for (Student *student in students) {
			// 打印出来的数据才看得懂，断点看的不懂
			NSLog(@"objectID：%@----id:%d----name:%@", student.objectID, student.id, student.name);
		}
	}else{
		NSLog(@"查询不到匹配的数据");
	}
	
}

@end
