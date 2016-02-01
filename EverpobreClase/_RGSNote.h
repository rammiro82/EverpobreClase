// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSNote.h instead.

@import CoreData;
#import "RGSNamedEntity.h"

extern const struct RGSNoteAttributes {
	__unsafe_unretained NSString *text;
} RGSNoteAttributes;

extern const struct RGSNoteRelationships {
	__unsafe_unretained NSString *location;
	__unsafe_unretained NSString *notebook;
	__unsafe_unretained NSString *photo;
} RGSNoteRelationships;

@class RGSLocation;
@class RGSNotebook;
@class RGSPhoto;

@interface RGSNoteID : RGSNamedEntityID {}
@end

@interface _RGSNote : RGSNamedEntity {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RGSNoteID* objectID;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) RGSLocation *location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) RGSNotebook *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) RGSPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _RGSNote (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (RGSLocation*)primitiveLocation;
- (void)setPrimitiveLocation:(RGSLocation*)value;

- (RGSNotebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(RGSNotebook*)value;

- (RGSPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(RGSPhoto*)value;

@end
