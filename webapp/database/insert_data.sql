use institutionmanagement;

-- Thêm dữ liệu cho các khóa học
INSERT INTO Course (course_name, description, status) VALUES
    ('Java Programming', 'Introduction to Java programming language', 1),
    ('Web Development', 'Fundamentals of web development', 1),
    ('Database Management', 'Introduction to database management systems', 1),
    ('Data Science', 'Overview of data science and analytics', 1),
    ('Machine Learning', 'Introduction to machine learning algorithms', 1),
    ('Artificial Intelligence', 'Foundations of artificial intelligence', 1),
    ('Cybersecurity', 'Essentials of cybersecurity and network security', 1),
    ('Mobile App Development', 'Developing mobile applications for iOS and Android', 1),
    ('Cloud Computing', 'Overview of cloud computing technologies', 1),
    ('Software Engineering', 'Principles of software engineering', 1);

-- Lấy ID của các khóa học vừa thêm
SET @courseIdStart = LAST_INSERT_ID();

-- Thêm dữ liệu cho các bài học, mỗi bài học thuộc một khóa học
INSERT INTO Lesson (course_id, detail) VALUES
    (@courseIdStart, 'Introduction to Java programming language'),
    (@courseIdStart, 'Variables, data types, and operators'),
    (@courseIdStart, 'Control flow and decision making'),
    (@courseIdStart, 'Object-oriented programming concepts'),
    (@courseIdStart, 'Exception handling and file I/O'),

    (@courseIdStart + 1, 'HTML and CSS basics'),
    (@courseIdStart + 1, 'Responsive web design principles'),
    (@courseIdStart + 1, 'Client-side scripting with JavaScript'),
    (@courseIdStart + 1, 'Server-side scripting with Node.js'),
    (@courseIdStart + 1, 'Database integration and web frameworks'),

    -- Bài học cho khóa học 3 (Database Management)
    (@courseIdStart + 2, 'Introduction to database management systems'),
    (@courseIdStart + 2, 'Relational database concepts'),
    (@courseIdStart + 2, 'SQL basics and querying'),
    (@courseIdStart + 2, 'Database design and normalization'),
    (@courseIdStart + 2, 'Transaction management and ACID properties'),

    -- Bài học cho khóa học 4 (Data Science)
    (@courseIdStart + 3, 'Overview of data science and analytics'),
    (@courseIdStart + 3, 'Data preprocessing and cleaning'),
    (@courseIdStart + 3, 'Exploratory data analysis'),
    (@courseIdStart + 3, 'Statistical modeling and inference'),
    (@courseIdStart + 3, 'Machine learning algorithms'),
    
    (@courseIdStart + 4, 'Introduction to machine learning algorithms'),
    (@courseIdStart + 4, 'Supervised learning: regression and classification'),
    (@courseIdStart + 4, 'Unsupervised learning: clustering and dimensionality reduction'),
    (@courseIdStart + 4, 'Evaluation metrics and model selection'),
    (@courseIdStart + 4, 'Deep learning and neural networks'),

    -- Bài học cho khóa học 6 (Artificial Intelligence)
    (@courseIdStart + 5, 'Foundations of artificial intelligence'),
    (@courseIdStart + 5, 'Search algorithms and optimization'),
    (@courseIdStart + 5, 'Knowledge representation and reasoning'),
    (@courseIdStart + 5, 'Machine learning techniques in AI'),
    (@courseIdStart + 5, 'Natural language processing and computer vision'),

    -- Bài học cho khóa học 7 (Cybersecurity)
    (@courseIdStart + 6, 'Essentials of cybersecurity and network security'),
    (@courseIdStart + 6, 'Threats and vulnerabilities analysis'),
    (@courseIdStart + 6, 'Secure coding practices and software security'),
    (@courseIdStart + 6, 'Incident response and digital forensics'),
    (@courseIdStart + 6, 'Security policies and compliance'),

    -- Bài học cho khóa học 8 (Mobile App Development)
    (@courseIdStart + 7, 'Developing mobile applications for iOS and Android'),
    (@courseIdStart + 7, 'User interface design and user experience'),
    (@courseIdStart + 7, 'Mobile app architecture and design patterns'),
    (@courseIdStart + 7, 'Mobile app testing and debugging'),
    (@courseIdStart + 7, 'Publishing and distribution on app stores'),

    -- Bài học cho khóa học 9 (Cloud Computing)
    (@courseIdStart + 8, 'Overview of cloud computing technologies'),
    (@courseIdStart + 8, 'Cloud service models: IaaS, PaaS, SaaS'),
    (@courseIdStart + 8, 'Cloud deployment models: public, private, hybrid'),
    (@courseIdStart + 8, 'Cloud security and data protection'),
    (@courseIdStart + 8, 'Serverless computing and microservices architecture'),

    -- Bài học cho khóa học 10 (Software Engineering)
    (@courseIdStart + 9, 'Principles of software engineering'),
    (@courseIdStart + 9, 'Software development life cycle (SDLC)'),
    (@courseIdStart + 9, 'Agile methodologies and Scrum framework'),
    (@courseIdStart + 9, 'Version control systems and Git workflow'),
    (@courseIdStart + 9, 'Software quality assurance and testing');

