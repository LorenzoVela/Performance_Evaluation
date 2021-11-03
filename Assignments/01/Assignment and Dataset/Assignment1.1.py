import csv
#import matplotlib.pyplot as plt

#bug nell'input e non prendeva la prima riga per questo ho dovuto trattarla specialmente inserendo a mano l'input. (non funzionava neanche con il cast)

arrivals = []  #lista che contiene tutti gli istanti dei momenti di arrivo
departures = []  #lista che contiene tutti gli istanti dei momenti di partenza
num_processes = 0  #contatore per il numero di processi (==al numero di righe del file csv)
response_time = 0  
a = 0  #flag per gestire l'input della prima riga
b = 0
responses_values = [1,10,50]  #valori soglia
count1 = 0  #counters
count10 = 0
count50 = 0

with open('DataSet1.csv') as dataset:
    csv_reader = csv.reader(dataset, delimiter=';')
    for line in csv_reader:
        if a:  #entro qua a partire dalla seconda riga, a infatti è inizializzato a 0
            #line viene parsata come una lista avente due elementi line = riga, line[0] = primo elemento, line[1] = secondo elemento
            arrivals.append(int(line[0]))
            departures.append(int(line[1]))
            response = (int(line[1])-int(line[0]))  #calcolo tempo di risposta (partenza - arrivo)
            response_time += response  #aggiorno il contatore che somma tutti i tempi di attesa di tutti i processi
            if(response < responses_values[0]):  #se il tempo di risposta è 0, è contemporaneamente minore di 1,10 e 50, quindi aggiorno tutti e 3 i contatori
                count1 += 1
                count10 += 1
                count50 += 1
            elif(response < responses_values[1]):  #response time 0<50 (non aggiorno il contatore <1 infatti, per questo l'elif)
                count10 += 1
                count50 += 1
            elif(response < responses_values[2]): #sempre elif
                count50 += 1
        else:  #scan della prima riga aggiornando i valori "a mano"
            arrivals.append(8)
            departures.append(13)
            a = 1
            response_time = 5
            count10 += 1
            count50 += 1
        num_processes += 1  #per ogni line incremento di 1

maxTime = max(departures)  #ultimo istante di funzionamento del sistema

x = list(range(0,maxTime))
y_a = []  #arrival time incrementale per ogni istante
for i in x:  #per ogni istante
    if i in arrivals:  #se in quell'istante si è verificata un arrival incremento il contatore
        b += 1
        y_a.append(b)
    else:              #altrimenti devo semplicemente concatenare il valore precedente 
        y_a.append(b)
#plt.title("Arrival Time")
#plt.plot(x,y_a)
#plt.show()

y_d = []  #throughput incrementale per ogni istante
b = 0
for i in x:
    if i in departures:
        b += 1
        y_d.append(b)
    else:
        y_d.append(b)
#plt.title("Throughput")
#plt.plot(x,y_d)
#plt.show()       

totalBusyTime = 0
y_b0 = 0  #no processes in the system
y_b1 = 0 #counter for busy time with 1 process
y_b2 = 0 #counter for busy time with 2 processes
y_b3 = 0 #counter for busy time with 3 processes
for i in x:
    if (y_a[i] - y_d[i]):  #se c'è ALMENO un processo nel sistema
        totalBusyTime += 1
    if (y_a[i] - y_d[i] == 1):  #se c'è esattamente 1 processo nel sistema
        y_b1 += 1
    elif (y_a[i] - y_d[i] == 2):
        y_b2 += 1
    elif (y_a[i] - y_d[i] == 3):
        y_b3 += 1 
    else:
        y_b0 += 1

print("Throughput is", num_processes/maxTime)
print("Arrival rate is", num_processes/maxTime)
print("W is",response_time)
print("Average number of jobs is",response_time/maxTime)
print("Average response time is",response_time/num_processes)
print("Probability of having no processes at the station", y_b0/maxTime)
print("Probability of having only 1 process at the station", y_b1/maxTime)
print("Probability of having 2 processes at the station", y_b2/maxTime)
print("Probability of having 3 processes at the station", y_b3/maxTime)
print("Busy time is",totalBusyTime,"out of",maxTime)
print("Average Service time is",totalBusyTime/num_processes)
print("Utilization is", totalBusyTime/maxTime)
print("Probability of having a response in less than 1,10,50 are respectively:",count1/num_processes," ", count10/num_processes," ", count50/num_processes)

