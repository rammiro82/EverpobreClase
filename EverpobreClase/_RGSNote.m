// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSNote.m instead.

#import "_RGSNote.h"

const struct RGSNoteAttributes RGSNoteAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
	.text = @"text",
};

const struct RGSNoteRelationships RGSNoteRelationships = {
	.location = @"location",
	.notebook = @"notebook",
	.photo = @"photo",
};

@implementation RGSNoteID
@end

@implementation _RGSNote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (RGSNoteID*)objectID {
	return (RGSNoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic text;

@dynamic location;

@dynamic notebook;

@dynamic photo;

@end

