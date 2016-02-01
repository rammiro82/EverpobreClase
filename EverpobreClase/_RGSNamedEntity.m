// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSNamedEntity.m instead.

#import "_RGSNamedEntity.h"

const struct RGSNamedEntityAttributes RGSNamedEntityAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
};

@implementation RGSNamedEntityID
@end

@implementation _RGSNamedEntity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"NamedEntity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"NamedEntity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"NamedEntity" inManagedObjectContext:moc_];
}

- (RGSNamedEntityID*)objectID {
	return (RGSNamedEntityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@end

