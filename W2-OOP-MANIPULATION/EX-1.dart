enum Skill { FLUTTER, DART, OTHER }
class Address {
  final String street;
  final String city;
  final int zipCode;

  Address (this.street, this.city, this.zipCode);
  

}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(String name, double baseSalary, List<Skill> skills, Address address, int yearsOfExperience
  ):_name = name,
    _baseSalary = baseSalary,
    _skills = List.unmodifiable(skills),
    _address = address,
    _yearsOfExperience = yearsOfExperience;

  Employee.mobile(
    String name,
    Address address, 
    int yearsOfExperience,
  ):_name = name,
    _baseSalary = 30000,
    _skills = List.unmodifiable([Skill.FLUTTER, Skill.DART]),
    _address = address,
    _yearsOfExperience = yearsOfExperience;

  Employee.other(
    String name,
    double baseSalary,
    Address address,
    int yearsOfExperience,
  ):_name = name,
    _baseSalary = baseSalary,
    _skills = List.unmodifiable([Skill.OTHER]),
    _address = address,
    _yearsOfExperience = yearsOfExperience;
    
  String get name=> _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;
  double calculateSalary(){
    double salary = _baseSalary;
    salary += _yearsOfExperience *2000;
    for (Skill skill in _skills){
      if (skill == Skill.FLUTTER){
        salary +=5000;
      } else if (skill == Skill.DART){
        salary +=3000;
      } else if (skill == Skill.OTHER){
        salary +=1000;
      }
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}');
    print('Skills:$skills');
    print('City: ${address.city}');
    print('Experience: $yearsOfExperience years');
    print('Street: ${address.street}');
    print('ZIP code: ${address.zipCode}');
    print('Calculated Salary: \$${calculateSalary()}');
  }
}



void main() {
  final address1 = Address('Street 23', 'Phnom Penh', 20000);
  final emp1 = Employee('Sokea', 40000, [Skill.FLUTTER, Skill.DART], address1, 5);
  emp1.printDetails();

  final address2 = Address('Street 45', 'Phnom Penh', 12000);
  final emp2 = Employee('Ronan', 45000, [Skill.OTHER], address2,3);
  emp2.printDetails();
}