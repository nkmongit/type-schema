public class IntegerTypeSchema extends TypeSchema {
  private Integer minimum; // Minimum value for the Integer
  private Integer maximum; // Maximum value for the Integer
  private Boolean isEven = false; // Flag to check if the Integer should be even
  private Boolean isOdd = false; // Flag to check if the Integer should be odd

  /**
   * Sets the minimum value for the Integer.
   *
   * @param value The minimum value that the Integer can have.
   * @return The current IntegerTypeSchema instance, allowing method chaining.
   */
  public IntegerTypeSchema min(Integer value) {
    this.minimum = value;
    return this;
  }

  /**
   * Sets the maximum value for the Integer.
   *
   * @param value The maximum value that the Integer can have.
   * @return The current IntegerTypeSchema instance, allowing method chaining.
   */
  public IntegerTypeSchema max(Integer value) {
    this.maximum = value;
    return this;
  }

  /**
   * Sets the validation rule to check if the Integer is even.
   *
   * @return The current IntegerTypeSchema instance, allowing method chaining.
   */
  public IntegerTypeSchema even() {
    this.isEven = true;
    return this;
  }

  /**
   * Sets the validation rule to check if the Integer is odd.
   *
   * @return The current IntegerTypeSchema instance, allowing method chaining.
   */
  public IntegerTypeSchema odd() {
    this.isOdd = true;
    return this;
  }

  /**
   * Validates if the given value is an Integer and if it adheres to the specified validation rules.
   *
   * @param value The value to validate.
   * @throws TypeSchemaException If the value does not match the validation rules.
   */
  public override void validate(Object value) {
    // Check if the value is not null and if it is an Integer
    if (value != null && !(value instanceof Integer)) {
      throw new TypeSchemaException('Value is not an Integer');
    }

    Integer valueToCheck = (Integer) value;

    // Validate the minimum value if defined
    if (minimum != null && valueToCheck < minimum) {
      throw new TypeSchemaException(
        'Number is too small. Minimum allowed: ' + String.valueOf(minimum)
      );
    }

    // Validate the maximum value if defined
    if (maximum != null && valueToCheck > maximum) {
      throw new TypeSchemaException(
        'Number is too big. Maximum allowed: ' + String.valueOf(maximum)
      );
    }

    // Validate if the value should be even
    if (isEven) {
      if (Math.mod(valueToCheck, 2) != 0) {
        // Check if the number is even
        throw new TypeSchemaException('Number must be even.');
      }
    }

    // Validate if the value should be odd
    if (isOdd) {
      if (Math.mod(valueToCheck, 2) == 0) {
        // Check if the number is odd
        throw new TypeSchemaException('Number must be odd.');
      }
    }
  }
}
