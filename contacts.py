# assumes csv file named contacts.csv in same folder as script
# export google contacts as 'outlook style csv'
# inbuilt py function
import csv
import re

# assumes four year degree
def increment_year(match):
    year = int(match.group(1))
    # Preserve the original suffix if it exists
    suffix = match.group(2) if len(match.groups()) > 1 else ""
    
    if year == 4:
        return "Alumni"
    
    # Map ordinal suffixes correctly
    ordinal_suffixes = {1: "st", 2: "nd", 3: "rd"}
    if suffix and suffix.lower() in ['st', 'nd', 'rd', 'th']:
        new_suffix = ordinal_suffixes.get(year + 1, "th")
    else:
        new_suffix = suffix
    
    return f"{year + 1}{new_suffix}"

# regex patterns to increment college year
def update_contact_year(name):
    patterns = [
        r"(\d)\s*(yr?)",
        r"(\d)(?:st|nd|rd|th)\s*(yr?)",
        r"(\d)\s*(Year)",
        r"(\d)(?:st|nd|rd|th)\s*(Year)",
        r"(\d)(?:st|nd|rd|th)"
    ]

    original_name = name
    for pattern in patterns:
        name = re.sub(pattern, increment_year, name, flags=re.IGNORECASE)

    return name if name != original_name else original_name

# parse csv file
def process_csv(input_file, output_file):
    with open(input_file, 'r', newline='', encoding='utf-8') as infile, \
            open(output_file, 'w', newline='', encoding='utf-8') as outfile:

        reader = csv.DictReader(infile)
        fieldnames = reader.fieldnames

        writer = csv.DictWriter(outfile, fieldnames=fieldnames)
        writer.writeheader()

        rows_processed = 0
        rows_updated = 0

        for row in reader:
            updated_row = row.copy()
            for field in ['First Name', 'Middle Name', 'Last Name']:
                if updated_row[field]:
                    updated_value = update_contact_year(updated_row[field])
                    if updated_value != updated_row[field]:
                        updated_row[field] = updated_value
                        rows_updated += 1

            writer.writerow(updated_row)
            rows_processed += 1

    return rows_processed, rows_updated

if __name__ == "__main__":
    input_file = 'contacts.csv'
    output_file = 'updated_contacts.csv'
    rows_processed, rows_updated = process_csv(input_file, output_file)
    print(f"Processed {rows_processed} rows.")
    print(f"Updated {rows_updated} fields.")
    print(f"Updated contacts have been saved to {output_file}")
