Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 78770246464
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 12:22:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE1103C58CB
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 12:22:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CBFAB3C300B
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 12:22:48 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50134.outbound.protection.outlook.com [40.107.5.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E6B5C601DBA
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 12:22:47 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFvcTliVqeS3x3cqxa8K9sVo8d18EqMCUn+DDGybEWLljv8jqwk9rfbqSZykIsLEiDRg5JCe848by73aa/xY5JzkGyOnNXR0Nh36vPcBn8/tr0kSFVKHsF65EdzqiZ6o8DdNwUIo14Yp2C1gydS2iwE3VfdSjr4DiXzrQgJg2KmDLTibzBFvtLQtwN5iOuluOp+6fOjzMnNFPwRGD20liJpbdrqrKQ7mDy6j+XEjIgxNPwdkgxk+4c/GafdakGI4eSLkJpTXrTBUaUH2nvLJkzae328E5qlDsq/zgrtOQqLh9I0JaremUHPS0Mlgz/AthxYok73GR+ra5arPLG1Wng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq8O5DzpQQgiWpF8NnlkDdul6/M86b7PGVTaAbTUh7k=;
 b=m5zkyzpzCNbC5tG1ScHcBcB77s3E3j7vOQ9qtL4V5GUOppyn7NdyphdCOw3eni0fNrG3bsZWHMASJJLIhwnJ98sjavulQ6wX5vwRegcA6j/+VsVRCB0GjrVMaygOksxfhyj9rXqeibpPaMAhFuWme5mriQqUQZgt9IMnGdVmBU60gaMT+yThhkW7oyrU1kUzyzYU32Z1Etaxmiw7c8XG/aKiPznI4G6NsbmxsAfPz/5VdEmvvUgGAGAkU/ix1vyyB/J/DPIgxlSscznrg09BHolPMUJ1P1MMtlaPpyJFptMZLt6xzg80M6j7GWWpd0BfzHnK9U50q3AUyBqNl2FWPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq8O5DzpQQgiWpF8NnlkDdul6/M86b7PGVTaAbTUh7k=;
 b=qEwd5teRVQUQQEgc84/pcyrnuQPcUc0NwKx0zUe/kPAUI2yBsrjo8+Ui8VbnKS/oy5ZU1XNmRqu9WkeGXvhoLAU06lg3KPYncRD0PrG4OkOjys2Oa7ipeZ/xIiNl6qOvQg1W6sSdbi41Hs3o4FjhtLcK6uWPexXSu9nbeLwNvJc=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com (2603:10a6:802:a1::22)
 by VI1PR03MB3056.eurprd03.prod.outlook.com (2603:10a6:802:30::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.26; Mon, 17 Aug
 2020 10:22:45 +0000
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362]) by VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362%6]) with mapi id 15.20.3261.026; Mon, 17 Aug 2020
 10:22:45 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Mon, 17 Aug 2020 12:22:30 +0200
Message-Id: <20200817102232.5902-1-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: GV0P278CA0045.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::14) To VE1PR03MB5246.eurprd03.prod.outlook.com
 (2603:10a6:802:a1::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.238) by
 GV0P278CA0045.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:29::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15 via Frontend Transport; Mon, 17 Aug 2020 10:22:45 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.238]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c30237c6-7c83-4022-47cc-08d842977ba1
X-MS-TrafficTypeDiagnostic: VI1PR03MB3056:
X-Microsoft-Antispam-PRVS: <VI1PR03MB3056E4E20CE2E07FF6255DECEB5F0@VI1PR03MB3056.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bULE1wGVfKYetpXc7XZl0LIqhuuYqukArxzYGr6okLKPwx4VGoOcSOAAR/d1HKkpAgcj4z+ARiuz9StAbvtPXzWpCq+kuz01Wqa0gEIHICGmBFt65wPGMf6m+qlCBfNPRxNjoCN5OCst5OpRRKWbjt/A2qi6H76zpWLrkOGYbS7IH6uUP6NE6OTaH7bpD11ZtJpYpE3pQmQpfKaXYFJhdLRz/M/L9+5stAQs9wOaCy8rY9Hr5WEGj6Nyt3QxKxTSXZa/43mvdTtulLgNuM1AY/dxEl1fB0YtW0WjqcT1BB0dFxj8cclVDGZzP0T2DEDg4aAiIb2ALYfCW5hTY7KEwIgHjGeEB/X+NANER9gp4lXr7oE2Xkssd0BFLbb82vt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5246.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(346002)(39830400003)(376002)(6486002)(26005)(83380400001)(478600001)(8936002)(16526019)(86362001)(52116002)(186003)(2906002)(5660300002)(6506007)(956004)(8676002)(66946007)(66556008)(1076003)(66476007)(4326008)(6512007)(6666004)(69590400007)(316002)(36756003)(6916009)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 7Ucg9igSofw9OfydZUwzJpC7/II5bGm5n32T+FqNrW/MlbyO6rEPoc0kY6aT7fH3KDJDqKVqb7y/8enu4/xLgEnPDqO01ykSPEWkPMaLw6SeScwQ2C+qiE+ehbMH2OtWGok54Hxd4I/s3dzLmQ16kdOGOQxTknZwjemCI+8k9uZJ20/OP1CF+mQuFELvkwxeLXhHOyoKyt1GDCmgIE26tEnpq3PTsekCzhMfIBrJevKN9UmeHocj4voj1LVnxAvQsTJreQMbshn+4E1LUx9z4PK5MB4pokbzls9Wzqn5PEWowpcUyaQByYUsxaSxErj/g2dWQURPam/GReCsd3gm+Py4RATzqWEIvr7y6YBPshNK7TCktku8yuGfUXrS53UTVQmPRSoK18dxGApYc3cDBROiueq1bF9peDePfGWpssSwwWM+BvmwwdhgbgBEIXJqCBkP+i+cqhLOWNFCR9nPEXhkawemhA6/dHaqWAL0YDM3B6EYbvuSU8cKjswSxTAJkDitTlk8lrWx3IaF9T8dGIzO3QzX1sXWoK+pBb5se0MWUgNmO5M5Ew49G4erTaO780vg5fvdFQwdTnRNgRaRN0QPqQfPmjEvp/nvWUMVwj16LWt0vsuNL5JhSvTP7Zx4AC2lo2VxxjK/5paWPONNnQ==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30237c6-7c83-4022-47cc-08d842977ba1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5246.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 10:22:45.6796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4P0vaq3iVAGgYP5PMxfJn/RtMwwIRg2LMwtFRKp/AGqlhiGTKPiTsvrNV84T13vdrPv773olvJW5b2fG0haiFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3056
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/2] testcases/kernel/syscalls: Adding new
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

    * clock_nanosleep()
    * sendmmsg()
    * recvmmsg()

* First patch in the series introduces bad timespec address cases
  for 'clock_nanosleep()'

* Second patch in the series introduces a timeout case and an errno
  test for 'sendmmsg()' and 'recvmmsg()'

More detailed descriptions of these newly added test cases and the
implementation details can be found in this series patch commit
messages.

These new test cases are part of my work of implementation for 2038
safe variants of the above mentioned syscalls in QEMU:

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

v3:
    * Removed first patch from the series as it got pushed
    * Moved the bad adrress intilization in the test 'setup()' part

Filip Bozuta (2):
  syscalls/clock_nanosleep: add a test case for bad timespec address
  syscalls/{send|recv}mmsg: add a test case for timeout and errno test

 runtest/syscalls                              |   1 +
 .../clock_nanosleep/clock_nanosleep01.c       |  43 +++-
 testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     |  68 +++--
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     | 235 ++++++++++++++++++
 5 files changed, 329 insertions(+), 19 deletions(-)
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg02.c

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
