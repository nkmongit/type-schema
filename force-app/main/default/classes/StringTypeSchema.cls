public class StringTypeSchema extends TypeSchema {
    private Integer exactLength;
    private Integer maxLength;
    private Integer minLength;

    public StringTypeSchema email(String value) {
        return this.validateEmail(value);
    }

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

    public StringTypeSchema phone(String value) {
        return this.validatePhone(value);
    }

    public StringTypeSchema url(String value) {
        return this.validateURL(value);
    }

    public StringTypeSchema ipv4(String value) {
        return this.validateIPV4(value);
    }

    private StringTypeSchema validateEmail(String value) {
        String emailRegex = '([a-zA-Z0-9_\\-\\.]+)@((\\[a-z]{1,3}\\.[a-z]{1,3}\\.[a-z]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})';
        Pattern emailPattern = Pattern.compile(emailRegex);
        Matcher matcher = emailPattern.matcher(value);
        if (!matcher.matches()) {
            throw new TypeSchemaException('String is not a valid email address');
        }
        return this;
    }


    private StringTypeSchema validateIPV4(String value) {
        String ipRegex = '^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$';
        Pattern ipPattern = Pattern.compile(ipRegex);
        Matcher matcher = ipPattern.matcher(value);
        if (!matcher.matches()) {
            throw new TypeSchemaException('String is not a valid ipv4 address');
        }
        return this;
    }

    public void validateLength(String value) {
        if (this.minLength != null && value.length() < this.minLength) {
            throw new TypeSchemaException('String is too short');
        }
        if (this.maxLength != null && value.length() > this.maxLength) {
            throw new TypeSchemaException('String is too long');
        }
        if(this.exactLength != null && value.length() != this.exactLength) {
            throw new TypeSchemaException('String must be of exact length');
        }
    }

    public void validateLength(String value, String customError) {
        if (this.minLength != null && value.length() < this.minLength) {
            if(customError != null && customError.trim() != '' && customError.trim().length() > 0) {
                throw new TypeSchemaException(customError);
            }
            else if (customError == null) {
                throw new TypeSchemaException('String is too short');
            }
        }
        if (this.maxLength != null && value.length() > this.maxLength) {
            if(customError != null && customError.trim() != '' && customError.trim().length() > 0) {
                throw new TypeSchemaException(customError);
            }
            else if(customError == null) {
                throw new TypeSchemaException('String is too long');
            }
        }
        if (this.exactLength != null && value.length() != this.exactLength) {
            if(customError != null && customError.trim() != '' && customError.trim().length() > 0) {
                throw new TypeSchemaException(customError);
            }
            else if(customError == null) {
                throw new TypeSchemaException('String must be of exact length');
            }
        }
    }

    private StringTypeSchema validateURL(String value) {
        // ! NEED TO PROVIDE GOOD REGEX FOR THIS
        Pattern urlPattern = Pattern.compile(
            '^((http|https)://)??(www[.])??[a-zA-Z0-9:.]{1,256}[.]{1}[a-zA-Z]{2,6}([.]{1}[a-zA-Z0-9]{2,6}){1,2}([#&?]{1}[a-zA-Z0-9&%:]{1,256})?([.]{1}[a-zA-Z0-9]{2,6}){1,2}([.]{1}[a-zA-Z]{2,6}){1,2}$'
        );
        Matcher matcher = urlPattern.matcher(value);
        if (!matcher.matches()) {
            throw new TypeSchemaException('String is not a valid URL');
        }
        return this;
    }

    private StringTypeSchema validatePhone(String value) {
        String phoneRegex = '^\\+[1-9]{1}[0-9]{3,14}$';
        Pattern phonePattern = Pattern.compile(phoneRegex);
        Matcher matcher = phonePattern.matcher(value);
        if (!matcher.matches()) {
            throw new TypeSchemaException('String is not a phone number');
        }
        return this;
    }
}