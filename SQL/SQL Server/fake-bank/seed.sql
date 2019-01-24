USE FAKEBANK
GO

INSERT INTO customers (
    firstName,  lastName,   madeAt
)
VALUES
    ('Argus',   'Helmut',       CONVERT(datetime, '2015/01/17 02:38:19', 120)),
    ('Eden',    'Tyson',        CONVERT(datetime, '2013/04/03 18:12:23', 120)),
    ('Teo',     'Greenberg',    CONVERT(datetime, '2011/06/22 08:14:53', 120)),
    ('Maeve',   'Braband',      CONVERT(datetime, '2013/07/11 18:45:09', 120)),
    ('Vico',    'Joshi',        CONVERT(datetime, '2009/11/26 05:02:04', 120)),
    ('Radko',   'Baines',       CONVERT(datetime, '2003/03/07 12:53:11', 120))
GO

SELECT * FROM customers
GO

INSERT INTO accounts (
    customerID, balance,    accountType,    madeAt    
)
VALUES
    (1,         88.00,      'checking',     CONVERT(datetime, '2015/01/17 02:38:19', 120)),
    (1,         5091.41,    'saving',       CONVERT(datetime, '2015/01/17 02:38:19', 120)),
    (2,         9783.21,    'checking',     CONVERT(datetime, '2013/04/03 18:12:23', 120)),
    (2,         2000.91,    'saving',       CONVERT(datetime, '2013/04/03 18:12:23', 120)),
    (3,         4058.45,    'checking',     CONVERT(datetime, '2011/06/22 08:14:53', 120)),
    (3,         4104.32,    'saving',       CONVERT(datetime, '2011/06/22 08:14:53', 120)),
    (4,         3335.09,    'checking',     CONVERT(datetime, '2013/07/11 18:45:09', 120)),
    (4,         7272.41,    'saving',       CONVERT(datetime, '2013/07/11 18:45:09', 120)),
    (5,         9748.38,    'checking',     CONVERT(datetime, '2009/11/26 05:02:04', 120)),
    (5,         88.03,      'saving',       CONVERT(datetime, '2009/11/26 05:02:04', 120)),
    (6,         6950.21,    'saving',       CONVERT(datetime, '2003/03/07 12:53:11', 120)),
    (6,         5757.84,    'saving',       CONVERT(datetime, '2003/03/07 12:53:11', 120))
GO

INSERT INTO transactions (
    accountID,  amount,     madeAt    
)
VALUES
    (1,     438.00,         CONVERT(datetime, '2016/01/05 05:53:56', 120)),
    (1,     93.02,          CONVERT(datetime, '2017/08/13 19:18:58', 120)),
    (2,     919.02,         CONVERT(datetime, '2017/03/24 20:24:33', 120)),
    (1,     366.00,         CONVERT(datetime, '2017/06/04 04:45:27', 120)),
    (1,     26.02,          CONVERT(datetime, '2018/07/19 03:12:50', 120)),
    (1,     158.02,         CONVERT(datetime, '2017/05/02 13:21:16', 120)),
    (2,     192.05,         CONVERT(datetime, '2018/06/19 07:53:23', 120)),
    (1,     93.01,          CONVERT(datetime, '2016/02/13 18:52:26', 120)),
    (1,     283.01,         CONVERT(datetime, '2018/01/23 14:36:44', 120)),
    (2,     313.01,         CONVERT(datetime, '2017/04/13 03:58:03', 120)),
    (1,     691.02,         CONVERT(datetime, '2017/05/12 03:12:28', 120)),
    (2,     773.00,         CONVERT(datetime, '2017/03/20 16:42:55', 120)),
    (2,     542.08,         CONVERT(datetime, '2017/08/06 23:42:11', 120)),
    (1,     253.02,         CONVERT(datetime, '2016/06/12 23:45:50', 120)),
    (1,     1078.02,        CONVERT(datetime, '2018/07/15 03:42:44', 120)),
    (4,     93.03,          CONVERT(datetime, '2015/11/04 16:16:57', 120)),
    (4,     1052.05,        CONVERT(datetime, '2017/10/23 23:52:14', 120)),
    (3,     345.04,         CONVERT(datetime, '2015/09/22 16:43:33', 120)),
    (3,     1001.00,        CONVERT(datetime, '2014/04/13 01:40:37', 120)),
    (4,     773.00,         CONVERT(datetime, '2014/07/25 19:02:59', 120)),
    (4,     58.01,          CONVERT(datetime, '2015/03/15 08:43:24', 120)),
    (4,     181.03,         CONVERT(datetime, '2018/09/10 02:54:23', 120)),
    (4,     763.07,         CONVERT(datetime, '2016/02/15 10:10:05', 120)),
    (4,     19.08,          CONVERT(datetime, '2014/09/24 15:04:06', 120)),
    (4,     747.01,         CONVERT(datetime, '2017/02/19 08:23:12', 120)),
    (3,     696.04,         CONVERT(datetime, '2015/03/06 17:41:12', 120)),
    (3,     47.07,          CONVERT(datetime, '2017/05/08 09:18:21', 120)),
    (4,     507.06,         CONVERT(datetime, '2015/10/22 23:44:42', 120)),
    (3,     00.08,          CONVERT(datetime, '2018/02/02 03:50:57', 120)),
    (4,     77.03,          CONVERT(datetime, '2014/12/24 13:52:08', 120)),
    (5,     375.02,         CONVERT(datetime, '2012/03/10 12:15:13', 120)),
    (6,     87.08,          CONVERT(datetime, '2014/12/14 04:43:21', 120)),
    (6,     569.07,         CONVERT(datetime, '2012/04/03 02:53:47', 120)),
    (6,     36.05,          CONVERT(datetime, '2013/05/11 02:43:32', 120)),
    (6,     768.06,         CONVERT(datetime, '2016/12/11 01:09:41', 120)),
    (6,     89.02,          CONVERT(datetime, '2018/11/22 14:02:38', 120)),
    (5,     705.06,         CONVERT(datetime, '2012/01/20 08:05:05', 120)),
    (6,     65.08,          CONVERT(datetime, '2012/04/05 04:59:32', 120)),
    (5,     82.06,          CONVERT(datetime, '2017/08/10 11:33:59', 120)),
    (6,     377.04,         CONVERT(datetime, '2018/05/14 10:03:12', 120)),
    (5,     506.00,         CONVERT(datetime, '2016/08/05 07:23:24', 120)),
    (6,     37.05,          CONVERT(datetime, '2012/10/05 04:19:16', 120)),
    (6,     896.01,         CONVERT(datetime, '2013/08/13 13:37:01', 120)),
    (5,     33.08,          CONVERT(datetime, '2018/10/23 22:05:32', 120)),
    (6,     596.03,         CONVERT(datetime, '2015/11/05 10:42:52', 120)),
    (10,    612.07,         CONVERT(datetime, '2017/09/09 17:27:33', 120)),
    (10,    821.01,         CONVERT(datetime, '2018/02/22 06:33:58', 120)),
    (9,     350.04,         CONVERT(datetime, '2014/02/22 02:51:58', 120)),
    (10,    753.08,         CONVERT(datetime, '2016/03/13 10:02:14', 120)),
    (9,     72.00,          CONVERT(datetime, '2016/11/13 19:14:06', 120)),
    (10,    910.07,         CONVERT(datetime, '2015/09/18 23:23:13', 120)),
    (9,     13.02,          CONVERT(datetime, '2017/12/22 01:51:39', 120)),
    (9,     930.02,         CONVERT(datetime, '2017/06/04 18:36:47', 120)),
    (10,    433.08,         CONVERT(datetime, '2018/02/19 14:08:09', 120)),
    (10,    524.00,         CONVERT(datetime, '2015/09/09 05:18:58', 120)),
    (10,    451.00,         CONVERT(datetime, '2016/01/03 18:58:28', 120)),
    (10,    792.08,         CONVERT(datetime, '2015/12/23 17:33:24', 120)),
    (10,    376.06,         CONVERT(datetime, '2016/05/18 14:33:51', 120)),
    (10,    155.07,         CONVERT(datetime, '2017/06/08 01:54:55', 120)),
    (10,    930.05,         CONVERT(datetime, '2015/10/07 01:18:16', 120)),
    (10,    492.08,         CONVERT(datetime, '2016/01/11 22:33:38', 120)),
    (9,     560.07,         CONVERT(datetime, '2012/10/21 04:47:19', 120)),
    (9,     320.01,         CONVERT(datetime, '2014/06/05 20:22:32', 120)),
    (9,     35.06,          CONVERT(datetime, '2014/01/05 01:15:35', 120)),
    (10,    409.06,         CONVERT(datetime, '2014/01/16 07:44:41', 120)),
    (9,     403.00,         CONVERT(datetime, '2011/05/13 08:49:27', 120)),
    (9,     908.02,         CONVERT(datetime, '2011/03/18 04:17:19', 120)),
    (9,     290.00,         CONVERT(datetime, '2011/02/17 08:34:57', 120)),
    (10,    974.01,         CONVERT(datetime, '2018/09/03 10:33:04', 120)),
    (9,     328.05,         CONVERT(datetime, '2014/07/11 08:46:22', 120)),
    (10,    458.05,         CONVERT(datetime, '2014/03/04 10:50:32', 120)),
    (10,    52.08,          CONVERT(datetime, '2011/03/10 19:44:25', 120)),
    (10,    945.06,         CONVERT(datetime, '2015/12/22 13:32:37', 120)),
    (10,    387.07,         CONVERT(datetime, '2016/02/24 18:38:14', 120)),
    (10,    519.02,         CONVERT(datetime, '2013/09/03 07:22:17', 120)),
    (12,    833.08,         CONVERT(datetime, '2015/11/13 04:01:29', 120)),
    (11,    230.01,         CONVERT(datetime, '2017/08/18 23:40:28', 120)),
    (12,    725.07,         CONVERT(datetime, '2016/05/23 16:42:14', 120)),
    (11,    646.02,         CONVERT(datetime, '2013/02/21 04:37:41', 120)),
    (12,    243.07,         CONVERT(datetime, '2010/07/02 17:53:47', 120)),
    (11,    266.01,         CONVERT(datetime, '2013/07/06 07:37:51', 120)),
    (12,    162.04,         CONVERT(datetime, '2011/04/22 18:54:51', 120)),
    (12,    284.00,         CONVERT(datetime, '2013/09/03 18:30:28', 120)),
    (11,    723.05,         CONVERT(datetime, '2018/02/19 05:24:20', 120)),
    (12,    96.08,          CONVERT(datetime, '2015/04/11 07:56:17', 120)),
    (12,    929.05,         CONVERT(datetime, '2012/12/06 12:47:07', 120)),
    (12,    485.08,         CONVERT(datetime, '2014/02/12 04:26:18', 120)),
    (12,    616.01,         CONVERT(datetime, '2012/06/14 12:38:23', 120)),
    (12,    410.00,         CONVERT(datetime, '2010/06/09 23:22:23', 120)),
    (12,    757.01,         CONVERT(datetime, '2015/10/17 17:54:53', 120)),
    (12,    525.07,         CONVERT(datetime, '2016/06/08 09:11:11', 120)),
    (12,    457.03,         CONVERT(datetime, '2016/08/14 21:06:38', 120)),
    (11,    505.07,         CONVERT(datetime, '2014/06/06 08:33:19', 120)),
    (12,    598.08,         CONVERT(datetime, '2015/11/12 21:58:55', 120)),
    (12,    929.08,         CONVERT(datetime, '2017/07/10 22:37:28', 120)),
    (12,    740.03,         CONVERT(datetime, '2016/04/01 06:25:37', 120)),
    (12,    458.02,         CONVERT(datetime, '2018/11/25 05:39:52', 120)),
    (12,    999.08,         CONVERT(datetime, '2013/07/07 06:50:58', 120)),
    (12,    411.03,         CONVERT(datetime, '2012/02/25 15:27:05', 120)),
    (12,    341.01,         CONVERT(datetime, '2010/10/06 19:55:26', 120)),
    (12,    446.04,         CONVERT(datetime, '2016/02/08 13:21:02', 120)),
    (11,    135.08,         CONVERT(datetime, '2017/03/22 03:56:28', 120)),
    (12,    43.00,          CONVERT(datetime, '2013/09/25 19:21:05', 120)),
    (12,    395.04,         CONVERT(datetime, '2012/04/02 10:29:56', 120)),
    (11,    325.05,         CONVERT(datetime, '2013/01/20 19:02:11', 120))
GO

-- const startYear  = 2009

-- function pad(num) {
--     var s = num+"";
--     while (s.length < 2) s = "0" + s;
--     return s;
-- }

-- let i= 30
-- while(i-- > 0) {

--   const id = (Math.random() >= 0.5) ? 11 : 12 ;
--   const amount = 10 + Math.floor(Math.random() * Math.floor(1000)) + '.' + 
--   pad(Math.floor(Math.random() * Math.floor(9)))
--   const year = startYear + 1 + Math.floor(Math.random() * Math.floor(2018 - startYear))
--   const month = pad(1 + Math.floor(Math.random() * Math.floor(12)))
--   const day = pad(1 + Math.floor(Math.random() * Math.floor(25)))
--   const hour = pad(1 + Math.floor(Math.random() * Math.floor(23)))
--   const minute = pad(1 + Math.floor(Math.random() * Math.floor(59)))
--   const second = pad(1 + Math.floor(Math.random() * Math.floor(59)))
--   const final = `(${id}, ${amount}, CONVERT(datetime, '${year}/${month}/${day} ${hour}:${minute}:${second}', 120)),`
--   console.log(final)
-- }