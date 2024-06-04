
CREATE TABLE reboard(
    rebno NUMBER(6)
        CONSTRAINT REBRD_NO_PK PRIMARY KEY,
    writer VARCHAR2(10 CHAR)
        CONSTRAINT REBRD_ID_FK REFERENCES member(id)
        CONSTRAINT REBRD_ID_NN NOT NULL,
    BODY VARCHAR2(200 CHAR)
        CONSTRAINT REBRD_BODY_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT REBRD_DATE_NN NOT NULL,
    goods NUMBER(6) DEFAULT 0
        CONSTRAINT REBRD_GOOD_NN NOT NULL,
    reupno VARCHAR2(21 CHAR)
        CONSTRAINT REBRD_UPNO_NN NOT NULL,
    regroup NUMBER(6) 
        CONSTRAINT REBRD_GROUP_NN NOT NULL,
    relevel NUMBER(1) DEFAULT 1
        CONSTRAINT REBRD_LEVEL_NN NOT NULL,
    reisshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT REBRD_SHOW_CK CHECK(reisshow IN('Y', 'N'))
        CONSTRAINT REBRD_SHOW_NN NOT NULL
);


CREATE SEQUENCE rebrdSeq
    START WITH 1001
    MAXVALUE 999999
    NOCACHE
    NOCYCLE
;

-- 데이터 입력


select
    SUBSTR('#1001#1012', ?, ?
    
    )
from
    dual
;

select
    SUBSTR('#100001#100012', ?, ?)
from
    dual
;

SELECT
    SUBSTR(
        data, 
        INSTR(data, '#') + 1,
        INSTR(data, '#', 2, 1) - 2
    ) regroup
FROM
    (
        SELECT
            '#1001#1012' data
        FROM
            dual
    )
;


selectKey 

INSERT INTO
    reboard(
        rebno, writer, body,
        reupno, regroup, relevel
    )
VALUES(
    #{bno}, #{id}, #{body},
    #{upno}||#{bno}, 
<if test="regroup eq 0">
    #{bno},
</if>
<if test="regroup neq 0">
    #{regroup},
</if>
    #{level + 1}
);
