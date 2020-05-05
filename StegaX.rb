

class StegaX

    @@file_to_hide = nil
    @@norm_file = nil
    @@output = nil
    @@separator = "======================="
    @@content_output_file = nil


    def initialize(file_to_hide = nil, file_norm = nil, output = nil)
        @@file_to_hide = file_to_hide
        @@norm_file = file_norm
        @@output = output
    end

    def issetFile(files)
        return File.file?(files) ? true : false
    end

    def attach
        if !issetFile(@@file_to_hide) && !issetFile(@@norm_file)
            return "File not exist"
        end
        file_to_hide_read = File.read @@file_to_hide
        file_nor_read = File.read @@norm_file
        

        @@content_output_file = [file_nor_read, @@separator, file_to_hide_read]
        
        File.open(@@output, "wb") do |out|
            @@content_output_file.each do |f|
                out.puts f
            end
        end

        return "File attached success to #{@@output}"
        
    end


    def detach(file_to_detach, output)
        if !issetFile(file_to_detach)
            return "File not exist"
        end 

        recov_file = File.read(file_to_detach).force_encoding("BINARY").split(@@separator).last

        File.open(output, 'wb') do |f|
            f.puts recov_file
        end
    end

end


