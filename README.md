# Project 6
### Ruby on Rails Project: Collaborate
Collaborate is a peer evaluation submission web application that allows professors to create a centralized location in which students can submit peer evaluations pertaining to their group projects.

### Roles
* Overall Project Manager: Duytan Tran
* Coding Manager: Sean Michaels
* Testing Manager: Caroline Wheeler
* Documentation: Reema Gupta

### Contributions
* Implemented professor, peer evaluation, project models; implemented course, project, enrolled in, and accounts controller with associated views; handled site-wide css styling; implemented Devise registration with student or professor assignment: Duytan Tran
* Implemented student, group, course project model; implemented adding groups to a course, implemented groups, associated and apart of controller, edited courses and projects controller- Reema Gupta
* Implemented the TA(removed), apart_of, and taught_by models; implemented the peer_evaluation controller; implemented the peer evaluation form view and a view to index all peer evaluations - Caroline Wheeler
* Implemented the give, associated, assistedby, apart_of models; implemented the pages controller,and edited the peer_evaluations controller; implemented the student_home, and edited the index for the peer_evaluations index. Helped with implementing devise into the project.  - Sean Michaels
### Walkthrough - Student
1. Upon entering the web application you are met with a login screen, by pressing the sign up button you can register yourself as a student
1. As a student you will be met with a student portal page upon logging in that communicates the current courses you have been enrolled in on the site and the projects and groups you are assigned to
1. You are given are a link next to each project that will send you the peer evaluation page
1. On the peer evaluation page you will see a list of all of your group members for that particular course project
1. Next to each group member you are given a link to give a peer evaluation
1. Upon pressing the link you are given a form in which you can fill out your feelings about that particular group-mate for that particular course project
1. This peer evaluation is then stored in the database and shown to the professor on his side

### Walkthrough - Professor
1. Upon entering the web application you are met with a login screen, by pressing the sign up button you can register yourself as a professor
1. As a professor you will be met with a courses page that will show all of your current registered courses on the site
1. You can register new courses via the link below the courses table, which will bring you to a form to register the course
1. Next to each course you register will have an enrollment, projects, and groups link
  
   - Pressing Enrollment will bring you to a page in which you can assign students that are registered on the site to the course
   - Pressing Projects will bring you to a page in which you can register projects to the course
   - Pressing Groups will bring you to a page in which you can register groups to the course
      - For each group created you can assign to it existing students and existing projects
1. Professors can view any peer evaluations submitted by their students via viewing the group then the project assigned to that group

### Setting Up the Collaborate Web Application
1. Traverse into the Collaborate folder housed within the Project-6-Quaranteam directory you downloaded via terminal command: 

    >cd file/path/to/Collaborate

1. Run bundle install via terminal command:

    >bundle install

1. Generate the Collaborate database via terminal command:

    >rails db:migrate

1. Run the rails server via terminal command:

    >rails server
    
1. To get to the Collaborate Web Application open fire fox and enter the URL:

    >http://localhost:3000/
    
### Running Model Testing
1. Traverse into the Collaborate folder housed within the Project-6-Quaranteam directory you downloaded via terminal command: 

    >cd file/path/to/Collaborate
    
2. Run all of the model tests via terminal command:

    >bundle exec rake

### Systems Testing
1. Systems testing text files can be found in the folder:

    >../Project-6-Quaranteam/Collaborate/test/system/
