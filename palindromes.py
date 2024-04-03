# Let's create a simple but interesting piece of Python code that generates a palindrome checker.
# This code will determine whether a word or phrase is the same when read forwards and backwards, ignoring spaces, punctuation, and capitalization.

def is_palindrome(s):
    # Remove non-alphanumeric characters and convert to lowercase
    cleaned_s = ''.join(c for c in s if c.isalnum()).lower()
    # Check if the cleaned string is equal to its reverse
    return cleaned_s == cleaned_s[::-1]

# Test the function with a well-known palindrome
test_phrase = "A man, a plan, a canal: Panama"
result = is_palindrome(test_phrase)

result