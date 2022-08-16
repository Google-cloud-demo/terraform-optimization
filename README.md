Google Kubernetes Engine (GKE) Module
This repo contains a Terraform module for running a Kubernetes cluster on Google Cloud Platform (GCP) using Google Kubernetes Engine (GKE).

Quickstart
If you want to quickly spin up a GKE Public Cluster, you can run the example that is in the root of this repo. Check out the gke-basic-helm example documentation for instructions.

What's in this repo
This repo has the following folder structure:

root: The root folder contains an example of how to deploy a GKE Public Cluster with an example chart with Helm. See gke-basic-helm for the documentation.

modules: This folder contains the main implementation code for this Module, broken down into multiple standalone submodules.

The primary module is:

gke-cluster: The GKE Cluster module is used to administer the cluster master for a GKE Cluster.
There are also several supporting modules that add extra functionality on top of gke-cluster:

gke-service-account: Used to configure a GCP service account for use with a GKE cluster.
examples: This folder contains examples of how to use the submodules.

test: Automated tests for the submodules and examples.

What is Kubernetes?
Kubernetes is an open source container management system for deploying, scaling, and managing containerized applications. Kubernetes is built by Google based on their internal proprietary container management systems (Borg and Omega). Kubernetes provides a cloud agnostic platform to deploy your containerized applications with built in support for common operational tasks such as replication, autoscaling, self-healing, and rolling deployments.

You can learn more about Kubernetes from the official documentation.

What is GKE?
Google Kubernetes Engine or "GKE" is a Google-managed Kubernetes environment. GKE is a fully managed experience; it handles the management/upgrading of the Kubernetes cluster master as well as autoscaling of "nodes" through "node pool" templates.

Through GKE, your Kubernetes deployments will have first-class support for GCP IAM identities, built-in configuration of high-availability and secured clusters, as well as native access to GCP's networking features such as load balancers.

How do you run applications on Kubernetes?
There are three different ways you can schedule your application on a Kubernetes cluster. In all three, your application Docker containers are packaged as a Pod, which are the smallest deployable unit in Kubernetes, and represent one or more Docker containers that are tightly coupled. Containers in a Pod share certain elements of the kernel space that are traditionally isolated between containers, such as the network space (the containers both share an IP and thus the available ports are shared), IPC namespace, and PIDs in some cases.

Pods are considered to be relatively ephemeral disposable entities in the Kubernetes ecosystem. This is because Pods are designed to be mobile across the cluster so that you can design a scalable fault tolerant system. As such, Pods are generally scheduled with Controllers that manage the lifecycle of a Pod. Using Controllers, you can schedule your Pods as:

Jobs, which are Pods with a controller that will guarantee the Pods run to completion.
Deployments behind a Service, which are Pods with a controller that implement lifecycle rules to provide replication and self-healing capabilities. Deployments will automatically reprovision failed Pods, or migrate Pods to healthy nodes off of failed nodes. A Service constructs a consistent endpoint that can be used to access the Deployment.
Daemon Sets, which are Pods that are scheduled on all worker nodes. Daemon Sets schedule exactly one instance of a Pod on each node. Like Deployments, Daemon Sets will reprovision failed Pods and schedule new ones automatically on new nodes that join the cluster.