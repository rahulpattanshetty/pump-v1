class Credit < ActiveRecord::Base
belongs_to :daily

before_destroy :adding_back_to_reading
after_create :recalculate_reading_calculation

def recalculate_reading_calculation
	#binding.pry
	reading = Reading.find_by(daily_id:self.daily_id)
	
	if self.oil_type == "Diesel"
		reading.d -= self.litres
		reading.total -= reading.total_diesel
		reading.total_diesel = reading.d * reading.diesel_price
		reading.total += reading.total_diesel
		reading.update_attributes(d:reading.d,total_diesel:reading.total_diesel,total:reading.total)
	elsif self.oil_type == "Petrol"
		reading.p -= self.litres
		reading.total -= reading.total_petrol
		reading.total_petrol = reading.p * reading.petrol_price
		reading.total += reading.total_petrol
		reading.update_attributes(p:reading.p,total_petrol:reading.total_petrol,total:reading.total)
	end
		
	#binding.pry
end
def adding_back_to_reading
	reading = Reading.find_by(daily_id:self.daily_id)
	
	if self.oil_type == "Diesel"
		reading.d += self.litres
		reading.total -= reading.total_diesel
		reading.total_diesel = reading.d * reading.diesel_price
		reading.total += reading.total_diesel
		reading.update_attributes(d:reading.d,total_diesel:reading.total_diesel,total:reading.total)
	elsif self.oil_type == "Petrol"
		reading.p += self.litres
		reading.total -= reading.total_petrol
		reading.total_petrol = reading.p * reading.petrol_price
		reading.total += reading.total_petrol
		reading.update_attributes(p:reading.p,total_petrol:reading.total_petrol,total:reading.total)
	end
end


end
