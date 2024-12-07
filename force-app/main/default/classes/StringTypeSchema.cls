/**
 * This class defines the schema for validating string values based on length, format,
 * and other specified conditions like email, phone, and URL formats.
 */
public class StringTypeSchema extends TypeSchema {
  private Integer exactLength;
  private Integer maxLength;
  private Integer minLength;

  private Boolean isEmail = false;
  private Boolean isPhone = false;
  private Boolean isURL = false;
  private Boolean isIPV4 = false;
  private Boolean isAlpha = false;
  private Boolean isAlphanumeric = false;
  private Boolean isUpperCase = false;
  private Boolean isLowerCase = false;

  private static final Pattern emailPattern = Pattern.compile(
    '([a-zA-Z0-9_\\-\\.]+)@((\\[a-z]{1,3}\\.[a-z]{1,3}\\.[a-z]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})'
  );
  private static final Pattern phonePattern = Pattern.compile(
    '^\\+[1-9]{1}[0-9]{3,14}$'
  );
  private static final Pattern urlPattern = Pattern.compile(
    '^((http|https)://)?(www\\.)?[a-zA-Z0-9:.]{1,256}\\.[a-zA-Z]{2,6}([#&?][a-zA-Z0-9&%:]*)?$'
  );
  private static final Pattern ipv4Pattern = Pattern.compile(
    '^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$'
  );
  private static final Pattern alphaPattern = Pattern.compile('^[a-zA-Z]+$');
  private static final Pattern alphanumericPattern = Pattern.compile(
    '^[a-zA-Z0-9]+$'
  );
  private static final Pattern upperCasePattern = Pattern.compile('^[A-Z]+$');
  private static final Pattern lowerCasePattern = Pattern.compile('^[a-z]+$');

  /**
   * Sets the exact length for the string.
   *
   * @param length The exact length the string should have.
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema exact(Integer length) {
    this.exactLength = length;
    return this;
  }

  /**
   * Sets the minimum length for the string.
   *
   * @param length The minimum length the string should have.
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema min(Integer length) {
    this.minLength = length;
    return this;
  }

  /**
   * Sets the maximum length for the string.
   *
   * @param length The maximum length the string can have.
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema max(Integer length) {
    this.maxLength = length;
    return this;
  }

  /**
   * Specifies that the string should be a valid email address.
   *
   * This will validate if the string matches the pattern of a standard email address.
   *
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema email() {
    this.isEmail = true;
    return this;
  }

  /**
   * Specifies that the string should be a valid phone number.
   *
   * This will validate if the string matches the pattern of a phone number.
   *
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema phone() {
    this.isPhone = true;
    return this;
  }

  /**
   * Specifies that the string should be a valid URL.
   *
   * This will validate if the string matches the pattern of a URL.
   *
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema url() {
    this.isURL = true;
    return this;
  }

  /**
   * Specifies that the string should be a valid IPv4 address.
   *
   * This will validate if the string matches the pattern of an IPv4 address.
   *
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema ipv4() {
    this.isIPV4 = true;
    return this;
  }

  /**
   * Specifies that the string should contain only alphabetic characters (a-zA-Z).
   *
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema alpha() {
    this.isAlpha = true;
    return this;
  }

  /**
   * Specifies that the string should contain only alphanumeric characters (a-zA-Z0-9).
   *
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema alphanumeric() {
    this.isAlphanumeric = true;
    return this;
  }

  /**
   * Specifies that the string should contain only uppercase characters (A-Z).
   *
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema upperCase() {
    this.isUpperCase = true;
    return this;
  }

  /**
   * Specifies that the string should contain only lowercase characters (a-z).
   *
   * @return The current instance of StringTypeSchema, allowing method chaining.
   */
  public StringTypeSchema lowerCase() {
    this.isLowerCase = true;
    return this;
  }

  /**
   * Validates if the string matches the pattern of a valid email address.
   *
   * @param value The string to validate.
   * @throws TypeSchemaException If the string is not a valid email address.
   */
  private void validateEmail(String value) {
    if (!emailPattern.matcher(value).matches()) {
      throw new TypeSchemaException('String is not a valid email address.');
    }
  }

  /**
   * Validates if the string matches the pattern of a valid phone number.
   *
   * @param value The string to validate.
   * @throws TypeSchemaException If the string is not a valid phone number.
   */
  private void validatePhone(String value) {
    if (!phonePattern.matcher(value).matches()) {
      throw new TypeSchemaException('String is not a valid phone number.');
    }
  }

  /**
   * Validates if the string matches the pattern of a valid URL.
   *
   * @param value The string to validate.
   * @throws TypeSchemaException If the string is not a valid URL.
   */
  private void validateURL(String value) {
    if (!urlPattern.matcher(value).matches()) {
      throw new TypeSchemaException('String is not a valid URL.');
    }
  }

  /**
   * Validates if the string matches the pattern of a valid IPv4 address.
   *
   * @param value The string to validate.
   * @throws TypeSchemaException If the string is not a valid IPv4 address.
   */
  private void validateIPV4(String value) {
    if (!ipv4Pattern.matcher(value).matches()) {
      throw new TypeSchemaException('String is not a valid IPv4 address.');
    }
  }

  /**
   * Validates if the string contains only alphabetic characters (a-zA-Z).
   *
   * @param value The string to validate.
   * @throws TypeSchemaException If the string is not alphabetic.
   */
  private void validateAlpha(String value) {
    if (!alphaPattern.matcher(value).matches()) {
      throw new TypeSchemaException('String is not alphabetic.');
    }
  }

  /**
   * Validates if the string contains only alphanumeric characters (a-zA-Z0-9).
   *
   * @param value The string to validate.
   * @throws TypeSchemaException If the string is not alphanumeric.
   */
  private void validateAlphanumeric(String value) {
    if (!alphanumericPattern.matcher(value).matches()) {
      throw new TypeSchemaException('String is not alphanumeric.');
    }
  }

  /**
   * Validates if the string contains only uppercase characters (A-Z).
   *
   * @param value The string to validate.
   * @throws TypeSchemaException If the string is not uppercase.
   */
  private void validateUpperCase(String value) {
    if (!upperCasePattern.matcher(value).matches()) {
      throw new TypeSchemaException('String is not uppercase.');
    }
  }

  /**
   * Validates if the string contains only lowercase characters (a-z).
   *
   * @param value The string to validate.
   * @throws TypeSchemaException If the string is not lowercase.
   */
  private void validateLowerCase(String value) {
    if (!lowerCasePattern.matcher(value).matches()) {
      throw new TypeSchemaException('String is not lowercase.');
    }
  }

  /**
   * Validates the length of the string.
   *
   * It checks if the string meets the specified minimum, maximum, or exact length.
   *
   * @param value The string to validate.
   * @throws TypeSchemaException If the string does not meet the length constraints.
   */
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

  /**
   * Validates the string based on the defined rules for length, format, and other conditions.
   *
   * @param value The string value to validate.
   * @throws TypeSchemaException If the string does not meet the specified conditions.
   */
  public override void validate(Object value) {
    if (!(value instanceof String)) {
      throw new TypeSchemaException('Value is not a String.');
    }
    String strValue = (String) value;

    // Validate the string length
    validateLength(strValue);

    // Validate based on specific format types
    if (isEmail)
      validateEmail(strValue);
    if (isPhone)
      validatePhone(strValue);
    if (isURL)
      validateURL(strValue);
    if (isIPV4)
      validateIPV4(strValue);
    if (isAlpha)
      validateAlpha(strValue);
    if (isAlphanumeric)
      validateAlphanumeric(strValue);
    if (isUpperCase)
      validateUpperCase(strValue);
    if (isLowerCase)
      validateLowerCase(strValue);
  }
}
