// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSMapSnapshot.m instead.

#import "_RGSMapSnapshot.h"

const struct RGSMapSnapshotAttributes RGSMapSnapshotAttributes = {
	.snapshotData = @"snapshotData",
};

const struct RGSMapSnapshotRelationships RGSMapSnapshotRelationships = {
	.location = @"location",
};

@implementation RGSMapSnapshotID
@end

@implementation _RGSMapSnapshot

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MapSnapshot" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MapSnapshot";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MapSnapshot" inManagedObjectContext:moc_];
}

- (RGSMapSnapshotID*)objectID {
	return (RGSMapSnapshotID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic snapshotData;

@dynamic location;

@end

