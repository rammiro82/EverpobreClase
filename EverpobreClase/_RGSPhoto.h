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

@property (nonatomic, strong) RGSNote *notes;

//- (BOOL)validateNotes:(id*)value_ error:(NSError**)error_;

@end

@interface _RGSPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImageData;
- (void)setPrimitiveImageData:(NSData*)value;

- (RGSNote*)primitiveNotes;
- (void)setPrimitiveNotes:(RGSNote*)value;

@end
