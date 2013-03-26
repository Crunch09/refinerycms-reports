class Usable

  attr_accessor :usables

  def self.all
    return @usables unless @usables.nil?
    combined = Refinery::Reports::Vehicle.all + Refinery::Reports::Person.all
    hsh = combined.group_by{|u| u.department.intern? ? 'intern' : 'extern'}
    @usables = hsh.each{|k,v| hsh[k] = v.group_by{|r| r.department.name}}
    @usables = [] if @usables.nil?
    @usables
  end
end
