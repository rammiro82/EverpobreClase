// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSLocation.h instead.

@import CoreData;

extern const struct RGSLocationAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *latitud;
	__unsafe_unretained NSString *longitud;
} RGSLocationAttributes;

extern const struct RGSLocationRelationships {
	__unsafe_unretained NSString *notes;
} RGSLocationRelationships;

@class RGSNote;

@interface RGSLocationID : NSManagedObjectID {}
@end

@interface _RGSLocation : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RGSLocationID* objectID;

@property (nonatomic, strong) NSString* address;

//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* latitud;

@property (atomic) double latitudValue;
- (double)latitudValue;
- (void)setLatitudValue:(double)value_;

//- (BOOL)validateLatitud:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* longitud;

@property (atomic) double longitudValue;
- (double)longitudValue;
- (void)setLongitudValue:(double)value_;

//- (BOOL)validateLongitud:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _RGSLocation (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(RGSNote*)value_;
- (void)removeNotesObject:(RGSNote*)value_;

@end

@interface _RGSLocation (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;

- (NSNumber*)primitiveLatitud;
- (void)setPrimitiveLatitud:(NSNumber*)value;

- (double)primitiveLatitudValue;
- (void)setPrimitiveLatitudValue:(double)value_;

- (NSNumber*)primitiveLongitud;
- (void)setPrimitiveLongitud:(NSNumber*)value;

- (double)primitiveLongitudValue;
- (void)setPrimitiveLongitudValue:(double)value_;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
