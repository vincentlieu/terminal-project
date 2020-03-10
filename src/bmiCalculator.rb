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

def prompt()
    prompt = TTY::Prompt.new
end

def welcome_msg()
    welcoming_msg = ["Hi there!", 
    "This is the Body Mass Index (BMI) calculator.",
    "", 
    "Description:",
    "BMI is a measurement of body fat based on height and weight that applies to men and women aged 18 and above.",
    "It is a screening tool used to indiciate whether an individual is under weight, heathly, over weight or obese.",
    ].join("\n") + "\n"
    return welcoming_msg
end

def questionaire(question)
    print question
    return gets.chomp()
end

def bmi_calculation(weight, height, selected_conversion)
    if selected_conversion == "Imperial"
        bmi_result = (703 * weight) / (height**2)
        return bmi_result.to_s
    else
        bmi_result = (weight / (height**2))
        return bmi_result.to_s
    end
end

def select_conversion_type()
    conversion_type = prompt.select("Choose your unit of conversion", %w(Imperial Metric))
    return conversion_type
end

puts welcome_msg()
name = questionaire("What's your name?: ")

selected_conversion = select_conversion_type()

if selected_conversion == "Imperial"
    weight = questionaire("What's your weight in pounds?: ").to_f
    height = questionaire("What's your height in feets?: ").to_f
else
    weight = questionaire("What's your weight in kg?: ").to_f
    height = questionaire("What's your height in metres: ").to_f
end

bmi_result = bmi_calculation(weight, height, selected_conversion)
puts "Your BMI result is: #{bmi_result}"

















