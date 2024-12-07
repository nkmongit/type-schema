public class IntegerTypeSchema extends TypeSchema {
    private Integer minimum;
    private Integer maximum;

    public IntegerTypeSchema min(Integer value) {
        this.minimum = value;
        return this;
    }

    public IntegerTypeSchema max(Integer value) {
        this.maximum = value;
        return this;
    }

    public override void validate(Object value) {
        if (value != null && !(value instanceof Integer)) {
            throw new TypeSchemaException('Value is not an Integer');
        }

        Integer valueToCheck = (Integer) value;

        if (minimum != null && valueToCheck < minimum) {
            throw new TypeSchemaException('Number is too small');
        }

        if (maximum != null && valueToCheck > maximum) {
            throw new TypeSchemaException('Number is too big');
        }
    }
}
