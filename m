Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8B92501D8
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 18:16:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA9923C2FC0
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 18:16:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3236E3C1D45
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 18:16:19 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5E8FE200AEA
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 18:16:18 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqwO/xSRzMnSuhQkwq+rE2EE76beQbwZeCQukBHRRp0A9RhTZ3Zwx1zDkRaFpPEvufOmzjlL89uwH4J4VEJseDzq8AmQhAdmUJCiRs/Gi0cY2FNGyuyWAP4e54b4GsUmJWDbzM9Ddv5dOrtB6ICaQNEGMnZcirn8cWNrlzGSLaJBxzUWVIC0Rseiw2Wu8UpQ+Ek+a6SWXALyGTC+12m2fVKkp2DoR/tHz92oFdOLQ3Kyy8jr0d8lgi3VxFWpx4QnHNSDKmiDD/E8VEb3E+NEtm0GZhIO5BoNe+NsTS98w+n2I5qnnVC2VQQmObhsY0tdTDVE+6mvtU4LUTVbllVQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc4BNqwaiBXAH5FNsCIa4Z2Smm+hMEeBdQULKOw5V6o=;
 b=blDAERu1+PfHJ6D8R/6k+vqAxtM6AAARNJtZHXZiIbC+p5pmBVWQAeymOEbSFu0tMVp28CJvfbf6PkmS+qeNCfn5fNxNMnODdhiJht6ARM6vlFHjgXYKIxIpUj08GgldrizEJKEXKzsBKe/ylVxUr2jrjowDKteUcB1OEZbvKn2zyGJhMS40SJHm0ooUSvQf5pC6XZb4EVVF31R1Na0FaHb3b411OLAy+/+WTkxxJuw3qtdmxsrGKjlU9orwwN1Um5hOH0tv/+45geylScDZi51uhWCcXjBwTxwYtLWsPP9jdxE/L/cYVEa60sx/Txt5xMAd6nwByB0nvM0E2jyPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc4BNqwaiBXAH5FNsCIa4Z2Smm+hMEeBdQULKOw5V6o=;
 b=Vyr2tHDyUKBhYABoCqQbdcNjMwU4FwSFjKbiozHNwZL8WwrbGTdYRQ1xnjYBdh+97EUQ/fO3BZ+v3VyBR+qOV0igJbAYlb5h7cXTGKcztoyMQfgvyqZK0g2Q1cDrbespd8SzwimSQVmi70Ty3U6NANGFQRvUPZQ0dzj8iQmTKxw=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com (2603:10a6:802:a1::22)
 by VI1PR03MB5055.eurprd03.prod.outlook.com (2603:10a6:803:c5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 16:16:17 +0000
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362]) by VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362%6]) with mapi id 15.20.3261.026; Mon, 24 Aug 2020
 16:16:15 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Mon, 24 Aug 2020 18:15:37 +0200
Message-Id: <20200824161538.53815-1-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: AM4PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:200:89::12) To VE1PR03MB5246.eurprd03.prod.outlook.com
 (2603:10a6:802:a1::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.235) by
 AM4PR0202CA0002.eurprd02.prod.outlook.com (2603:10a6:200:89::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Mon, 24 Aug 2020 16:16:15 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.235]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 331e9722-e86b-4d15-6d91-08d8484906a8
X-MS-TrafficTypeDiagnostic: VI1PR03MB5055:
X-Microsoft-Antispam-PRVS: <VI1PR03MB5055864CCFA2530EB4043419EB560@VI1PR03MB5055.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gD1TxE05BuXIJZcZeWFGYZUHt1N4qVacCPD9WDYUWCdN7taPDhTtTIk4OnZ8pQ9c9kTqqWaq7zPrPm5poykk/mLkgfCtK/P3YtMvZjP8bZ1/OpnmxyKUO1rVL+7VNJd8ihRZ8VsGfIuCjrBBjpDPYv7hKFgoPM5L+ufeLrUIXUqrsjQi5Xry7gnzRcwqgZFhmDyVF5oHBBJpkaDtRRTGj5l1CHBsZ86LtIqOr9XTvOFxQqy9xYvwiNYkWYVst1cK8Vz6KEdtCD5FpFKo6+0/8WxTYTGsG9Jv2iR3C9Kj85DGAYaNAra27i3ssXawds72D7HoD0OOMzvF645zUz4E7r0XIKfgWiRNDl4Qq2vdeOC7uIFuOKOAOCz2Hy1W6gT4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5246.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39830400003)(346002)(376002)(396003)(52116002)(1076003)(6506007)(5660300002)(8936002)(69590400007)(26005)(16526019)(36756003)(186003)(8676002)(6916009)(956004)(66556008)(66476007)(478600001)(2906002)(86362001)(6486002)(6512007)(83380400001)(2616005)(66946007)(4326008)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Nc4Fxvl1jihqUM4ZTJuzbI36x3zUL59fZC6T9aUS1ZfU1v9l4dCJKQIqqGFGvOcqHoyOlqgxD9e/5ZI7lce9OSf1j2NNjDQwvgirYhQGoHewCxTZRggcYKz1Ai/NOKl7kE4XhBCk3GaNRR4UzgcrLubdLbF06s/2llkGKQYVKG6JcCAPNThvKdAgQDqxUMFqXGV6OJdyt7ZBW4avmQYPxTBZlj2c+OwNAcFg9DZEsgesMU22g4ynj0gY1tdcQ0Pbrc4Kvu+JXCU4CUTIxdmDFaHVL3B0vCjBzfBhDF1hrddV0lngfqExe4N3GW2uSHAHxultgPtkmw0KyUlV462kR7kWy+RE4RfxifXLOUvnOu4PLjNnz86Hxel1j+x+ukaYKFHRBMXUHvI9rTnzJ3Or7oh3nzQ/MH+JhrghoZKz69mBYESP7O4Ii5LuXkyNz0r8yld09gf4L0vUCMbOWtELRyXzWHzLEGXTPYOARjiT4DjjtS2jdbckE55D/q0Vqt2GWlE5QAeSF08H0aqaLvfZVBT1V5qWPC0SqJx4cxW41LyaVfg8jB767ZopLmegMUww94xgQZ3EuyXWAKggAp2BxVUIWaJc5wyFfUr9rzFFyYhgFEox5l7Gtpa9vp0CB23dOa54GyQYEhNS23AdScy+aA==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331e9722-e86b-4d15-6d91-08d8484906a8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5246.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 16:16:15.7557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cM0McinjrDtgKwqrrteDnkjEtXI0ttW3zPyUDzPIK3Bx5xsHfrdMd4plXICVzuSmRdMZ7kXNWL7DP3xgbiiEaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB5055
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/1] testcases/kernel/syscalls: Adding new
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

This series introduces new test cases for existing tests for syscalls:

    * sendmmsg()
    * recvmmsg()

These new test cases are part of my work of implementation for 2038
safe variants of the above mentioned 'recvmmsg()':

    * recvmmsg_time64()

These test cases are needed to make sure that QEMU implementation of
the above mentioned time64 syscall works properly.

v2:

    * Changed bad address values from (void *)1 to using function
      'tst_get_bad_addr()'
    * Removed unnecessary implementation descriptions that can be
      seen from the patches

v3:

    * Changed the timeout test to make the second message be received
      after the timeout so that it doesn't brake the test with option
      '-i n'
    * Created a separate 'recvmmsg01.c' where the errno test cases for
      'recvmmsg()' are moved
    * Create a common header 'sendmmsg.h' where all the other necessary
      headers along with the 'test_variants' array, test 'setup()' and
      'test_cleanup()' for files 'sendmmsg01.c', 'sendmmsg02.c',
      'recvmmsg01.c'

Filip Bozuta (1):
  syscalls/{send|recv}mmsg: add a test case for timeout and errno test

 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/recvmmsg/Makefile   |   7 +
 .../kernel/syscalls/recvmmsg/recvmmsg01.c     | 127 +++++++++++++++
 testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
 testcases/kernel/syscalls/sendmmsg/sendmmsg.h |  87 ++++++++++
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 150 +++++++-----------
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     |  80 ++++++++++
 7 files changed, 362 insertions(+), 93 deletions(-)
 create mode 100644 testcases/kernel/syscalls/recvmmsg/Makefile
 create mode 100644 testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg.h
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg02.c

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
