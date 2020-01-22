class BaseService
  def ok_message (code ='',  message='', data={})
    {
        success: true,
        code: code,
        message: message,
        data: data
    }
  end

  def error_message (code ='', description='', message='')
    {
        success: false,
        code: code,
        description: description,
        message: message
    }
  end

  def volumetric_weight(width, height, length, unit="CM")
    case unit.to_s.upcase
    when "IN"
      inches_to_centimeters(width.to_f) * inches_to_centimeters(height.to_f) * inches_to_centimeters(length.to_f) / 5000.0
    else
          width.to_f * height.to_f * length.to_f / 5000.0
    end
  end

  def weight(weight, unit="KG")
    case unit.to_s.upcase
    when "LB"
      pounds_to_kilos(weight.to_f)
    else
      weight
    end
  end

  def pounds_to_kilos pounds
    pounds.to_f * 0.45359237
  end

  def kilos_to_pounds kilos
    kilos.to_f / 0.45359237
  end

  def inches_to_centimeters inches
    inches.to_f * 2.54
  end

  def centimeters_to_inches centimeters
    centimeters.to_f / 2.54
  end
end