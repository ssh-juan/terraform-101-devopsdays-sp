module "instance" {
    source = "./module/"
    #source = "git::https://github.com/ssh-juan/terraform.git//?ref=main"

    ami = "ami-0360c520857e3138f" #Ubuntu
    instance_type = "t3.micro"
}

module "instance_2" {
    source = "./module/"
    #source = "git::https://github.com/ssh-juan/terraform.git//?ref=main"

    ami = "ami-0fd3ac4abb734302a" #RedHat
    instance_type = "t3.micro"
}