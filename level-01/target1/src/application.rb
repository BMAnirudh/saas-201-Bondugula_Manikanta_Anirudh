# require './department' # Include other files in the same directory
require_relative './department'
# Your application
class Application
   attr_accessor :departments,:x #x is the rollno

  def initialize()
    #self.departments = ['EEE', 'MECH', 'CSE', 'CIVIL'].each { |dept| Department.new dept }
    self.departments=[]    
    self.departments[0]=Department.new('EEE')
    self.departments[1]=Department.new ('MECH')
    self.departments[2]=Department.new ('CSE')
    self.departments[3]=Department.new ('CIVIL')
  end

  def enroll(student_name, student_department)
    # This is a sample implementation. you can write your own code
    # department = departments.detect { |dept| dept == student_department }
     #department.enroll student_name
    
    
    case student_department
    	when 'EEE'
    		self.x =self.departments[0].enroll student_name
        when 'MECH'
    		self.x =self.departments[1].enroll student_name
        when 'CSE'
    		self.x =self.departments[2].enroll student_name
        when 'CIVIL'
    		self.x =self.departments[3].enroll student_name

    end
    if self.x.length ==6
        y=self.x[3] #to get the section of the student
        str ="You have been enrolled to #{student_department}\nYou have been allotted section #{y}\nYour roll number is #{self.x}"
        return str
    else
        return self.x
    end

   
  end

  def change_dept(student_name, student_department)
    ## write some logic to frame the string below
    str="" #to return the details of the student
    x =0 #it is just a flag
    for i in 1..self.departments.length
    	for j in 1..self.departments[i-1].sections.length
    		for k in 1..self.departments[i-1].sections[j-1].student_name.length
    			if self.departments[i-1].sections[j-1].student_name[k-1]==student_name
    				x = 2

    				self.departments[i-1].sections[j-1].student_name.delete(student_name)
    				self.departments[i-1].sections[j-1].roll.pop
    				break
    			end
            end
            if x==2
            	break
            end
        end
        if x==2
        	break
        end
    end
    if x != 0
        return self.enroll(student_name,student_department)
    else
    	str="Error: The student didn't enroll with the given name"
    	return str
    end	    
    #{}"You have been enrolled to #{student_department}" \
    #{}"\nYou have been allotted section B" \
    #{}"\nYour roll number is #{self.x}"

  end

  def change_section(student_name, section)
    ## write some logic to frame the string below
    rrr="" #it's just a int rollno 
    rollno="" # it is a complete rollno
    str="" #the details of the student to be returned
    n =10 #it just tells us the index of the department in the department array of student 
    c =0 #just a flag to know whether the seats are available in that particular section
    x =0 #just to know the no of students in the particular section
    for i in 1..self.departments.length
    	for j in 1..self.departments[i-1].sections.length
    		for k in 1..self.departments[i-1].sections[j-1].student_name.length
    			if self.departments[i-1].sections[j-1].student_name[k-1]==student_name
    				self.departments[i-1].sections[j-1].student_name.delete(student_name)
    				self.departments[i-1].sections[j-1].roll.pop
    				n =(i-1)
    				
    				c =2
    				break
    			end
    		end
            if c==2
            	break
            end
        end
        if c==2
            break
        end
    end
    if c==2
    for l in 1..self.departments[n].sections.length
        if self.departments[n].sections[l-1].sec==section
            if self.departments[n].sections[l-1].student_name.length<10
            	c =4
                self.departments[n].sections[l-1].student_name << student_name
                self.departments[n].sections[l-1].student_name=self.departments[n].sections[l-1].student_name.sort
                x =self.departments[n].sections[l-1].student_name.length
                
                if x<=9
					rrr="0"+x.to_s
				else
					rrr=x.to_s
				end
				self.departments[n].sections[l-1].roll << self.departments[n].department_name+self.departments[n].sections[l-1].sec+rrr
                for i in 1..self.departments[n].sections[l-1].student_name.length
				if self.departments[n].sections[l-1].student_name[i-1]==student_name
					rollno=self.departments[n].sections[l-1].roll[i-1]
				end
                end
            else
            	c =0
            	break
            end
        end

    end
    end
    if c ==4
    	str ="You have been allotted section #{section}\nYour roll number is #{rollno}"
    else
    	str ="Error: Seats are not available in #{section} section"
    end
    return str
    #{}"You have been allotted section #{section}" \
    #{}"\nYour roll number is #{rollno}"
  end

  def department_view(student_dept)
    ## write some logic to frame the string below
    c =0 #just a flag
    str ="List of students:"
    for i in 1..self.departments.length
     	if self.departments[i-1].department_name==student_dept[0..2]
     		c =2
    	for j in 1..self.departments[i-1].sections.length
    		for k in 1..self.departments[i-1].sections[j-1].student_name.length
    			str =str+"\n"+self.departments[i-1].sections[j-1].student_name[k-1]+" - "+self.departments[i-1].sections[j-1].roll[k-1]
    		end
    	end
        end
        if c==2
        	break
        end
    end
    return str
    #{}"List of students:" \
    #{}"\nTom - MECB01"
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    c =0 #just a flag
    str ="List of students:"
    for i in 1..self.departments.length
     	if self.departments[i-1].department_name==student_dept[0..2]
    	for j in 1..self.departments[i-1].sections.length
    		if self.departments[i-1].sections[j-1].sec==section
    			c =2
    		    for k in 1..self.departments[i-1].sections[j-1].student_name.length
    		    	str =str+"\n"+self.departments[i-1].sections[j-1].student_name[k-1]+" - "+self.departments[i-1].sections[j-1].roll[k-1]
    		    end
    		end
    		if c==2
    			break
    		end
    	end
        end
    	if c==2
    		break
    	end
    end
    return str
    #{}"List of students:" \
    #{}"\nTom - MECB01"
  end

  def student_details(student_name)
    ## write some logic to frame the string below
    c =0 #just a flag
    str =""
    for i in 1..self.departments.length
    	for j in 1..self.departments[i-1].sections.length
    		for k in 1..self.departments[i-1].sections[j-1].student_name.length
    			if self.departments[i-1].sections[j-1].student_name[k-1]==student_name
    				c =2
    				str =student_name+" - "+self.departments[i-1].deptname+" - "+"Section "+self.departments[i-1].sections[j-1].sec+" - "+self.departments[i-1].sections[j-1].roll[k-1]
                end
            if c==2
            	break
            end
            end
        if c==2
        	break
        end
        end
    if c==2
    	break
    end
    end
    return str
    #{}"Tom - MECH - Section B - MECB01"
  end
end
