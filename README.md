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

**Usage**

Before using this application, the user will need to have access to a Windows or Mac computer and have Ruby installed. 

1.  Enter a user's name

2. Select a system of measurement (Imperial or Metric)

3. Enter your weight (Imperial: pounds(lbs) or Metric: Kilograms(kg))

4. Enter your height (Imperial: feet(ft) & inches(in) or Metric: metres (m)

**Once the above steps have been completed the application will return the calculated BMI result, the weight category and description.**

5. Prompt user with the options to re-calculate BMI

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



