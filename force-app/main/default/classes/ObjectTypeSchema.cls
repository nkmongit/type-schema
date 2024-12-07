public class ObjectTypeSchema extends TypeSchema {
    private Map<String, TypeSchema> fieldSchemas = new Map<String, TypeSchema>();
    private Boolean strict = false;

    public ObjectTypeSchema field(String fieldName, TypeSchema schema) {
        fieldSchemas.put(fieldName, schema);
        return this;
    }

    public ObjectTypeSchema strictMode(Boolean strict) {
        this.strict = strict;
        return this;
    }

    public override void validate(Object value) {
        if (!(value instanceof Map<String, Object>)) {
            throw new TypeSchemaException('Value is not an object.');
        }

        Map<String, Object> objValue = (Map<String, Object>) value;

        for (String fieldName : fieldSchemas.keySet()) {
            if (!objValue.containsKey(fieldName)) {
                throw new TypeSchemaException('Missing required field: ' + fieldName);
            }
            fieldSchemas.get(fieldName).validate(objValue.get(fieldName));
        }

        if (strict) {
            for (String fieldName : objValue.keySet()) {
                if (!fieldSchemas.containsKey(fieldName)) {
                    throw new TypeSchemaException('Unexpected field: ' + fieldName);
                }
            }
        }
    }
}
