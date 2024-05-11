#Ce script R contiendra l'integralité du code R pour l'apprentissage en DataMining allant de
#l'introduction a R jusqu'a la classification supervisé avec Arbre de décision

#Introduction a R
#Dans cette partie nous ferons une introduction a R 
#Nous présenterons les notions de bases a l'utilisation de R notament :
#1-> Commandes de bases

getwd()#Afficher le dossier de travail
setwd("~/INFO L3 2023-2024/DataMining/script_R/")#Modifier le dossier de travail
dir()#Affichier le contenu du dossier de travail
help("savePlot")#Pour afficher l'aide d'une commande (ici c'est pour savePlot: Pour enregistrer le graphe courant dans un fichier) 
?data.frame#Seconde methode pour afficher l'aide (ici c'est pour data.frame)
save.image("Apprentissage R Data.RData")#Enregistrer une image de nos donnees de travail
savehistory(file = "Apprentissage R History.Rhistory")#Enregistrer l'historique d'une session

#2-> Les types primitifs de R

#Comme dans tous les langages de programmation retrouve des types de base
#Sur R les types primitifs sont :
#-> Numeric
x<-12 
mode(x)#Pour affichier le type d'elements dans une variable

#-> Character
x<-"Bonjour le monde"
mode(x)

#-> Logical
#L'équivqlent de boolean en Python
x<-TRUE
mode(x)

#-> Complex
x<-1+3i
mode(x)

#-> Non defini (NULL)
x<-NULL
mode(x)

#3-> Les varianles

#Creation
#Sur R on ne defini pas le type des variables
x<-10#En utilisant la fleche entrante
y=7#En utilisant l'égalité
x+y-> z#En utilisant la fleche sortante
X=11
X==x#R est sensible a la casse
ls()#Lister les variables creees
rm(z)#Supprimer une variable dans R

#Convertion a un type
#En regle generale on fait as>.Type(variable) pour convertir au type "Type"
#exemple :
as.character(x)#Convertir en character

#Verifier le type d'une variable
#En regle generale on fait as>.Type(variable) pour convertir au type "Type"
is.double(y)#Tester si y est double

#Les constantes de R
#NA : Donnees manquantes
#NULL : Objet vide 
#inf (-inf) : Infini
#NaN : Not A Number

#4-> Les operateurs sur R

#Sur R on a plusieurs operateurs
#En plus des operateurs arithmetiques (+,-,*,/) et de comparaison (>,<,>=,<=,==,!=)
#On a aussi :
#! : Non logiaue
!TRUE
#& : Et logique
(y<=10)&((x-3)==8)
#| : Ou logique
(y<=10)|((x-3)==8)
#xor(x,y) : Ou exclusif
xor((y<=10),((x-3)==8))
#^ : Puissance
x^2
#%%: Modulo
x%%y
#%/% : Division entiere
x%/%y

x==(x%/%y)*y+(x%%y)

#5-> Structures de donnees

#Les structures de donnees de R les plus communement utilisees sont:

#->Les Vecteurs

#Creation :
v=c(1,2,3,4)#En utilisant la fonction c()
mode(v)#Retourne le type des elements contenues dans R
v1=1:10#Creation d'un vecteur par une séquence d'elements
rep(3,10)#Retourne un vecteur contenant 10 valeurs de 3
seq(1,10,by=2)#Retoune un vecteur d'éléments allant de 1 à 10 (peu être exclus) avec un pas de 2
seq(1,10, length=100)#Retoune un vecteur de 100 éléments allant de 1 à 10 linéairement espacé
letters#Les lettres de l'alphabeth en minuscule
LETTERS#Les lettres de l'alphabeth en majuscule
print(v1)

#Manipulartion :
v[1]
v[1]=10
length(v)#Afficher la taille de v
v=c(v,NA)
is.na(v)#Teste si v contient des valeurs manquantes
is.vector(v)
rev(v)#Renverser l'ordre des elements d'un vecteur
names(v)#Afficher le nom de chaque element contenu dans v
names(v)=paste("a",1:length(v), sep="")#Modifier les noms des elements d'un vecteur
mean(v1)#Moyenne
var(v1)#Variance
median(v1)#Mediane
sample(v1,length(v1)/2)#Tirage aleatoire d'un échantillon de v1 sans remise
v1[c(1,3,5,4)]#Sous vecteurs : Contenant les elements des positions 1,3,5,4 dans cet ordre
v1[c(-4,-1)]#Sous vecteurs :  Contenant tous les elements de v1 sauf ceux des positions 1 et 4
v1[v1%%2==0]#Sous vecteurs :  Contenant tous les elements de v1 respectant la condition v1%%2==0
sort(v1)#Trier les elements de v1

#-> Facteurs

#C'est pour creer des chaines de caractères qui sont des valeurs numériques en interne
f=c("a","b","a","a","b")
ffactor=factor(f)
ffactor
mode(ffactor)
mode(f)#Retourner les levels d'un facteur

#-> Les matrices

#Creation des matrices
M1=matrix(c(2,3,1,4,5,4,1,2,4),nrow = 3, byrow = TRUE)#Remlissage par ligne 
M1
M2=matrix(c(2,3,1,4,5,4,1,2,4),nrow = 3, byrow = FALSE)#Remlissage par colonne
M2

#Manipulation
dim(M1)#Dimension de M1
rbind(M1,M2)#Combiner deux matrices ou deux vecteurs ou un vecteur une matrice le long des lignes
cbind(M1,M2)#Combiner deux matrices ou deux vecteurs ou un vecteur une matrice le long des colonnes
t(M1)#Transposé de M1
M1%*%M2#Produit matriciel de deux matrices 
M1*M2#Produit valeur par valeur de deux matrices 
solve(M1)#Retourne l'inverse de M1
diag(M1)#Retorune la diagonale de M1
eigen(M1)#retourne les valeurs propres de M1 ainsi que les vecteurs propres

#-> Les listes
my_list<- list(age=c(12,15,17,22),sexe=c("F","M","M","F"),note=c(2.5,3,2.02,3.55))#Creer une liste
#Visualiser une liste
print(my_list)
View(my_list)
my_list$age#Afficher les valeurs d'un attribut d'une liste
names(my_list)#Afficher les attributs d'une liste
vect=c(1,2,3,4)
p=as.list(vect)#Convertir un vecteur en une liste : Chaque element du vecteur sera considere comme appartenant a un attribut
names(p)#Va retourner null car aucun nom d'attribut n'est défini
p[1]#Lorsqu'une liste n'a pas d'attributs défini, on accède aux elements d'un attribut avec []

#-> Les data frames
my_df=data.frame(my_list)#On peut creer un data.frame a partir d'une liste
View(my_df)
my_df1=data.frame(age=c(12,15,17,22),sexe=c("F","M","M","F"),note=c(2.5,3,2.02,3.55))#On peut creer un data.frame a partir d'une liste de vecteur
View(my_df1)
my_df2=data.frame(M1)#On peut creer un data.frame a partir d'une matrice
View(my_df2)
names(my_df2)=c("x","y","z")#Modifier les noms des colonnes d'un data.frame
View(my_df2)
my_df$age#Pour acceder a une colonne du data.frame
my_df[,"age"]#Pour acceder a une colonne du data.frame on peut aussi utiliser ceci
my_df[1]#Pour acceder a une colonne du data.frame on peut aussi utiliser les numeros des colonnes
my_df$sexe[my_df$sexe=="F"]#filtrer une colonne du data.frame suivant une condition
my_df[my_df$sexe=="F",]#filtrer un data.frame suivant une condition
names(my_df1)#Afficher les noms des colonnes du data.frame


#6-> Les structures conditionnelles

#Les structures conditionnelles dans R sont sous la forme :
#if(condition){
#Liste d'instructions
#}
#On peut aussi avoir un else:
#if(condition){
#Liste d'instructions
#}
#else{
#Liste d'instructions
#}

#7-> Les structures iteratives

#Boucle for
#for(var in vecteur){
#Liste d'instructions
#}


#Boucle while
#while(condition){
#Liste d'instructions
#}


#8-> Les fonctions
#En R les fonctions s'écrivent sous la forme :
#nom_fonction = function(<liste de parametres>){
#Liste d'instructions
#return(expression)
#}

#Exemples
produit=function(vect){
  p=1
  if(mode(vect)!="numeric" | sum(is.na(vect)>=1)){
    print("Le vecteur doit contenir des valeurs numériques")
    return(NULL)
  }
  else{
    for (i in vect) {
      p=p*i
    }
    return(p)
  }
}

produit(v1)

moy=function(vect){
  m=0
  if(mode(vect)!="numeric" | sum(is.na(vect)>=1)){
    print("Le vecteur doit contenir des valeurs numériques")
    return(NULL)
  }
  else{
    i=1
    while (i<=length(vect)) {
      m=m+vect[i]
      i=i+1
    }
    m=m/length(vect)
    return(m)
  }
}

moy(v1)

#Pretratement de donnees 
#1-> Lecture des donnees depuis un fichier csv (comma separate values)
df=read.table("../TP/Obesity/ObesityDataSet.csv",header = TRUE,sep = ",",dec = ".")
df_col=names(df)
#Optionel
num=c()
for(name in df_col){
  if(mode(df[,name])=="numeric"){
    num=c(num, name)
  }
}
num
View(df)

#2-> Resume des donnees 
str(df)
summary(df)
dim(df)
print(df_col)

#3-> Identification des valeurs manquantes 

col_NA=colSums(is.na(df))
col_NA=col_NA[col_NA>=1]
col_NA=names(col_NA)

row_NA=rowSums(is.na(df))
row_NA=col_NA[row_NA>=1]
row_NA=names(row_NA)

#4-> Identification des valeurs aberantes/outliers

#Outlier individuels
for(n in num){
  plot(df[,n],xlab = "Individus",ylab = n)
  title(paste("Plot of", n))
  q1=quantile(df[,n],probs = 0.25)
  q3=quantile(df[,n],probs = 0.25)
  eiq=q3-q1
  abline(h=(q1-1.5*eiq),col="red",lty=4)
  abline(h=(q3+1.5*eiq),col="blue",lty=4)
}

for(n in num){
  boxplot(df[,n],ylab = n)
  title(paste("Plot of", n))
}

#Outlier de l'ensemble de données
D2=mahalanobis(df[,num],colMeans(df[,num]),cov(df[,num]))
D2 <- mahalanobis(x, colMeans(x), Sx)
plot(density(D2, bw = 0.5),
     main="Squared Mahalanobis distances") ; rug(D2)

#5-> Traitement des valeurs manquantes
#Pas de valeurs manquantes

#6-> Normalisation

#Z-score
for(n in num){
  df[,n]=scale(df[,n])
}


#Min max
for(n in num){
  min_val=min(df[,n])
  max_val=max(df[,n])
  df[,n]=scale(df[,n],center = min_val, scale = (max_val-min_val))
}

#7-> Discretisation

df$TrancheAge=cut(df$Age,seq(round(min(df$Age))-1,round(max(df$Age))+5,by=5))
table(df$TrancheAge)

#Matrice de distance entre les points
dist(df[1:10,num],upper = FALSE)

