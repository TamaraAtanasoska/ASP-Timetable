%%clingo 50 user_course.lp -

%At least 2 pms

one_pm:-1{module(pm1, ling, 12, 1, 0, 0);module(pm2, ml, 12, 0, 0, 0);module(pm3, ci, 12, 1, 0, 0)}1.
two_pm:-2{module(pm1, ling, 12, 1, 0, 0);module(pm2, ml, 12, 0, 0, 0);module(pm3, ci, 12, 1, 0, 0)}2.
toomany_pm:-3{module(pm1, ling, 12, 1, 0, 0);module(pm2, ml, 12, 0, 0, 0);module(pm3, ci, 12, 1, 0, 0)}.

%2 pms from different fields
pm_fieldcheck:-module(_,X,12,_,_,_),module(_,Y,12,_,_,_),X!=Y.
    
%credits_want(A):-A=#sum{X,Z:want_module(Z,_,X,_,_,_)}.

planned_pm(C):-A=#count{X:module(X,_,12,_,_,_)},B=#count{X:want_module(X,_,12,_,_,_)},C=A+B.  
 
toomuchpm:-planned_pm(X),X>2.  

field_pm(C):-A=#count{X:module(_,X,12,_,_,_)},B=#count{X:want_module(_,X,12,_,_,_)},C=A+B.  

        
%All bms    
bm_check:-module(bm1, ling, 9, 0, 1, 0),module(bm2, ml, 9, 1, 1, 0),module(bm3, ci, 9, 0, 1, 0).
    
%Im check
im_check:-1{module(im, none, 15, 2, 1, 0)}.
  

%AM check
%three fm
fm_am_comb_check:-module(fm1, ling, 6, 0, 0, 0),module(fm2, ml, 6, 0, 0, 0),module(fm3, ci, 6, 0, 0, 0),1{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}.

%two fm
fm_am_comb_check:-2{module(fm1, ling, 6, 0, 0, 0);module(fm2, ml, 6, 0, 0, 0);module(fm3, ci, 6, 0, 0, 0)}2,2{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}.

%one fm   
fm_am_comb_check:-1{module(fm1, ling, 6, 0, 0, 0);module(fm2, ml, 6, 0, 0, 0);module(fm3, ci, 6, 0, 0, 0)}1,3{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}.

%no fm
fm_am_comb_check:-not module(fm1, ling, 6, 0, 0, 0),not module(fm2, ml, 6, 0, 0, 0),not module(fm3, ci, 6, 0, 0, 0),4{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}.

need(0):-0{needfm(fm1, ling, 6, 0, 0, 0);needfm(fm2, ml, 6, 0, 0, 0);needfm(fm3, ci, 6, 0, 0, 0)}0.    
need(1):-1{needfm(fm1, ling, 6, 0, 0, 0);needfm(fm2, ml, 6, 0, 0, 0); needfm(fm3, ci, 6, 0, 0, 0)}1.    
need(2):-2{needfm(fm1, ling, 6, 0, 0, 0);needfm(fm2, ml, 6, 0, 0, 0); needfm(fm3, ci, 6, 0, 0, 0)}2.    
need(3):-3{needfm(fm1, ling, 6, 0, 0, 0);needfm(fm2, ml, 6, 0, 0, 0); needfm(fm3, ci, 6, 0, 0, 0)}3.    
    

fm(0):-not module(fm1, ling, 6, 0, 0, 0), not module(fm2, ml, 6, 0, 0, 0), not module(fm3, ci, 6, 0, 0, 0).    
fm(1):-1{module(fm1, ling, 6, 0, 0, 0);module(fm2, ml, 6, 0, 0, 0); module(fm3, ci, 6, 0, 0, 0)}1.    
fm(2):-2{module(fm1, ling, 6, 0, 0, 0);module(fm2, ml, 6, 0, 0, 0); module(fm3, ci, 6, 0, 0, 0)}2.    
fm(3):-3{module(fm1, ling, 6, 0, 0, 0);module(fm2, ml, 6, 0, 0, 0); module(fm3, ci, 6, 0, 0, 0)}3.    
    

planned_am_fm(C):-A=#count{X:module(X,_,6,_,_,_)},B=#count{X:want_module(X,_,6,_,_,_)},C=A+B.  

too_much_am_fm:-planned_am_fm(A),A>4.
too_few_am_fm:-planned_am_fm(A),A<4.
    
am(1):-1{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}1.

am(2):-2{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}2.

am(3):-3{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}3.

am(4):-4{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}4.

am_to_many:-5{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}.


am_fieldcheck:-module(_,X1,6,2,0,0),module(_,X2,6,2,0,0),module(_,Y1,6,2,0,0),X1=X2,X1!=Y1.
am_fieldcheck:-module(_,X1,6,2,0,0),module(_,X2,6,2,0,0),module(_,Y1,6,2,0,0),module(_,Y2,6,2,0,0),X1=X2,X1!=Y1,X1!=Y2.

    
    
thesis_check:-im_check,pm_fieldcheck,bm_check,fm_am_comb_check,credits_have(X),X>89.

credits_have(A):-A=#sum{X,Z:module(Z,_,X,_,_,_)}.
    
    
credits_want(A):-A=#sum{X,Z:want_module(Z,_,X,_,_,_)}.

toomuchcredits:-credits_want(X),X>40.  

toofewcredits:-credits_want(X),X<15.  
    
    
done_already(A):-want_module(A,B,C,D,E,F),module(A,B,C,D,E,F).
 
%#show planned_am_fm/1.
%#show too_much_am_fm/0.
%#show module/6.
%#show want_module/6.