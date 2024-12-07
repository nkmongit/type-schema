/**
 * Schema for validating Decimal values. 
 * This class allows you to define minimum and maximum values for a Decimal, 
 * and validates if a given value fits within these bounds.
 */
public class DecimalTypeSchema extends TypeSchema {
    private Decimal minimum;  // Minimum allowed value for the Decimal.
    private Decimal maximum;  // Maximum allowed value for the Decimal.

    /**
     * Sets the minimum allowed value for the Decimal.
     * 
     * @param value The minimum Decimal value that is allowed.
     * @return The current DecimalTypeSchema instance, allowing method chaining.
     */
    public DecimalTypeSchema min(Decimal value) {
        this.minimum = value;
        return this;
    }

    /**
     * Sets the maximum allowed value for the Decimal.
     * 
     * @param value The maximum Decimal value that is allowed.
     * @return The current DecimalTypeSchema instance, allowing method chaining.
     */
    public DecimalTypeSchema max(Decimal value) {
        this.maximum = value;
        return this;
    }

    /**
     * Validates if a given value is a Decimal and falls within the defined bounds.
     * 
     * @param value The value to validate.
     * @throws TypeSchemaException If the value is not a Decimal or if it falls outside the allowed range.
     */
    public override void validate(Object value) {
        // Check if the value is of Decimal type
        if (!(value instanceof Decimal)) {
            throw new TypeSchemaException('Value is not a Decimal.');
        }

        // Cast the object to Decimal for validation
        Decimal decimalValue = (Decimal) value;

        // Validate minimum value
        if (minimum != null && decimalValue < minimum) {
            throw new TypeSchemaException('Number is too small. Minimum allowed: ' + String.valueOf(minimum));
        }

        // Validate maximum value
        if (maximum != null && decimalValue > maximum) {
            throw new TypeSchemaException('Number is too big. Maximum allowed: ' + String.valueOf(maximum));
        }
    }
}
