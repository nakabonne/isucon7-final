#!/bin/bash
cd $(dirname $0)
mysql --default-character-set=utf8mb4 -uroot -pnakao < $(pwd)/drop.sql
mysql --default-character-set=utf8mb4 -uroot -pnakao isudb < $(pwd)/isudb.sql
mysql --default-character-set=utf8mb4 -uroot -pnakao isudb < $(pwd)/m_item.sql
