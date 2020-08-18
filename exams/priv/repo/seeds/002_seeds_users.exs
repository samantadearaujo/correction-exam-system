alias Exams.Repo
alias Exams.Accounts.User

Repo.insert! %User{
  username: "Adm",
  password: "123",
  name: "Administrador",
  profile: 1
  }



