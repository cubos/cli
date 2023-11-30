# Cubos CLI

This repository contains a Docker image with a set of tools preinstalled and useful scripts to help simplify CI/CD pipelines.

## Preinstalled tools

- [AWS CLI](https://aws.amazon.com/cli/)
- [Bash](https://www.gnu.org/software/bash/)
- [Composer](https://getcomposer.org/)
- [Docker](https://www.docker.com/)
- [Firebase Tools](https://firebase.google.com/docs/cli)
- [Git](https://git-scm.com/)
- [Google Cloud SDK (gcloud CLI)](https://cloud.google.com/sdk/gcloud/)
- [Helm](https://helm.sh/)
- [jq](https://stedolan.github.io/jq/)
- [kubectl](https://kubernetes.io/docs/reference/kubectl/)
- [Node.js](https://nodejs.org/)
- [npm](https://www.npmjs.com/)
- [PHP](https://php.net/)
- [Python](https://www.python.org/)
- [s3cmd](https://s3tools.org/s3cmd)
- [yq](https://kislyuk.github.io/yq/)

## Additional scripts

- `cluster_from_env`: Configure `kubectl` to use a Kubernetes cluster from environment variables.
- `deploy_app_engine`: Deploy an application to Google App Engine.
- `deploy_firebase_hosting`: Deploy a static website to Firebase Hosting.
- `deploy_site`: Deploy a static website to either Firebase Hosting or Google Cloud Storage.
- `deploy`: Deploy YAML and _kube-templates_ files to a Kubernetes cluster.
- `docker_build`: Build a Docker image and push it to a registry, using buildx, with support for multiple architectures.
- `docker_login`: Login to a Docker registry.
- `gsutil_auth_from_env`: Authenticate to Google Cloud using a service account JSON key encoded in Base64 stored in an environment variable.
- `s3cfg_from_env`: Generate a `.s3cfg` file from environment variables.
- `undeploy_site`: Delete a static website from Google Cloud Storage.
- `upload_chart`: Upload a Helm chart to Nexus Repository Manager.

## Example usage

- GitLab CI:

  ```yaml
  Deploy:
    stage: deploy
    image: cubos/cli
    only:
      - main
    script:
      - cluster_from_env CLUSTER_PRD
  ```

## Contributing

PRs are welcome! Feel free to improve current scripts or add new ones.

By submitting a PR, you agree to license your work under the [GNU Lesser General Public License v3.0](LICENSE).
