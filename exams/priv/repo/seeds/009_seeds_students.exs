alias Exams.Repo
alias Exams.Students.Student



Repo.insert! %Student{
  student_id: 2,
  class_id: 1,
  exam_id: 1,
  score: 3.0 
  }

Repo.insert! %Student{
  student_id: 3,
  class_id: 1,
  exam_id: 1,
  score: 2.5 
  }

Repo.insert! %Student{
  student_id: 4,
  class_id: 1,
  exam_id: 1,
  score: 2.0 
  }
    

