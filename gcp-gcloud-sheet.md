# gcp-gcloud-shell commands
Some of the common commands being used in normal workflow.

#### Setters & Getters:
```
# setting the SA json key
export GOOGLE_APPLICATION_CREDENTIALS=path-to-service account-key

# disabling the prompt same as --quite 
CLOUDSDK_CORE_DISABLE_PROMPTS=1

# setting up projects
gcloud config set project project_name
gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a

export PROJECT_ID=`gcloud config get-value project`
export REGION=`gcloud config get-value compute/region`
export ZONE=`gcloud config get-value compute/zone`
echo $PROJECT_ID $REGION $ZONE
```

#### Compute
```
# Port forwarding through IAP
gcloud beta compute ssh --zone "us-west1-a" "host-us-wst1-a-01" --tunnel-through-iap --project $PROJECT -- -f -N -L 8081:localhost:443
```

#### GKE
```
gcloud container clusters create hello-cluster --num-nodes=1 --labels owner=ishaq --project metal-voyager-280804 --preemptible  
```


#### Networking
```

export GCP_REGION="us-west1"
export NET_NAME="vpc-1"
export SUBNET1_NAME="gke-subnet-1"
export SUBNET1_RANGE="10.192.43.0/24"
export SUBNET1_POD_RANGE="10.194.0.0/16"
export SUBNET1_SVC_RANGE="10.192.44.0/22"

#vpc creation
gcloud compute networks create $NET_NAME --subnet-mode custom

#subnet with secondary ranges
gcloud beta compute networks subnets create $SUBNET1_NAME \
--network $NET_NAME --range $SUBNET1_RANGE --region $GCP_REGION \
--secondary-range pod-range=$SUBNET1_POD_RANGE,svc-range=$SUBNET1_SVC_RANGE

# IAP firewall rule
gcloud compute firewall-rules create $NET_NAME-allow-iap-access-fw \
    --network $NET_NAME \
    --allow tcp:22 \
    --source-ranges 35.235.240.0/20 \
    --target-tags allow-iap-access



# firewall rule updation
gcloud compute firewall-rules update k8s-fw-l7--0e440d4ebdfbbd81 --description "GCE L7 firewall rule" --allow tcp:30000-32767,tcp:4141 --source-ranges 130.211.0.0/22,35.191.0.0/16 --target-tags gke-prod-gke-config-mgmt-us-wst1-cluster-a9edb9cd-node --project $PROJECT_ID
```


#### IAM

```
gcloud auth list
gcloud config list


# getting the permissions attached to role handy when creating roles with the terraform
gcloud iam roles describe roles/iam.roleViewer --format json

# custom role creation/updation
cat <<-EOF>./custom-role.yaml
title: "custom_iap_role"
description: "IAP tunnel user custom role"
stage: "ALPHA"
includedPermissions:
- compute.projects.get
- compute.instances.get
- compute.instances.getIamPolicy
- compute.instances.list
- compute.instances.setMetadata
- compute.zoneOperations.get
- iap.tunnelInstances.accessViaIAP
- accessapproval.requests.list
EOF

gcloud iam roles create custom_iap_role --file=./custom-role.yaml --project $PROJECT_ID
gcloud iam roles update custom_iap_role --file=./custom-role.yaml --project $PROJECT_ID

# deletion takes 7 days
gcloud iam roles delete custom_iap_role --project $PROJECT_ID


# SA creation & iam-role binding
SERVICE_ACCOUNT_NAME=viewer-sa
gcloud iam service-accounts create $SERVICE_ACCOUNT_NAME

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
 --member="serviceAccount:${SERVICE_ACCOUNT_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
 --role="roles/iam.roleViewer" 

export SERVICE_ACCOUNT_ID=jenkins-ci-sa
# downloading a json key for a service account
gcloud iam service-accounts keys create --iam-account \
 $SERVICE_ACCOUNT_ID@$PROJECT_ID.iam.gserviceaccount.com ./$SERVICE_ACCOUNT_ID_keys.json

# to acctivate a service account key as default user for the gcloud
gcloud auth activate-service-account --key-file=$SERVICE_ACCOUNT_ID_keys.json
```



#### Others'

* KMS encryption & decryption
```
# key & keyring generation
gcloud kms keys create secrets-kms-key-01 \
    --keyring secrets-kms-keyring-01 \
    --location location \
    --purpose "encryption"

# encryting the secret.txt with the KMS keys
gcloud kms encrypt \
    --key secrets-kms-key-01 \
    --keyring secrets-kms-keyring-01 \
    --location global \
    --plaintext-file secret.txt \
    --ciphertext-file secret.txt.enc

```

* Getting the GKE cluster name from the metadata server
```
kubectl run curl --rm --restart=Never -it --image=appropriate/curl -- -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/attributes/cluster-name
```

Recommended/Best practices ref:
```
# for managing the credentials
https://cloud.google.com/docs/authentication/production#best_practices

# understanding least privlege model
https://cloud.google.com/iam/docs/using-iam-securely#least_privilege
```



