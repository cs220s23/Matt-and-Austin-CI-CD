import unittest
import app


class Tester(unittest.TestCase):
    def test_hello(self):
        count = read_count()
        self.assertEqual(count, save_count(count))
