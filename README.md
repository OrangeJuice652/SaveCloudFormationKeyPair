# SaveCloudFormationKeyPair
AWSCloudFormationで生成したkeypairについて、privateキーをローカルに保存するスクリプト

## 概要
- AWS CLIでパラメータストア内に記載されたプライベートキーを取得し、~/.ssh内にプライベートキーファイルを作成するスクリプト。
- 前提
  - CloudFormationのスタック作成時に、キーペアIDを出力している。
- 基礎知識
  - AWS CloudFormation上で、EC2のキーペアを作成した際、プライベートキーは、パラメータストアに保存される。
    - パラメータストアが作成されるパラメータストア名: /ec2/keypair/<キーペアのID>
    - パラメータストアに記載されたIDを取得し、~/.sshにプライベートキーファイルを作成する。

## 引数
1.  $1: キーペアIDを取得したいCloudFormationスタック名
2.  $2: CloudFormationスタック作成時出力されたキーペアIDの出力キー名
3.  $3: ~/.sshに保存する保存キーペア名

## コマンド

```
save_cloudformation_keypair.sh <取得したいCloudFormationスタック名> <キーペア名> <~/.sshに保存するキーペアファイル名(.pemを除く)>
```
