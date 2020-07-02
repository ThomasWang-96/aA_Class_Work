require_relative 'database'
require_relative 'replies'
require_relative 'question_follow'
require_relative 'question'


class User
    attr_accessor :fname, :lname
    def self.find_by_id(id)
        data = QuestionDataBase.instance.get_first_row(<<-SQL, id: id)
            SELECT users.*
            FROM users
            WHERE users.id = :id
        SQL
        User.new(data)
    end

    def self.find_by_name(fname, lname)
        data = QuestionDataBase.instance.get_first_row(<<-SQL, fname: fname, lname: lname)
            SELECT users.*
            FROM users
            WHERE users.fname = :fname AND users.lname = :lname
        SQL
        User.new(data)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname'] 
    end


    def authored_questions
        Question.find_by_author_id(@id)
    end

    def authored_replies
        Reply.find_by_user_id(@id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(@id)
    end

    def liked_questions
        QuestionLike.liked_questions_for_user_id(@id)
    end

    def average_karma
        data = QuestionDataBase.instance.get_first_row(<<-SQL, id: @id)
          SELECT 
             COUNT(ql.user_id NOT NULL) / CAST(COUNT(DISTINCT q.id)AS FLOAT)
            FROM questions AS q
            LEFT OUTER JOIN question_like AS ql 
                ON q.id = ql.question_id
            WHERE q.author_id = :id      
        
        SQL

        data.values.first
    end
end







    # SELECT COUNT (users.id) / COUNT ()
    #       FROM question
    #       LEFT JOIN question_likes








            


