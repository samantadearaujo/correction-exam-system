defmodule ExamsWeb.ClassView do
  use ExamsWeb, :view
  alias ExamsWeb.ClassView

  def render("index.json", %{class: class}) do
    %{data: render_many(class, ClassView, "class.json")}
  end

  def render("show.json", %{class: class}) do
    %{data: render_one(class, ClassView, "class.json")}
  end

  def render("class.json", %{class: class}) do
    %{id: class.id,
      teacher_id: class.teacher_id,
      year: class.year,
      academic: class.academic,
      name: class.name,
      description: class.description,
      created_by: class.created_by,
      modified_by: class.modified_by,
      id_exam: class.id_exam}
  end
end
