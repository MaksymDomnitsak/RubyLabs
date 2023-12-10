# frozen_string_literal: true
require 'mechanize'
require_relative 'my_application_domnitsak'

class LoginAndVisitPage
  def initialize
    @agent = Mechanize.new
  end

  def login(settings)
    login_page = @agent.get(settings.web_address)
    open_sidebar = login_page.at('#page-block > div > header > div.ek-body__section.ek-body__section_height_1-1 > div > div:nth-child(3) > div > div:nth-child(1) > button')
    sidebar = @agent.click(open_sidebar)
    puts sidebar.links
    page_with_sidebar = sidebar.at('#react-portal > div:nth-child(2) > div > div > div.elIqJ._4DX3c > div > div > ul > li:nth-child(1) > div > button')
    login_form = @agent.click(page_with_sidebar)
    puts login_form.links
    oauth = login_form.at('#react-portal > div:nth-child(4) > div > div > div.elIqJ._4DX3c > div > div > div > div.M3v0L.-ZQ1A.dqJ33.CiWn0.Sbv8m._3Q8Xr.JBm3P > div.M3v0L.t1VU0.v9U-h._9xXMY.kFSRf.Z5XfI.NI39K.veyx2.W_dPp > div.M3v0L.Tr1FH > div > div:nth-child(2) > div')
    oauth_form = @agent.click(oauth)
    puts oauth_form
    #login_button = login_page.button_with(data_qaid: 'show_sidebar')
    #open_sidebar = @agent.submit(login_button)
    #sign = open_sidebar.button_with(data_qaid: 'sign_in_mob_sidebar')
    #login_form = @agent.submit(sign)
    #div_element = login_form.at('#react-portal > div:nth-child(4) > div > div > div.elIqJ._4DX3c > div > div > div > div.M3v0L.-ZQ1A.dqJ33.CiWn0.Sbv8m._3Q8Xr.JBm3P > div.M3v0L.t1VU0.v9U-h._9xXMY.kFSRf.Z5XfI.NI39K.veyx2.W_dPp > div.M3v0L.Tr1FH > div > div:nth-child(2) > div')
    #link_inside_div = div_element.at('a')
    #new_page = @agent.click(link_inside_div)
  end

  def visit_page(url)
    page = @agent.get(url)
  end
end
