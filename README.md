# goacalc


## Build
Building without docker \
``` 
goa gen calcsvc/design
cd cmd/calc
go build
 ```

To build a docker image containing the calc service run the following:\
```docker build -t <your tag> .```

## Run in kubernetes

Requires Helm.

To deploy using the default docker image sajfer/goacalc run: \
``` helm upgrade --install <deployment name> ./chart```

### To access the service once deployed
To be able to access the service use the following commands:\
```
export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=chart,app.kubernetes.io/instance=goacalc" -o jsonpath="{.items[0].metadata.name}")

kubectl --namespace default port-forward $POD_NAME 5000:5000
```
This will portforward localhost port 5000 to the kubernetes service.

To test that this works the following can be done: ``` curl localhost:5000/add/1/1 ``` \
If everything works it should return 2.