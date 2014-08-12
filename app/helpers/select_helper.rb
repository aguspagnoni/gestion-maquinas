module SelectHelper

  def get_entries(objects, method)
    objects.pluck(method, :id)
  end
end
