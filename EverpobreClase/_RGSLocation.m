// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSLocation.m instead.

#import "_RGSLocation.h"

const struct RGSLocationAttributes RGSLocationAttributes = {
	.address = @"address",
	.latitud = @"latitud",
	.longitud = @"longitud",
};

const struct RGSLocationRelationships RGSLocationRelationships = {
	.mapSnapshot = @"mapSnapshot",
	.notes = @"notes",
};

@implementation RGSLocationID
@end

@implementation _RGSLocation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Location";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Location" inManagedObjectContext:moc_];
}

- (RGSLocationID*)objectID {
	return (RGSLocationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"latitudValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitud"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitud"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic address;

@dynamic latitud;

- (double)latitudValue {
	NSNumber *result = [self latitud];
	return [result doubleValue];
}

- (void)setLatitudValue:(double)value_ {
	[self setLatitud:@(value_)];
}

- (double)primitiveLatitudValue {
	NSNumber *result = [self primitiveLatitud];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudValue:(double)value_ {
	[self setPrimitiveLatitud:@(value_)];
}

@dynamic longitud;

- (double)longitudValue {
	NSNumber *result = [self longitud];
	return [result doubleValue];
}

- (void)setLongitudValue:(double)value_ {
	[self setLongitud:@(value_)];
}

- (double)primitiveLongitudValue {
	NSNumber *result = [self primitiveLongitud];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudValue:(double)value_ {
	[self setPrimitiveLongitud:@(value_)];
}

@dynamic mapSnapshot;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

