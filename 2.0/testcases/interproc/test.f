(set-logic QF_ABV)
(set-info :smt-lib-version 2.0)
(set-option :produce-assignments true)

; free variables:
(declare-fun R_EBP_0 () (_ BitVec 32))
(declare-fun R_ESP_1 () (_ BitVec 32))
(declare-fun mem_array_85 () (Array (_ BitVec 32)
(_ BitVec 8)))
; end free variables.

(assert
 (let ((?R_ESP_107_0 (bvsub R_ESP_1 (_ bv4 32))))
 (let ((?T_tempmem_109_1 (store mem_array_85 (bvadd ?R_ESP_107_0 (_ bv3 32))
                         (( _ extract 31 24) R_EBP_0))))
 (let ((?T_tempmem_113_2 (store ?T_tempmem_109_1
                         (bvadd ?R_ESP_107_0 (_ bv2 32))
                         (( _ extract 23 16) R_EBP_0))))
 (let ((?T_tempmem_117_3 (store ?T_tempmem_113_2
                         (bvadd ?R_ESP_107_0 (_ bv1 32))
                         (( _ extract 15 8) R_EBP_0))))
 (let ((?T_tempmem_121_4 (store ?T_tempmem_117_3 ?R_ESP_107_0
                         ((_ extract 7 0) R_EBP_0))))
 (let ((?R_ESP_127_5 (bvsub ?R_ESP_107_0 (_ bv24 32))))
 (let ((?temp_157_6 (bvadd ?R_ESP_127_5 (_ bv4 32))))
 (let ((?T_tempmem_156_7 (store ?T_tempmem_121_4
                         (bvadd ?temp_157_6 (_ bv3 32)) (_ bv0 8))))
 (let ((?T_tempmem_161_8 (store ?T_tempmem_156_7
                         (bvadd ?temp_157_6 (_ bv2 32)) (_ bv0 8))))
 (let ((?T_tempmem_166_9 (store ?T_tempmem_161_8
                         (bvadd ?temp_157_6 (_ bv1 32)) (_ bv0 8))))
 (let ((?T_tempmem_171_10 (store ?T_tempmem_166_9 ?temp_157_6 (_ bv5 8))))
 (let ((?temp_177_11 (bvadd ?R_ESP_107_0 (_ bv4294967288 32))))
 (let ((?R_EAX_198_12 (bvor
                      (bvor
                      (bvor
                      ((_ zero_extend 24)
                      (select ?T_tempmem_171_10 ?temp_177_11))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_171_10
                      (bvadd ?temp_177_11 (_ bv1 32)))) (_ bv8 32)))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_171_10
                      (bvadd ?temp_177_11 (_ bv2 32)))) (_ bv16 32)))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_171_10
                      (bvadd ?temp_177_11 (_ bv3 32)))) (_ bv24 32)))))
 (let ((?T_tempmem_200_13 (store ?T_tempmem_171_10
                          (bvadd ?R_ESP_127_5 (_ bv3 32))
                          (( _ extract 31 24) ?R_EAX_198_12))))
 (let ((?T_tempmem_204_14 (store ?T_tempmem_200_13
                          (bvadd ?R_ESP_127_5 (_ bv2 32))
                          (( _ extract 23 16) ?R_EAX_198_12))))
 (let ((?T_tempmem_208_15 (store ?T_tempmem_204_14
                          (bvadd ?R_ESP_127_5 (_ bv1 32))
                          (( _ extract 15 8) ?R_EAX_198_12))))
 (let ((?T_tempmem_212_16 (store ?T_tempmem_208_15 ?R_ESP_127_5
                          ((_ extract 7 0) ?R_EAX_198_12))))
 (let ((?R_ESP_217_17 (bvsub ?R_ESP_127_5 (_ bv4 32))))
 (let ((?T_tempmem_219_18 (store ?T_tempmem_212_16
                          (bvadd ?R_ESP_217_17 (_ bv3 32)) (_ bv8 8))))
 (let ((?T_tempmem_223_19 (store ?T_tempmem_219_18
                          (bvadd ?R_ESP_217_17 (_ bv2 32)) (_ bv4 8))))
 (let ((?T_tempmem_227_20 (store ?T_tempmem_223_19
                          (bvadd ?R_ESP_217_17 (_ bv1 32)) (_ bv132 8))))
 (let ((?T_tempmem_231_21 (store ?T_tempmem_227_20 ?R_ESP_217_17 (_ bv6 8))))
 (let ((?R_ESP_236_22 (bvsub ?R_ESP_217_17 (_ bv4 32))))
 (let ((?temp_239_23 (bvadd ?R_ESP_236_22 (_ bv3 32))))
 (let ((?T_tempmem_238_24 (store ?T_tempmem_231_21 ?temp_239_23
                          (( _ extract 31 24) ?R_ESP_107_0))))
 (let ((?temp_243_25 (bvadd ?R_ESP_236_22 (_ bv2 32))))
 (let ((?T_tempmem_242_26 (store ?T_tempmem_238_24 ?temp_243_25
                          (( _ extract 23 16) ?R_ESP_107_0))))
 (let ((?temp_247_27 (bvadd ?R_ESP_236_22 (_ bv1 32))))
 (let ((?T_tempmem_246_28 (store ?T_tempmem_242_26 ?temp_247_27
                          (( _ extract 15 8) ?R_ESP_107_0))))
 (let ((?T_tempmem_250_29 (store ?T_tempmem_246_28 ?R_ESP_236_22
                          ((_ extract 7 0) ?R_ESP_107_0))))
 (let ((?temp_256_30 (bvadd ?R_ESP_236_22 (_ bv12 32))))
 (let ((?R_EAX_277_31 (bvor
                      (bvor
                      (bvor
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29 ?temp_256_30))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29
                      (bvadd ?temp_256_30 (_ bv1 32)))) (_ bv8 32)))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29
                      (bvadd ?temp_256_30 (_ bv2 32)))) (_ bv16 32)))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29
                      (bvadd ?temp_256_30 (_ bv3 32)))) (_ bv24 32)))))
 (let ((?temp_279_32 (bvadd ?R_ESP_236_22 (_ bv8 32))))
 (let ((?R_EDX_300_33 (bvor
                      (bvor
                      (bvor
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29 ?temp_279_32))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29
                      (bvadd ?temp_279_32 (_ bv1 32)))) (_ bv8 32)))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29
                      (bvadd ?temp_279_32 (_ bv2 32)))) (_ bv16 32)))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29
                      (bvadd ?temp_279_32 (_ bv3 32)))) (_ bv24 32)))))
 (let ((?R_ECX_303_34 (bvsub ?R_EDX_300_33 ?R_EAX_277_31)))
 (let ((?R_EBP_350_35 (bvor
                      (bvor
                      (bvor
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29 ?R_ESP_236_22))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29 ?temp_247_27)) (_ bv8 32)))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29 ?temp_243_25)) (_ bv16 32)))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_250_29 ?temp_239_23)) (_ bv24 32)))))
 (let ((?temp_375_36 (bvadd ?R_EBP_350_35 (_ bv4294967292 32))))
 (let ((?temp_376_37 (bvadd ?temp_375_36 (_ bv3 32))))
 (let ((?T_tempmem_374_38 (store ?T_tempmem_250_29 ?temp_376_37
                          (( _ extract 31 24) ?R_ECX_303_34))))
 (let ((?temp_381_39 (bvadd ?temp_375_36 (_ bv2 32))))
 (let ((?T_tempmem_379_40 (store ?T_tempmem_374_38 ?temp_381_39
                          (( _ extract 23 16) ?R_ECX_303_34))))
 (let ((?temp_386_41 (bvadd ?temp_375_36 (_ bv1 32))))
 (let ((?T_tempmem_384_42 (store ?T_tempmem_379_40 ?temp_386_41
                          (( _ extract 15 8) ?R_ECX_303_34))))
 (let ((?T_tempmem_389_43 (store ?T_tempmem_384_42 ?temp_375_36
                          ((_ extract 7 0) ?R_ECX_303_34))))
 (let ((?R_EAX_416_44 (bvor
                      (bvor
                      (bvor
                      ((_ zero_extend 24)
                      (select ?T_tempmem_389_43 ?temp_375_36))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_389_43 ?temp_386_41)) (_ bv8 32)))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_389_43 ?temp_381_39)) (_ bv16 32)))
                      (bvshl
                      ((_ zero_extend 24)
                      (select ?T_tempmem_389_43 ?temp_376_37)) (_ bv24 32)))))
 (= ?R_EAX_416_44 (_ bv10 32))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(get-model)
(exit)
