/**
 * Represents a schema for validating Date values.
 * Allows setting minimum and maximum allowed date values.
 */
public class DateTypeSchema extends TypeSchema {
    private Date minimum;
    private Date maximum;

    /**
     * Sets the minimum allowed date for validation.
     * 
     * @param value The minimum date value.
     * @return The current instance of DateTypeSchema.
     */
    public DateTypeSchema min(Date value) {
        this.minimum = value;
        return this;
    }

    /**
     * Sets the maximum allowed date for validation.
     * 
     * @param value The maximum date value.
     * @return The current instance of DateTypeSchema.
     */
    public DateTypeSchema max(Date value) {
        this.maximum = value;
        return this;
    }

    /**
     * Validates whether the provided value is a Date and whether it falls within the specified date range.
     * 
     * @param value The value to validate.
     * @throws TypeSchemaException if the value is not a Date or if it is outside the allowed range.
     */
    public override void validate(Object value) {
        if (value != null && !(value instanceof Date)) {
            throw new TypeSchemaException('Value is not a Date');
        }

        Date dateValue = (Date)value;

        if (minimum != null && dateValue < minimum) {
            throw new TypeSchemaException('Date is too early. Minimum allowed: ' + minimum);
        }

        if (maximum != null && dateValue > maximum) {
            throw new TypeSchemaException('Date is too late. Maximum allowed: ' + maximum);
        }
    }
}
