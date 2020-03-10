# Provide a description of what BMI is x
# Input user details (Name, Height, Weight)
# Perform caculation to determine which category they fit into

# Less than 18.5 =>	Underweight
# 18.5–24.9	=> Healthy weight range
# 25–29.9 => Overweight (pre-obesity)
# 30-34.9 => Obese class I
# 35.0–39.9 => Obese class II
# 40+ => Obese class III

# Colour code the categories (Yellow, Green, Orange, Red)

require "tty-prompt"
require "colorize"

weight_description = {
    "Underweight" => "you should eat more",
    "Healthy" => "keep it up!",
    "Overweight" => "be cautious!",
    "Obese Class I" => "get off the couch!",
    "Obese Class II" => "seriously get off the couch!",
    "Obese Class III" => "seek a medical professional!"
    }


    def prompt()
    prompt = TTY::Prompt.new
end
    
def welcome_msg()
    welcoming_msg = [
    "Body Mass Index (BMI) calculator".colorize(:red),
    "", 
    "Description:".colorize(:red),
    "BMI is a measurement of body fat based on height and weight that applies to men and women aged 18 and above.",
    "It is a screening tool used to indiciate whether an individual is under weight, heathly, over weight or obese.",
    ""
    ].join("\n") + "\n"
    return welcoming_msg
end

def questionaire(question)
    print question
    return gets.chomp()
end

def pounds_to_kg(i_weight)
    weight = (i_weight / 2.205).round(2)
    return weight
    # p "#{total} metres"
    # return weight & height
end

def ft_inch_to_m(i_height)
    arr = i_height.split("'")
    feet = arr[0].to_f
    inches = arr[1].to_f
    height = ((feet / 3.281) + (inches / 39.37)).round(2)
    return height
end

def bmi_calculation(weight, height, selected_conversion)
    bmi_result = weight / (height**2)
    return bmi_result.round(2)
    # if selected_conversion == "Imperial"
    #     bmi_result = (703 * weight) / ((height*12)**2)
    #     return bmi_result.round(2)
    # else
        # bmi_result = (weight / (height**2))
        # return bmi_result.round(2)
    # end
end

def select_conversion_type()
    conversion_type = prompt.select("Choose your unit of conversion:", %w(Imperial Metric))
    return conversion_type
end

def weight_category(bmi_result)
    if bmi_result < 18.5
        return category = "Underweight"
    elsif bmi_result >= 18.5 && bmi_result < 25
        return category = "Healthy"
    elsif bmi_result >= 25 && bmi_result < 30
        return category = "Overweight"  
    elsif bmi_result >= 30 && bmi_result < 35
        return category = "Obese Class I"  
    elsif bmi_result >= 35 && bmi_result < 40
        return category = "Obese Class II"   
    else
        return category = "Obese Class III"    
    end
end

puts welcome_msg()
name = questionaire("What's your name?: ")

replay = true

while replay == true

selected_conversion = select_conversion_type()

    if selected_conversion == "Imperial"
        i_weight = questionaire("Enter your weight in pounds (lbs): ").to_f
        i_height = questionaire("Enter your height in feet and inches (e.g. 6'1): ")
        weight = pounds_to_kg(i_weight)
        height = ft_inch_to_m(i_height)
    else
        weight = questionaire("What's your weight in kilograms (kg): ").to_f
        height = questionaire("What's your height in metres (m): ").to_f
    end

bmi_result = bmi_calculation(weight, height, selected_conversion)
bmi_category = weight_category(bmi_result)

keys = weight_description.keys()
for key in keys
    if bmi_category == key
        advise = weight_description[key]
    end
end

puts "Your BMI result is: #{bmi_result} and you are classed as #{bmi_category}, #{advise}"

calc_again = prompt.yes?('Would you like to re-calculate again?')

if calc_again == true
    replay = true
else
    replay = false
end

end


















