require_relative 'user'
require_relative 'database'
require_relative 'replies'
require_relative 'question'
require_relative 'question_like'


class QuestionFollow
    attr_accessor :user_id, :question_id
    def self.most_followed_questions(n)
        # data = QuestionDataBase.instance.execute(<<-SQL, n: n)
        #     SELECT *
        #     FROM questions
        #     WHERE questions.id IN (SELECT f.question_id
        #     FROM question_follows AS f
        #     GROUP BY f.question_id
        #     ORDER BY COUNT(f.user_id) DESC)
        #     LIMIT :n
        # SQL

        data = QuestionDataBase.instance.execute(<<-SQL, n: n)
            SELECT q.*
            FROM questions AS q
            JOIN question_follows AS f
                ON q.id = f.question_id
            GROUP BY q.id
            ORDER BY COUNT(f.user_id) DESC
            LIMIT :n
        SQL
        
        data.map { |ele| Question.new(ele) }
    end

    def self.find_by_id(id)
        data = QuestionDataBase.instance.get_first_row(<<-SQL, id: id)
            SELECT question_follows.*
            FROM question_follows
            WHERE question_follows.id = :id
        SQL
        QuestionFollow.new(data)
    end

    def self.followers_for_question_id(id)
        data = QuestionDataBase.instance.execute(<<-SQL, id: id)
            SELECT users.*
            FROM users
            WHERE users.id = (
                SELECT question_follows.user_id
                FROM question_follows
                WHERE question_follows.question_id = :id)
        SQL
        data.map { |ele| User.new(ele) }
    end

    def followed_questions_for_user_id(id)
        data = QuestionDataBase.instance.execute(<<-SQL, id: id)
            SELECT questions.*
            FROM questions
            WHERE questions.id = (
                SELECT question_follows.question_id
                FROM question_follows 
                WHERE question_follows.user_id = :id)
        SQL
        data.map { |ele| Question.new(ele) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

end







