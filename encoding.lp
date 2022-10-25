%%clingo 100


%BM 

%no constraints they either exist or not

{module(bm, ling, 9, 0, 1, 0)}. {module(bm, ml, 9, 1, 1, 0)}. {module(bm, ci, 9, 0, 1, 0)}.

bm_check:-module(bm, ling, 9, 0, 1, 0),module(bm, ml, 9, 1, 1, 0),module(bm, ci, 9, 0, 1, 0).

:-not bm_check.


%PM
{module(pm, ling, 12, 1, 0, 0)}.{module(pm, ml, 12, 0, 0, 0)}.{module(pm, ci, 12, 1, 0, 0)}.

%There must be at least 2 pms
2{module(pm, ling, 12, 1, 0, 0);module(pm, ml, 12, 0, 0, 0);module(pm, ci, 12, 1, 0, 0)}.

%There have to be 2 pms from different fields
pm_check:-module(pm,X,12,_,_,_),module(pm,Y,12,_,_,_).
    
:-not pm_check.

   

%IM
%There must be at least 1 im
1{module(im, none, 15, 2, 1, 0)}.

im_check:-1{module(im, none, 15, 2, 1, 0)}.

:-not im_check.

   

%fm & am

{module(fm, ling, 6, 0, 0, 0)}.{module(fm, ml, 6, 0, 0, 0)}. {module(fm, ci, 6, 0, 0, 0)}.


    
%if there are 3 fms than at least one am
1{module(id(1..6),am,ling,6,2,0,0);module(id(1..6),am,ci,6,2,0,0);module(id(1..6),am,cl,6,2,0,0)}:-module(fm, ling, 6, 0, 0, 0),module(fm, ml, 6, 0, 0, 0),module(fm, ci, 6, 0, 0, 0).

%if there are 2 fms then at least two am
2{module(id(1..6),am,ling,6,2,0,0);module(id(1..6),am,ci,6,2,0,0);module(id(1..6),am,cl,6,2,0,0)}:-2{module(fm, ling, 6, 0, 0, 0);module(fm, ml, 6, 0, 0, 0);module(fm, ci, 6, 0, 0, 0)}2.

%if 1 fm then 3 am
3{module(id(1..6),am,ling,6,2,0,0);module(id(1..6),am,ci,6,2,0,0);module(id(1..6),am,cl,6,2,0,0)}:-1{module(fm, ling, 6, 0, 0, 0);module(fm, ml, 6, 0, 0, 0);module(fm, ci, 6, 0, 0, 0)}1.

%if 0 fm then 4 am

4{module(id(1..6),am,ling,6,2,0,0);module(id(1..6),am,ci,6,2,0,0);module(id(1..6),am,cl,6,2,0,0)}:-0{module(fm, ling, 6, 0, 0, 0);module(fm, ml, 6, 0, 0, 0);module(fm, ci, 6, 0, 0, 0)}0.


%there cannot be only more than 3 ams from the same field if there are no other ams choosen
%is this right?
:-3{module(_,am,X,6,2,0,0)},not {module(_,am,Y,6,2,0,0)}0.
    

    
% There has to be exactly one thesis
%To write the thesis you need: 2pm an im, the bms, four am/fm
%pm = 24
%im = 15
% bm=27
%thesis=30
%am/fm=24

module(thesis, none, 30, 2, 1, 0):-im_check,pm_check,bm_check,{module(fm, ling, X, 0, 0, 0)},{module(fm, cl, X, 0, 0, 0)},{module(fm, ci, X, 0, 0, 0)},{module(_,am,_,X,2,0,0)}4,X==24.

thesis_check:-module(thesis, none, 30, 2, 1, 0).

:-not thesis_check.
        
#show module/6.