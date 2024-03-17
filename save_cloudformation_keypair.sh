# $1: キーペアのID
# $2: キーペア名

# name引数のスペースについて: https://stackoverflow.com/questions/53597272/aws-cli-ssm-get-parameters-invalidparameters-on-windows
PRIVATE_KEY=$(aws ssm get-parameter --with-decryption --query "Parameter.Value" --output text --name " /ec2/keypair/$1")
echo $PRIVATE_KEY > ~/.ssh/${2}.pem;
