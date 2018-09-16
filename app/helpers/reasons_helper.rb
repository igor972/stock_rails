module ReasonsHelper
  def action_name(action)
    ret = ""
    if action == 'add'
      ret =  "<span class='badge badge-success'>Adicionará</span>"
    elsif action == 'remove'
      ret = "<span class='badge badge-danger'>Removerá</span>"
    end
    
    return ret.html_safe
  end
end
