/**
 * Base class for all type schemas that define the structure for validating different types of data.
 * This class provides methods for common types like String, Integer, Decimal, Boolean, Date, DateTime, List, Set, and Map.
 * Subclasses should override the `validate` method to implement type-specific validation logic.
 */
public virtual class TypeSchema {
  /**
   * Creates and returns a new instance of StringTypeSchema.
   *
   * This method allows for defining a schema for string validation with specific conditions, such as length or pattern.
   *
   * @return A new StringTypeSchema object to define string validation rules.
   */
  public static StringTypeSchema string() {
    return new StringTypeSchema();
  }

  /**
   * Creates and returns a new instance of IntegerTypeSchema.
   *
   * This method allows for defining a schema for integer validation, including range checks (e.g., min and max values).
   *
   * @return A new IntegerTypeSchema object to define integer validation rules.
   */
  public static IntegerTypeSchema integer() {
    return new IntegerTypeSchema();
  }

  /**
   * Creates and returns a new instance of DecimalTypeSchema.
   *
   * This method allows for defining a schema for decimal (floating-point) validation, including range checks for decimal values.
   *
   * @return A new DecimalTypeSchema object to define decimal validation rules.
   */
  public static DecimalTypeSchema decimal() {
    return new DecimalTypeSchema();
  }

  /**
   * Creates and returns a new instance of BooleanTypeSchema.
   *
   * This method allows for defining a schema for boolean validation (true/false).
   *
   * @return A new BooleanTypeSchema object to define boolean validation rules.
   */
  public static BooleanTypeSchema boolean() {
    return new BooleanTypeSchema();
  }

  /**
   * Creates and returns a new instance of DateTypeSchema.
   *
   * This method allows for defining a schema for date validation.
   *
   * @return A new DateTypeSchema object to define date validation rules.
   */
  public static DateTypeSchema date() {
    return new DateTypeSchema();
  }

  /**
   * Creates and returns a new instance of DateTimeTypeSchema.
   *
   * This method allows for defining a schema for DateTime validation (date and time).
   *
   * @return A new DateTimeTypeSchema object to define DateTime validation rules.
   */
  public static DateTimeTypeSchema dateTime() {
    return new DateTimeTypeSchema();
  }

  /**
   * Creates and returns a new instance of ListTypeSchema.
   *
   * This method allows for defining a schema for list validation, where the list's items can be validated using other schemas.
   *
   * @return A new ListTypeSchema object to define list validation rules.
   */
  public static ListTypeSchema lists() {
    return new ListTypeSchema();
  }

  /**
   * Creates and returns a new instance of SetTypeSchema.
   *
   * This method allows for defining a schema for set validation, where the set's items can be validated using other schemas.
   *
   * @return A new SetTypeSchema object to define set validation rules.
   */
  public static SetTypeSchema set() {
    return new SetTypeSchema();
  }

  /**
   * Creates and returns a new instance of MapTypeSchema.
   *
   * @param keySchema The schema to validate the keys of the Map.
   * @param valueSchema The schema to validate the values of the Map.
   * @return A new MapTypeSchema object to define Map validation rules.
   */
  public static MapTypeSchema maps(
    TypeSchema keySchema,
    TypeSchema valueSchema
  ) {
    return new MapTypeSchema(keySchema, valueSchema); // Ensure the constructor exists
  }

  /**
   * The virtual method for validating an object based on the specific type schema.
   *
   * This method is intended to be overridden in child classes to provide specific validation logic for different types.
   * If not overridden, it throws an exception indicating that validation has not been implemented.
   *
   * @param value The value to validate. This can be any object depending on the schema (String, Integer, Decimal, etc.).
   * @throws TypeSchemaException If the validation is not implemented in the derived class or if validation fails.
   */
  public virtual void validate(Object value) {
    throw new TypeSchemaException('Validation not implemented.');
  }
}
