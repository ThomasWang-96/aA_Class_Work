require_relative 'user'
require_relative 'database'
require_relative 'replies'
require_relative 'question'
require_relative 'question_follow'


class QuestionLike
    attr_accessor :user_id, :question_id
    def self.find_by_id(id)
        data = QuestionDataBase.instance.get_first_row(<<-SQL, id: id)
            SELECT question_like.*
            FROM question_like
            WHERE question_like.id = :id
        SQL
        QuestionLike.new(data)
    end

    def self.likers_for_question_id(id)
         data = QuestionDataBase.instance.execute(<<-SQL, id: id)
            SELECT u.*
            FROM users AS u
            JOIN question_like AS l
                ON l.user_id = u.id
            WHERE l.question_id = :id    
        SQL
  
        data.map { |ele| User.new(ele) }
    end


    def self.num_likes_for_question_id(id)
        data = QuestionDataBase.instance.get_first_row(<<-SQL, id: id)
            SELECT COUNT(l.user_id)
            FROM question_like AS l
            GROUP BY l.question_id 
                HAVING l.question_id = :id
        SQL

        data.values.first
    end

    def self.liked_questions_for_user_id(id)
        data = QuestionDataBase.instance.execute(<<-SQL, id: id)
            SELECT q.*
            FROM questions AS q
            JOIN question_like AS l
                ON q.id = l.question_id
            WHERE l.user_id = :id    
        SQL
  
        data.map { |ele| Question.new(ele) }
    end


    def self.most_liked_questions(n)
        data = QuestionDataBase.instance.execute(<<-SQL, n: n)
            SELECT q.*
            FROM questions AS q
            JOIN question_like AS l
                ON q.id = l.question_id
            GROUP BY l.question_id
            ORDER BY COUNT(l.user_id) DESC
            LIMIT :n
        SQL
        data.map { |ele| Question.new(ele) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end


