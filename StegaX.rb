=begin
    Bonjour aujourd'hui on se retrouve pour une vidéo speed coding sur la creation
    d'un script permettant de mettre un fichier dans un autre fichier et puis 
    de pouvoir decompresser cette image afin de decupeler les deux fichiers


    [ FUNCTION ]
        - Creation d'une fonction permettant dattacher les deux fichier
        - Creation d'une fonction permettant de detacher les fichiers

    [ SQUELETTE ]
        -Class Steganographie
        - Fonction attach
        - Fonction detache
        - ARGV
        - Lire les deux fichier (normal et to hide)
        - Creation d'une variable separateur pour split
        - et ensuite ouverture du fichier de sortis 
        - et boucle afin d'ajouter le contenue des deux fichier dans la sortie
        - 
=end
require 'colorize'


class Steganographie

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


if ARGV.length == 4 && ARGV[0] == "--attach" || ARGV[0] == "-a"
    stega = Steganographie.new(ARGV[1], ARGV[2], ARGV[3])
    begin
        puts stega.attach.green
        exit
    rescue Errno::ENOENT
        puts "File not exist".red
        exit
    end
else
    if ARGV[0] == "--attach"
        puts "Usage: #{__FILE__} [ OPTION ][--attach] < file_to_hide > < normal_file  > < Output_File >".red
    end
end


if ARGV.length == 3 && ARGV[0] == "--detach" || ARGV[0] == "-d"
    stag = Steganographie.new()
    begin
        stag.detach(ARGV[1], ARGV[2])
        puts "File detached to #{ARGV[2]}".green
    rescue Errno::ENOENT
        puts "File not exist".red
        exit
    end
else
    if ARGV[0] == "--detach"
        puts "Usage: #{__FILE__} [ OPTION ][--detach] < file_to_detach > < Output_File  >".red
        exit
    end
end