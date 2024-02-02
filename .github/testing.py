import testinfra
import subprocess
import unittest

class Test(unittest.TestCase):
    def setUp(self):
        subprocess.check_call(['docker', 'build', '-f', '../example/hello-bellshade/Dockerfile', '-t', 'testing-image', '.'])
    
    def test_image_hello(self):
        output = subprocess.check_output(['docker', 'run', 'testing-image']).decode().strip()
        self.assertEqual(output, "Hello Bellshade")

if __name__ == "__main__":
    unittest.main()