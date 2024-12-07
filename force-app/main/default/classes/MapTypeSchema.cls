/**
 * A schema class for validating Map data types.
 * This class allows you to define validation rules for both the keys and values of a Map.
 */
public class MapTypeSchema extends TypeSchema {
  private TypeSchema keySchema; // The schema to validate the keys of the map.
  private TypeSchema valueSchema; // The schema to validate the values of the map.

  /**
   * Constructor to initialize the key and value schemas.
   *
   * @param keySchema The schema to validate the keys of the Map.
   * @param valueSchema The schema to validate the values of the Map.
   */
  public MapTypeSchema(TypeSchema keySchema, TypeSchema valueSchema) {
    this.keySchema = keySchema;
    this.valueSchema = valueSchema;
  }

  /**
   * Method to validate the keys and values of a Map.
   *
   * This method checks each key and value in the map using the specified key and value schemas.
   *
   * @param value The Map object to validate.
   * @throws TypeSchemaException If the map contains invalid keys or values.
   */
  public override void validate(Object value) {
    // Check if the value is a Map.
    if (!(value instanceof Map<String, Object>)) {
      throw new TypeSchemaException('Value is not a Map.');
    }

    // Cast the value to a Map
    Map<String, Object> mapValue = (Map<String, Object>) value;

    // Validate each key in the map using the key schema
    for (String key : mapValue.keySet()) {
      if (keySchema != null) {
        keySchema.validate(key); // Validate the key using the provided key schema
      }
    }

    // Validate each value in the map using the value schema
    for (Object valueItem : mapValue.values()) {
      if (valueSchema != null) {
        valueSchema.validate(valueItem); // Validate the value using the provided value schema
      }
    }
  }

  /**
   * Method to set the schema for the keys of the Map.
   *
   * @param schema The schema to validate the keys of the Map.
   * @return The current MapTypeSchema object for method chaining.
   */
  public MapTypeSchema keySchema(TypeSchema schema) {
    this.keySchema = schema;
    return this;
  }

  /**
   * Method to set the schema for the values of the Map.
   *
   * @param schema The schema to validate the values of the Map.
   * @return The current MapTypeSchema object for method chaining.
   */
  public MapTypeSchema valueSchema(TypeSchema schema) {
    this.valueSchema = schema;
    return this;
  }
}
