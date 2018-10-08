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
	NSLog(@"%@", filePath);
}


- (IBAction)insertAction:(id)sender {
	[MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
		for (int i=0; i<100; i++) {
			Student *user = [Student MR_createEntityInContext:localContext];
			user.id = 1000+i;
			user.name = [NSString stringWithFormat:@"ygc%d",i];
		}
	} completion:^(BOOL contextDidSave, NSError * _Nullable error) {
		NSLog(@"结束存储");
	}]; 
}

- (IBAction)selectAction:(id)sender {
	NSArray *students = [Student MR_findByAttribute:@"name" withValue:@"ygc90220"];
	for (Student *student in students) {
		// 打印出来的数据才看得懂，断点看的不懂
		NSLog(@"name:%@----age:%d",student.name,student.id);
	}
}
@end
