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
    "Underweight" => "This may not be good for your health. There are many benefits of being a healthy weight. Visit your health professional to discuss these.",
    "Healthy" => "This is generally good for your health. The challenge is to maintain that weight, and not put on weight as you get older. ",
    "Overweight" => "This may not be good for your health. There are many benefits of moving towards a healthier weight, and even losing a small amount of weight can deliver major health benefits.",
    "Obese Class I (Low risk)" => "This may not be good for your health. There are many benefits of moving towards a healthy weight and losing even a small amount of weight can bring health benefits. You may also benefit from more supervised guidance; talk with your health professional about how losing weight can improve your health and wellbeing.",
    "Obese Class II (Moderate risk)" => "seriously get off the couch!",
    "Obese Class III (High risk)" => "seek a medical professional!"
    }

#Create prompts for user input 
def prompt()
    prompt = TTY::Prompt.new
end

#Introduction - Description of the application
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

#Gather user details
def questionaire(question)
    print question
    return gets.chomp()
end

#Convert pounds to kilograms
def pounds_to_kg(i_weight)
    weight = (i_weight / 2.205).round(2)
    return weight
    # p "#{total} metres"
    # return weight & height
end

#Convert feet and inches to metres
def ft_inch_to_m(i_height)
    arr = i_height.split("'")
    feet = arr[0].to_f
    inches = arr[1].to_f
    height = ((feet / 3.281) + (inches / 39.37)).round(2)
    return height
end

#Calculate BMI using metric system
def bmi_calculation(weight, height)
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

#Display selection list (Imperial/Metric) to user & saves selection
def select_conversion_type()
    conversion_type = prompt.select("Choose your unit of conversion:", %w(Imperial Metric))
    return conversion_type
end

#Return weight category based on BMI calculation and output value from weight_description array
def weight_category(bmi_result)
    if bmi_result < 18.5
        return category = "Underweight"
    elsif bmi_result >= 18.5 && bmi_result < 25
        return category = "Healthy"
    elsif bmi_result >= 25 && bmi_result < 30
        return category = "Overweight"  
    elsif bmi_result >= 30 && bmi_result < 35
        return category = "Obese Class I (Low risk)"  
    elsif bmi_result >= 35 && bmi_result < 40
        return category = "Obese Class II (Moderate risk)"   
    else
        return category = "Obese Class III (High risk)"    
    end
end

def result_msg(name, bmi_result, bmi_category, description)
    results_msg = [
    "",
    "Hi #{name},",
    "", 
    "RESULT".colorize(:red),
    "Score: #{bmi_result}",
    "Category: #{bmi_category}",
    "Description: #{description}",
    ""
    ].join("\n") + "\n"
    return results_msg
end

puts welcome_msg()

name = questionaire("What's your name?: ")

replay = true

while replay == true

selected_conversion = select_conversion_type()

    if selected_conversion == "Imperial"
        i_weight = questionaire("Enter your weight in pounds(lbs): ").to_f
        i_height = questionaire("Enter your height in feet and inches (e.g. 6'1): ")
        weight = pounds_to_kg(i_weight)
        height = ft_inch_to_m(i_height)
    else
        weight = questionaire("What's your weight in kilograms(kg): ").to_f
        height = questionaire("What's your height in metres(m): ").to_f
    end

bmi_result = bmi_calculation(weight, height)
bmi_category = weight_category(bmi_result)

keys = weight_description.keys()
for key in keys
    if bmi_category == key
        description = weight_description[key]
    end
end

puts result_msg(name, bmi_result, bmi_category, description)

calc_again = prompt.select("What would you like to do?", %w(Recalculate Exit))

if calc_again == "Recalculate"
    replay = true
else
    replay = false
end

end


















