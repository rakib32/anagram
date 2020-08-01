# Program to check if two strings are anagrams of each other

NO_OF_CHARS = 256

debug = True


# Function to check whether two strings are anagram of each other
def areAnagram(str1, str2):
    # Create count arrays and initialize all values as 0
    count = [0] * NO_OF_CHARS
    str1 = str1.lower()
    str2 = str2.lower()

    # For each character in input strings, increment count
    for i in range(len(str1)):
        if str1[i] and i < len(str2):
            count[ord(str1[i])] += 1
            count[ord(str2[i])] -= 1

    # If both strings are of different length.
    if len(str1) != len(str2):
        return False

    # Compare count arrays
    for i in range(NO_OF_CHARS):
        if count[i]:
            return False
    return True


def lambda_handler(event, context):
    result = "Failed"
    if areAnagram("AB", "ab"):
        result = "Success"

    return result