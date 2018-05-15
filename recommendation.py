import psycopg2
import nltk
from nltk.stem import PorterStemmer
from nltk.corpus import stopwords
import math
import numpy as np
from scipy import spatial

conn = psycopg2.connect( host="localhost", user="postgres", password="0000", dbname="rec_sys_db" )
cursor = conn.cursor()

cursor.execute(" SELECT * FROM products ")
rows = cursor.fetchall()

stemmer = PorterStemmer()
nb_word = 0
total_word = []
all_set_word = dict()
nb_product = 0
idf = {}


matrice_bin=np.zeros((0,0))
matrice_freq=np.zeros((0, 0))

def top3 (v1,v2):
    return sorted(zip(v1,v2.keys()), reverse=True)[:4]


def similarite_cosinus(idPdt1,idPdt2,type):
    if type == 1:
        return ( 1 - spatial.distance.cosine(matrice_bin[idPdt1], matrice_bin[idPdt2]))
    else:
        return( 1 - spatial.distance.cosine(matrice_freq[idPdt1], matrice_freq[idPdt2]))


for row in rows:
    id_product = row[0]
    description = row[2]
    #print('Description:{}'.format(row[2]))
    words = nltk.wordpunct_tokenize(description)
    #print(words)
    #print("------------------------------------------------------------------")

    english_stopwords = list(stopwords.words())
    english_stopwords.extend([".",",",";","#","!","?","...","..","'","-","_","(",")"])
    stemmed_words = words[:]
    for i in range(len(stemmed_words)):
        stemmed_words[i] = stemmer.stem(stemmed_words[i])
        #print(stemmed_words)
        #print('------------------------------',i,'-----------------------------------')
    all_words = [mot for mot in stemmed_words if mot.lower() not in english_stopwords]
    key_words = {mot for mot in stemmed_words if mot.lower() not in english_stopwords}
    total_word.extend([* key_words])
    nb_word+=len(key_words)
    all_set_word[id_product]=key_words
    nb_product+=1


matrice_bin = np.zeros((nb_product,nb_word))
matrice_freq = np.zeros((nb_product,nb_word))

word_list = list(all_set_word.values())

#print(total_word)

for mots in all_set_word.values():
    for motCh in mots:
        freq=0
        #print("Le mot est ", motCh)
        for i in range(nb_product):
            if (motCh in word_list[i]):
                freq+=1
        idf[motCh]=math.log10(nb_product/freq)
        #print("idf[",motCh,"] = ", idf[motCh])


product_key_id = {}
i=0
for key in all_set_word.keys():
    j=0
    product_key_id[i]=key
    for mot_matrice in total_word:
        if (mot_matrice in all_set_word[key]):
            matrice_bin[i][j]=1
            matrice_freq[i][j]+=1
        j+=1
    i+=1

matrice_similarite_bin=np.zeros((nb_product,nb_product))
matrice_similarite_freq=np.zeros((nb_product,nb_product))


for k in range(nb_product):
    for z in range(nb_product):
        matrice_similarite_bin[k][z]=similarite_cosinus(k,z,1)
        matrice_similarite_freq[k][z]=similarite_cosinus(k,z,0)

print('--------------------------matrice similarité bin-----------------------------')
print(matrice_similarite_bin)

print('--------------------------matrice similarité freq------------------------')
print(matrice_similarite_freq)

print('--------------------------all set word--------------------------')
print(all_set_word)



"""x = np.array(matrice_similarite_bin)
x2=x.flatten()
x2[::-1].sort()
x3=np.delete(x2,[i for i in range(20)]) 
print('--------------ordred matrice similarité----------------')
print(x3)
similar_products=x3[0:6:2]
'''print('--------------similar_products----------------')
print(similar_products)'''
index = {}
for i in range(20):
    for j in range(20):
        for k in range(6):
            if (x[i][j] == x3[k]):
                index[i]=j"""
#print('--------------index----------------')
#print(index.keys())

#similar_products_id=[]

'''for key in index.keys():
    similar_products_id.append(product_key_id[key])'''

'''print('--------------similar_products_id----------------')
print(similar_products_id)'''


for i in range(nb_product):
    p=list(top3(matrice_similarite_freq[i],all_set_word)[0]) 
    #print(p)
    ltop1=list(top3(matrice_similarite_freq[i],all_set_word)[1])
    #print(ltop1)
    ltop2=list(top3(matrice_similarite_freq[i],all_set_word)[2])
    ltop3=list(top3(matrice_similarite_freq[i],all_set_word)[3])
    prod=p[1]
    tp1=ltop1[1]
    tp2=ltop2[1]
    tp3=ltop3[1]
    #requette
    cursor.execute("""UPDATE products SET top_1=%s,top_2=%s,top_3=%s where id=%s """,(tp1,tp2,tp3,prod))
    conn.commit()  

    
    
'''for key in similar_products_id:
    query_string= """ SELECT * FROM products WHERE products.id='{key}' """
    select_query = query_string.format(key=key)
    cursor.execute(select_query)
    product = cursor.fetchone()
    query_string = """ INSERT INTO similar_products VALUES('{id}','{name}','{description}','{category}','{price}','{image}'); """
    insert_query = query_string.format(id=product[0], name=product[1], description=product[2], category=product[3], price=product[4], image=product[5])
    cursor.execute(insert_query)
    conn.commit()'''




conn.close()




        

'''print('----------------all words----------------')
print(all_words)
print('----------------key_words----------------')
print(key_words)
print('-----------------all_set_words---------------')
print(all_set_word)
print('-----------------total_words---------------')
print(total_word)
print('-----------------word_list---------------')
print(word_list)
print('-----------------nb_product---------------')
print(nb_product)
print('-----------------nb_word---------------')
print(nb_word)'''





