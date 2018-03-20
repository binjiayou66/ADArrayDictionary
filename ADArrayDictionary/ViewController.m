//
//  ViewController.m
//  ADArrayDictionary
//
//  Created by Andy on 20/03/2018.
//  Copyright © 2018 Andy. All rights reserved.
//

#import "ViewController.h"
#import "ADArrayDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ADArrayDictionary *ad = [[ADArrayDictionary alloc] init];
    [ad addObject:@"aaa" forKey:@"111"];
    [ad addObjects:@[@"bbb", @"ccc", @"ddd"] forKeys:@[@"zzz222", @"333", @"444"]];

    NSLog(@"keys == %@", ad.allKeys);
    NSLog(@"values == %@", ad.allValues);
    NSLog(@"the 2th item == %@", [ad objectAtIndex:1]);
    NSLog(@"the 99th item == %@", [ad objectAtIndex:99]);
    NSLog(@"object with key 333 == %@", [ad objectForKey:@"333"]);
    NSLog(@"object with key 666 == %@", [ad objectForKey:@"666"]);
    
    [ad insertObject:@"new ccc" atIndex:2 forKey:@"new 333"];
    NSLog(@"%@", ad);
    [ad replaceObjectAtIndex:2 withObject:@"new new ccc"];
    NSLog(@"%@", ad);
    [ad replaceObjectAtIndex:2 withObject:@"new new new ccc" forKey:@"new new 333"];
    NSLog(@"%@", ad);
    
    [ad sortedByKey];
    NSLog(@"sortedByKey == %@", ad);
    [ad sortedByValue];
    NSLog(@"sortedByValue == %@", ad);
    
    [ad removeObjectForKey:@"new new 333"];
    NSLog(@"%@", ad);
    [ad removeObjectAtIndex:2];
    NSLog(@"%@", ad);
    [ad exchangeObjectAtIndex:0 withObjectAtIndex:1];
    NSLog(@"%@", ad);
    [ad removeLastObject];
    NSLog(@"%@", ad);
    [ad removeAllObjects];
    NSLog(@"%@", ad);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
