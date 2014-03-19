require 'spec_helper'

describe 'Patient' do
  it 'initializes a new patient with a name, birthday and a doctor_id' do
    test_patient = Patient.new('Madonna', '1969-05-01', 1)
    test_patient.should be_an_instance_of Patient
  end
    describe 'delete' do
    it 'removes a patient from the patients table in the database' do
      test_patient = Patient.new('Spears', '1969-05-01', 1)
      test_patient.save
      test_patient.delete
      Patient.all.should eq []
    end
  end

  describe 'save' do
    it 'saves the patient to the patients database' do
      test_patient = Patient.new('Spears', '1969-05-01', 1)
      test_patient.save
      test_patient.id.should be_an_instance_of Fixnum
    end
  end

  it 'is equal to another object with the same name and birthday' do
    test_patient1 = Patient.new('MJ', '1969-05-01', 1)
    test_patient2 = Patient.new('MJ', '1969-05-01', 1)
    test_patient1.should eq test_patient2
  end

  describe '.all' do
    it 'shows a list of patients currently in the database' do
    test_patient = Patient.new('Spears', '1969-05-01', 1)
    test_patient.save
    test_patient2 = Patient.new('Lady Gaga', '1969-05-01', 1)
    test_patient2.save
    Patient.all.should eq [test_patient, test_patient2]
    end
  end
end





