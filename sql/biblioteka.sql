CREATE TABLE
    IF NOT EXISTS public.reader (
        reader_id INTEGER NOT NULL CONSTRAINT reader_pk PRIMARY KEY,
        reader_fullname VARCHAR NOT NULL,
        reader_adress VARCHAR NOT NULL,
        reader_phone VARCHAR
    );

ALTER TABLE public.reader OWNER TO postgres;

CREATE TABLE
    IF NOT EXISTS public.author (
        author_id INTEGER NOT NULL CONSTRAINT author_pk PRIMARY KEY,
        author_fullname VARCHAR NOT NULL
    );

ALTER TABLE public.author OWNER TO postgres;

CREATE TABLE
    IF NOT EXISTS public.isdat (
        isdat_id INTEGER NOT NULL CONSTRAINT isdat_pk PRIMARY KEY,
        isdat_name VARCHAR NOT NULL,
        isdat_city VARCHAR NOT NULL
    );

ALTER TABLE public.isdat OWNER TO postgres;

CREATE TABLE
    IF NOT EXISTS public.book (
        book_id INTEGER NOT NULL CONSTRAINT book_pk PRIMARY KEY,
        book_name VARCHAR NOT NULL,
        book_list NUMERIC NOT NULL,
        book_ex NUMERIC NOT NULL,
        book_price NUMERIC NOT NULL,
        book_date DATE NOT NULL,
        book_isdat INTEGER NOT NULL CONSTRAINT book_isdat_isdat_id_fk REFERENCES public.isdat
    );

ALTER TABLE public.book OWNER TO postgres;

CREATE TABLE
    IF NOT EXISTS public.cardbook (
        cardbook_id INTEGER NOT NULL CONSTRAINT cardbook_pk PRIMARY KEY,
        reader_id INTEGER NOT NULL CONSTRAINT cardbook_reader_reader_id_fk REFERENCES public.reader,
        book_id INTEGER NOT NULL CONSTRAINT cardbook_book_book_id_fk REFERENCES public.book,
        cardbook_on DATE NOT NULL,
        cardbook_off DATE
    );

ALTER TABLE public.cardbook OWNER TO postgres;

CREATE TABLE
    IF NOT EXISTS public.author_book (
        author_id INTEGER NOT NULL CONSTRAINT author_book_author_author_id_fk REFERENCES public.author,
        book_id INTEGER NOT NULL CONSTRAINT author_book_book_book_id_fk REFERENCES public.book,
        ab_id BIGSERIAL CONSTRAINT author_book_pk PRIMARY KEY,
        CONSTRAINT author_book_pk2 UNIQUE (book_id, author_id)
    );

ALTER TABLE public.author_book OWNER TO postgres;

ALTER TABLE public.author_book OWNER TO postgres;

INSERT INTO
    public.author (author_id, author_fullname)
VALUES (1, 'AF1');

INSERT INTO
    public.author (author_id, author_fullname)
VALUES (2, 'AF2');

INSERT INTO
    public.author (author_id, author_fullname)
VALUES (3, 'AF3');

INSERT INTO
    public.author (author_id, author_fullname)
VALUES (4, 'AF4');

INSERT INTO
    public.author (author_id, author_fullname)
VALUES (5, 'AF5');

INSERT INTO
    public.isdat (
        isdat_id,
        isdat_name,
        isdat_city
    )
VALUES (1, 'Red', 'Moscow');

INSERT INTO
    public.isdat (
        isdat_id,
        isdat_name,
        isdat_city
    )
VALUES (2, 'Star', 'New York');

INSERT INTO
    public.isdat (
        isdat_id,
        isdat_name,
        isdat_city
    )
VALUES (3, 'Green', 'Dallas');

INSERT INTO
    public.isdat (
        isdat_id,
        isdat_name,
        isdat_city
    )
VALUES (4, 'Gray', 'Tula');

INSERT INTO
    public.isdat (
        isdat_id,
        isdat_name,
        isdat_city
    )
VALUES (5, 'Moon', 'Berlin');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (1, 'RAAA', 'A001', '1001');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (2, 'RBBB', 'A002', '1002');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (3, 'RCCC', 'A003', '1003');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (4, 'REEE', 'A004', '1004');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (5, 'RDDD', 'A005', '1005');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (6, 'RFFF', 'A006', null);

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        1,
        'BAAA',
        '100',
        5,
        200,
        '2016-07-08',
        1
    );

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        2,
        'BBBB',
        '300',
        5,
        400,
        '2017-07-25',
        2
    );

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        3,
        'BCCC',
        '500',
        5,
        400,
        '2015-07-09',
        3
    );

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        4,
        'BEEE',
        '500',
        5,
        600,
        '2011-07-08',
        4
    );

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        5,
        'BDDD',
        '800',
        5,
        800,
        '2007-07-06',
        5
    );

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        6,
        'BFFF',
        '1000',
        5,
        1000,
        '2018-07-19',
        2
    );

INSERT INTO public.author_book (author_id, book_id) VALUES (1, 2);

INSERT INTO public.author_book (author_id, book_id) VALUES (2, 1);

INSERT INTO public.author_book (author_id, book_id) VALUES (3, 3);

INSERT INTO public.author_book (author_id, book_id) VALUES (4, 6);

INSERT INTO public.author_book (author_id, book_id) VALUES (4, 5);

INSERT INTO public.author_book (author_id, book_id) VALUES (5, 1);

INSERT INTO public.author_book (author_id, book_id) VALUES (5, 2);

INSERT INTO public.author_book (author_id, book_id) VALUES (5, 3);

INSERT INTO public.author_book (author_id, book_id) VALUES (4, 3);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        1,
        2,
        1,
        '2023-07-01',
        '2023-07-08'
    );

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (2, 2, 3, '2023-07-02', null);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        3,
        3,
        2,
        '2023-07-03',
        '2023-07-09'
    );

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (4, 3, 4, '2023-07-04', null);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        5,
        3,
        6,
        '2023-07-05',
        '2023-07-13'
    );

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        6,
        3,
        5,
        '2023-07-06',
        '2023-07-20'
    );

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (7, 4, 1, '2023-07-07', null);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        8,
        5,
        3,
        '2023-07-08',
        '2023-07-21'
    );

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (9, 5, 4, '2023-07-09', null);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (10, 6, 2, '2023-07-10', null);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        11,
        1,
        2,
        '2022-08-06',
        '2022-08-31'
    );