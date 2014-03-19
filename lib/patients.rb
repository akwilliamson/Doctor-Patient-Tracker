class Patient
  attr_reader :name, :birthday, :id, :doctor_id

  def initialize(name, birthday, doctor_id, id=nil)

    @name = name
    @birthday = birthday
    @id = id
    @doctor_id = doctor_id
  end

  def ==(another_patient)
    self.name == another_patient.name
  end

  def self.all
    results = DB.exec("SELECT * FROM patients;")
    patients = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      birthday = result['birthday']
      doctor_id = result['doctor_id'].to_i
      patients << Patient.new(name, birthday, doctor_id)
    end
    patients
  end

  def save
    results = DB.exec("INSERT INTO patients (name, birthday, doctor_id) VALUES ('#{@name}', '#{@birthday}', '#{@doctor_id}') RETURNING id;")
    @id = results.first['id'].to_i

  end

  def delete
    DB.exec("DELETE FROM patients WHERE id = #{@id}")
  end
end
