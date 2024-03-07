# CI/CD Workflow deploy to ECS using AWS CodePipeline

<h2>Project Overview</h2>
<p>In this project, we orchestrated the deployment of a robust cloud infrastructure on AWS using Terraform, focusing on VPC, subnetting, and ECS services. By breaking down our architecture into VPCs and subnets, we achieved network isolation and optimized resource allocation. Additionally, deploying containerized applications with ECS streamlined our operational processes, allowing for efficient scaling and management of Docker containers. Integrating AWS CodePipeline into our workflow automated the CI/CD pipeline, enabling seamless code deployments and ensuring rapid iteration cycles.</p>

![CHEESE](images/codepipelinecs.jpg)

<h2>Pre-requisites</h2>
<p><b>CodeCommit :</b> You need to create a repository in CodeCommit and Upload all files to repo.
<p><b>SSM Parameters Store :</b> You need to create two parameters in AWS System Manager Parameter Store to keep AWS account ID and Region Values.</p>
<p><b>Image:</b> You need to upload a first image with tag to AWS ECR</p>
<p><b>ECS:</b> You can check this github https://github.com/wailinoo1/Terraform-ECS-GitHubAction.git to build ECS Infrastructure with terraform as a refrence.</p>

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

<h2>CodePipeline</h2>

<p>
   <br><b>Creating CodePipeline :</b></br>
   <br><b>Pipeline Name :</b> nodeapp-ecs </br>
   <br><b>Service Role :</b> Your Existing Service Role or new one </br>
   <b>And then , Next</b>
</p>

![CHEESE](images/cp1.jpg)

<p>
   <br><b>Source :</b></br>
   <br><b>Source Provider :</b> CodeCommit </br>
   <br><b>Repository Name :</b> Your Existing Repo Name </br>
   <br><b>Branch Name :</b> master  </br>
   <b>And then , Next</b>
</p>

![CHEESE](images/cp2.jpg)

<p>
   <br><b>Build :</b></br>
   <br><b>Build Provider :</b> AWS CodeBuild </br>
   <br><b>Region :</b> AWS Region </br>
   <br><b>Project Name :</b> Build Project Name that we created previous step  </br>
   <b>And then , Next</b>
</p>

![CHEESE](images/cp3.jpg)

<p>
   <br>In Deploy Option , we will choose ECS as a deploy provider cause we want to deploy our build image to AWS ECS</br>
   <br><b>Deploy Provier :</b> ECS </br>
   <br><b>Region :</b> AWS Region </br>
   <br><b>Cluster Name :</b> Your ECS Cluser Name </br>
   <br><b>Service Name :</b> Your ECS Service Name  </br>
   <br><b>Image Definitions File :</b> imagedefinition.json  </br>
   <br><b>If you are deploying container-based applications, you must generate an image definitions file to provide the CodePipeline job worker with the Amazon ECS container and image identification to retrieve from the image repository, such as Amazon ECR.</b></br>
   <b>And then , Next</b>
</p>

![CHEESE](images/cp4.jpg)

<p>
   <br><b>Now , you can see CodePipeline and it will start deploying to ECS when every commit changes happen in CodeCommit Repository</b></br>
</p>

![CHEESE](images/cp5.jpg)

<h2>Conclusion</h2>
<p>In conclusion, our project successfully implemented a robust cloud infrastructure on AWS using Terraform, focusing on VPC, subnetting, and ECS services. By leveraging infrastructure as code principles, we achieved consistency, repeatability, and scalability across environments. The integration of AWS CodePipeline automated our CI/CD pipeline, facilitating rapid and reliable application deployments. Overall, our approach ensures efficient resource utilization, streamlined operational processes, and sets the stage for future growth and innovation in cloud-native development.</p>
