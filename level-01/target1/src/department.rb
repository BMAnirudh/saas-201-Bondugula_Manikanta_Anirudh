require_relative './section'

class Department
		attr_accessor :sections,:department_name,:deptname,:rollno

	def initialize(dept)
		#self.sections = ['A', 'B', 'C'].each { |sec| Section.new sec }
		self.sections=[]
		self.sections[0]=Section.new('A')
		self.sections[1]=Section.new('B')
		self.sections[2]=Section.new('C')
		self.deptname=dept
		self.department_name=dept[0..2]
    end

	def enroll(student_name)
		rrr=""
		c =0
		x =11
		if self.sections[0].student_name.length<10
			self.sections[0].student_name << student_name
			c =2
			self.sections[0].student_name=self.sections[0].student_name.sort
			
			x =self.sections[0].student_name.length
		    if (x)<=9
				rrr="0"+(x).to_s
			else
				rrr=(x).to_s
			end
			self.sections[0].roll << department_name+self.sections[0].sec+rrr
			for i in 1..self.sections[0].student_name.length
				if self.sections[0].student_name[i-1]==student_name
					rollno=self.sections[0].roll[i-1]
				end
            end

	    elsif self.sections[1].student_name.length<10
			self.sections[1].student_name << student_name
			c =2
			self.sections[1].student_name=self.sections[1].student_name.sort

			x =self.sections[1].student_name.length
		    if (x)<=9
				rrr="0"+(x).to_s
			else
				rrr=(x).to_s
			end
			self.sections[1].roll << department_name+self.sections[1].sec+rrr
			for i in 1..self.sections[1].student_name.length
				if self.sections[1].student_name[i-1]==student_name
					rollno=self.sections[1].roll[i-1]
				end
            end

        elsif self.sections[2].student_name.length<10
			self.sections[2].student_name << student_name
			c =2
			self.sections[2].student_name=self.sections[2].student_name.sort
			x =self.sections[2].student_name.length
		    if (x)<=9
				rrr="0"+(x).to_s
			else
				rrr=(x).to_s
			end
			self.sections[2].roll << department_name+self.sections[2].sec+rrr
			for i in 1..self.sections[2].student_name.length
				if self.sections[2].student_name[i-1]==student_name
					rollno=self.sections[2].roll[i-1]
				end
            end
        end
        if c==2
            return rollno
        else
        	rollno ="Error: Seats are not available in #{self.deptname}"
        end
    end
end