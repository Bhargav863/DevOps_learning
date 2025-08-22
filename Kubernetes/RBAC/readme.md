In Kubernetes, managing access control is crucial for maintaining security and ensuring that only authorized users have access to resources. 
Kubernetes RBAC (Role-Based Access Control) provides a powerful mechanism for controlling access to Kubernetes resources based on roles and permissions.
RBAC is used for authenctication and authorization of user.
 * Authentication --> Having access to your companyspace.
 * Authorization --> Having access to your project space.
RBAC in Kubernetes allows you to define roles and permissions for users, groups, or service accounts. It consists of four main components:
* Roles: Define a set of permissions within a namespace.
* RoleBindings: Associate roles with users, groups, or service accounts within a namespace.
* ClusterRoles: Similar to roles, but apply across the entire cluster.
* ClusterRoleBindings: Associate cluster roles with users, groups, or service accounts across the entire cluster.

## Understand Roles, RoleBindings, ClusterRoles, and ClusterRoleBindings

Let's say your cluster is deployed on Amazon EKS. We have different projects in your cluster like amazon,flipkart and Roboshop.
EKS admin/K8s adim have full access to this cluster.
When coming to the project, each project have their own namespace.
For roboshop, you provide roboshop admin access to DevOps and cloud Team and limited access to the developer team.
## ROLE: 
* Let’s say we have a Kubernetes namespace called “roboshop” and we want to grant permissions to a user named “tony” to manage pods within that namespace.

**role.yaml**

```
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: roboshop
  name: pod-manager
rules:
- apiGroups: [""] # indicates the core api group
  resources: ["pods"]
  verbs: ["get", "list", "create", "delete"]
```
* Here the role pod-manager allows the user assigned with this role to create, delete and list the pods

## ROLE BINDING:

**rolebinding.yaml**

```
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-manager-binding
  namespace: roboshop
subjects:
# You can specify more than one "subject"
- kind: User
  name: tony # "name" is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  # "roleRef" specifies the binding to a Role / ClusterRole
  kind: Role #this must be Role or ClusterRole
  name: pod-manager # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io
```
This role binding (pod-manager-binding) binds the **pod-manager** role to the **tony** user within the **roboshop** namespace.

## Cluster Roles & Cluster Role Bindings:

Let’s consider a scenario where we want to grant permissions to view nodes across the entire cluster to a group named “ops-team”.

**clusterrole.yaml**

```
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  # "namespace" omitted since ClusterRoles are not namespaced
  name: roboshop-cluster-reader
rules:
- apiGroups: ["v1","apps/v1",""]
  resources: ["secrets","nodes","namespaces","persistentvolumes","deployments"]
  verbs: ["get", "watch", "list"]
```

This role allows the ops-team to view the nodes, namespaces, deployments, secrets etc.,

**clusterolebinding.yaml**

```
apiVersion: rbac.authorization.k8s.io/v1
# This cluster role binding allows anyone in the "manager" group to read secrets in any namespace.
kind: ClusterRoleBinding
metadata:
  name: roboshop-cluster-binding
subjects:
- kind: Group
  name: Ops-team # Name is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: roboshop-cluster-reader
  apiGroup: rbac.authorization.k8s.io
```

* This cluster role binding (roboshop-cluster-binding) binds the roboshop-cluster-reader cluster role to the ops-team group, allowing them to view nodes across the entire cluster.

**In summary, roles & role bindings are used to manage permissions within namespaces, while cluster roles & cluster role bindings are used to manage permissions across the entire cluster.**