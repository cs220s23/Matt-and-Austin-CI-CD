import unittest
import app


class Tester(unittest.TestCase):
    def test_hello(self):
        count = app.read_count()
        self.assertEqual(count, app.save_count(count))
