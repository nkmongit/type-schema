/**
 * Represents a schema for validating boolean values.
 * You can specify whether the value is required or not.
 */
public class BooleanTypeSchema extends TypeSchema {
  private Boolean required = false;

  /**
   * Marks the boolean value as required.
   *
   * @param value A boolean indicating whether the value is required.
   * @return The current instance of BooleanTypeSchema.
   */
  public BooleanTypeSchema required(Boolean value) {
    this.required = value;
    return this;
  }

  /**
   * Validates whether the provided value is a Boolean.
   * If the value is required, ensures it is not null.
   *
   * @param value The value to validate.
   * @throws TypeSchemaException if the value is not a Boolean or if a required value is missing.
   */
  public override void validate(Object value) {
    if (value != null && !(value instanceof Boolean)) {
      throw new TypeSchemaException('Value is not a Boolean');
    }

    if (required && value == null) {
      throw new TypeSchemaException('Boolean value is required.');
    }
  }
}
