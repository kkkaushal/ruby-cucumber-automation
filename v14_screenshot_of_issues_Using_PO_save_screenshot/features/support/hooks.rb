require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :chrome
end

After do |scenario|
  if scenario.failed?
    time = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    filename = "error-#{@current_page.class}-#{time}.png"
    filepath = File.join('testresults','error_image', filename.to_s) 
    @current_page.save_screenshot(filepath)
  end
  @browser.close
end

# Notice that @current_page is being used to get hold of a page object. On line 4 we are saving the image.