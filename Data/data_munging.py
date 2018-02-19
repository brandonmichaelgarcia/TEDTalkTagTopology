TEDdata = open('TED_Tags.txt', 'r+')

dictionary_list = list()
for row in TEDdata:
    row = row[:-1] #remove trailing newline character
    words = row.split(', ')
    dictionary_list = dictionary_list + words

dictionary_list = list(set(dictionary_list))
dictionary_list.sort()

TEDcsv = open('TED_tagMatrix.csv', 'w')
first_line = ','.join(dictionary_list)
first_line += '\n'
TEDcsv.write(first_line)

TEDdata.seek(0)
for row in TEDdata:
    row = row[:-1] #remove trailing newline character
    row_words = row.split(', ')
    
    word_vector = list()
    for tag in dictionary_list:
        word_vector.append('1' if (tag in row_words) else '0')
    
    line = ','.join(word_vector)
    line += '\n'
    TEDcsv.write(line)


TEDcsv.close()
TEDdata.close()
