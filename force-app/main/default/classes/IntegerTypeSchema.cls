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

    public void validateSize(Object value) {
        if (minimum != null && value != null) {
            Integer valueToCheck = (Integer) value;
            if (valueToCheck < minimum) {
                throw new TypeSchemaException('Number is too small');
            }
        }
        if(maximum != null && value != null) {
            Integer valueToCheck = (Integer) value;
            if (valueToCheck > maximum) {
                throw new TypeSchemaException('Number is too big');
            }
        }
    }
}