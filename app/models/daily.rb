class Daily < ActiveRecord::Base
has_one :sale, dependent: :destroy
has_many :credits, dependent: :destroy
has_one :reading, dependent: :destroy
#before_create :calculate
#validates :d1,:d2,:p1,:p2,:oil,:daily_date, presence:true
#after_save :save_into_sales
before_save :calculate_total
after_save :add_to_readings
def calculate_total
	last_reading = Daily.last
	l = Daily.last(2).first
	d = (last_reading.d1 + last_reading.d2)-(l.d1 + l.d2) 
	p = (last_reading.p1 + last_reading.p2)-(l.p1 + l.p2)
	o = last_reading.oil
	t = (d * last_reading.diesel_price) + (p * last_reading.petrol_price) + o
	self.total = t
		
end

def save_into_sales
	last_reading = Daily.last
	#binding.pry
	sale = Sale.new
	is_sale_present = Sale.find_by(daily_id:last_reading.id)
	l = Daily.find(last_reading.id-1)
	d = (last_reading.d1 + last_reading.d2)-(l.d1 + l.d2) 
	p = (last_reading.p1 + last_reading.p2)-(l.p1 + l.p2)
	o = last_reading.oil
	t = (d * last_reading.diesel_price) + (p * last_reading.petrol_price) + o
	#binding.pry
	sale.diesel = d
	sale.petrol = p
	sale.diesel_price = l.diesel_price
	sale.petrol_price = l.petrol_price
	sale.oil = o
	sale.reading_date = l.daily_date
	sale.daily_id = last_reading.id
	sale.total = t
	#binding.pry
	
	if (is_sale_present.nil?)
		sale.save	
	else
		is_sale_present.diesel = d
		is_sale_present.petrol = p
		is_sale_present.diesel_price = l.diesel_price
		is_sale_present.petrol_price = l.petrol_price
		is_sale_present.oil = o
		is_sale_present.reading_date = l.daily_date
		is_sale_present.daily_id = last_reading.id
		is_sale_present.total = t
		is_sale_present.save
	end
	 	
end
def add_to_readings
	reading = Reading.find_by(daily_id:self.id)

	if reading.nil?
		reading = Reading.new
		daily = Daily.last(2)
		reading.d = (daily.second.d1 - daily.first.d1) + (daily.second.d2 - daily.first.d2)
		reading.p = (daily.second.p1 - daily.first.p1) + (daily.second.p2 - daily.first.p2)
		reading.diesel_price = self.diesel_price
		reading.petrol_price = self.petrol_price
		reading.oil = self.oil
		reading.total_diesel = reading.d * reading.diesel_price
		reading.total_petrol = reading.p * reading.petrol_price
		reading.total = reading.total_petrol + reading.total_diesel + reading.oil
		reading.daily_id = self.id
		reading.daily_date = self.daily_date
		reading.save	
	else
		daily = Daily.last(2)
		reading.d = (daily.second.d1 - daily.first.d1) + (daily.second.d2 - daily.first.d2)
		reading.p = (daily.second.p1 - daily.first.p1) + (daily.second.p2 - daily.first.p2)
		reading.diesel_price = self.diesel_price
		reading.petrol_price = self.petrol_price
		reading.oil = self.oil
		reading.total_diesel = reading.d * reading.diesel_price
		reading.total_petrol = reading.p * reading.petrol_price
		reading.total = reading.total_petrol + reading.total_diesel + reading.oil
		

		reading.update_attributes(d:reading.d,p:reading.p,diesel_price:reading.diesel_price,petrol_price:reading.petrol_price,total_diesel:reading.total_diesel,total_petrol:reading.total_petrol,oil:reading.oil,total:reading.total)	
	end

end
	

end
