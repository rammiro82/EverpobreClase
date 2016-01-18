// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSNotebook.m instead.

#import "_RGSNotebook.h"

const struct RGSNotebookAttributes RGSNotebookAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
};

const struct RGSNotebookRelationships RGSNotebookRelationships = {
	.notes = @"notes",
};

@implementation RGSNotebookID
@end

@implementation _RGSNotebook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Notebook" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Notebook";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Notebook" inManagedObjectContext:moc_];
}

- (RGSNotebookID*)objectID {
	return (RGSNotebookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

