import unittest
import anagram


class AnagramTestCase(unittest.TestCase):
    def test_empty_string(self):
        self.assertEqual(anagram.areAnagram("", ""), True)

    def test_upper_small(self):
        self.assertEqual(anagram.areAnagram("AB", "ba"), True)
        self.assertEqual(anagram.areAnagram("ab", "BA"), True)

    def test_same_string(self):
        self.assertEqual(anagram.areAnagram("ab", "ab"), True)

    def test_length(self):
        self.assertEqual(anagram.areAnagram("abc", "ab"), False)
        self.assertEqual(anagram.areAnagram("ab", "abc"), False)


if __name__ == '__main__':
    unittest.main()
