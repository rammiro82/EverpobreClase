// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSNote.h instead.

@import CoreData;

extern const struct RGSNoteAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *name;
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

@interface RGSNoteID : NSManagedObjectID {}
@end

@interface _RGSNote : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RGSNoteID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

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

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (RGSLocation*)primitiveLocation;
- (void)setPrimitiveLocation:(RGSLocation*)value;

- (RGSNotebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(RGSNotebook*)value;

- (RGSPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(RGSPhoto*)value;

@end
