//
//  Constant.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

struct Constant {
    
    public static let HOME_SCREEN_TITLE  = "Home"
    public static let ABOUT_SCRREN_TITLE = "About"
    public static let MAIN_VIEWS = ["Saving", "Loan", "Mortgage"]
    public static let SAVING_SCREEN_NAME = "Saving"
    public static let LOAN_SCREEN_NAME = "Loan"
    public static let MORTAGAGE_SCREEN_NAME = "Mortgage"
    public static let SAVING_VIEWS = ["Calculate Future Value", "Calculate Periodic Value", "Calculate Interest Rate", "Calculate Compounding Periods", "Calculate Present Value"]
    
    public static let LOAN_SCREEN_TITLE = "Loan Calculator"
    public static let MORTAGAGE_SCREEN_TITLE = "Mortalage Calculator"
    public static let COMPOUDING_SCREEN_TITLE = "Compounding Periods Calculator"
    public static let FUTURE_VALUE_SCREEN_TITLE = "Future Value Calculator"
    public static let INTEREST_RATE_SCREEN_TITLE = "Interest Rate Calculator"
    public static let PMT_SCREN_TITLE = "Periodic Payment Calculator"
    public static let PRESENT_VALUE_SCREEN_TITLE = "Present Value Calculator"
    
    public static let ERORR_ALERT_TITLE_INVALID_DATA = "Invalid Input"
    public static let ERROR_ALERT_MESSAGE_INVALID_DATA = "Please enter valid numbers for all fields."
    public static let ERROR_ALERT_BUTTON_TITLE_OK = "OK"
    
    public static let SECTION_TITLE = "Financial Inputs"
    
    public static let CURRENCY = "Rs"
    
    //MARK: Help view data
    public static let LOAN_HELP_DATA: HelpData = HelpData(
        title: "Help",
        description: "The Loan Calculator helps you determine the missing value in a loan calculation (Loan Amount, Loan Term, Monthly Payment, or Interest Rate) based on the following inputs:",
        inputFields: [
            InputField(icon: "dollarsign.circle", title: "Loan Amount", description: "Enter the total amount of the loan (in Rs)."),
            InputField(icon: "calendar", title: "Loan Term", description: "Enter the total duration of the loan (in months)."),
            InputField(icon: "arrow.clockwise.circle", title: "Monthly Payment", description: "Enter the amount you will pay each month (in Rs)."),
            InputField(icon: "percent", title: "Interest Rate", description: "Enter the annual interest rate (in percentage) for the loan.")
        ],
        notes: [
            "Ensure all inputs are positive numbers.",
            "The interest rate should be entered as a percentage (e.g., 5 for 5%).",
            "To calculate the missing value, enter three fields and leave one blank."
        ]
    )
    public static let MORTGAGE_HELP_DATA: HelpData = HelpData(
        title: "Help",
        description: "The Mortgage Calculator helps you determine the missing value in a mortgage calculation (House Price, Down Payment, Monthly Payment, Loan Term, or Interest Rate) based on the following inputs:",
        inputFields: [
            InputField(icon: "house.fill", title: "House Price", description: "Enter the total price of the house (in Rs)."),
            InputField(icon: "dollarsign.circle", title: "Down Payment", description: "Enter the amount you will pay upfront (in Rs)."),
            InputField(icon: "arrow.clockwise.circle", title: "Monthly Payment", description: "Enter the amount you will pay each month (in Rs)."),
            InputField(icon: "calendar", title: "Loan Term", description: "Enter the total duration of the loan (in years)."),
            InputField(icon: "percent", title: "Interest Rate", description: "Enter the annual interest rate (in percentage) for the mortgage.")
        ],
        notes: [
            "Ensure all inputs are positive numbers.",
            "The interest rate should be entered as a percentage (e.g., 5 for 5%).",
            "To calculate the missing value, enter four fields and leave one blank."
        ]
    )
    
    public static let PRESENT_VALUE_HELP_DATA: HelpData = HelpData(
        title: "Help",
        description: "The Present Value Calculator helps you determine the current value of a future amount of money or cash flow, based on the following inputs:",
        inputFields: [
            InputField(icon: "calendar", title: "Number of Periods", description: "Enter the total number of periods (e.g., months, years) over which the future value will be discounted."),
            InputField(icon: "percent", title: "Interest Per Year", description: "Enter the annual interest rate (in percentage) that will be used to discount the future value."),
            InputField(icon: "dollarsign.circle", title: "Future Value", description: "Enter the future amount of money or cash flow you want to discount to its present value."),
            InputField(icon: "arrow.clockwise.circle", title: "Periodic Payment (Optional)", description: "Enter the amount of money you will receive or pay periodically (e.g., monthly or yearly). If there are no periodic payments, you can leave this field blank or enter 0.")
        ],
        notes: [
            "Ensure all inputs are positive numbers.",
            "The interest rate should be entered as a percentage (e.g., 5 for 5%).",
            "The calculator assumes that payments are made at the end of each period."
        ]
    )
    
    public static let  PMT_HELP_DATA: HelpData = HelpData(
        title: "Help",
        description: "The PMT (Periodic Payment) Calculator helps you determine the periodic payment required to achieve a future value or pay off a loan.",
        inputFields: [
            InputField(icon: "calendar", title: "Number of Periods", description: "Enter the total number of periods (e.g., months, years) over which the payments will be made."),
            InputField(icon: "percent", title: "Interest Per Year", description: "Enter the annual interest rate (in percentage) that will be applied to the loan or investment."),
            InputField(icon: "dollarsign.circle", title: "Present Value", description: "Enter the initial amount of money (present value) of the loan or investment."),
            InputField(icon: "dollarsign.circle.fill", title: "Future Value", description: "Enter the future amount of money you want to achieve. For loans, this is typically 0.")
        ],
        notes: [
            "Ensure all inputs are positive numbers.",
            "The interest rate should be entered as a percentage (e.g., 5 for 5%).",
            "The calculator assumes that payments are made at the end of each period."
        ]
    )
    
    public static let INTEREST_RATE_HELP_DATA = HelpData(
        title: "Help",
        description: "The Interest Rate Calculator helps you determine the annual interest rate required to achieve a future value, based on the following inputs:",
        inputFields: [
            InputField(icon: "calendar", title: "Number of Periods", description: "Enter the total number of periods (e.g., months, years) over which the investment will grow."),
            InputField(icon: "dollarsign.circle", title: "Present Value", description: "Enter the initial amount of money (present value) you are investing."),
            InputField(icon: "dollarsign.circle.fill", title: "Future Value", description: "Enter the future amount of money you want to achieve."),
            InputField(icon: "arrow.clockwise.circle", title: "Periodic Payment (Optional)", description: "Enter the amount of money you will add periodically (e.g., monthly or yearly) to the investment. If there are no periodic payments, you can leave this field blank or enter 0.")
        ],
        notes: [
            "Ensure all inputs are positive numbers.",
            "The calculator assumes that payments are made at the end of each period."
        ]
    )
    
    public static let FUTURE_VALUE_HELP_DATA: HelpData = HelpData(
        title: "Help",
        description: "The Future Value Calculator helps you determine the future value of an investment based on the following inputs:",
        inputFields: [
            InputField(icon: "calendar", title: "Number of Periods", description: "Enter the total number of periods (e.g., months, years) over which the investment will grow."),
            InputField(icon: "percent", title: "Interest Per Year", description: "Enter the annual interest rate (in percentage) that will be applied to the investment."),
            InputField(icon: "dollarsign.circle", title: "Present Value", description: "Enter the initial amount of money (present value) you are investing."),
            InputField(icon: "arrow.clockwise.circle", title: "Periodic Payment (Optional)", description: "Enter the amount of money you will add periodically (e.g., monthly or yearly) to the investment. If there are no periodic payments, you can enter 0.")
        ],
        notes: [
            "Ensure all inputs are positive numbers.",
            "The interest rate should be entered as a percentage (e.g., 5 for 5%).",
            "The calculator assumes that payments are made at the end of each period."
        ]
    )
    public static let COMPOUNDING_PERIODS_HELP_DATA : HelpData =  HelpData (
        title: "Help",
        description: "The Compounding Periods Calculator helps you determine the number of compounding periods required to reach a future value, based on the following inputs:",
        inputFields: [
            InputField(icon: "percent", title: "Interest Per Year", description: "Enter the annual interest rate (in percentage) that will be applied to the investment."),
            InputField(icon: "dollarsign.circle", title: "Present Value", description: "Enter the initial amount of money (present value) you are investing."),
            InputField(icon: "dollarsign.circle.fill", title: "Future Value", description: "Enter the future amount of money you want to achieve."),
            InputField(icon: "arrow.clockwise.circle", title: "Periodic Payment (Optional)", description: "Enter the amount of money you will add periodically (e.g., monthly or yearly) to the investment. If there are no periodic payments, you can leave this field blank or enter 0.")
        ],
        notes: [
            "Ensure all inputs are positive numbers.",
            "The interest rate should be entered as a percentage (e.g., 5 for 5%).",
            "The calculator assumes that payments are made at the end of each period."
        ]
    )
    
}
