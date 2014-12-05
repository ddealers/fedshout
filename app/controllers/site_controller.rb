require 'open-uri'
require 'nokogiri'
class SiteController < ApplicationController
	def scrap
		list = Nokogiri::HTML(open('http://sitl.diputados.gob.mx/listado_diputados_gpnp.php?tipot=TOTAL'))
		table = list.css('table tr:nth-child(4) table tr td:nth-child(1) a').each do |row|
			doc = Nokogiri::HTML(open('http://sitl.diputados.gob.mx/'+row['href']))
			name = doc.css('table tr:nth-child(3) table tr:nth-child(2) td:nth-child(2) span').text.strip
		  	#if doc.css('table tr:nth-child(3) table tr:nth-child(2) td:nth-child(3) img') != nil
		  	#	img_group = doc.css('table tr:nth-child(3) table tr:nth-child(2) td:nth-child(3) img')[0]['src']
		  	#end
		  	entity = doc.css('table tr:nth-child(3) table tr:nth-child(4) td:nth-child(2)').text.strip
		  	place = doc.css('table tr:nth-child(3) table tr:nth-child(5) td:nth-child(1) span').text.strip.gsub! ':', ''
		  	place_int = if place  == 'Distrito' then 1 else 2 end
		  	district = doc.css('table tr:nth-child(3) table tr:nth-child(5) td:nth-child(2)').text.strip
		  	head = doc.css('table tr:nth-child(3) table tr:nth-child(6) td:nth-child(2)').text.strip
		  	curul = doc.css('table tr:nth-child(3) table tr:nth-child(7) td:nth-child(2)').text.strip
		  	substitute = doc.css('table tr:nth-child(3) table tr:nth-child(8) td span').text.strip.gsub! 'Suplente:', ''
		  	mail = doc.css('table tr:nth-child(3) table tr:nth-child(10) td:nth-child(1) a').text.strip

		  	if place_int == 2 then head = ('Circunscripción ' + district) end

		  	$entity = Entity.find_or_create_by(name: entity)
		  	
		  	$district = District.find_or_create_by(num: district, head: head)

		  	$member = Member.create(name: name, mail: mail, selected_for: place_int, curul: curul, alternate: substitute)
		  	$member.district = $district
		  	if $member.id >= 1 && $member.id <= 206 then $member.group = Group.find(1) end
		  	if $member.id >= 207 && $member.id <= 331 then $member.group = Group.find(2) end
		  	if $member.id >= 332 && $member.id <= 437 then $member.group = Group.find(3) end
		  	if $member.id >= 438 && $member.id <= 455 then $member.group = Group.find(4) end
		  	if $member.id >= 456 && $member.id <= 472 then $member.group = Group.find(5) end
		  	if $member.id >= 473 && $member.id <= 483 then $member.group = Group.find(6) end
		  	if $member.id >= 484 && $member.id <= 492 then $member.group = Group.find(7) end
		  	if $member.id >= 493 && $member.id <= 497 then $member.group = Group.find(8) end
		  	$member.save

		  	$district.entity = $entity
		  	$district.save
		end
  	end
end
