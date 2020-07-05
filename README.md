# Robot Framework guide
This project has propose introduce for Robot Framework and provide libraries for development more fast 
See documentation in [Robot Framework Use Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#introduction)

## 1.1   Introduction
Robot Framework is a Python-based, extensible keyword-driven automation framework for acceptance testing, acceptance test driven development (ATDD), behavior driven development (BDD) and robotic process automation (RPA). It can be used in distributed, heterogeneous environments, where automation requires using different technologies and interfaces.
The framework has a rich ecosystem around it consisting of various generic libraries and tools that are developed as separate projects. For more information about Robot Framework and the ecosystem, see http://robotframework.org.
Robot Framework is open source software released under the Apache License 2.0. Its development is sponsored by the Robot Framework Foundation.

## 1.2 What you need for user Robot Framework?
Robot Framework is implemented with Python and supports also Jython (JVM), IronPython (.NET) and PyPy. Before installing the framework, an obvious precondition is installing at least one of these interpreters.
You need install in your machine python3 and pip for install dependencies this project.
First create virtual environment:

    python3 -m venv venv
   
 Before this active virtualenv with command:
 
      source venv/bin/activate 
     
 Now install robot and dependencies:
      
      pip install -r requirements.txt
      
 If you need run tests with Selenium is necessary install drive with example ChromeDriver or other browser you need
 ### For run test accept you need install ChromeDriver or other browser your preference 
Download ChromeDriver in https://chromedriver.chromium.org/downloads,
select based in your version Chrome and unzip file and move for /home/your_user/.local/bin

## 1.3 Run tests
Always see if you virtual environment is activate for run robot.
You can run all tests or one test
Example run one file:
You need pass folder where robot save report, log and screenshot  for not overwrite other test recommend you use
one folder specific for you test 

    robot -d ./results/test_selenium tests/test_ecommerce_with_selenium.robot
    robot -d ./results/variable tests/example_variables.robot  

Example run all test
    
    robot -d ./results test

