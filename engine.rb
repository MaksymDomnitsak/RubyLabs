require_relative 'libs'

class Engine
    def self.run()
        settings = MyApplicationZbihli::MyApplicationSettings.instance

        cart = Cart.new

        general_items = []
        num_pages = 3
        threads = []

        num_pages.times do |i|
            threads << Thread.new do
                item = MainApplication.get_items(settings.web_address + ";#{i}")
                general_items.concat item
            end
        end
      
        threads.each{|t| t.join}
        
        general_items.each do |item|
            cart.add_item(item, 1)
        end
        
        attachment = Zipper.create_archive('./', 'tmp/output.zip', settings.file_ext) 
        settings.user.send_email('SUBJECT', 'BODY', attachment)

        cart
    end
end