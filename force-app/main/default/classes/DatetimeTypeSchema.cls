/**
 * Represents a schema for validating Datetime values.
 * Allows setting minimum and maximum allowed datetime values.
 */
public class DatetimeTypeSchema extends TypeSchema {
    private Datetime minimum;
    private Datetime maximum;

    /**
     * Sets the minimum allowed datetime for validation.
     * 
     * @param value The minimum datetime value.
     * @return The current instance of DatetimeTypeSchema.
     */
    public DatetimeTypeSchema min(Datetime value) {
        this.minimum = value;
        return this;
    }

    /**
     * Sets the maximum allowed datetime for validation.
     * 
     * @param value The maximum datetime value.
     * @return The current instance of DatetimeTypeSchema.
     */
    public DatetimeTypeSchema max(Datetime value) {
        this.maximum = value;
        return this;
    }

    /**
     * Validates whether the provided value is a Datetime and whether it falls within the specified datetime range.
     * 
     * @param value The value to validate.
     * @throws TypeSchemaException if the value is not a Datetime or if it is outside the allowed range.
     */
    public override void validate(Object value) {
        if (value != null && !(value instanceof Datetime)) {
            throw new TypeSchemaException('Value is not a Datetime');
        }

        Datetime datetimeValue = (Datetime)value;

        if (minimum != null && datetimeValue < minimum) {
            throw new TypeSchemaException('Datetime is too early. Minimum allowed: ' + minimum);
        }

        if (maximum != null && datetimeValue > maximum) {
            throw new TypeSchemaException('Datetime is too late. Maximum allowed: ' + maximum);
        }
    }
}
