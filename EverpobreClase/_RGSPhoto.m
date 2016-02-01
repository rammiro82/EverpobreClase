// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSPhoto.m instead.

#import "_RGSPhoto.h"

const struct RGSPhotoAttributes RGSPhotoAttributes = {
	.imageData = @"imageData",
};

const struct RGSPhotoRelationships RGSPhotoRelationships = {
	.notes = @"notes",
};

@implementation RGSPhotoID
@end

@implementation _RGSPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (RGSPhotoID*)objectID {
	return (RGSPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic imageData;

@dynamic notes;

@end

