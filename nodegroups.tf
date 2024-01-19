variable "nodegroups" {
    "NODE_NAME" : {
      name                   = "Node_Name"
      subnet_ids             = ["subnet-XXXXXXXXXX"]
      instance_types         = ["t2.micro"]
      image_id               = "ami-xxxxxxxx"
      disk_size              = 10
      desired_size           = 1
      min_size               = 1
      max_size               = 1
      create_launch_template = true
      encrypted              = true
      disk_type              = "gp3"
      labels = {
        label_name    = "true",
        label_name1 = "true",
        team            = "test"
      }
      tags = {
        team                                = "team_name"
        env                                 = "test"
        module                              = "test"
        reason                              = "realignment"
        owner                               = "test_owner"
        owneremail                          = "test-owner@abc.com"
        renewaldate                         = "xxxx"
        creationdate                        = "xxxx"
        "k8s.io/cluster-autoscaler/enabled" = "true"
      }
    }

}
