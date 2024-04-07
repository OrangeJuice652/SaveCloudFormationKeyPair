# $1: キーペアIDを取得したいCloudFormationスタック名
# $2: CloudFormationスタック作成時出力されたキーペアIDの出力キー名
# $3: ~/.sshに保存する保存キーペア名

# キーペアIDを取得
KeyPairID=$(aws cloudformation describe-stacks --stack-name $1 --query "Stacks[0].Outputs[?OutputKey=='$2'].OutputValue" --output text)

# name引数のスペースについて: https://stackoverflow.com/questions/53597272/aws-cli-ssm-get-parameters-invalidparameters-on-windows
aws ssm get-parameter --with-decryption --query "Parameter.Value" --output text --name " /ec2/keypair/$KeyPairID" > ~/.ssh/$3.pem