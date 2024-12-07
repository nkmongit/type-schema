/**
 * Schema for validating Decimal values. 
 * This class allows you to define minimum and maximum values for a Decimal, 
 * as well as enforce precision and scale constraints.
 */
public class DecimalTypeSchema extends TypeSchema {
    
    // Minimum allowed value for the Decimal.
    private Decimal minimum;  
    
    // Maximum allowed value for the Decimal.
    private Decimal maximum;  
    
    // The total number of digits allowed in the Decimal (precision).
    private Integer precision; 
    
    // The number of digits allowed after the decimal point (scale).
    private Integer scale;    

    /**
     * Sets the minimum allowed value for the Decimal.
     * This method is used to define the smallest valid Decimal number.
     * 
     * @param value The minimum Decimal value that is allowed.
     * @return The current DecimalTypeSchema instance, allowing method chaining.
     */
    public DecimalTypeSchema min(Decimal value) {
        this.minimum = value;  // Assign the minimum allowed value.
        return this;
    }

    /**
     * Sets the maximum allowed value for the Decimal.
     * This method defines the largest valid Decimal number.
     * 
     * @param value The maximum Decimal value that is allowed.
     * @return The current DecimalTypeSchema instance, allowing method chaining.
     */
    public DecimalTypeSchema max(Decimal value) {
        this.maximum = value;  // Assign the maximum allowed value.
        return this;
    }

    /**
     * Sets the precision (total number of digits) allowed for the Decimal.
     * Precision represents the total number of digits (before and after the decimal point).
     * 
     * @param value The total number of digits allowed.
     * @return The current DecimalTypeSchema instance, allowing method chaining.
     */
    public DecimalTypeSchema precision(Integer value) {
        this.precision = value;  // Assign the precision value.
        return this;
    }

    /**
     * Sets the scale (number of digits after the decimal point) allowed for the Decimal.
     * Scale represents the number of digits allowed after the decimal point.
     * 
     * @param value The number of digits after the decimal point allowed.
     * @return The current DecimalTypeSchema instance, allowing method chaining.
     */
    public DecimalTypeSchema scale(Integer value) {
        this.scale = value;  // Assign the scale value.
        return this;
    }

    /**
     * Validates if a given value is a Decimal and falls within the defined bounds,
     * precision, and scale.
     * This method checks whether the Decimal value meets all the constraints:
     * minimum, maximum, precision (total number of digits), and scale (digits after the decimal point).
     * 
     * @param value The value to validate.
     * @throws TypeSchemaException If the value is not a Decimal, or if it falls outside 
     *         the allowed range, precision, or scale.
     */
    public override void validate(Object value) {
        // Check if the value is of Decimal type
        if (!(value instanceof Decimal)) {
            throw new TypeSchemaException('Value is not a Decimal.');  // Throw exception if the value is not a Decimal.
        }

        // Cast the object to Decimal for validation
        Decimal decimalValue = (Decimal) value;

        // Validate minimum value: Ensure the value is greater than or equal to the minimum.
        if (minimum != null && decimalValue < minimum) {
            throw new TypeSchemaException('Number is too small. Minimum allowed: ' + String.valueOf(minimum));
        }

        // Validate maximum value: Ensure the value is less than or equal to the maximum.
        if (maximum != null && decimalValue > maximum) {
            throw new TypeSchemaException('Number is too big. Maximum allowed: ' + String.valueOf(maximum));
        }

        // Validate precision: Ensure the total number of digits does not exceed the allowed precision.
        if (precision != null) {
            Integer totalDigits = decimalValue.precision();  // Get total number of digits (precision).
            if (totalDigits > precision) {
                throw new TypeSchemaException('Number exceeds maximum precision. Allowed precision: ' + precision);
            }
        }

        // Validate scale: Ensure the number of digits after the decimal point does not exceed the allowed scale.
        if (scale != null) {
            Integer decimalScale = decimalValue.scale();  // Get the number of digits after the decimal point (scale).
            if (decimalScale > scale) {
                throw new TypeSchemaException('Number exceeds maximum scale. Allowed scale: ' + scale);
            }
        }
    }
}
