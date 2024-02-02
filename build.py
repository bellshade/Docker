import testinfra
import subprocess
import unittest
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("filename", help="Letak dockerfile kamu seperti ex. ./path/Dockerfile")
parser.add_argument("port", help="Dockerport sesuai expose di image")

args = parser.parse_args()
fileDocker = args.filename
dockerPort = args.port

socket = f"tcp://0.0.0.0:{dockerPort}"
class Test(unittest.TestCase):
    """
    # Description
    Class ini untuk unittesting
    dockerfile yang sudah kalian buat
    """
    def setUp(self):
        """
        # Description
        Fungsi ini digunakan untuk
        install image yang kalian sudah buat dockerfilenya.
        
        Jika berada di path yang berbeda filenya
        kalian bias dengan cara `./path/Dockerfile`
        Input docker port yang sesuai dari expose imagenya
        """
        subprocess.check_call(['docker', 'build', '-f' , fileDocker, '-t', 'testing-image', '.'])
        
        port = f"{dockerPort}:{dockerPort}"
        containerID = subprocess.check_output(['docker', 'run', '-dp', port, 'testing-image']).decode().strip()
        
        self.host = testinfra.get_host("docker://" + containerID)
        
    def test_image(self):
        """
        # Description
        Fungsi ini untuk check apakah base image 
        yang kalian gunakan, sudah install net-tools
        untuk testing kalau containernya sudah berjalan
        
        Fungsi berguna untuk check port di dalam container
        sudah running
        """
        self.assertTrue(self.host.package('net-tools').is_installed)
        self.assertTrue(self.host.socket(socket).is_listening)

if __name__ == "__main__":
    unittest.main(argv=['first-arg-is-ignored'], exit=False)