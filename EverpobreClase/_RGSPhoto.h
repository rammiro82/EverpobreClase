// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSPhoto.h instead.

@import CoreData;

extern const struct RGSPhotoAttributes {
	__unsafe_unretained NSString *imageData;
} RGSPhotoAttributes;

extern const struct RGSPhotoRelationships {
	__unsafe_unretained NSString *notes;
} RGSPhotoRelationships;

@class RGSNote;

@interface RGSPhotoID : NSManagedObjectID {}
@end

@interface _RGSPhoto : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RGSPhotoID* objectID;

@property (nonatomic, strong) NSData* imageData;

//- (BOOL)validateImageData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _RGSPhoto (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(RGSNote*)value_;
- (void)removeNotesObject:(RGSNote*)value_;

@end

@interface _RGSPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImageData;
- (void)setPrimitiveImageData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
