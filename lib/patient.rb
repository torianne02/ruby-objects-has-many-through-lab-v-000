class Patient
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select do |date, patient, doctor|
      Appointment.patient == self
    end
  end

  def doctors
    appointments.map {|patient| patient.doctor}
  end
end
