# infra-as-code

## Description

Repository that will store the infrastructure as code for KeepCoding Bootcamps for 8 Edition.

## Structure

Modules are used depending on the purpose of the resources per folder:

- [github_iam](./modules/github_iam/TFDOC.md): Module to configure an [OpenOIDC Connector in AWS for GitHub specific repositories](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)
- [iam_users](./modules/iam_users/TFDOC.md): Module to configure IAM Group and IAM users for each BootCamp
- [cyber](./modules/cyber/TFDOC.md): Module to manage the necessary infrastucture for Cybersecurity bootcamp
