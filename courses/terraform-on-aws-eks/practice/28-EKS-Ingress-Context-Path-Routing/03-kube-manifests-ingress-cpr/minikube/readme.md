Commands:
```bash
minikube addons enable ingress # to install the addon
# to start a tunnel
minikube tunnel  # (keep it running
# -> open localhost or 127.0.0.1
```

What was changed from the original files?
```bash
# in file 02-ALB-ingress-Basic.yml we have this:
  ingressClassName: nginx
```