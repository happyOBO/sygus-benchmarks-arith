(set-logic BV)    
(synth-fun f ( (x0 (BitVec 64)) (x1 (BitVec 64)) ) (BitVec 64)    
((Start (BitVec 64)    
((bvadd Start Start)    
(bvmul Start Start)    
(bvudiv Start Start)    
(bvsub Start Start)    
x0    
x1    
#x0000000000000000  #x0000000000000001  #x0000000000000002  #x0000000000000003  #x0000000000000004  #x0000000000000005  #x0000000000000006  #x0000000000000007  #x0000000000000008  #x0000000000000009  #x000000000000000a  #x000000000000000b  #x000000000000000c  #x000000000000000d  #x000000000000000e  #x000000000000000f  #x0000000000000010  #x0000000000000011  #x0000000000000012  #x0000000000000013  #x0000000000000014  #x0000000000000015  #x0000000000000016  #x0000000000000017  #x0000000000000018  #x0000000000000019  #x000000000000001a  #x000000000000001b  #x000000000000001c  #x000000000000001d  #x000000000000001e  #x000000000000001f  #x0000000000000020  #x0000000000000021  #x0000000000000022  #x0000000000000023  #x0000000000000024  #x0000000000000025  #x0000000000000026  #x0000000000000027  #x0000000000000028  #x0000000000000029  #x000000000000002a  #x000000000000002b  #x000000000000002c  #x000000000000002d  #x000000000000002e  #x000000000000002f  #x0000000000000030  #x0000000000000031  #x0000000000000032  #x0000000000000033  #x0000000000000034  #x0000000000000035  #x0000000000000036  #x0000000000000037  #x0000000000000038  #x0000000000000039  #x000000000000003a  #x000000000000003b  #x000000000000003c  #x000000000000003d  #x000000000000003e  #x000000000000003f  #x0000000000000040  #x0000000000000041  #x0000000000000042  #x0000000000000043  #x0000000000000044  #x0000000000000045  #x0000000000000046  #x0000000000000047  #x0000000000000048  #x0000000000000049  #x000000000000004a  #x000000000000004b  #x000000000000004c  #x000000000000004d  #x000000000000004e  #x000000000000004f  #x0000000000000050  #x0000000000000051  #x0000000000000052  #x0000000000000053  #x0000000000000054  #x0000000000000055  #x0000000000000056  #x0000000000000057  #x0000000000000058  #x0000000000000059  #x000000000000005a  #x000000000000005b  #x000000000000005c  #x000000000000005d  #x000000000000005e  #x000000000000005f  #x0000000000000060  #x0000000000000061  #x0000000000000062  #x0000000000000063  #x0000000000000064  #x0000000000000065  #x0000000000000066  #x0000000000000067  #x0000000000000068  #x0000000000000069    
))))
(constraint (= (f #x0000000000000002 #x0000000000000003 ) #x0000000000000017))
(constraint (= (f #x0000000000000003 #x0000000000000002 ) #x0000000000000018))
(constraint (= (f #x0000000000000004 #x0000000000000002 ) #x000000000000001a))
(check-synth)