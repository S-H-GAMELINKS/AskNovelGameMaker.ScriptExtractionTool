#AskScriptExtraction

#ファイル名
input_filename = nil
output_filename = nil

#抽出範囲
num_begin = 0
num_end = 0

while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

    print "スクリプトを抽出したいファイルを指定してください："
    input_filename = gets.strip
        
    print "抽出後のファイル名を入力してください:"
    output_filename = gets.strip

    print "抽出する範囲を指定してください(始点):"
    num_begin = gets.to_i

    print "抽出する範囲を指定してください(終点):"
    num_end = gets.to_i
end

text = open("#{input_filename}.asks", "r+:utf-8")
str = String.new
str = text.read

str.gsub!(/<!ask>無名/, "")

file = File.open("#{output_filename}.txt", "w")

str.each_line do |line|
    for i in num_begin..num_end do
        if line =~ /^"#{i}"/ then
            line.gsub!(/"\d+"|<!n>|<!askret>|,|"/, "")
            file.write line
        end
    end
end