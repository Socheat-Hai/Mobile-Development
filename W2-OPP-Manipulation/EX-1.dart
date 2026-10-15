enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);
   
  Employee.mobileDev(this._name, this._baseSalary, this._address, this._yearsOfExperience)
    : _skills = [Skill.DART, Skill.FLUTTER];

  Employee.newHire(this._name,this._baseSalary, this._skills, this._address)
    : _yearsOfExperience = 1; 

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double salary() {
    double experienceBonus = (yearsOfExperience * 2000).toDouble();

    double skillBonus () {
      double total = 0;
      for (Skill s in skills) {
        if (s == Skill.FLUTTER) {
          total += 5000;
        }
        else if (s == Skill.DART) {
          total += 3000;
        }
        else if (s == Skill.OTHER) {
          total += 1000;
        }
      }
      return total;
    }

    return baseSalary + experienceBonus + skillBonus();
  } 

  @override
  String toString() {
    return "Employee: $name - Experience: $_yearsOfExperience - Salary: ${salary()}";
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}');
  }
}

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

void main() {
  var addr = Address('St 123', 'Phnom Penh', '12000');

  var emp1 = Employee('Sokea', 40000, [Skill.DART], addr, 2);
  emp1.printDetails();


  var emp2 = Employee.mobileDev('Ronan', 45000, addr, 3);
  emp2.printDetails();

  print(emp1);
  print(emp2);
}