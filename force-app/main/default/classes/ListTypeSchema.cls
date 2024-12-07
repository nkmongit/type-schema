/**
 * Schema class to define validation rules for lists.
 * A ListTypeSchema allows you to validate a List of values.
 */
public class ListTypeSchema extends TypeSchema {
  // A list of schemas to validate each item in the list
  private List<TypeSchema> itemSchemas = new List<TypeSchema>();

  // Minimum size of the list
  private Integer minSize;

  // Maximum size of the list
  private Integer maxSize;

  /**
   * Constructor for ListTypeSchema.
   */
  public ListTypeSchema() {
  }

  /**
   * Adds a schema to validate each item in the list.
   *
   * @param schema The schema to validate each item in the list.
   * @return The current ListTypeSchema instance for method chaining.
   */
  public ListTypeSchema addItemSchema(TypeSchema schema) {
    itemSchemas.add(schema);
    return this;
  }

  /**
   * Sets the minimum allowed size for the list.
   *
   * @param size The minimum size of the list.
   * @return The current ListTypeSchema instance for method chaining.
   */
  public ListTypeSchema minSize(Integer size) {
    this.minSize = size;
    return this;
  }

  /**
   * Sets the maximum allowed size for the list.
   *
   * @param size The maximum size of the list.
   * @return The current ListTypeSchema instance for method chaining.
   */
  public ListTypeSchema maxSize(Integer size) {
    this.maxSize = size;
    return this;
  }

  /**
   * Validates the given list based on the item schemas and size constraints.
   *
   * @param value The list to validate.
   * @throws TypeSchemaException If the list contains invalid items based on the provided schemas,
   *         or if the size constraints are violated.
   */
  public override void validate(Object value) {
    // Ensure the value is a List
    if (!(value instanceof List<Object>)) {
      throw new TypeSchemaException('Value is not a List.');
    }

    List<Object> listValue = (List<Object>) value;

    // Validate the size of the list
    if (minSize != null && listValue.size() < minSize) {
      throw new TypeSchemaException(
        'List is too small. Minimum allowed size: ' + minSize
      );
    }
    if (maxSize != null && listValue.size() > maxSize) {
      throw new TypeSchemaException(
        'List is too large. Maximum allowed size: ' + maxSize
      );
    }

    // Validate each item in the list against the provided item schemas
    for (Object item : listValue) {
      // If no item schemas are provided, validate with a generic type check
      if (itemSchemas.isEmpty()) {
        continue; // Or add some default validation logic here
      }

      // Validate each item with its corresponding schema
      for (TypeSchema itemSchema : itemSchemas) {
        itemSchema.validate(item); // Validate the item with its schema
      }
    }
  }

  /**
   * Performs a binary search on a list to find the target item.
   * The list must be sorted in ascending order for binary search to work correctly.
   * This method compares elements based on their type, such as Integer, Decimal, or String.
   *
   * @param searchList The list to search through. It should be sorted before calling this method.
   * @param target The item to search for in the list. It should be of the same type as the items in the list.
   * @return The index of the target item if found, or -1 if not found.
   */
  public Integer binarySearch(List<Object> searchList, Object target) {
    if (searchList == null || searchList.size() == 0) {
      return -1; // Return -1 if the list is empty or null
    }

    Integer low = 0;
    Integer high = searchList.size() - 1;

    while (low <= high) {
      Integer mid = (low + high) / 2;
      Object midItem = searchList.get(mid);

      // Type-specific comparison
      if (midItem instanceof String && target instanceof String) {
        String midStr = (String) midItem;
        String targetStr = (String) target;
        if (midStr == targetStr) {
          return mid; // Target found at index mid
        } else if (midStr < targetStr) {
          low = mid + 1; // Search in the right half
        } else {
          high = mid - 1; // Search in the left half
        }
      } else if (midItem instanceof Decimal && target instanceof Decimal) {
        Decimal midDec = (Decimal) midItem;
        Decimal targetDec = (Decimal) target;
        if (midDec == targetDec) {
          return mid; // Target found at index mid
        } else if (midDec < targetDec) {
          low = mid + 1; // Search in the right half
        } else {
          high = mid - 1; // Search in the left half
        }
      } else if (midItem instanceof Integer && target instanceof Integer) {
        Integer midInt = (Integer) midItem;
        Integer targetInt = (Integer) target;
        if (midInt == targetInt) {
          return mid; // Target found at index mid
        } else if (midInt < targetInt) {
          low = mid + 1; // Search in the right half
        } else {
          high = mid - 1; // Search in the left half
        }
      } else {
        throw new IllegalArgumentException(
          'Target and list elements must be of the same type.'
        );
      }
    }

    return -1; // Return -1 if the target is not found in the list
  }
  /**
   * Sorts a list in ascending order using the bubble sort algorithm.
   * The list elements are compared based on their type, which can be String, Integer, or Decimal.
   * The method sorts the list by repeatedly swapping adjacent items if they are in the wrong order.
   *
   * @param unsortedList The list to be sorted. The list elements must be of the same type.
   * @return The sorted list in ascending order.
   */
  public List<Object> bubbleSort(List<Object> unsortedList) {
    Integer n = unsortedList.size(); // Get the size of the list
    Boolean swapped;

    // Outer loop for each pass through the list
    for (Integer i = 0; i < n - 1; i++) {
      swapped = false; // Flag to track if a swap was made in this pass

      // Inner loop to compare adjacent elements
      for (Integer j = 0; j < n - i - 1; j++) {
        Object currentItem = unsortedList.get(j);
        Object nextItem = unsortedList.get(j + 1);

        // Compare based on the type of the elements in the list
        if (currentItem instanceof String && nextItem instanceof String) {
          String currentStr = (String) currentItem;
          String nextStr = (String) nextItem;
          if (currentStr > nextStr) {
            unsortedList.set(j, nextItem);
            unsortedList.set(j + 1, currentItem);
            swapped = true; // A swap was made
          }
        } else if (
          currentItem instanceof Decimal && nextItem instanceof Decimal
        ) {
          Decimal currentDec = (Decimal) currentItem;
          Decimal nextDec = (Decimal) nextItem;
          if (currentDec > nextDec) {
            unsortedList.set(j, nextItem);
            unsortedList.set(j + 1, currentItem);
            swapped = true; // A swap was made
          }
        } else if (
          currentItem instanceof Integer && nextItem instanceof Integer
        ) {
          Integer currentInt = (Integer) currentItem;
          Integer nextInt = (Integer) nextItem;
          if (currentInt > nextInt) {
            unsortedList.set(j, nextItem);
            unsortedList.set(j + 1, currentItem);
            swapped = true; // A swap was made
          }
        } else {
          throw new IllegalArgumentException(
            'List elements must be of the same type.'
          );
        }
      }

      // If no elements were swapped, the list is sorted, and we can break early
      if (!swapped) {
        break;
      }
    }

    return unsortedList; // Return the sorted list
  }

  /**
   * Flattens a nested list into a single list of elements.
   * This method processes lists with nested structures recursively.
   *
   * @param nestedList The list containing nested elements.
   * @return A single-level list with all elements from the nested structure.
   */
  public List<Object> flattenList(List<Object> nestedList) {
    List<Object> flatList = new List<Object>();
    for (Object item : nestedList) {
      if (item instanceof List<Object>) {
        flatList.addAll(flattenList((List<Object>) item)); // Recursively flatten
      } else {
        flatList.add(item); // Add non-list items directly
      }
    }
    return flatList;
  }

  /**
   * Splits a list into smaller sublists of a specified size.
   *
   * @param inputList The list to be divided.
   * @param pageSize The number of elements per sublist.
   * @return A list of sublists, each containing up to pageSize elements.
   */
  public List<List<Object>> paginateList(
    List<Object> inputList,
    Integer pageSize
  ) {
    List<List<Object>> paginatedList = new List<List<Object>>();
    for (Integer i = 0; i < inputList.size(); i += pageSize) {
      paginatedList.add(
        subList(inputList, i, Math.min(i + pageSize, inputList.size()))
      );
    }
    return paginatedList;
  }

  /**
   * Creates a sublist from a given list, starting and ending at the specified indices.
   *
   * @param inputList The original list.
   * @param fromIndex The starting index (inclusive).
   * @param toIndex The ending index (exclusive).
   * @return A new list containing elements from fromIndex to toIndex.
   * @throws System.ListException if indices are out of range.
   */
  public List<Object> subList(
    List<Object> inputList,
    Integer fromIndex,
    Integer toIndex
  ) {
    // Check for valid indices
    if (fromIndex < 0 || toIndex > inputList.size() || fromIndex > toIndex) {
      throw new System.ListException('Invalid indices for subList operation.');
    }

    List<Object> result = new List<Object>();
    for (Integer i = fromIndex; i < toIndex; i++) {
      result.add(inputList[i]);
    }
    return result;
  }

  /**
   * Finds the mode (most frequent element) in a list.
   *
   * @param inputList The list to process.
   * @return The element that appears most frequently, or null if the list is empty.
   */
  public Object findMode(List<Object> inputList) {
    // Map to store the frequency of each element
    Map<Object, Integer> frequencyMap = new Map<Object, Integer>();

    // Populate the frequency map
    for (Object item : inputList) {
      if (frequencyMap.containsKey(item)) {
        frequencyMap.put(item, frequencyMap.get(item) + 1); // Increment count if the item exists
      } else {
        frequencyMap.put(item, 1); // Initialize count to 1 if the item is seen for the first time
      }
    }

    // Initialize variables to track the mode and max frequency
    Object mode = null;
    Integer maxFrequency = 0;

    // Iterate through the frequency map to find the mode
    for (Object key : frequencyMap.keySet()) {
      Integer frequency = frequencyMap.get(key);
      if (frequency > maxFrequency) {
        maxFrequency = frequency;
        mode = key;
      }
    }

    // Return the mode (most frequent element) or null if no mode was found
    return mode;
  }
}
