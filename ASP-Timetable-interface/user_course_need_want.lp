module(pm1, ling, 12, 1, 0, 0).
%module(pm2, ml, 12, 0, 0, 0).
%module(pm3, ci, 12, 1, 0, 0).

module(bm1, ling, 9, 0, 1, 0). 
module(bm2, ml, 9, 1, 1, 0). 
module(bm3, ci, 9, 0, 1, 0).

%module(im, none, 15, 2, 1, 0).

%module(fm1, ling, 6, 0, 0, 0).
%module(fm2, ml, 6, 0, 0, 0). 
%module(fm3, ci, 6, 0, 0, 0).

module(am11, ling, 6, 2, 0, 0).
module(am12, ling, 6, 2, 0, 0).
%module(am21, ml, 6, 2, 0, 0).
%module(am22, ml, 6, 2, 0, 0).
module(am31, ci, 6, 2, 0, 0).
%module(am32, ci, 6, 2, 0, 0).


%needfm(fm1, ling, 6, 0, 0, 0).
%needfm(fm2, ml, 6, 0, 0, 0). 
%needfm(fm3, ci, 6, 0, 0, 0).

want_module(pm1, ling, 12, 1, 0, 0).
want_module(pm2, ml, 12, 0, 0, 0).
want_module(pm3, ci, 12, 1, 0, 0).
