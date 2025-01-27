// SPDX-License-Identifier: GPL-3.0

pragma solidity  ^0.8.0;

struct Student{
    uint id;
    string name;
    uint grade;
}

contract StudentContact{

    Student[] public students;

    //adding new student
    function addStudent(uint _id,string memory _name, uint _grade) public {
        students.push(Student(_id,_name,_grade));
    }

    //updating a student information by Id
    function updateStudentById(uint _id,string memory _name, uint _grade) public {

        for(uint i=0;i<students.length;i++){
            if(students[i].id==_id){
                students[i].name=_name;
                students[i].grade=_grade;
            }
        }

        revert("Student not found");
    }

    //get a student details by Id
    function getInformationById(uint _id) view public returns (Student memory){
        for(uint i=0;i<students.length;i++){
            if(students[i].id==_id){
                return students[i];
            }
        }

        revert("Student not found");
    }

    //Delete a student by Id
    function deleteById(uint _id) public{
       for(uint i=0;i<students.length;i++){
            if(students[i].id==_id){
                students[i]=students[students.length-1];
                students.pop();
                return;
            }
        }  

        revert("Student not found");
    }

    //Get all students information at once
    function getAllStudentInformation()public view returns(Student[] memory){
        return students;
    }

    //updating only grades
    function updateStudentGrade(uint _id, uint _newGrade) public {
        for (uint i=0;i<students.length;i++) {
            if (students[i].id==_id) {
                students[i].grade = _newGrade;
                return;
            }
        }

        revert("Student not found");
    }

    //adding multiple of students at once
    function bulkAddStudents(Student[] memory newStudents) public {
        for (uint i=0;i<newStudents.length;i++) {
            students.push(newStudents[i]);
        }
    }

    //deleting all at once
    function clearAllStudents() public {
        delete students;
    }

}