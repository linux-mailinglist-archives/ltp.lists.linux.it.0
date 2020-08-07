Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7723ECB9
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:41:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CFE43C3204
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:41:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A5E9B3C260F
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:41:37 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20136.outbound.protection.outlook.com [40.107.2.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 46C25140112E
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:41:37 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfHo5Vg0FQvIT5EFqpT5lau1PElQb+BmD9JMZOmYGkX64zLty+1xr9alO1zgYaIZiHJuD984fseEYrHmn3gZfCXlTIukbz0voVaqZOfEgn4zfdyclHUogDd/DVHugEjjvzfplnNGtYxWK+DCmIRIkxE5GfvmHxl6/l2ZS88AfntZtM0D4AbRfuEwWKJNjGLEj58lcVB8FNEArYDeNYXCfjmAnEtlUKpWo9Xg3Yt9CZW3tYve701u7Xov+ENkCWd0v/osezIdT8ekksanfZ7Y4SEmI+Ea26eeQkd1O6wP4Q2RBrbM4O2CZNbma0Jf03SC4SIZaBM9Wo2obdxK9W6CBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2EoIyLMkdtqgE23to0zSmQ021TDxJGzDdTX7z4tSFU=;
 b=QoVQIbPJHs9LPAU3pA5pTgRhM8nKxRUR4VU1QkO8toOrv5ol2gdXZVrZN4zYUbDLQ/l+HbA8R0AhTwKHtfDEzqATO7LF8tQuE1d/AWvVVknw879n0afEOH15R4bCtza10p692Rrl0itD8t3w5PGvTAx1qMdjVD7nZKQ4bWhTRrYwy1MSZNFCyvMwrVsILQEa1alnSivGLC4ILawlMmodXe7+Akxugyr9pU/rkcaDwSl3PSq4ac1gczWr82chc+y/fL1Mw8JdRjqiaGu+47OggTcSdnQnMV/QQsMsZDkt7fxPKbkzC9dkngDHSoFEHnXDFGg7/u84ABJxulPEDcZiNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2EoIyLMkdtqgE23to0zSmQ021TDxJGzDdTX7z4tSFU=;
 b=KJdytY/kgAX1fV9PI/nvBY7mbsGQuufihaXm7FmjMdouH+nYHvMgIwCakkKwknJarMmo1BcFJHxno1RNjck0CzU+7ZLUgk5ksdmIbn5ogDBhJyW2Vuc6TRqPfuwF3AJB878YvzHjEqbyFr4XD01x/uajYaDP/nG4t9JaRWY8o+o=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AM6PR03MB4839.eurprd03.prod.outlook.com (2603:10a6:20b:8a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Fri, 7 Aug
 2020 11:41:29 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::f5ac:9ad:533:e589]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::f5ac:9ad:533:e589%3]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 11:41:29 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Fri,  7 Aug 2020 13:39:47 +0200
Message-Id: <20200807113950.69052-1-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: GV0P278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:26::18) To AM6PR03MB5233.eurprd03.prod.outlook.com
 (2603:10a6:20b:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.235) by
 GV0P278CA0008.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:26::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.18 via Frontend Transport; Fri, 7 Aug 2020 11:41:28 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.235]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d44aaaa-442c-467a-7c68-08d83ac6d2ff
X-MS-TrafficTypeDiagnostic: AM6PR03MB4839:
X-Microsoft-Antispam-PRVS: <AM6PR03MB4839DD629B439D4246F017ACEB490@AM6PR03MB4839.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DiArYpkjzbc8zwm37iw1KYuSEOueIsUUoLaBnbv9EpBBejIrNggw2ENfkNo2y9l96hz6+J3osTqDumjajCf9xvT7OrpDwHZcDBr2hOFZmXEO8qk/4eX1OmyLqTAIQZyQk7+Hq88BYYkhSQNNo55DGNv16PQSWS5O4fe3/czmomOZOqPZG/NeSMOJseWZheKk8BzAdABEus9lfDKZp/PCIfd98B0urDaDhsJuM4o5t3acGuW2KgxYIiZJn4bwnGhSYzaI3B6H8U7rFyYn7TLqyUKJp6pds0sTlN9MX8YYnl/4s3cQwCV07YaAdKM06CZ7Bp1TMnMW1RzQmUONN70BUbrn3IxNSOiEHphH0z7clXarSfHm7DcrGo6utQOOeu1y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(346002)(39830400003)(396003)(366004)(66476007)(1076003)(66556008)(66946007)(4326008)(16526019)(36756003)(186003)(8936002)(8676002)(26005)(316002)(508600001)(6512007)(6506007)(52116002)(5660300002)(6486002)(69590400007)(956004)(86362001)(2616005)(6916009)(83380400001)(6666004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: hFqGqIjODLa3BrEcuPpovETBVz1NheSfGWD703ME3nQSk19tnKFB3lGkSu3FukuwyoHi+FEINQ8/m/x9GnT9vbIZfJXi7IbdUq1wc/hMDFPYifoI+B+pLrD2ceMQhxjdCU1kJunWYJYRSa7iEHZFJwRmz6OypjnD9bTun3gGe/2BrUNqN0W4oL5LFViMpPrBknI+aJ7NxvqylTfPuDQPSFvzh02yftAADhH5Zm47Es0eK2dcZ5RaGsncs6Hh7mXOx7mu9+0kvGvMAyPK9mMogMxeIzBtbILsKYsOVvAMLv51Kg0dWl45dA3QLstm0hN04u64qsLUgAa56ZRbhsNhGQP96MT0wPOeYBoAHnx+P5Ub2S1B0JyhmDPgpa8G5W9ubLnt14jbFP0h1LJXiAy6ZsySiThdswKiA0I+9Ad7uWWkeohIrBOiaWYVhA8lDnKzs80pXGdJyeO1+AGZ/j8gTlSa3zCHiRAZnayl0cvEV7e2pRvnMERMR2p9242nRb8+Lno21lcTi7B5guMNwtmbk4SHZqb7ee+U+ctfqn92RnbPl/FuhO1Z8Bp5+X1E/F2DVtgChwLD4G5ZL17Xvl+azc23pdWPxXJ8L2fcq1cdR9z7M0sQ8+Zcuykyd5xN0Ij7HArJ6mEwWJS6RzbD1NA95g==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d44aaaa-442c-467a-7c68-08d83ac6d2ff
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 11:41:29.3288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bp5IUv2KXEo0/KjYihgD/sBIkidb4sTdSz6ptSMy9jeAr9q9Rr8c1wVsycf1cFCB6Uvt35MN2x+kjg05+G0yzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4839
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/3] testcases/kernel/syscalls: Adding new
 testcases for existing tests
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: laurent@vivier.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This series introduces new test cases for existing tests for syscalls

    * mq_timedsend()        * sendmmsg()
    * mq_timedreceive()     * recvmmsg()
    * clock_nanosleep()

* First patch in the series introduces bad address test cases for
  'mq_timedsend()' and 'mq_timedreceive()'

* Second patch in the series introduces bad timespec address cases
  for 'clock_nanosleep()'

* Third patch in the series introduces a timeout case and an errno
  test for 'sendmmsg()' and 'recvmmsg()'

More detailed descriptions of these newly added test cases and the
implementation details can be found in this series patch commit
messages.

These new test cases are part of my work of implementation for 2038
safe variants of the above mentioned syscalls in QEMU:

    * mq_timedsend_time64()
    * mq_timedreceive_time64()
    * clock_nanosleep_time64()
    * recvmmsg_time64()

These test cases are needed to make sure that QEMU implementations of
the above mentioned time64 syscalls work properly.

These test cases are also used to fix some minor issues with already
existing implementations of regular variants of these syscalls.

v2:

    * Changed bad address values from (void *)1 to using function
      'tst_get_bad_addr()'
    * Removed unnecessary implementation descriptions that can be
      seen from the patches

Filip Bozuta (3):
  syscalls/mq_timed{send|receive}: Add test cases for bad address
  syscalls/clock_nanosleep: add a test case for bad timespec address
  syscalls/{send|recv}mmsg: add a test case for timeout and errno test

 runtest/syscalls                              |   1 +
 .../clock_nanosleep/clock_nanosleep01.c       |  35 ++-
 .../mq_timedreceive/mq_timedreceive01.c       |  15 +-
 .../syscalls/mq_timedsend/mq_timedsend01.c    |  29 ++-
 testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     |  68 ++++--
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     | 231 ++++++++++++++++++
 testcases/kernel/syscalls/utils/mq_timed.h    |   2 +
 8 files changed, 362 insertions(+), 20 deletions(-)
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg02.c

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
