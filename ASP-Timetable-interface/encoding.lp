%%clingo 50 user_course.lp -


%PM

%Number of PMs planned   
planned_pm(C):-A=#count{X:finished(X,_,12,_,_,_)},B=#count{X:want_module(X,_,12,_,_,_)},C=A+B.  
 
%NUmber of different PMs fields
%field_pm(A):-A=#count{X:finished(_,X,12,_,_,_), want_module(_,X,12,_,_,_)}.  

too_many_pm(X):-planned_pm(X),X>2.  
toofewpm(X):-planned_pm(X),X<2.
twopm(X):-planned_pm(X),X=2.

        
%BM   
planned_bm(C):-A=#count{X:finished(X,_,9,_,_,_)},B=#count{X:want_module(X,_,9,_,_,_)},C=A+B.  
too_few_bm:-planned_bm(X),X<3.

    
%Im check
planned_im(C):-A=#count{X:finished(im,_,X,_,_,_)},B=#count{X:want_module(im,_,X,_,_,_)},C=A+B.  
too_few_im:-planned_im(X),X=0.
too_many_im(X):-planned_im(X),X>1.
    

%Number of FM needed
need(A):-A=#count{X:needfm(X,_,_,_,_,_)}.
 
%Number of FM planned
planned_fm(C):-A=#count{X:finished(fm,X,_,_,_,_)},B=#count{X:want_module(fm,X,_,_,_,_)},C=A+B.
too_few_fm(X):-planned_fm(X),need(Y),Y>X.
too_many_fm(X):-planned_fm(X),need(Y),X>Y.

planned_am_fm(C):-A=#count{X:finished(X,_,6,_,_,_)},B=#count{X:want_module(X,_,6,_,_,_)},C=A+B.  

too_much_am_fm(A):-planned_am_fm(A),A>4.
too_few_am_fm(A):-planned_am_fm(A),A<4. 
    
%TO DO AM FIELD CHECK
%TO DO check that the right FM are selected
    
thesis_check:-planned_im(1),planned_pm(2),planned_bm(3),planned_fm(A),need(B),A==B, not too_few_am_fm(_),credits_have(X),credits_want(Y),(X+Y)>89.

credits_have(A):-A=#sum{X,Z:finished(Z,_,X,_,_,_)}.
    
    
credits_want(A):-A=#sum{X,Z:want_module(Z,_,X,_,_,_)}.


toomuchcredits:-credits_want(X),X>40.  
toofewcredits:-credits_want(X),X<15.
    
done_already(A):-want_module(A,B,C,D,E,F),finished(A,B,C,D,E,F).
 
%#show planned_am_fm/1.
%#show too_much_am_fm/0.
%#show finished/6.
%#show want_module/6.