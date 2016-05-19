class EncouragementForm
  include Capybara::DSL

  def leave_encouragement(attrs = {})
    fill_in("encouragement_messagem", with: attrs.fetch(:text, 'good job'))
    self
  end

  def submit
    click_on("Encourage")
    self
  end
end