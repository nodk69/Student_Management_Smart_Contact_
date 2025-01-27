// SPDX-License-Identifier: GPL-3.0

pragma solidity  ^0.8.0;

contract Structure {
    
    //Definning the structure Empolyee here 
    struct Emp{
        string name;
        uint age;
        address acc;
    }
    //it can use to initialize value for only one empolyee
    Emp public emp;

    //pushing the value through the construter in emp
    constructor(string memory _name,uint _age,address _acc){
        emp.name=_name;
        emp.age=_age;
        emp.acc=_acc;
    }

    //multiple empolyee can be stored here 
    Emp[] public emps;

    function setValues() public {

        //these are the maily 3 types through which we put the data into Empolyee Array
        //first way to initialize value  Order-Based Initialization
        Emp memory emp1=Emp("Nadeem Kiwai",24,msg.sender); //order matters
        
        //first way to initialize value Named Parameter Initialization
        Emp memory emp2=Emp({acc: msg.sender,name:"zeeshan",age:34}); //order does not matter
        
        //first way to initialize value Field-by-Field Assignment
        Emp memory emp3;

        emp3.name="shadan";
        emp3.age=34;
        emp3.acc=msg.sender;

        //Copying from Another Struct
        Emp memory emp4 = emp1; // Copy values from emp1

       
        //pushing all the data into the array
        emps.push(emp1);
        emps.push(emp2);
        emps.push(emp3);
        emps.push(emp4);

        //pushing directly from here
        emps.push(Emp("aru",43,msg.sender));

        //updating the value of emp using storage keyword in the setter function
        Emp storage emp_temp=emp;
        emp_temp.name="abc";

        //simply updating value through the variable
        emp.name="xyz";

        //now updating the array of empolyee
        Emp storage emp_temp1=emps[1];

        emp_temp1.age=4;
        emp_temp1.name="we";

        //now deleting one constrain 
        delete emp_temp1.acc;
        //deleting all the fields of an empolyee
        delete emps[2];

        
    }
    //initilizing the value through passed parammetres 
    // function createEmp(string memory _name, uint _age, address _acc) public {
    //     Emp memory emp5= Emp(_name, _age, _acc);
    //     emps.push(emp5);
    // }

    //function updateValue()


}