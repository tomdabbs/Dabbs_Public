from pulp import *
import datetime
import pandas as pd

inputs = r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Public\Python\Optimization\Inputs.xlsx'
variable=r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Public\Python\Optimization\variable.txt'
problem=r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Public\Python\Optimization\problem.txt'
solution = r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Public\Python\Optimization\output.txt'

#Facility Information
facility=pd.read_excel(inputs, sheet_name='Constraints')
facility=pd.DataFrame(facility,columns=['Facility','Product','MaxCycles','MinCycles'])
facility_l=[]
[facility_l.append(x) for x in facility['Facility'] if x not in facility_l]

#Store Information
stores=pd.read_excel(inputs, sheet_name='Demand')
stores=pd.DataFrame(stores,columns=['Store','Product','Demand'])
stores_l=[]
[stores_l.append(x) for x in stores['Store'] if x not in stores_l]

#Product Information
product_l=['Fruit','Vegetable']

#Costs Information
costs=pd.read_excel(inputs, sheet_name='Costs')
costs=pd.DataFrame(costs,columns=['Facility','Store','Product','TotalCost'])
costs=costs.set_index(['Facility','Store','Product'])['TotalCost'].to_dict()

#Constraint Information - Dictionary
DC_max=facility.set_index(['Facility','Product'])['MaxCycles'].to_dict()
DC_min=facility.set_index(['Facility','Product'])['MinCycles'].to_dict()
demand=stores.set_index(['Store','Product'])['Demand'].to_dict()

#####_____PULP_OPTIMIZATION_____####

#State LP Problem
prob = LpProblem("DToptimization",LpMinimize)

#Variables
vars = LpVariable.dict('flow',(facility_l,stores_l,product_l),0,None,LpContinuous) 

#Objective Function
print('Construct_OBjective_Function')
print("current time:-", datetime.datetime.now())
prob += lpSum([vars[f]*costs[f] for f in costs])

#Constraints
for j in stores_l:
    for k in product_l:
        prob += lpSum(vars[i,j,k] for i in facility_l)==demand[j,k]


for i in facility_l:
    #for j in stores_l:
        for k in product_l:
            prob += lpSum(vars[i,j,k] for j in stores_l)<=DC_max[i,k]

#Solution
prob.solve() # This solves the linear problem
prob.writeLP(solution) # The status of the solution is printed to the screen

#Outputs
for v2 in prob.variables():
    v2_output = (v2.name, v2.varValue)
    print(v2_output)
print("Total Cost = ", value(prob.objective))

print('Finished')
print("current time:-", datetime.datetime.now())