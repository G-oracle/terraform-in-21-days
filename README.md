# Terraform in 21 days

## Automating AWS with Terraform

    We are using git branches to track changes

### Get Started with Git and GitHub

+ Create a repository on GitHub: [Create a repo - GitHub Docs](https://docs.github.com/en/get-started/quickstart/create-a-repo)

+ Clone a repository: [Cloning a repository - GitHub Docs](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)

+ Set the name of your branchgit branch -M main

+ In your repository create the first file 

    `echo "Automating AWS with Terraform" > README.md`

+ Add and commit the file

    `git add README.md`

    `git commit -m "Initial commit"`

+ Push your local changes to GitHub

    `git push origin main`

+ Create a new branch. More info about branches is here:  [About branches - GitHub Docs](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches)

    `git checkout -b first_branch`

+ Add one more line to README.md

    `echo "We are using git branches to track changes" >> README.md`

+ Add and commit the file

    `git add README.mdgit commit -m "Update README.md"`

+ Push your local changes to GitHub (this time, we are uploading to a different branch, so the push command is different)

    `git push origin first_branch (see screenshot 1)`

+ Open GitHub in your browser. You should see two branches `main` and `first_branch`

+ Create a Pull Request. More info about pull requests is here: [About pull requests - GitHub Docs](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)

+ Copy the Pull Request URL and send me the link

Here is an example of the repository with a similar task completed:

[Update README.md #1](https://github.com/G-oracle/terraform-in-21-days/pull/1)
