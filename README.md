Debug utilities for erlang
===========================

    Eshell V5.9.3.1  (abort with ^G)
    1> c(d).
    {ok,d}
    2> c(demo).
    {ok,demo}
    3> d:c(demo).
    debug OFF
    {ok,demo}
    4> demo:twice(1).
    2
    5> demo:api_1_test().
    ** exception error: undefined function demo:api_1_test/0
    6> d:d(demo).
    debug ON
    {ok,demo}
    7> demo:twice(1).
    2
    8> demo:api_1_test().
    ok
    9> eunit:test(demo).
    demo: api_2_test...*failed*
    in function demo:'-api_2_test/0-fun-0-'/0 (d:/project/erlang/erldebug/demo.erl,
    line 16)
    **error:{assertion_failed,[{module,demo},
                       {line,16},
                       {expression,"3 =:= twice ( 2 )"},
                       {expected,true},
                       {value,false}]}


    =======================================================
      Failed: 1.  Skipped: 0.  Passed: 1.
    error
    10> 
