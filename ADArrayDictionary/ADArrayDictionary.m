//
//  ADArrayDictionary.m
//  ADArrayDictionary
//
//  Created by Andy on 20/03/2018.
//  Copyright © 2018 Andy. All rights reserved.
//

#import "ADArrayDictionary.h"

typedef NS_ENUM(NSUInteger, ADArrayDictionarySeries) {
    ADArrayDictionarySeriesKey = 0,
    ADArrayDictionarySeriesValue
};

@interface ADArrayDictionary()

@property (nonatomic, strong) NSMutableArray<NSArray *> *dataSource;

@end

@implementation ADArrayDictionary

#pragma mark - public method

- (BOOL)addObject:(nonnull id)object forKey:(nonnull NSString *)key
{
    [self.dataSource addObject:@[key, object]];
    return YES;
}

- (BOOL)addObjects:(nonnull NSArray *)objects forKeys:(nonnull NSArray<NSString *> *)keys
{
    NSUInteger count = MIN(objects.count, keys.count);
    for (int i = 0; i < count; i++) {
        [self addObject:objects[i] forKey:keys[i]];
    }
    return YES;
}

- (BOOL)insertObject:(nonnull id)object atIndex:(NSUInteger)index forKey:(nonnull NSString *)key
{
    if (index > self.count - 1) return NO;
    [self.dataSource insertObject:@[key, object] atIndex:index];
    return YES;
}

- (BOOL)removeObjectAtIndex:(NSUInteger)index
{
    if (index > self.count - 1) return NO;
    [self.dataSource removeObjectAtIndex:index];
    return YES;
}

- (BOOL)removeLastObject
{
    if (self.count <= 0) return NO;
    [self.dataSource removeLastObject];
    return YES;
}

- (BOOL)removeAllObjects
{
    [self.dataSource removeAllObjects];
    return YES;
}

- (BOOL)replaceObjectAtIndex:(NSUInteger)index withObject:(nonnull id)object
{
    return [self replaceObjectAtIndex:index withObject:object forKey:nil];
}

- (BOOL)replaceObjectAtIndex:(NSUInteger)index withObject:(nonnull id)object forKey:(nullable NSString *)key
{
    if (index > self.count - 1) return NO;
    if (key)
    {
        [self.dataSource replaceObjectAtIndex:index withObject:@[key, object]];
    }
    else
    {
        NSString *oldKey = self.dataSource[index][ADArrayDictionarySeriesKey];
        [self.dataSource replaceObjectAtIndex:index withObject:@[oldKey, object]];
    }
    return YES;
}

- (BOOL)exchangeObjectAtIndex:(NSUInteger)index1 withObjectAtIndex:(NSUInteger)index2
{
    [self.dataSource exchangeObjectAtIndex:index1 withObjectAtIndex:index2];
    return YES;
}

- (BOOL)removeObjectForKey:(nonnull NSString *)key
{
    __block NSUInteger index = NSNotFound;
    [self.dataSource enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *oldKey = obj[ADArrayDictionarySeriesKey];
        if ([oldKey isEqualToString:key]) {
            index = idx;
            *stop = YES;
        }
    }];
    if (index == NSNotFound) return NO;
    [self.dataSource removeObjectAtIndex:index];
    return YES;
}

- (nullable id)objectAtIndex:(NSUInteger)index
{
    if (index > self.count - 1) return nil;
    return self.dataSource[index][ADArrayDictionarySeriesValue];
}

- (nullable id)objectForKey:(nonnull NSString *)key
{
    for (NSArray *item in self.dataSource) {
        NSString *oldKey = item[ADArrayDictionarySeriesKey];
        if ([oldKey isEqualToString:key]) {
            return item[ADArrayDictionarySeriesValue];
        }
    }
    return nil;
}

- (BOOL)containsObject:(nonnull id)object
{
    __block NSUInteger index = NSNotFound;
    [self.dataSource enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *value = obj[ADArrayDictionarySeriesValue];
        if (object == value) {
            index = idx;
            *stop = YES;
        }
    }];
    if (index == NSNotFound) return NO;
    return YES;
}

- (nullable ADArrayDictionary *)sortedByKey
{
    
    return nil;
}

- (nullable ADArrayDictionary *)sortedByValue
{
    
    return nil;
}

#pragma mark - getter and setter

- (NSUInteger)count
{
    return self.dataSource.count;
}

- (id)firstObject
{
    return [self.dataSource firstObject][ADArrayDictionarySeriesValue];
}

- (id)lastObject
{
    return [self.dataSource lastObject][ADArrayDictionarySeriesValue];
}

- (NSArray *)allKeys
{
    NSMutableArray *keys = [NSMutableArray array];
    [self.dataSource enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [keys addObject:obj[ADArrayDictionarySeriesKey]];
    }];
    return keys.copy;
}

- (NSArray *)allValues
{
    NSMutableArray *keys = [NSMutableArray array];
    [self.dataSource enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [keys addObject:obj[ADArrayDictionarySeriesValue]];
    }];
    return keys.copy;
}

- (NSMutableArray<NSArray *> *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
