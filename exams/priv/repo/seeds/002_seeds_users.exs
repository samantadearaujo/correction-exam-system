alias Exams.Repo
alias Exams.Accounts.User

Repo.insert! %User{
  username: "Adm",
  password_hash: "$argon2id$v=19$m=131072,t=8,p=4$/c/91ll/Hmilfe2m1KZBYw$wwjN6LfnXxt4t2mqZv8Ew/E4W7FYsanRpCin0ekf1Nc",
  name: "Administrador",
  profile: 1
  }

  Repo.insert! %User{
    username: "Teacher_Master",
    password: "$argon2id$v=19$m=131072,t=8,p=4$i/pfS/9KT4V6L37RkwLk8g$gut6vgklxVgAbkzdphWz9OTCnhD8B4VK16o+BhO2EXs",
    name: "Teacher Master",
    profile: 2
    }
  


