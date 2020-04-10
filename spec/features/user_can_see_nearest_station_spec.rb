require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when i visit / and select drop down search info' do
    it 'shows nearest fuel station electric with info' do

      visit '/'

      click_on 'Find Nearest Station'
      expect(page).to have_content("Name: Seventeenth Street Plaza")
      expect(page).to have_content("Address: 1225 17th St.")
      expect(page).to have_content("Fuel type: ELEC")
      expect(page).to have_content("Access times: MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
      expect(page).to have_content("Distance: 0.1 m")
      expect(page).to have_content("Travel time: 1 min")
      expect(page).to have_content("Directions: ")
      save_and_open_page
    end

  end

end
