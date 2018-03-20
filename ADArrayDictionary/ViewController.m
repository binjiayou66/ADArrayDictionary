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
    [ad addObjects:@[@"bbb", @"ccc", @"ddd"] forKeys:@[@"222", @"333", @"444"]];

    NSLog(@"keys == %@", ad.allKeys);
    NSLog(@"values == %@", ad.allValues);
    NSLog(@"the 2th item == %@", [ad objectAtIndex:1]);
    NSLog(@"the 99th item == %@", [ad objectAtIndex:99]);
    NSLog(@"object with key 333 == %@", [ad objectForKey:@"333"]);
    NSLog(@"object with key 666 == %@", [ad objectForKey:@"666"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
