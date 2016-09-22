@outputSchema("m_traffic: {(year:int, miles:float, vans:float, trucks:float)}")
def to_miles(km_traffic):
  year, km, vans, trucks = km_traffic.split(' ')
  miles = float(km) * 0.62
  return int(year), miles, float(vans), float(trucks)

