resource "aws_ecs_task_definition" "three-tier" {
  family = "three-tier"

  container_definitions = <<DEFINITION
[
    {
        "name": "nginx",
        "image": "justinwilson/nginx-config",
        "cpu": 128,
        "memory": 128,
        "memoryReservation": 64,
        "links": [
            "wordpress"
        ],
        "portMappings": [
            {
                "containerPort": 80,
                "hostPort": 0,
                "protocol": "tcp"
            }
        ],
    		"environment": [
    		  	{
    		  	  	"name": "PROXY_TARGET",
    		  	  	"value": "${var.proxy_target}"
    		  	}
    		],
        "interactive": true,
        "pseudoTerminal": true
    },
    {
        "name": "wordpress",
        "image": "bitnami/wordpress",
        "cpu": 128,
        "memory": 512,
        "memoryReservation": 512,
        "portMappings": [
            {
                "containerPort": 80,
                "hostPort": 0,
                "protocol": "tcp"
            }
        ],
    		"environment": [
    		  	{
    		  	  	"name": "WORDPRESS_DATABASE_USER",
    		  	  	"value": "${var.wordpress_db_user}"
    		  	},	
    		  	{
    		  	  	"name": "WORDPRESS_DATABASE_NAME",
    		  	  	"value": "${var.wordpress_db_name}"
    		  	},	
    		  	{
    		  	  	"name": "WORDPRESS_DATABASE_PASSWORD",
    		  	  	"value": "${var.wordpress_db_password}"
    		  	},	
    		  	{
    		  	  	"name": "MARIADB_HOST",
    		  	  	"value": "${var.db_host}"
    		  	}
    		],
        "interactive": true,
        "pseudoTerminal": true
    }
]
DEFINITION
}
