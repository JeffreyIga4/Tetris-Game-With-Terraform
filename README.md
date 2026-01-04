# Azure Tetris Game (Terraform + Azure)

This project deploys a **scalable Tetris web application on Microsoft Azure using Terraform**.  
The game runs on a **Virtual Machine Scale Set (VMSS)** behind an **Azure Standard Load Balancer**, with autoscaling and secure networking defined using Infrastructure as Code.

The application is publicly accessible via the Load Balancer, while backend VM instances remain private.


![ADE1D7B8-4ED9-48A9-9E11-E8EA1CFFD3AF_1_201_a](https://github.com/user-attachments/assets/d368a6d4-d73e-4b2b-bf4d-de2e5f7900c1)


## Architecture
- Azure Virtual Network with backend subnet
- Network Security Group restricting inbound traffic
- Azure Standard Load Balancer with public IP and health probe
- Virtual Machine Scale Set running Ubuntu + Apache + Tetris
- Autoscaling based on CPU utilization

## Key Features
- Load-balanced HTTP traffic on port 80
- Scale out when CPU > 80%
- Scale in when CPU < 10%
- No public IPs on backend VMs
- NSG allows traffic only from the Load Balancer and health probes
- Fully reproducible using Terraform

## Project Files
- `backend.tf`
- `provider.tf`
- `vnet.tf`
- `vmss.tf`
- `autoscale.tf`
- `locals.tf`
- `user-data.sh`
- `terraform.tfvars`

## Deployment
```bash
terraform init
terraform apply
```

After deployment, access the game using the Azure Load Balancer DNS name.

## Notes
- Azure Standard Load Balancer forwards backend traffic as VirtualNetwork
- The AzureLoadBalancer service tag is used only for health probes
- Backend access is restricted at the subnet level using NSGs

Built with Terraform and Microsoft Azure as a hands-on cloud infrastructure project.

