module.exports = cds.service.impl( async function(){
    const { EmployeeSet } = this.entities;

    //Validation for, when creating the employee data
    this.before('CREATE', EmployeeSet,(req)=>{
        var sal = parseInt(req.data.salaryAmount);
        var curr = req.data.Currency_code;

        if(sal > 50000){
            req.error(500,'Employee’s salary must be less than 50000 USD');
        }
    })

    this.before('CREATE', EmployeeSet,(req)=>{
        var sal = parseInt(req.data.salaryAmount);
        var curr = req.data.Currency_code;

        if((curr != 'USD')){
            req.error(500,'Employee’s salary must be less than 50000 USD');
        }
    })
    this.after('CREATE', EmployeeSet, (req) => {
        console.log('Create operation successful');
    });
    
    //Validation for updating the data
    this.before ('UPDATE', EmployeeSet, async (req) => { 
        if ('nameFirst' in req.data) {
            req.error("Operation not allowed");
       
        }
    })
    this.before ('UPDATE', EmployeeSet, async (req) => { 
        if ('loginName' in req.data) {
            req.error("Operation not allowed");
       
        }
    })
    this.after('UPDATE', EmployeeSet, (req) => {
        console.log('Update operation successful');
    });
})