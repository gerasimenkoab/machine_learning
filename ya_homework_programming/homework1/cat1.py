import re
import numpy as np
import scipy.spatial 
f=open('sentences.txt','r')
all_words_split = []
sentence_list = []
for line in f:
    sentence_list.append(line)
    #splitting and refining the sentence
    a_split = filter(lambda x: x!='',re.split('[^a-z]', line.lower()))
    # adding refined sentence to the sentence list
    #sentence_list.append(a_split)
    #adding words to word list
    for val in a_split:
        all_words_split.append(val)
f.close()
# creating dict from word the list
di = dict.fromkeys(all_words_split)
# enumerating words in the dict
count = 0
for key in di:
    di[key] = count
    count += 1
#print(di)
#print(sentence_list)
print(len(sentence_list),len(di))
wordMatrix = np.zeros((len(sentence_list),len(di)))
wordMatrix.shape
#for sentence in sentence_list:
for i in range(len(sentence_list)):
    for di_key in di:
        wordMatrix[i][di[di_key]] = len(re.findall(di_key,sentence_list[i]))
        
print(wordMatrix)
#calculating distances
dist_list=[]
for i in range(len(sentence_list)):
    dist_list.append(scipy.spatial.distance.cosine(wordMatrix[0,:],wordMatrix[i,:]))
print(dist_list)
for i in range(1,len(dist_list)):
    print(i)
    
print('\n Two min distance sentences numbers indeces:')
a = min(dist_list[1:])
n1 = dist_list.index(a)
print(n1)
dist_list.remove(a)
n2 = dist_list.index(min(dist_list[1:]))
print(n2)
f = open('submission-1.txt','w')
f.write(str(n1)+' ')
f.write(str(n2))
f.close()