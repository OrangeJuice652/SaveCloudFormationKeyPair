# SaveCloudFormationKeyPair
AWSCloudFormationで生成したkeypairについて、privateキーをローカルに保存するスクリプト

## 概要
- AWS CLIでパラメータストア内に記載されたプライベートキーを取得し、~/.ssh内にプライベートキーファイルを作成するスクリプト。
- 前提
  - AWS CloudFormation上で、EC2のキーペアを作成した際、プライベートキーは、パラメータストアに保存される。
    - パラメータストアが作成されるパラメータストア名: /ec2/keypair/<キーペアのID>

## コマンド

```
save_cloudformation_keypair.sh <キーペアのID> <キーペア名>
```
