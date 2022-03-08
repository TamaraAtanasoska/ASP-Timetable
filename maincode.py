from IPython.core.magic import register_line_magic
import clingo
from clingo.control import Control

from IPython.display import display
import ipywidgets as widgets

class main:
    def __init__(self):
        self.sem = 0

        #We should think if we are offering a list of course beforehand to the user
        #Should they first input a semester, for which we can have boxes to tick for the available courses?
        #It would be easier to translate those courses into suitable code than parse strings
        self.course = widgets.Textarea(
            description='Enter course:',
            placeholder='Available course codes: asp, anlp, ida',
            ensure_option=True,
            disabled=False
        )
        self.btn_save_course = widgets.Button(
            description='Save course',
            disabled=False,
            button_style='success'
        )
        #This implies 6 semesters as default, we should change it to 8 probably
        self.semester = widgets.BoundedIntText(
            description='Semester:', 
            min=2, 
            max=6
        )

        self.btn_save_semester = widgets.Button(
            description='Save semester',
            disabled=False,
            button_style='success'
        )

        self.output = widgets.Output()


        def update(fact):
            result = fact+";"#+result
            with output:
                display(result)

        #this is code to style the widgets
        ui_top = widgets.VBox([widgets.Label(value='Course',style=dict(font_weight='bold')), self.course, self.btn_save_course, self.output])

        ui_btm = widgets.VBox([widgets.Label(value='Semester',style=dict(font_weight='bold')), self.semester, self.btn_save_semester])

        #to order the widgets
        self.ui = widgets.VBox([ui_top,ui_btm])

        #saving into the user facts file (we need to make decisions about this)
        #we need to differentiate between courses we must exclude or courses we must include (passed vs desired)
        #the encoding file then works with the facts from this file like we had the projects with the instances
        def save_course(bttn):
            output_file = open('user_course.lp', 'a') 
            output_file.write('course('+self.course.value+').') 
            output_file.close() 

        def save_semester(bttn):
            self.sem = self.semester.value

        #widget events to save
        self.btn_save_course.on_click(save_course)
        self.btn_save_semester.on_click(save_semester)
        
        
        
#Additional ideas: have a button that says "remind me of the general plan recommendations"
#which displays the plan as given in the study regulations, hardcoded (done in python because why would we bother)