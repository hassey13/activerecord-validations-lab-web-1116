class MyValidator < ActiveModel::Validator

  def validate(record)
    unless record.name.starts_with? 'X'
      record.errors[:name] << 'Need a name starting with X please!'
      "Won't Believe", "Secret", "Top [number]", or "Guess"
    end
  end

end
