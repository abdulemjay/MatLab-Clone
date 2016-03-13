# Regular expression confirmations
  def digit_confirm(num)
    if /^\d+$/ =~ num
      true
    else
      false
    end
  end

  def array_confirm(array)
    if /^\d+(\s\d+)*$/ =~ array
      true
    else
      false
    end
  end
