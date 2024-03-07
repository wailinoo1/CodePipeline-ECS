# CI/CD Workflow deploy to ECS using AWS Code Pipeline

<h2>Project Overview</h2>
<p>In this project, we orchestrated the deployment of a robust cloud infrastructure on AWS using Terraform, focusing on VPC, subnetting, and ECS services. Leveraging Terraform's declarative syntax, we defined our infrastructure as code, ensuring consistency and repeatability across environments. By breaking down our architecture into VPCs and subnets, we achieved network isolation and optimized resource allocation. Additionally, deploying containerized applications with ECS streamlined our operational processes, allowing for efficient scaling and management of Docker containers. Integrating AWS CodePipeline into our workflow automated the CI/CD pipeline, enabling seamless code deployments and ensuring rapid iteration cycles. This cohesive approach to infrastructure provisioning and application deployment lays a solid foundation for scalable, reliable, and secure cloud-native solutions.</p>

![CHEESE](images/codepipelinecs.jpg)

<h2>Code Build</h2>

<p><br><b>Creating New Code Build Project</b></br>
   <br><b>Project Name :</b> node-build </br>
   <br><b>Source :</b> Code Commit </br>
   <b>Repository :</b> Your Repo Name
</p>

![CHEESE](images/bp1.jpg)

<p>
   <br><b>Environment :</b> default </br>
</p>

![CHEESE](images/bp2.jpg)

<p>
   <br><b>Service Role :</b> Your Existing Service Role or Create one </br>
   <br><b>BuildSpec :</b> Use a buildspec file 
</p>

![CHEESE](images/bp3.jpg)

<p>
   <br><b>Artifacts :</b> S3 </br>
   <br><b>Bucket Name :</b> Your S3 Bucket Name </br>
   <br><b>Service Role :</b> Bucket Directory 
</p>

![CHEESE](images/bp4.jpg)

<p>
   <br><b>Cloud Watch Logs : </b> 
   <br><b>Group Name</b> /aws/codebuild/node-build </br>
</p>
<p>And then , Create build project</p>

![CHEESE](images/bp5.jpg)

<p>
   <b>Now, you can see your build project and start build</b> 
</p>

![CHEESE](images/bp6.jpg)

