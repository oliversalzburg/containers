# Container Images
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Foliversalzburg%2Fcontainers.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Foliversalzburg%2Fcontainers?ref=badge_shield)


## Available images

1. Infrastructure

    For AWS IaC jobs. Includes AWS CLI and Terraform.

1. PySpark

    For Python Spark unit testing. Includes PySpark and PyTest.

## Operation

1. The version tags on this repository reflect the version of the entire development stack in this repository.

1. When images are published with a version, this version reflects the development progress of this repository.

1. Extended work in a single context can cause version bumps in unaffected contexts.

Consumers of these images shouldn't have to care about the version of the framework. Every published image should work as expected, and provide the tooling as reflected by the tag on the image.

Regardless of not caring about the version number, using the `edge` tags is strongly discouraged in production! Using fixed images is the entire point of this image generation process.


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Foliversalzburg%2Fcontainers.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Foliversalzburg%2Fcontainers?ref=badge_large)