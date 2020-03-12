require "tty-prompt"
require "colorize"
require "figlet"
require "lolcat"
require "terminal-table"

$weight_categories_list = {
    "cat_one" => {
        "name" => "Underweight", 
        "range" => "Less than 18.5", 
        "description" => "This may not be good for your health. There are many benefits of being a healthy weight. Visit your health professional to discuss these."
    },
    "cat_two" => {
        "name" => "Healthy", 
        "range" => "Between 18.5 – 24.9",
        "description" => "This is generally good for your health. The challenge is to maintain that weight, and not put on weight as you get older."
    },
    "cat_three" => {
        "name" => "Overweight",
        "range" => "Between 25 – 29.9",
        "description" => "This may not be good for your health. There are many benefits of moving towards a healthier weight, and even losing a small amount of weight can deliver major health benefits.",
    },
    "cat_four" => {
        "name" => "Obese Class I (Low risk)",
        "range" => "Between 30 - 34.9",
        "description" => "This may not be good for your health. There are many benefits of moving towards a healthy weight and losing even a small amount of weight can bring health benefits. You may also benefit from more supervised guidance; talk with your health professional about how losing weight can improve your health and wellbeing."
    },
    "cat_five" => {
        "name" => "Obese Class II (Moderate risk)",
        "range" => "Between 35 - 39.9",
        "description" => "This may not be good for your health. There are many benefits of moving towards a healthy weight and losing even a small amount of weight can bring health benefits. You may also benefit from more supervised guidance; talk with your health professional about how losing weight can improve your health and wellbeing."
    },
    "cat_six" => {
        "name" => "Obese Class III (High risk)",
        "range" => "Above 40",
        "description" => "his may not be good for your health. There are many benefits of moving towards a healthy weight and losing even a small amount of weight can bring health benefits. You may also benefit from more supervised guidance; talk with your health professional about how losing weight can improve your health and wellbeing."
    }
}

#Introduction - Description of the application
def welcome_msg()
    welcoming_msg = [ 
    "DESCRIPTION:".colorize(:red),
    "Body Mass Index(BMI) is a measurement of body fat based on height and weight that applies to men and women aged 18 and above.",
    "It is a screening tool used to indicate whether an individual is under weight, heathly, over weight or obese.",
    "",
    "Below you can find the weight categories and their respective ranges:"
    ].join("\n") + "\n"
    return welcoming_msg
end

def display_bmi_table()
    rows = []
    $weight_categories_list.each do |key, value|
        rows << [value["name"], value["range"]]
    end
    
    Terminal::Table.new :rows => rows
    Terminal::Table.new :headings => ['Category'.colorize(:red), 'Ranges'.colorize(:red)], :rows => rows
end

#Gather user details
def prompt_questionaire(question)
    TTY::Prompt.new.ask(question) do |q|
        q.validate(/[0-9\/.]/)
        q.messages[:valid?] = "Invalid input. Please enter numeric values"
    end
end

#Convert pounds to kilograms
def pounds_to_kg(i_weight)
    weight = (i_weight.to_f / 2.205)
    return weight
end

#Convert feet and inches to metres
def ft_inch_to_m(i_height)
    arr = i_height.split("'")
    feet = arr[0].to_f
    inches = arr[1].to_f
    height = ((feet / 3.281) + (inches / 39.37))
    return height
end

#Calculate BMI using metric system
def bmi_calculation(weight, height)
    result = weight.to_f / (height.to_f**2)
    return result.round(2)
end

#Match BMI score to a key in the hash
def weight_category(bmi_result)
    if bmi_result < 18.5
        return "cat_one"
    elsif bmi_result >= 18.5 && bmi_result < 25
        return "cat_two"
    elsif bmi_result >= 25 && bmi_result < 30
        return "cat_three"  
    elsif bmi_result >= 30 && bmi_result < 35
        return "cat_four" 
    elsif bmi_result >= 35 && bmi_result < 40
        return "cat_five"  
    else
        return "cat_six"    
    end
end

def find_cat_name(category)
    $weight_categories_list.each do |key, value|
        if category == key
            return value["name"]
        end
    end
end

def find_cat_range(category)
    $weight_categories_list.each do |key, value|
        if category == key
            return value["range"]
        end
    end
end

def find_cat_desc(category)
    $weight_categories_list.each do |key, value|
        if category == key
            return value["description"]
        end
    end
end

def result_msg(name, bmi_result, category)
    results_msg = [
    "",
    "Hi #{name},",
    "", 
    "RESULTS".colorize(:red),
    "Score: ".colorize(:red) + "#{bmi_result}",
    "Category: ".colorize(:red) +"#{find_cat_name(category)}",
    "Range: ".colorize(:red) + "#{find_cat_range(category)}",
    "Description: ".colorize(:red),
    "#{find_cat_desc(category)}",
    ""
    ].join("\n") + "\n"
    return results_msg
end

system "echo BMI Calculator | figlet -f big.flf | lolcat "

puts welcome_msg()
puts display_bmi_table()

name = TTY::Prompt.new.ask("What's your name?:") do |q|
    q.validate(/[a-zA-Z\/]/)
    q.messages[:valid?] = 'Invalid name. Please re-enter using alphabetical letters.'
end

replay = true

while replay == true

#Display selection list (Imperial/Metric) to user to drive the flow of the application
conversion_type = TTY::Prompt.new.select("Choose your unit of conversion:", %w(Imperial Metric))

    if conversion_type == "Imperial"
        i_weight = prompt_questionaire("Enter your weight in pounds (lbs): ")
        weight = pounds_to_kg(i_weight)
        
        i_height = TTY::Prompt.new.ask("Enter your height in feet and inches (e.g. 6'1): ") do |q|
            q.validate(/[0-9\/]'[0-9\/]/)
            q.messages[:valid?] = "Invalid input. Please enter numeric values in the following format (e.g. 6'1)"
        end
        height = ft_inch_to_m(i_height)
        #Error handle format for feet and inches
        # while i_height.include?("'") == false
        #     puts "Please enter in the following format (e.g 6'1)".colorize(:red)
        #     i_height = questionaire("Enter your height in feet and inches (e.g. 6'1): ")
        # end     
    else
        weight = prompt_questionaire("Enter your weight in kilograms (kg): ")

        height = prompt_questionaire("Enter your height in metres (m): ")
    end

bmi_result = bmi_calculation(weight, height)
category = weight_category(bmi_result)

puts result_msg(name, bmi_result, category)

calc_again = TTY::Prompt.new.select("What would you like to do?", %w(Recalculate Exit))

if calc_again == "Recalculate"
    replay = true
else
    replay = false
end
end


















