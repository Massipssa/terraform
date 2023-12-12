# EKS Cluster

```helm plan```
```helm apply -auto-approve```


- Verify cluster creation

```aws eks list-clusters --region [YOUR_REGION]```

- Connect to the cluster

```
aws eks --region [YOUR_REGION] update-kubeconfig --name [YOUR_CLUSTER_NAME]
kubectl config get-contexts
```

- Cleanup 

```helm destroy -auto-approve```