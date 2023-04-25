# Matt-and-Austin-CI-CD
Continuous Integration and Continuous Deployment repository for Matthew and Austin's final project.

Continuous Integration:

On a pull request:
 - Use GitHub Actions to run pylint on this repository
    - This will ensure that any files present in this repository have the correct syntax and contain no blatant mistakes
 - Use GitHub Actions to run pytest on this repository
    - This will run a test on the code (currently an arbitrary, always true statement)

Continuous Deployment:

On a Merge:
 - Use GitHub Actions "ssh" into a script within an EC2 instance
    - This script will build a docker container in which an image of the app.py file will be built
    - This script will also retain any data collected by building another container which calls to a redis server 

About:

About app.py:
 - app.py will run a web counter code which will count the number of times the webpage is reloaded or visited

About redeploy.sh
 - redeploy.sh will be the bash script used to perform the Continuous Deployment
    - This bash script begins by ensuring that the git and docker packages are installed within the EC2 instance
    - This script removes any existent clone of this repository and proceeds to clone the repository again. (This is mainly to ensure that the EC2 instance remains up to date with this repository)
    - This script ensures docker is running and runs the down file to bring down any currently operating containers
    - This script moves the environment variable for the redis container into the cloned repository
    - This script then builds new docker containers (namely app and redis) from the Dockerfile present in this repository and runs them 
    - This script concludes with some clean-up involving removing the redis environment variable from the cloned repository and copying the newest version of the redeploy.sh script into the instance, in order to be called on subsequent merges.

Running the app within the EC2 instance:
 - The app.py file can be run using the following string in any browser: 3.89.125.125:5000
