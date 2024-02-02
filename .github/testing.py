import testinfra
import subprocess
import unittest

class Test(unittest.TestCase):
    def setup(self):
        subprocess.check_call(['docker', 'build', '-f', '../example/hello-bellshade/Dockerfile', '-t', 'testing-image', '.'])
        docker_id = subprocess.check_output(['docker', 'run', '-d', 'testing-image']).decode().strip()
        self.host = testinfra.get_host("docker://" + docker_id)
    
    def test_image_hello(self):
        self.assertEqual(self.host.system_info.type, 'alpine')

if __name__ == "__main__":
    unittest.main()