# anagram

## setup
* Clone repo
* Install and configure python or may be pycharm to open the project with `venv`
* Run `python3 ./anagram.py`
* Run Test `python3 -m unittest /tests/test_anangram.py`

## Terraform Setup and Deploy to AWS
* Install terraform > 0.12
* Create user in AWS iam console with name `rakib-terraform`
* Add profile to AWS config like following
```bash
    vi .aws/credentials 

```
* Then add following:

```bash
    [iam-terraform-user]
    aws_access_key_id=[your access key]
    aws_secret_access_key=[Your secret key]
```

* Then just run:

```bash
    ./deploy stage
```