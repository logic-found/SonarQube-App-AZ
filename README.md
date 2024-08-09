## Deploy SonarQube on Azure App Service and connect with SQL DB 
The objective was to deploy SonarQube on Azure app service and connect with SQL DB (to store sonarqube data), set up the necessary configurations, and integrate it with the CI/CD pipeline to build, test, generate analysis results, and publish them to SonarQube.

### Steps Followed: 

- Infrastructure Provisioning : Used Terraform script deploy Azure app service and SQL DB.
  
- Deploy the SonarQube Image (build via Dockerfile) on App service 

- Create login in SQL Master DB (via SSMS) 
    `CREATE LOGIN sonarqube WITH PASSWORD = '******';`
- Create user and assign db_owner role in SQL DB 
    ``CREATE USER sonarqube FOR LOGIN SonarQube WITH DEFAULT_SCHEMA = dbo; ``
    ``ALTER ROLE db_owner ADD MEMBER sonarqube; ``
- Add SonarQube details in App service setting: 
    `SONAR_JDBC_USERNAME=sonarqube` 
    `SONAR_JDBC_UPASSWORD=*******` 
    `SONAR_JDBC_URL=********` 

- Restart the app service and store the SonarQube data on App service
  
- Integrate SonarQube with Azure DevOps Pipeline (to generate & publish sonarqube results):
    1) Used a Dockerfile that installs the required dependencies.
    2) The Dockerfile also includes steps to build the project, run tests, generate coverage reports and publish it to SonarQube.

 
[Reference](https://medium.com/globant/sonarqube-integration-with-azure-web-app-and-sql-37eb468162b6)
