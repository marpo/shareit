module Tags
  def tag_array
    if tags.nil?
      []
    else
      tags.split(/,\s*/)
    end
  end
end
