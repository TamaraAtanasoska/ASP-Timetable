%%clingo 50 user_course.lp -

%At least 2 pms

one_pm:-1{module(pm1, ling, 12, 1, 0, 0);module(pm2, ml, 12, 0, 0, 0);module(pm3, ci, 12, 1, 0, 0)}1.
two_pm:-2{module(pm1, ling, 12, 1, 0, 0);module(pm2, ml, 12, 0, 0, 0);module(pm3, ci, 12, 1, 0, 0)}2.
toomany_pm:-3{module(pm1, ling, 12, 1, 0, 0);module(pm2, ml, 12, 0, 0, 0);module(pm3, ci, 12, 1, 0, 0)}.

%2 pms from different fields
pm_fieldcheck:-module(_,X,12,_,_,_),module(_,Y,12,_,_,_),X!=Y.
    

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
 

fm_am_comb_check:-not module(fm1, ling, 6, 0, 0, 0),not module(fm2, ml, 6, 0, 0, 0),not module(fm3, ci, 6, 0, 0, 0),4{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}.


am_one:-1{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}1.
am_two:-2{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}2.
am_three:-3{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}3.
am_four:-4{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}4.
am_to_many:-5{module(am11,ling,6,2,0,0);module(am21,ml,6,2,0,0);module(am31,ci,6,2,0,0);module(am12,ling,6,2,0,0);module(am22,ml,6,2,0,0);module(am32,ci,6,2,0,0)}.


am_fieldcheck:-module(_,X1,6,2,0,0),module(_,X2,6,2,0,0),module(_,Y1,6,2,0,0),X1=X2,X1!=Y1,am_three.
am_fieldcheck:-module(_,X1,6,2,0,0),module(_,X2,6,2,0,0),module(_,Y1,6,2,0,0),module(_,Y2,6,2,0,0),X1=X2,X1!=Y1,X1!=Y2.

    
    
thesis_check:-im_check,pm_fieldcheck,bm_check,fm_am_comb_check.

