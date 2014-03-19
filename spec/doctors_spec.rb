require 'spec_helper'

describe 'Doctor' do
  it 'is initialized with a name' do
    test_doctor = Doctor.new('Joe')
  end

  it 'starts off with no doctors' do
    Doctor.all.should eq []
  end

  describe 'save' do
    it 'saves a new doctor to the database' do
      test_doctor = Doctor.new('Dr. Con')
      test_doctor.save
      test_doctor.id.should be_an_instance_of Fixnum
    end
  end

  describe '.all' do
    it 'shows a list of doctors currently stored in the databse' do
      test_doctor = Doctor.new('Dr. Con')
      test_doctor.save
      test_doctor2 = Doctor.new('Dr. Cox')
      test_doctor2.save

      Doctor.all.should eq [test_doctor, test_doctor2]
    end
  end

  it 'is the same doctor if it has the same name' do
    test_doctor1 = Doctor.new('Bill Nye')
    test_doctor2 = Doctor.new('Bill Nye')
    test_doctor1.should eq test_doctor2
  end

  it 'deletes a doctor from the database' do
    test_doctor = Doctor.new('Daniel Day ASDASD')
    test_doctor.save
    test_doctor.delete
    Doctor.all.should eq []
  end

  describe '.list_doctors' do
    it 'lists all of the doctors' do
      test_doctor1 = Doctor.new('Dr. Seuss')
      test_doctor1.save
      test_doctor2 = Doctor.new('Dr. No')
      test_doctor2.save
      test_doctor3 = Doctor.new('Dr. Cox')
      test_doctor3.save
      Doctor.list_doctors.should eq ['Dr. Seuss','Dr. No','Dr. Cox']
    end
  end

  describe '.list_patients' do
    it 'lists all of the patients for a specific doctor' do
      test_doctor = Doctor.new('Charlie Brown')
      test_doctor.save
      test_patient = Patient.new('Lucy','1980-01-02', test_doctor.id)
      test_patient.save
      test_patient2 = Patient.new('Pamela Anderson','1980-01-02', test_doctor.id)
      test_patient2.save
      test_doctor.list_patients.length.should eq 2
    end
  end
end
