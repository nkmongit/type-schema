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

    public void validate(Object value) {
        if (minimum != null && value != null) {
            Decimal valueToCheck = (Decimal) value;
            if (valueToCheck < minimum) {
                throw new TypeSchemaException('Number is too small');
            }
        }
        if(maximum != null && value != null) {
            Decimal valueToCheck = (Decimal) value;
            if (valueToCheck > maximum) {
                throw new TypeSchemaException('Number is too big');
            }
        }
    }
}