
class Patient {
  final String patientId;
  final String name;
  final int age;
  final bool urgent;

  Patient ({required this.patientId, 
    required this.name, 
    required this.age, 
    this.urgent = false
  });

  @override
  String toString() => name;

}

class Hospital {
  final List<Patient> _patients;
  Hospital(List<Patient> patients) : _patients = List.unmodifiable(patients);

  List<Patient> getUrgentPatients() {
    return _patients.where((p) => p.urgent).toList();
  }

  List<Patient> getUrgentPatientsFrom60() {
    return _patients.where((p) => p.urgent && p.age >= 60).toList();
  }

  
}


void main () {

  final hospital = Hospital([
    Patient(patientId: 'P001', name: 'Dara', age: 70, urgent: true),
    Patient(patientId: 'P002', name: 'Sophea', age: 8),
    Patient(patientId: 'P003', name: 'Malis', age: 55, urgent: true),
    Patient(patientId: 'P004', name: 'Rith', age: 65)
  ]);

  print("Urgent Patient: ${hospital.getUrgentPatients().join(',')}");
  print("Urgent Patient age 60 or more: ${hospital.getUrgentPatientsFrom60().join(',')}");
  
}