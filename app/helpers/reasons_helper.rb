module ReasonsHelper
  def action_name(action)
    return 'Adicionará' if action == 'add'
    return 'Removerá' if action == 'remove'
  end
end
