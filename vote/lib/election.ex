defmodule Election do
  defstruct(
    name: "Mayor",
    candidates: [
      Candidate.new(1, "Shobhit Yadav"),
      Candidate.new(2, "Ayush Agarwal")
    ],
    next_id: 3
  )
end
