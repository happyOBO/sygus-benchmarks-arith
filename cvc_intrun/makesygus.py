arr = [[( 10 ),( 17 )],[10,17],[( 5 ),( 7 )],[10,10],[( 2, 3 ),( 1, 1 )],[5,2],[( 4, 5 ),( 1, 3 )],[9,4],[( 3, 6 ),( 7, 14 )],[9,21],[( 5 ),( 6 )],[7,8],[( 5 ),( 6 )],[15,16],[( 5 ),( 2 )],[11,5],[( 5, 3 ),( 17, 7 ),( 10, 6 )],[2,10,4],[( 17, 3 ),( 15, 5 )],[14,10],[( 10, 1 ),( 17, 15 ),( 20, 3 )],[9,2,17],[( 10 ),( 17 ),( 20 )],[5,12,15],[( 2, 3 ),( 4, 5 )],[6,20],[( 29, 2 ),( 17, 6 )],[58,102],[( 2 ),( 4 )],[6,12],[( 2, 4 ),( 7, 2 )],[16,28],[( 4 ),( 7 )],[32,56],[( 2, 3, 5 ),( 2, 3, 2 )],[90,36],[( 4, 6, 3 ),( 7, 9, 2 )],[27,65],[( 4, 3 ),( 3, 9 ),( 2, 4 )],[34,64,26],[( 3, 5 ) ,( 2, 3 ) ],[40,20],[( 5, 3, 7 ),( 7, 9, 2 )],[50,73],[( 5, 3, 2 ),( 2, 1, 2 )],[56,24],[( 8, 3 ),( 6, 2 )],[2,3],[( 12, 4 ),( 15, 3 )],[3,5],[( 2, 3 ),( 3, 5 ),( 4, 13 )],[4,1,2],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[15,10,14],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[14,9,10],[( 46, 2 ),( 69, 3 ),( 92, 2 )],[24,24,25],[( 2, 18 ),( 3, 18 ),( 4, 18 )],[2,3,4],[( 11, 2 ),( 22, 2 ),( 33, 2 )],[24,36,48],[( 4, 2 ),( 5, 2 ),( 6, 2 )],[1,2,3],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[30,38,46],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[82,83,100],[( 2, 3 ),( 3, 2 ),( 4, 3 )],[51,34,51],[( 2, 3 ),( 4, 2 ),( 8, 2 )],[4,6,8],[( 10, 5 ),( 15, 5 ),( 20, 5 )],[3,4,5],[( 10, 2 ),( 20, 2 ),( 25, 5 )],[6,7,6],[( 2, 3 ),( 3, 2 ),( 4, 3 )],[17,28,17],[( 2, 3 ),( 3, 5 ),( 4, 3 )],[5,8,7],[( 7, 2 ),( 8, 2 ),( 9, 2 )],[2,4,6],[( 15, 3 ),( 30, 2 ),( 45, 3 )],[5,30,45],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[3,9,10],[( 2, 3 ),( 5, 2 ),( 10, 2 )],[1,2,3],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[47,33,34],[( 10, 2 ),( 15, 3 ),( 20, 2 )],[11,16,22],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[4,12,19],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[37,53,70],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[15,14,13],[( 2, 18 ),( 3, 36 ),( 4, 18 )],[26,27,26],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[22,21,28],[( 2, 3 ),( 3, 2 ),( 4, 2 )],[23,24,26],[( 3, 2 ),( 12, 4 ),( 13, 3 )],[4,1,9],[( 2, 3 ),( 3, 4 ),( 4, 6 )],[19,18,19],[( 2, 4 ),( 3, 6 ),( 4, 8 )],[16,17,18]]
tot_count = 0
zero_to_p =""
for z in range(0,106):
    zero_to_p += str(z)+" "
while (tot_count <110):
    print()
    ###
    curr_arg = arr[tot_count]
    curr_res = arr[tot_count+1]
    num = int(tot_count /2)
    ###
    inputargcount = 1
    array_count = 0
    try:
        inputargcount = len(curr_arg[0])
    except:
        print('인자가 하나!')

    # #
    # if (curr_arg[0] is not int):
    #     inputargcount = len(curr_arg[0])
    # #

    #'{0:08b}'.format(6)
    res_sys =""
    if(inputargcount == 1):
        res_sys += "(set-logic LIA)\
    \n(synth-fun f ( (x0 Int) ) Int\
    \n((Start Int\
    \n((+ Start Start)\
    \n(* Start Start)\
    \n(div Start Start)\
    \n(- Start Start)\
    \nx0\n"+zero_to_p+"))))\n"
        for i in range(len(curr_arg)):
            for j in range(len(curr_res)):
                if(i == j):
                    res_sys += "(constraint (= (f " + str(curr_arg[i]) + ") " + str(curr_res[j])  + "))\n"
    elif(inputargcount == 2):
        res_sys += "(set-logic LIA)\
    \n(synth-fun f ( (x0 Int) (x1 Int) ) Int\
    \n((Start Int\
    \n((+ Start Start)\
    \n(* Start Start)\
    \n(div Start Start)\
    \n(- Start Start)\
    \nx0\
    \nx1\n"+zero_to_p+"))))\n"
        i = 0
        for pi in curr_arg:
            appendi = ""
            for k in pi:
                appendi += str(k) + " "
            for j in range(len(curr_res)):
                if(i == j):
                    res_sys += "(constraint (= (f " + appendi + ") " + str(curr_res[j]) + "))\n"
            i +=1

    elif(inputargcount == 3):
        res_sys += "(set-logic LIA)\
    \n(synth-fun f ( (x0 Int) (x1 Int) (x2 Int) ) Int\
    \n((Start Int\
    \n((+ Start Start)\
    \n(* Start Start)\
    \n(div Start Start)\
    \n(- Start Start)\
    \nx0\
    \nx1\
    \nx2\n"+zero_to_p+"))))\n"
        i = 0
        for pi in curr_arg:
            appendi = ""
            for k in pi:
                appendi += str(k) + " "
            for j in range(len(curr_res)):
                if(i == j):
                    res_sys += "(constraint (= (f " + appendi + ") " + str(curr_res[j]) + "))\n"
            i +=1
    else :
        print("wrong program quit()")
        quit()

    res_sys += "(check-synth)"

    f = open("int-arith-intver"+str(num)+".sl", 'w')
    f.write(res_sys)
    f.close()
    tot_count += 2