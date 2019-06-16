/* 
requires you to create a file (on windows) called terraform.rc 
which MUST be located at the ROOT of %APPDATA%
*/

# Using a single workspace:
terraform {
  backend "remote" {
    organization = "alfran"

    workspaces {
      // name = "my-app-prod"
      name = "default"
    }
  }
}