--Определить, сколько книг прочитал каждый читатель в текущем году.Вывести рейтинг читателей по убыванию.

-- SELECT reader_fullname, COUNT(book_id) AS total_book

-- FROM cardbook

--     JOIN reader ON cardbook.reader_id = reader.reader_id

-- GROUP BY reader_fullname

-- ORDER BY total_book DESC;

----------------------------------------------------------------------------------

--Определить, сколько книг у читателей на руках на текущую дату.

-- SELECT COUNT(book_id) FROM cardbook

-- WHERE cardbook.cardbook_on < CURRENT_DATE AND cardbook_off IS NULL;

----------------------------------------------------------------------------------

-- Определить читателей, у которых на руках определенная книга.

-- SELECT reader_fullname, book_name

-- FROM cardbook

--     JOIN public.reader r ON r.reader_id = cardbook.reader_id

--     JOIN public.book b ON b.book_id = cardbook.book_id

-- WHERE book_name LIKE 'BCCC';

----------------------------------------------------------------------------------

-- Определите, какие книги на руках читателей.

-- SELECT reader_fullname, book_name

-- FROM cardbook

--     JOIN public.reader r ON r.reader_id = cardbook.reader_id

--     JOIN public.book b ON b.book_id = cardbook.book_id

-- WHERE cardbook_off IS NULL;

----------------------------------------------------------------------------------

-- Вывести количество должников на текущую дату.

-- SELECT reader_fullname, book_name

-- FROM cardbook

--     JOIN public.reader r ON r.reader_id = cardbook.reader_id

--     JOIN public.book b ON b.book_id = cardbook.book_id

-- WHERE cardbook_on + INTERVAL '14 day' < current_date AND cardbook_off IS NULL;

--Или если просто количество.

-- SELECT

--     count(reader_fullname) AS TOTAL

-- FROM cardbook

--     JOIN public.reader r ON r.reader_id = cardbook.reader_id

--     JOIN public.book b ON b.book_id = cardbook.book_id

-- WHERE

--     cardbook_on + INTERVAL '14 day' < CURRENT_DATE

--     AND cardbook_off IS NULL;

----------------------------------------------------------------------------------

--Книги какого издательства были самыми востребованными у читателей ? Отсортируйте издательства по убыванию востребованности книг.

-------

--Запрос с учетом популярности книг

-- SELECT

--     count(cardbook.book_id) AS total,

--     book_name,

--     isdat_name

-- FROM cardbook

--     JOIN public.book b ON b.book_id = cardbook.book_id

--     JOIN public.isdat i ON i.isdat_id = b.book_isdat

-- GROUP BY

--     cardbook.book_id,

--     book_name,

--     isdat_name

-- ORDER BY total DESC;

-------

--Запрос с учетом популярности издательства.

-- SELECT

--     DISTINCT(isdat_name) isdat_name,

--     count(cardbook.book_id) as total

-- FROM cardbook

--     JOIN public.book b ON b.book_id = cardbook.book_id

--     JOIN public.isdat i ON i.isdat_id = b.book_isdat

-- GROUP BY isdat_name

-- ORDER BY total DESC;

----------------------------------------------------------------------------------

--Определить самого издаваемого автора.

-- SELECT

--     author.author_fullname,

--     count(author.author_fullname) AS total

-- FROM book

--     LEFT JOIN author_book ON book.book_id = author_book.book_id

--     LEFT JOIN author ON author_book.author_id = author.author_id

-- GROUP BY

--     author.author_fullname

-- ORDER BY total DESC;

----------------------------------------------------------------------------------

--Определить среднее количество прочитанных страниц читателем за день.

-- SELECT

--     DISTINCT (cardbook.reader_id),

--     reader_fullname,

--     book_name,

--     book_list / avg( (

--             DATE_PART('day', cardbook.cardbook_off) - date_part('day', cardbook.cardbook_on)

--         )

--     ) AS total_day

-- FROM cardbook

--     JOIN public.book b ON b.book_id = cardbook.book_id

--     JOIN public.reader r ON r.reader_id = cardbook.reader_id

-- WHERE

--     cardbook_off IS NOT NULL

-- GROUP BY

--     reader_fullname,

--     book_name,

--     book_list,

--     cardbook.reader_id

-- ORDER BY cardbook.reader_id;