# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Doctor.delete_all
Doctor.create(:name => 'Fengling Zhang',
			 :introduction => %{<p>Jiangsu province<p>},
			 :skill => "paediatrics",
			 :username => "zfl")
#..
Man.delete_all
Man.create(:name => "zfl",
		  :hashed_password => "d1a17dd98309b9b0194f2eb6a4298174b662e044079fc995f4b375d27a256590",
		  :salt => "-6212819780.420778383271837",
		  :isDoctor => true)
Man.create(:name => "sxc",
           :hashed_password => "d1a17dd98309b9b0194f2eb6a4298174b662e044079fc995f4b375d27a256590",
           :salt => "-6212819780.420778383271837",
           :isDoctor =>false)
