require 'date'

module GenerateDate

  def generate_date
    Date.today.strftime('%d%m%y')
  end
end
