Main issues:
The API docker file was missing the installation step for the required packages
The application was only listening for connections inside the container and was blocking external connections for my machine via localhost
----------------------------------
Fixing:
The initial error after building was the API docker file ('docker') could not find the module 'flask', which needed to be edited to include the installation step.
-I first checked if the containers were running, the front end was, the backend was failing with the following error "ModuleNotFoundError: No module named 'flask'". This indicated to me that flask was no installed in the container, I checked if it was defined in the requirements file and it was. This means the requirements were not being installed in the container. After checking the Dockerfile, copying of the requirements was being done but not installing the dependencies within it. Once installing the requirements, both containers started up. 
-Dockerfile edited and saved
-containers status were 'running'
After checking the containers were running, the next issue was to find the cause of the front end message not loading, this was due to the port exposure only being internal on the app.py, after allowing connections from localhost the front end loaded without errors 
-Load the defined port assigned (localhost://5000/data)
-Use the 'empty response error' to research common causes and compare to the project
-The port exposure defined in the app.py file was the issue, with requiring an edit to expose the port to external access
-Front end loaded default message and edited message
----------------------------------
Build.sh script
For a .sh script, you need WSL installed on your machine
Performing some research (Google search) for the steps needed, the script was able to be created
using the Bash CLI, a script was generated and saved to the project to build and run the application
