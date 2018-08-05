require 'selenium-webdriver'

class SeleniumDemoReg

  # page_url
  PAGE_URL = 'http://demoqa.com/registration/'
  # Page field
  FIRST_NAME_FIELD = 'name_3_firstname' # id
  LAST_NAME_FIELD = 'name_3_lastname' # id
  MARITAL_STATUS = 'radio_4[]' # id
  HOBBY_STATUS = 'checkbox_5[]' # values
  COUNTRY_DROP_DOWN_LIST = 'dropdown_7' # id
  DOB_MONTH_DROPDOWN_LIST = 'mm_date_8' # id
  DOB_DAY_DROPDOWN_LIST = 'dd_date_8' # id
  DOB_YEAR_DROPDOWN_LIST = 'yy_date_8' # id
  PHONE_NUMBER_FIELDS = 'phone_9' # id
  USERNAME_FIELD = 'username' # id
  EMAIL_FIELD = 'email_1' # id
  PROFILE_PICTURE_BUTTON = 'profile_pic_10' # id
  DESCRIPTION_FIELD = 'description' # id
  PASSWORD_FIELD = 'password_2' # id
  CONFIRM_PASSWORD_FIELD = 'confirm_password_password_2' # id
  SUBMIT_BUTTON = 'pie_submit' # name
  REGISTRATION_CONFIRMATION = 'piereg_message' #class

  def initialize
    # set up driver
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def access_registration_form
    @chrome_driver.get(PAGE_URL)
  end

  def current_url
    @chrome_driver.current_url
  end

  # first name field management - Difficulty Easy

  def set_first_name_field(first_name)
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD).send_keys first_name
  end

  def get_first_name_field_value
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD)["value"]
  end

  def first_name_field_displayed
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD).displayed?
  end

  # last name field management - Difficulty Easy

  def set_last_name_field(last_name)
    @chrome_driver.find_element(:id, LAST_NAME_FIELD).send_keys last_name
  end

  def get_last_name_field_value
    @chrome_driver.find_element(:id, LAST_NAME_FIELD)["value"]
  end

  def last_name_field_displayed
    @chrome_driver.find_element(:id, LAST_NAME_FIELD).displayed?
  end

  # Marital option management - Difficulty Medium

  def select_marital_option(marital_status)
    # Consider something like a case statement and check the selenium selected? method
    @chrome_driver.find_elements(:name, "radio_4[]").each do |option|
      if option["value"] == marital_status
        option.click
        return option.selected?
      end
    end
  end

  # hobby option management - Difficulty Medium

  def select_hobby_option(hobby)
    # Consider something like a case statement and check the selenium selected? method
    @chrome_driver.find_elements(:name, "checkbox_5[]").each do |option|
      if option["value"] == hobby
        option.click
        return option.selected?
      end
    end
  end

  # Select Country - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def get_selected_country
    country = ''
    country_options = @chrome_driver.find_element(:id, COUNTRY_DROP_DOWN_LIST)
    options = country_options.find_elements(:tag_name, 'option')
    # options.getFirstSelectedOption().text
    options.each do |option|
      if option.selected?
        country = option.text
      end
    end
    country
  end

  def country_dropdown_list_select(country)
    @chrome_driver.find_element(:id, COUNTRY_DROP_DOWN_LIST).find_element(:css,"option[value='#{country}']").click
  end

  # DOB management - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def dob_month_list_select(month_value)
    @chrome_driver.find_element(:id, DOB_MONTH_DROPDOWN_LIST).find_element(:css,"option[value='#{month_value}']").click
  end

  def dob_day_list_select(day_value)
    @chrome_driver.find_element(:id, DOB_DAY_DROPDOWN_LIST).find_element(:css,"option[value='#{day_value}']").click
  end

  def dob_year_list_select(year_value)
    @chrome_driver.find_element(:id, DOB_YEAR_DROPDOWN_LIST).find_element(:css,"option[value='#{year_value}']").click
  end


  # Phone number field management - Difficulty Easy

  def set_phone_number_field(phone_number)
    @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS).send_keys phone_number
  end

  def get_phone_number_field_value
    @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS)["value"]
  end

  #  username field management - Difficulty Easy

  def set_user_name_field(user_name)
    @chrome_driver.find_element(:id, USERNAME_FIELD).send_keys user_name
  end

  def get_user_name_field_value
    @chrome_driver.find_element(:id, USERNAME_FIELD)["value"]
  end

  # Email field management - Difficulty Easy

  def set_email_field(email)
    @chrome_driver.find_element(:id, EMAIL_FIELD).send_keys email
  end

  def get_email_field_value
    @chrome_driver.find_element(:id, EMAIL_FIELD)["value"]
  end

  # about yourself / description field - Difficulty Easy

  def set_about_yourself_field(details)
    @chrome_driver.find_element(:id, DESCRIPTION_FIELD).send_keys details
  end

  def get_about_yourself_value
    @chrome_driver.find_element(:id, DESCRIPTION_FIELD)["value"]
  end

  # Password management - Difficulty Easy

  def set_password_field(password)
    @chrome_driver.find_element(:id, PASSWORD_FIELD).send_keys password
  end

  def get_password_value
    @chrome_driver.find_element(:id, PASSWORD_FIELD)["value"]
  end

  def set_confirmation_password_field(password)
    @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD).send_keys password
  end

  def get_confirmation_password_value
    @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD)["value"]
  end

  # registration confirmation - Difficulty Easy

  def click_submit
    @chrome_driver.find_element(:name, SUBMIT_BUTTON).click
  end

  def check_registration_successful
  end
end
