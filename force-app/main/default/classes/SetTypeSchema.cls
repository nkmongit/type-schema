/**
 * Schema class to define validation rules for sets.
 * A SetTypeSchema allows you to validate a Set of values.
 */
public class SetTypeSchema extends TypeSchema {

    // A set of schemas to validate each item in the set
    private Set<TypeSchema> itemSchemas = new Set<TypeSchema>();

    /**
     * Adds a schema to validate each item in the set.
     * 
     * @param schema The schema to validate each item in the set.
     * @return The current SetTypeSchema instance for method chaining.
     */
    public SetTypeSchema addItemSchema(TypeSchema schema) {
        itemSchemas.add(schema);
        return this;
    }

    /**
     * Validates the given set based on the item schemas.
     * 
     * @param value The set to validate.
     * @throws TypeSchemaException If the set contains invalid items based on the provided schemas.
     */
    public override void validate(Object value) {
        if (!(value instanceof Set<Object>)) {
            throw new TypeSchemaException('Value is not a Set.');
        }

        Set<Object> setValue = (Set<Object>) value;

        // Validate each item in the set against the provided item schemas
        for (Object item : setValue) {
            // If no item schemas are provided, validate with a generic type check
            if (itemSchemas.isEmpty()) {
                continue; // Or add some default validation logic here
            }

            for (TypeSchema itemSchema : itemSchemas) {
                itemSchema.validate(item); // Validate the item with its schema
            }
        }
    }
}
