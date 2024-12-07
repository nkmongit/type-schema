/**
 * Schema for validating Object values.
 * This class allows you to define a schema for each field in an object,
 * validates if the object matches the expected structure, and checks for
 * missing or unexpected fields based on strict mode.
 */
public class ObjectTypeSchema extends TypeSchema {
  private Map<String, TypeSchema> fieldSchemas = new Map<String, TypeSchema>(); // Map to store field names and their corresponding schema
  private Boolean strict = false; // Flag to determine whether strict mode is enabled

  /**
   * Adds a field to the object schema with a specific validation schema.
   *
   * @param fieldName The name of the field to validate.
   * @param schema The schema to validate the field against.
   * @return The current ObjectTypeSchema instance, allowing method chaining.
   */
  public ObjectTypeSchema field(String fieldName, TypeSchema schema) {
    fieldSchemas.put(fieldName, schema);
    return this;
  }

  /**
   * Enables or disables strict mode for field validation.
   * In strict mode, any field that is not defined in the schema will result in an error.
   *
   * @param strict If true, strict mode is enabled; otherwise, it is disabled.
   * @return The current ObjectTypeSchema instance, allowing method chaining.
   */
  public ObjectTypeSchema strictMode(Boolean strict) {
    this.strict = strict;
    return this;
  }

  /**
   * Validates if a given value is an object and if it matches the defined field schemas.
   *
   * @param value The value (should be a Map<String, Object>) to validate.
   * @throws TypeSchemaException If the value is not an object or if there are missing/extra fields.
   */
  public override void validate(Object value) {
    // Check if the value is a Map, which is equivalent to an object
    if (!(value instanceof Map<String, Object>)) {
      throw new TypeSchemaException('Value is not an object.');
    }

    Map<String, Object> objValue = (Map<String, Object>) value;

    // Validate each field in the object against its schema
    for (String fieldName : fieldSchemas.keySet()) {
      if (!objValue.containsKey(fieldName)) {
        throw new TypeSchemaException('Missing required field: ' + fieldName);
      }
      fieldSchemas.get(fieldName).validate(objValue.get(fieldName));
    }

    // If strict mode is enabled, check for unexpected fields
    if (strict) {
      for (String fieldName : objValue.keySet()) {
        if (!fieldSchemas.containsKey(fieldName)) {
          throw new TypeSchemaException('Unexpected field: ' + fieldName);
        }
      }
    }
  }
}
