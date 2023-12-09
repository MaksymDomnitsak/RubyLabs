require 'zip'

class Zipper 
    def self.create_archive(directory_path, temp_path, file_ext = 'rb')
        #Видалення файла в temp_path, якщо він існує
        File.delete(temp_path) if File.exist?(temp_path)

        if(file_ext === '')
            file_ext = 'rb'
        end

        #Зчитування назв всіх файлів у заданому шляху
        file_names = Dir.entries(directory_path)
                .reject { |name| name == '.' || name == '..' || File.directory?(File.join(directory_path, name)) }
                .select { |name| File.extname(name) == ".#{file_ext}" }

        #Створення архіву та запис файлів (з відповідними іменами)
        Zip::File.open(temp_path, Zip::File::CREATE) do |zipfile|
            file_names.each do |filename|
                zipfile.add(filename, File.join(directory_path, filename))
            end
        end

        temp_path
    end
end
