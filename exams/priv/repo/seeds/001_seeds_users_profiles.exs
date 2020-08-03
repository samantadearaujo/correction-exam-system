alias Exams.Repo
alias Exams.Acounts.UserProfile

Repo.insert! %UserProfile{
    name: "Administrator",
  }

Repo.insert! %UserProfile{
    name: "Teacher",
  }

Repo.insert! %UserProfile{
    name: "Student",
  }


