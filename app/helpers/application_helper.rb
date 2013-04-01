module ApplicationHelper
  def format(txt)
    txt.blank? ? '0' : txt
  end
end
