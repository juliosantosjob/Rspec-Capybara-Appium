# Mobile Testing Framework

This framework provides a seamless testing experience for Native Mobile apps using Appium, Capybara, RSpec, and Rake. With shared PageObject and Test classes for both Android and iOS platforms, it offers a robust solution for QA Engineers to conduct comprehensive tests efficiently.

## Features

- **Appium-Capybara Integration:** Utilizes the power of Appium-Capybara for seamless interaction with mobile apps.
- **Page Object Model:** Organizes test automation code into reusable PageObjects for improved maintainability and readability.
- **Shared Classes:** Enables code reusability between Android and iOS platforms, minimizing duplication and enhancing consistency.
- **Allure Report Integration:** Generates detailed Allure Reports for clear visualization and analysis of test results.

## Getting Started

1. **Clone the Project:** Clone this repository to your local machine.

2. **Install Dependencies:** Run `bundle install` to install all necessary dependencies.

3. **Run Tests:** Execute tests using Rake tasks with:

```
rake run[android]
```

or 

```
rake run[ios]
```

"To run a scenario using the tag, simply insert a comma and pass the name of the tag. For example:"

```
rake run[android,login]
```