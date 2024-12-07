# **TypeSchema**

![TypeSchema](https://img.shields.io/badge/Apex-Validator-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-orange?style=for-the-badge)

---

## **🚀 Overview**

**TypeSchema** is a robust library for creating type-safe validations in Salesforce using Apex.  
With this tool, you can:  

- **Simplify schema validation**  
- **Ensure data integrity**  
- **Streamline your development workflow**

This library is designed to help Apex developers write cleaner, more maintainable, and error-free code for modern Salesforce applications.

---

## **✨ Features**

- **Lightweight & Efficient**: Minimal performance overhead while delivering powerful validation capabilities.  
- **Type-Safe Validation**: Enforce strict rules on your data structure.  
- **Dynamic Schema Creation**: Easily define and modify validation schemas.  
- **Easy Integration**: Seamlessly integrates into existing Salesforce Apex projects.  

---

## **🛠️ Installation**

1. Clone the repository:  

   ```bash
   git clone https://github.com/nkmongit/type-schema.git
2. Deploy the classes to your Salesforce org using Salesforce DX or any other deployment tool.
3. Start using the TypeSchema library in your Apex projects!

📚 TypeSchema Classes
This section provides an overview of different classes within the TypeSchema library, used to validate various types of data.

---

## Documentation

1. **StringTypeSchema**

The StringTypeSchema class validates string values, ensuring they adhere to rules like length and pattern.

Example Usage:

```java
// Create a StringTypeSchema for string length validation
StringTypeSchema stringSchema = TypeSchema.string().min(3).max(10);

// Sample string to validate
String sampleString = 'HelloWorld';

// Validate the string
try {
    stringSchema.validate(sampleString);
    System.debug('String is valid!');
} catch (TypeSchemaException e) {
    System.debug('Validation failed: ' + e.getMessage());
}
```

Description:

- Purpose: Validates strings based on their length (minimum and maximum).
- Example: The string 'HelloWorld' is valid as it fits within the length constraints of 3 and 10 characters.

---

2. **IntegerTypeSchema**

The IntegerTypeSchema validates integer values, ensuring they fall within a specific range.

Example Usage:

```java
// Create an IntegerTypeSchema with a range validation
IntegerTypeSchema integerSchema = TypeSchema.integer().min(1).max(100);

// Sample integer to validate
Integer sampleInteger = 50;

// Validate the integer
try {
    integerSchema.validate(sampleInteger);
    System.debug('Integer is valid!');
} catch (TypeSchemaException e) {
    System.debug('Validation failed: ' + e.getMessage());
}

```