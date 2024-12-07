public virtual class TypeSchema {
    public static StringTypeSchema string() {
        return new StringTypeSchema();
    }

    public static IntegerTypeSchema integer() {
        return new IntegerTypeSchema();
    }

    public static DecimalTypeSchema decimal() {
        return new DecimalTypeSchema();
    }
}