Commands:

```bash
minikube addons enable ingress # to install the addon
# to start a tunnel
minikube tunnel  # (keep it running
# -> open localhost or 127.0.0.1
```

What was changed from the original files?

```bash
# in file 04-ALB-ingress-Basic.yml we have added this:
  ingressClassName: nginx
  tls:
    - hosts:
        - localhost
      secretName: demo-tls-secret
```

# Local cert

# 🧩 Local HTTPS Certificate Setup for Minikube (Windows + OpenSSL)

This guide creates a **trusted local CA** and a **signed localhost certificate** for use with NGINX Ingress in
Minikube.  
It ensures Firefox/Chrome no longer show "self-signed" warnings.

---

## 1️⃣ Create a Local Root CA

```bash
# Generate the CA private key
openssl genrsa -out rootCA.key 4096

# Generate the CA certificate (valid 10 years)
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 3650 ^
  -out rootCA.pem -subj "/C=US/ST=Local/L=Local/O=MyLocalCA/CN=MyLocalCA"
```

This produces:
rootCA.key ← private key
rootCA.pem ← public CA certificate (import this into Firefox)

2️⃣ Create a Localhost Certificate and CSR

```bash
# Generate localhost private key + CSR
openssl req -new -newkey rsa:2048 -nodes ^
  -keyout localhost.key -out localhost.csr ^
  -subj "/C=US/ST=Local/L=Local/O=Dev/CN=localhost"

```

Create SAN Config (so it works for localhost + 127.0.0.1)

```powershell
@"
subjectAltName = @alt_names

[alt_names]
DNS.1 = localhost
IP.1 = 127.0.0.1
IP.2 = ::1
"@ | Out-File -Encoding ascii san.cnf

```

4️⃣ Sign the Localhost Certificate with Your CA

```powershell
openssl x509 -req -in localhost.csr -CA rootCA.pem -CAkey rootCA.key ^
-CAcreateserial -out localhost.crt -days 825 -sha256 -extfile san.cnf

```

# Import Your CA Certificate into Firefox (Trust It)

1. Open Firefox and go to: about:preferences#privacy
2. Scroll to Certificates → click View Certificates
3. Go to the Authorities tab
4. Click Import
5. Select rootCA.pem
6. ✅ Check "Trust this CA to identify websites"
7. Restart Firefox completely

# Create/Update the TLS Secret in Kubernetes

Run this in the folder you created the files.

```
kubectl create secret tls demo-tls-secret ^
--cert=localhost.crt ^
--key=localhost.key

```

# restart nginx

```bash
kubectl rollout restart deployment ingress-nginx-controller -n ingress-nginx
```