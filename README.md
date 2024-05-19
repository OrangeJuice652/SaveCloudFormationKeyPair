# SaveCloudFormationKeyPair
AWS CloudFormationで生成したキーペアについて、プライベートキーを保存するスクリプト

## 概要
- AWS CLIでパラメータストア内に記載されたプライベートキーを取得し、~/.ssh内にプライベートキーファイルを作成するスクリプト。
- 前提
  - CloudFormationのスタック作成時に、キーペアIDを出力している。

- CloudFormationテンプレートExample
```
Resources:
  MyKeyPair:
    Type: 'AWS::EC2::KeyPair'
    Properties:
      KeyName: MyKeyPairName

  JenkinsInstance:
    Type: 'AWS::EC2::Instance'
    Properties:
      ...
      KeyName: !Ref MyKeyPair

Outputs:
  MyKeyPairID:
    Description: The KeyPairID for EC2 instance
    Value: !GetAtt MyKeyPair.KeyPairId
```

- CloudFormationで作成されてたキーペアの基礎知識
  - AWS CloudFormation上で、EC2のキーペアを作成した際、プライベートキーは、パラメータストアに保存される。
    - パラメータストアが作成されるパラメータストア名: /ec2/keypair/<キーペアのID>

## コマンド

```
save_cloudformation_keypair.sh <取得したいCloudFormationスタック名> <キーペア名> <~/.sshに保存するキーペアファイル名(.pemを除く)>
```

### 引数
1.  $1: キーペアIDを取得したいCloudFormationスタック名
2.  $2: CloudFormationスタック作成時出力されたキーペアIDの出力キー名
3.  $3: ~/.sshに保存する保存キーペア名
