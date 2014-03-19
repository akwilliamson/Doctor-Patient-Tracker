class Doctor
  attr_reader :name, :id

  def Doctor.list_doctors
    doctor_names = []
    result = DB.exec("SELECT * FROM doctors;")
    result.each do |result|
      doctor_names << result
    end
    doctor_names
  end

  def initialize(name, id=nil)
    @name = name
    @id = id
  end

  def self.all
    results = DB.exec("SELECT * FROM doctors;")
    doctors = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      doctors << Doctor.new(name)
    end
    doctors
  end

  def save
    results = DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_doctor)
    self.name == another_doctor.name
  end

  def delete
    DB.exec("DELETE FROM doctors WHERE id = ('#{@id}');")
  end


  def list_patients
    patients = []
    answers = DB.exec("SELECT * FROM patients WHERE doctor_id = ('#{@id}')")
      answers.each do |answer|
        patients << answer
    end
    patients
  end

end


