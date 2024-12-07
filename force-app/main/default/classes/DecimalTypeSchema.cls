public class DecimalTypeSchema extends TypeSchema {
    private Decimal minimum;
    private Decimal maximum;

    public DecimalTypeSchema min(Decimal value) {
        this.minimum = value;
        return this;
    }

    public DecimalTypeSchema max(Decimal value) {
        this.maximum = value;
        return this;
    }

    public override void validate(Object value) {
        if (!(value instanceof Decimal)) {
            throw new TypeSchemaException('Value is not a Decimal.');
        }
        Decimal decimalValue = (Decimal)value;

        if (minimum != null && decimalValue < minimum) {
            throw new TypeSchemaException('Number is too small. Minimum allowed: ' + String.valueOf(minimum));
        }

        if (maximum != null && decimalValue > maximum) {
            throw new TypeSchemaException('Number is too big. Maximum allowed: ' + String.valueOf(maximum));
        }
    }
}
