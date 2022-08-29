    CREATE TABLE tbl (
        dt DATETIME NOT NULL,  -- or DATE
        ...
        PRIMARY KEY (..., dt),
        UNIQUE KEY (..., dt),
        ...
    )
    PARTITION BY RANGE (TO_DAYS(dt)) (
        start        VALUES LESS THAN (0),
        from20120315 VALUES LESS THAN (TO_DAYS('2012-03-16')),
        from20120316 VALUES LESS THAN (TO_DAYS('2012-03-17')),
        ...
        from20120414 VALUES LESS THAN (TO_DAYS('2012-04-15')),
        from20120415 VALUES LESS THAN (TO_DAYS('2012-04-16')),
        future       VALUES LESS THAN MAXVALUE
    );