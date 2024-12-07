public class StringTypeSchema extends TypeSchema {
    private Integer exactLength;
    private Integer maxLength;
    private Integer minLength;

    private Boolean isEmail = false;
    private Boolean isPhone = false;
    private Boolean isURL = false;
    private Boolean isIPV4 = false;

    private static final Pattern emailPattern = Pattern.compile('([a-zA-Z0-9_\\-\\.]+)@((\\[a-z]{1,3}\\.[a-z]{1,3}\\.[a-z]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})');
    private static final Pattern phonePattern = Pattern.compile('^\\+[1-9]{1}[0-9]{3,14}$');
    private static final Pattern urlPattern = Pattern.compile('^((http|https)://)?(www\\.)?[a-zA-Z0-9:.]{1,256}\\.[a-zA-Z]{2,6}([#&?][a-zA-Z0-9&%:]*)?$');
    private static final Pattern ipv4Pattern = Pattern.compile('^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$');

    public StringTypeSchema exact(Integer length) {
        this.exactLength = length;
        return this;
    }

    public StringTypeSchema min(Integer length) {
        this.minLength = length;
        return this;
    }

    public StringTypeSchema max(Integer length) {
        this.maxLength = length;
        return this;
    }

    public StringTypeSchema email() {
        this.isEmail = true;
        return this;
    }

    public StringTypeSchema phone() {
        this.isPhone = true;
        return this;
    }

    public StringTypeSchema url() {
        this.isURL = true;
        return this;
    }

    public StringTypeSchema ipv4() {
        this.isIPV4 = true;
        return this;
    }

    private void validateEmail(String value) {
        if (!emailPattern.matcher(value).matches()) {
            throw new TypeSchemaException('String is not a valid email address.');
        }
    }

    private void validatePhone(String value) {
        if (!phonePattern.matcher(value).matches()) {
            throw new TypeSchemaException('String is not a valid phone number.');
        }
    }

    private void validateURL(String value) {
        if (!urlPattern.matcher(value).matches()) {
            throw new TypeSchemaException('String is not a valid URL.');
        }
    }

    private void validateIPV4(String value) {
        if (!ipv4Pattern.matcher(value).matches()) {
            throw new TypeSchemaException('String is not a valid IPv4 address.');
        }
    }

    private void validateLength(String value) {
        if (this.minLength != null && value.length() < this.minLength) {
            throw new TypeSchemaException('String is too short.');
        }
        if (this.maxLength != null && value.length() > this.maxLength) {
            throw new TypeSchemaException('String is too long.');
        }
        if (this.exactLength != null && value.length() != this.exactLength) {
            throw new TypeSchemaException('String must be of exact length.');
        }
    }

    public override void validate(Object value) {
        if (!(value instanceof String)) {
            throw new TypeSchemaException('Value is not a String.');
        }
        String strValue = (String)value;

        validateLength(strValue);

        if (isEmail) validateEmail(strValue);
        if (isPhone) validatePhone(strValue);
        if (isURL) validateURL(strValue);
        if (isIPV4) validateIPV4(strValue);
    }
}
