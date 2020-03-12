**Body Mass Index (BMI) Calculator**

---

**Problem statement**

As individuals grow older and take on more commitments - personal, family or work; it may become more difficult for individuals to set time aside to be physically active due to fatigue or stress. This may result in an increase in health concerns both physically and mentally ranging from diseases such as cardiovascular (heart and blood circulation), high blood pressure, respiratory, digestive or mental health disorders like depression. 

With the above constraint. Individuals may seek a tool to provide a general overview of their current health. 

---

**Purpose**

The purpose of this application is to provide a risk assessment screening tool to determine an individual's general health based on their height and weight ratio. It provides a general indication on whether an individual is underweight, healthy, overweight or obese (class I-III). The results generated by this application can be provided to a health professional for further assessment to mitigate potential diseases they may face within the respective weight category. 

---

**Target audience**

| Audience                 | Description                                                  |
| ------------------------ | ------------------------------------------------------------ |
| **General users**        | General user would use this application if they are concerned about their health and are looking to make a healthier lifestyle change. |
| **Health professionals** | Health professional would use this application as it is inexpensive and simplistic and can provide their patients a simple view of their current health state and devise a plan to better a patient's overall health and wellbeing. |
| **Developers**           | A developer would use this application to attain an understanding of the logic and tools that were used to develop this application. The developer may choose to build ontop of this application or create an application similar to the design. |

---

**Process flow**

1. Enter a user's name

2. Select a system of measurement (Imperial or Metric)

3. Enter your weight (Imperial: pounds(lbs) or Metric: Kilograms(kg))

4. Enter your height (Imperial: feet(ft) & inches(in) or Metric: metres (m)

**Once the above steps have been completed the application will return the calculated BMI result, the weight category and description.**

5. Prompt user with the options to re-calculate BMI

---

**Interaction with the application**

The two main way a user would interact with this application is through a series of user input and menu selection. The application will guide provide the user on what is required to be performed.

**User Input:**

When the application prompts the user to enter a value; it is required for the user to enter in a value to proceed further into the application. The entered value will then be displayed on the terminal window, confirming the user's input.

For example: Enter your name will require the user to type in their name and also output it on the terminal window. 

**Menu selection:**

When the application prompts the user to select an option; it is required for the user to select an option to drive the flow of the application. The selected value will then be displayed on the terminal window, confirming the user's selection.

For example: Given the option to select either to use the Imperial or Metric system will dictate different series of questions provided to the user. If the user has selected Imperial then the application would ask for values to be entered in pounds and, feet and inches. 

**Error handling:**

An error message will be displayed beneath the user input to indicate to the user that an entered value is invalid and ask the user to re-enter their value. 

For single value fields like - Enter your weight in pounds (lbs) or Enter your height in meters (m); the application will prevent the user from entering alphabets, symbols or a combination either including numeric. (e.g. abcd, @#!, a#1, 1aj should result in an error)

For special cases such as - Enter your height in feet and inches; the application will be expecting the user to enter in value in the following syntax (7'1). The field will validate whether an apostrophe and numbers are included in the string. Otherwise throw an error to indicate to the user that their input is invalid.

---

**Feature list**

| #     | Feature                           | Description                                                  |
| ----- | --------------------------------- | ------------------------------------------------------------ |
| **1** | Unit of measure option (Selector) | A feature of this application is that it allows the flexibility for the user to select their preferred system of measurement either imperial or metric. This allows individuals to input values according to the unit they are familiar with<br />**a. Imperial Unit System calculation:**<br />The user is given the option to select and enter their preferred unit of measurement under the imperial system. The unit of measure used for this system are as follows:<br />**Weight:** Pounds (lbs)<br />**Height:** Feet (ft) & Inches (in)<br />**b. Metric Unit System calculation:**<br />The user is given the option to select and enter their preferred unit for measurement under the metric system. The unit of measurement used for this system are as follows:<br />**Weight:** Kilograms (kgs)<br />**Height:** Metres (m) |
| **2** | Body Mass Index(BMI) calculation  | This is an essential feature of this application. Once the user has entered their name, selected their preferred system of measurement and has entered in their height and weight. The application will calculate the user's BMI and return a value for the user. This calculation is vital for determining the category that the user is assigned to and determine a course of action which the user may take. |
| **3** | Weight category specification     | To compliment the BMI score calculated. The application will also provide a table specifying the weight categories from (Underweight to Obese (Catagory III)), their respective BMI ranges, description and advices it to the user. It is necessary to provide this information complimentary to their score so that the user is able to determine their placement within the weight category - whether it be the upper, mid or lower bounds of their weight category, and allows the user to re-calculate the score required for their height to meet a healthy weight category. |
| **4** | Re-calculate                      | The application allows the user the ability to re-calculate their BMI again. If the user has accidently selected the wrong measurement system or inputted the wrong values; after the initial calculation the user is able to recalculate their BMI. They can change their weight value to find an optimal healthy weight within the healthy category. This may provide the user a weight goal to achieve. |

**Data Dictionary**

| Field name                                      | Variable name   | Data type | Description                                                  | Example      |
| ----------------------------------------------- | --------------- | --------- | ------------------------------------------------------------ | ------------ |
| Enter your name                                 | Name            | String    | Name of the user                                             | John Smith   |
| Select conversion type                          | conversion_type | Boolean   | Selection option of either Imperial or Metric                | Imperial     |
| Enter your weight in pounds(lbs)                | i_weight        | Float     | **IMPERIAL:**<br />User input weight value                   | 165.5        |
| Enter your height in feet and inches (e.g. 6'1) | i_height        | String    | **IMPERIAL:**<br />User input height value in feet and inches | 5'7          |
| Enter your weight in kilograms(kg)              | weight          | Float     | **METRIC:**<br />User input weight value                     | 71.5         |
| Enter your height in metres (m)                 | height          | Float     | **METRIC:**<br />User input height value                     | 1.7          |
| What would you like to do?                      | calc_again      | Boolean   | Selection option of either Re-calculate or Exit              | Re-calculate |

---

**Control Diagram**

![](/docs/BMI_control_flow_diagram.png)

---

**Project duration** 
10/02/2020 - 13/02/2020

**Project management tool:**
Trello is a project management tool used to track the progress in developing the BMI terminal application. It consists of three statuses (To Do, In Progress and Done) and each task on the board are marked as:

1. Task - Items that don't directly impact the application
2. MVP - Items that are required for the core functionality of the application
3. Enhancements - Items that improve the consistency or usability of the application

**URL:** https://trello.com/invite/b/57OCByeL/9ecfcaf1ceadcc5c762ee5a004550f9c/terminal-application-bmi-calculator

**1. Unit of measurement option (Selector)**

This feature was implemented through the using IF and ELSE statements complimented by the use of the Ruby gem - TTY-Prompt, which allows the user to select their preferred measurement system - Imperial or Metric, in turn this will drive what unit of measurement is required by the user. <br />When the user selects either Imperial or Metric - it will be stored in a variable conversion_type. Conditioning is then implemented to determine whether the conversion_type matches either Imperial or Metric. <br />If conversion_type == "Imperial" the application will the proceed to prompt the user with their weight in pounds (lbs) and height in feet (ft) and inches(in). Otherwise prompt the user to enter their weight in kilograms (kgs) and metres (m).

1. [x] define a method to initialise TTY-prompt

2. [x] define a variable to store user selection 

3. [x] define a method to drive what unit of measurement to prompt the user after selecting conversion type

4. [x] define a method to store and validate user values for weight using the imperial system

5. [x] define a method to store and validate user values for height using the imperial system

6. [x] define a method to store and validate user values for height and weight using metric  system 

7. [x] define a method to allow the user to enter in a feet and inches (5'1) 

   *Enhancement: (12/02/20) - to have a better user experience for inputting height*

**2. Body Mass Index Calculation**

This feature was implemented by creating a method to calculate BMI by passing the variables weight and height. Before calculating the BMI score; if the user has selected the imperial system - there are methods defined to convert pounds to kg and feet and inches to metres. Otherwise pass the entered values for the metric system as the weight and height variable to perform the BMI calculation. 

1. [x] define a method to convert pounds to kilograms

2. [x] define a unique method to calculate under the imperial system 

   *Removed: (12/02/20) - removed two forms of calculation.*

3. [x] define a method to convert feet and inches to metres

   *Enhancement: (12/02/20) - convert imperial system to metric system to unify the BMI calculation*

4. [x] define a unique method to calculate under the metric system 

   *Modified: (12/02/20) - this is now the only method used to perform the calculation*

5. [x] define a method to split the syntax of feet and inches into an array and perform calculation 

   *Enhancement: (12/02/20) - logic built to compliment item 3*

**Convert pounds to kilograms**

```ruby
def pounds_to_kg(i_weight)
    weight = (i_weight / 2.205)
    return weight
end
```

**Convert feet and inches to metres**

```ruby
def ft_inch_to_m(i_height)
    arr = i_height.split("'")
    feet = arr[0].to_f
    inches = arr[1].to_f
    height = ((feet / 3.281) + (inches / 39.37))
    return height
end
```

**Calculate BMI**

```ruby
def bmi_calculation(weight, height)
    bmi_result = weight / (height**2)
    return bmi_result.round(2)
end
```

**3. Weight category specification**

This feature was implemented by introducing a hash to store the weight categories descriptions based on the score retrieved the from BMI calculation. An IF and ELSE statement was used to determine what weight category the user falls into. For example; if the BMI score is between the ranges of 0-18.4 then the category assigned is 'Underweight'. Using this as a key; it will then pass the description in the output to the user. In addition using the Ruby gem terminal-table outputs table for each category their respective ranges.

1. [x] define a method to determine which weight category based on BMI score
2. [x] define a hash (key and value) to store the weight category description 
3. [x] define a method to search the hash for a specific value via loop using a key 
4. [x] defne a method to generate a table to indicate to the user the various weight categories and ranges
5. [x] define a method to output the results to the user through string interpolation
6. [ ] refactor the hash to include weight category name and ranges
7. [ ] define a method to generate table rows based on the hash

**4. Re-calculate**

This feature was implemented using an IF and ELSE statement complimented by the Ruby gem - TTY-prompt. This allows the user to select whether they would like to exit the application or re-calculate their BMI. When the user selects re-calculate it will set the variable replay to TRUE, hence prompting the user back to the beginning of the loop for the user to select which unit conversion system they would like to use; otherwise it will set the replay variable to FALSE and terminate the application.

1. [x] define a method to initialise TTY-prompt
2. [x] define a variable to store user selection 
3. [x] define a method to set the variable to either terminate or continue the loop

---

**Hardware/software requirements:**

In order to use this application; you must have access to a computer running either Windows, Mac OSX, or Ubuntu. 

**Dependencies**

Prior to running the application, please open your preferred terminal application and install the following:

**Colorize:**

```
gem install colorize
```

**Terminal Table:**

```
gem install terminal-table
```

**TTY-Prompt:**

```
gem install tty-prompt
```

**Figlet:**

```
gem install figlet
```

**Lolcat**:

```
gem install lolcat
```

**Once completed, enter the below command to verify that the above Ruby Gems have been installed.**

```
gem list
```

**Install**

1. Clone the repository: https://github.com/vincentlieu/terminal-project.git
2. Open your preferred terminal application and navigate into the folder /src where the bmiCalculator.rb file resides
3. Type in the command "ruby bmiCalculator.rb" and press Enter to begin executing the application

