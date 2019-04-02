provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {/*  Below values are passed through backend_config parameter of terraform module in tf.yml playbook
      uncomment below values if you want to pass backend config directly from main.tf file 
    region = "ap-south-1"
    bucket = "sopara"
    key    = "terraform.tfstate"
  */}
}

resource "aws_instance" "tf_ec2" {
  count         = "${var.amicount}"
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  tags {
    name = "prashant-${count.index + 1}"
  }
}
