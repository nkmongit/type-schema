/**
 * Schema class to define validation rules for lists.
 * A ListTypeSchema allows you to validate a List of values.
 */
public class ListTypeSchema extends TypeSchema {

    // A list of schemas to validate each item in the list
    private List<TypeSchema> itemSchemas = new List<TypeSchema>();

    /**
     * Adds a schema to validate each item in the list.
     * 
     * @param schema The schema to validate each item in the list.
     * @return The current ListTypeSchema instance for method chaining.
     */
    public ListTypeSchema addItemSchema(TypeSchema schema) {
        itemSchemas.add(schema);
        return this;
    }

    /**
     * Validates the given list based on the item schemas.
     * 
     * @param value The list to validate.
     * @throws TypeSchemaException If the list contains invalid items based on the provided schemas.
     */
    public override void validate(Object value) {
        if (!(value instanceof List<Object>)) {
            throw new TypeSchemaException('Value is not a List.');
        }

        List<Object> listValue = (List<Object>) value;

        // Validate each item in the list against the provided item schemas
        for (Object item : listValue) {
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
