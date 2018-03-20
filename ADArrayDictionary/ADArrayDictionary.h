//
//  ADArrayDictionary.h
//  ADArrayDictionary
//
//  Created by Andy on 20/03/2018.
//  Copyright © 2018 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 ADArrayDictionary
 index, key, value
 */

@interface ADArrayDictionary : NSObject

@property (nonatomic, assign, readonly) NSUInteger count;
@property (nonatomic, strong, readonly, nullable) id firstObject;
@property (nonatomic, strong, readonly, nullable) id lastObject;
@property (nonatomic, strong, readonly, nullable) NSArray *allKeys;
@property (nonatomic, strong, readonly, nullable) NSArray *allValues;

- (BOOL)addObject:(nonnull id)object forKey:(nonnull NSString *)key;
- (BOOL)addObjects:(nonnull NSArray *)objects forKeys:(nonnull NSArray<NSString *> *)keys;
- (BOOL)insertObject:(nonnull id)object atIndex:(NSUInteger)index forKey:(nonnull NSString *)key;

- (BOOL)removeObjectAtIndex:(NSUInteger)index;
- (BOOL)removeLastObject;
- (BOOL)removeAllObjects;
- (BOOL)replaceObjectAtIndex:(NSUInteger)index withObject:(nonnull id)object;
- (BOOL)replaceObjectAtIndex:(NSUInteger)index withObject:(nonnull id)object forKey:(nullable NSString *)key;
- (BOOL)exchangeObjectAtIndex:(NSUInteger)index1 withObjectAtIndex:(NSUInteger)index2;
- (BOOL)removeObjectForKey:(nonnull NSString *)key;

- (nullable id)objectAtIndex:(NSUInteger)index;
- (nullable id)objectForKey:(nonnull NSString *)key;
- (BOOL)containsObject:(nonnull id)object;

- (nullable ADArrayDictionary *)sortedByKey;
- (nullable ADArrayDictionary *)sortedByValue;

@end
