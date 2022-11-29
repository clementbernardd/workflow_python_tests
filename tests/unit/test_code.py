import unittest

from code_example.src.code import test


class CodeTest(unittest.TestCase):
    def test_random(self):
        test()
        self.assertTrue(True)


if __name__ == "__main__":
    unittest.main()


