# encoding: UTF-8
require  'json'

namespace :my_namespace do
  desc "insert_data_audit"
  task :insert_answers_ko => :environment do
    data = insert_data
    data.map{|info| 
    json_file  =  JSON.parse(info)  
    puts json_file.inspect 
    @answers = AuditAnswer.new(json_file["audit_answer"])
    @answers.inspect
    @answers.lang_code = "ko"
    @answers.save
  }

  end
end

def insert_data
  f = File.new('audit_answerko.txt')
    value_arr = []

    f.each do |line|
      value_arr << line
    end
    return value_arr
end
