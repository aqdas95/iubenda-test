require_relative './tandcgenerator.rb'

class Main

    def execute 
        begin
            dataset_filename = getFilename("dataset")
            template_filename = getFilename("template")
            @TCG = TAndCGenerator.new
            File.write("transformed_template.txt", @TCG.generate(dataset_filename,template_filename))
            puts(@TCG.generate("dataset.json","template.txt"))
        rescue Exception => e
            puts "#{e.message} (Check Error Logs for further details)"
            File.write("error_logs.txt", "#{Time.now} Error: #{e.message}\n",mode: "a")
        end
    end  

    private

    def getFilename name
        puts "Enter #{name} file name: "
        filename = gets.chomp
        case name
        when "dataset"
            return filename.include?(".json")? filename : filename+".json"
        when "template"
            return filename.include?(".txt")? filename : filename+".txt"
        end
    end
end

start = Main.new
start.execute