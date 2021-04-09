# servers

This is a simple repo because I was tired of trying to remember everytime how to host a flutter project on a server. I've put simple examples of two different servers here. Both very small and lightweight. One uses the [get_server](https://pub.dev/packages/get_server) package, the other uses primarily [shelf](https://pub.dev/packages/shelf) but also [functions_framework](https://github.com/GoogleCloudPlatform/functions-framework-dart).  All they do is host your Flutter web project. There's really no other functionality. They both use the same setup and the same Docker file. Below are the instructions for using Docker to containerize and upload them to google cloud.

## Quick shout outs to the following people for making my life much easier for this:
- [Jermaine Oppong YouTube Tutorial](https://www.youtube.com/watch?v=y6Z1V8QpGFc)
- [Nick Manning YouTube Tutorial](https://www.youtube.com/watch?v=SIDOSAdevWM)
- [Tony Pujals - Google Engineer](https://medium.com/google-cloud/build-slim-docker-images-for-dart-apps-ee98ea1d1cf7)

## Docker
- Ensure docker is installed, to check run:  
```$ docker run hello-world```
- Take a flutter project that's ready for web deployment
- In the root of that directory, run
```$ flutter build web```
- copy the contents of folder ```build/web``` to the folder ```web``` in the server - currently they just hold an example of the startup app
- replace what is currently in the web folder (although if you want to use the workflow of having OAuth done in an external window, I've kept the static.html file in the web folder that you may use, read more about [that here](https://itnext.io/flutter-web-oauth-authentication-through-external-window-d890a7ff6463))
- From the root of the server project, run the following:
```$ docker build -t projectName .```
- Test it:  
```$ docker run -d -p 8080:8080 projectName```
- Get Google Cloud account
- Create Project
- Note Project ID
- Enable Container Registry
- Initialize gcloud  
```$ gcloud init```
- Configure docker for gcloud  
```$ gcloud auth configure-docker```
- Build container in Google Cloud Container Registry  
```$ docker build -t gcr.io/projectId/projectName:version .```  
For the above, the projectId is your GCP project ID, the projectName is the name of the docker file that we had above, and the version is however you want to define versions in the cloud so in the future you'll know which is which. For instance, if our GCP project Id is ```new-project-123456``` our docker project was called ```docker-project```, we would write:  
```$ docker build -t gcr.io/new-project-123456/docker-project:v0.1 .```
- Push container to cloud
```$ docker push gcr.io/projectId/projectNam:version```
