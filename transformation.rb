class Transformation

  def perform (dataset,template)
    text = ""

    dataset.each do |key, value|

      if key == "clauses"
        value.each do |val| 
          template = template.gsub("[CLAUSE-#{val["id"]}]",val["text"])
        end
      end

      if key == "sections"
        value.each do |val|
          val["clauses_ids"].each do |clause|
            text << getText(dataset,clause)
            text << ";"
          end
          text.delete_suffix!(';') 
          template = template.gsub("[SECTION-#{val["id"]}]",text)
          text = ""
        end
      end
    end

    raise "Clause/Section not Found in Dataset" if (/\[CLAUSE-\d\]/).match?(template) || (/\[SECTION-\d\]/).match?(template)
    return template
  end

  private

  def getText(dataset,clause)
    dataset["clauses"].each do |index|
      return index["text"] if index["id"] == clause
    end
    raise "Clauses_ids in Section not Found in Dataset"
  end

end