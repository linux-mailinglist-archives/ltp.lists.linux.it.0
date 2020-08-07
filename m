Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B5323ECB7
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:41:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 900B83C31F2
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:41:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 3F0AD3C260F
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:41:37 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20136.outbound.protection.outlook.com [40.107.2.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BD8351401133
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:41:36 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyIHl3PM0jNdi7XrQirFHDEvvx69J5gDl9DHUcOeCccpmSEQDlCnAAvy7cyBmOn3UMfOxgZSavOqZxc5BH7oS8tDic72si/DK1zDUstK3ykGo5TiKFPSOwHgJmBsYrwQ7BH5zlNipzHGm1aMFeaC+rjNEJ/mn6Ae7L4AohGwOTh3UxIlSNVCN1jM3al+oZsj2xxL6lhVYsgUXJfvcBXi8YrI34Ti47XIXYbjegBLnbiIb20Sj1wjAIIMWVX5bcjLIT6DP5Zb7nE4w3V3zeBu9jQUksgV5iptOOw0vQmyNw2j/3QnB7QVnSNS6N68b9BUMqe38J8zXKgOyFCUGryy2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKy65TvRSaok3KyrSMwUv4mk+1bnS+mmGGo6X2S6hnU=;
 b=BsnOO6Zc3ZvHcBl747F7UPrkQbQa0tymrvJJqZ+jTFKq8zFnmbO5refD91McGiDH58X5znmWKZx8kdSPbNebvZ5djPNuFO3p/TTLloZVToS5/3l9cVvAm/mxMIz2efQ8HcZoz4UBgyktc9THyiGj+SQYGIeDabj/KYzlQpmSLhsmL9Q/o/gBSVyrlYr/qsxDo399K0u2N4qJn33VXqUxdzimLOWb/GRf5XkAugDjX16BdyxOAiMmL2e2wbUKadFLJUlWP1GJPD4uVVR5WnKf/5nEjlgZEnC6SxR+836TDbdr90z/xVyEheCkQMlsYrNjZUo8U+60zM3N9xWFTS05jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKy65TvRSaok3KyrSMwUv4mk+1bnS+mmGGo6X2S6hnU=;
 b=IguSQsonD7ioSGl50PQZz13TKba6lP4TPi1rxV6XCl5CUYMcsKMOzDRC6gUQll2/dPyVXBfjTB7EFQL7CRlPm0YmE2YwbgOkgcqSE3Q8ZryuHCzJ5QqsfH6UtB0pwQpbjjhu+LUg7Bhu+CLFuDv/Utos4sPyjYCNlPhuBwHSutE=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AM6PR03MB4839.eurprd03.prod.outlook.com (2603:10a6:20b:8a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Fri, 7 Aug
 2020 11:41:30 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::f5ac:9ad:533:e589]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::f5ac:9ad:533:e589%3]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 11:41:30 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Fri,  7 Aug 2020 13:39:48 +0200
Message-Id: <20200807113950.69052-2-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807113950.69052-1-Filip.Bozuta@syrmia.com>
References: <20200807113950.69052-1-Filip.Bozuta@syrmia.com>
X-ClientProxiedBy: GV0P278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:26::18) To AM6PR03MB5233.eurprd03.prod.outlook.com
 (2603:10a6:20b:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.235) by
 GV0P278CA0008.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:26::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.18 via Frontend Transport; Fri, 7 Aug 2020 11:41:29 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.235]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22231bc0-b632-431f-8586-08d83ac6d37e
X-MS-TrafficTypeDiagnostic: AM6PR03MB4839:
X-Microsoft-Antispam-PRVS: <AM6PR03MB4839BEE7DEB440599C6F5427EB490@AM6PR03MB4839.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6zrgfW5Ay2LDOyXp/ipVmAEDUv5T5XtjJET5mzAhWw5zyuH1h073GG1HANsOGRtcaPY7yqYbEy6k5a2+wv+B2BlM/kp1Kp0wwhjFfVlCHiRs3njCnfr6c89ulBRkNywEVgILSB78MKAvqHsJ3yC0/xJhonVbbfprxOLN0yyfUPlcDkarndQdGKhWghxh96phlTg4Z2KaxsOvE/NUWg74MBT2ToYgDGdFCQ38peBnnCqxsaauvFOtdzaVPtiWWxYT4UC2FzQspgrA/GUgl5UpoUYD0x9eyOnV4FEWYkQVYSCjkbRPiGPITGXD/+dVxG30b/MiDLNmTG2m0IvMcU5tqpJaiV26wsAHhWwvfCuo960FoZJg+AdR7kmoUUT7G0f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(346002)(39830400003)(396003)(366004)(66476007)(1076003)(66556008)(66946007)(4326008)(16526019)(36756003)(186003)(8936002)(8676002)(26005)(316002)(508600001)(6512007)(6506007)(52116002)(5660300002)(6486002)(69590400007)(956004)(86362001)(2616005)(6916009)(83380400001)(6666004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: NeUx0Y4B55IgQfWdayXO2lMORAP00fKxKAdZQ0+zQMaE8bHCD0j1VEmcyAjou+KHC4s9xDAzTUKcXGJ/YUpWIT1U1iBGLrTkKFRqQycJlv5X8IEnLYZ3HV/lM70e7IvBr3efdtQHqF3RYEFMRceiB6VSegWpsaOxAMXohhgXh+8C99EvQxck2yi3AX3AjZFqVOVCIBbUY9vfMV5jRufOuBCvpnQ1WYIdf9lXxTpi8/hIo6sq52H2rVX/fOUGv05KfCkCLOIZY0oG67LYGFU/apH0/uivlzVRx7s1jiP7hTN3roUjGCx//9FoLfYAkShpOOMGif/3DGIdqLYL9ArmJR0aVDTLHWFbXRmI+eJ7zuTNhzelNViTEQfrHpHNqfZvm7yyAZ1tRGQFHY5vNETtzrxBdBb5PrkVEwpbB5dGEffbJgezjvjaSOoT3G9TlnH7yGMLNgMjoZ7KS3RGLdNI0NapodvSdsCifyi0hCl8gGCcCEDx8ceXG3Nmt9fNeJciTWOb/V7HttQ+fg9L1Qh3cHZcabxJ2DOtWoOYQ4s3Yi1ksVRdT4Kv8ztG0lU7kNWndx/bVX4z+fdVpQHzOyOLy4UT1GMW2Bd1+G8az03bBTTFbcZETlgz+iVd6DMtCcKTyV57PhfUwN4YtoOeOOFCTA==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22231bc0-b632-431f-8586-08d83ac6d37e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 11:41:30.0984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFP1klFBUjp7jFDGD6N1zVN3SZNqe8szKpWjKC8Kkf8e1+9FIu7eiH7o6/aS+e6LQTsO+ZHteVgQiTLrvgSeDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4839
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] syscalls/mq_timed{send|receive}: Add test
 cases for bad address
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

This patch introduces test cases for already existing
tests for syscalls 'mq_timedsend()' and 'mq_timedreceive()'
(mq_timedsend01, mq_timedreceive01). These test cases are for
situations when bad addresses are passed for arguments 'msg_ptr'
and 'abs_timeout' in which case errno 'EFAULT' is expected to be set.

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
---
 .../mq_timedreceive/mq_timedreceive01.c       | 15 +++++++++-
 .../syscalls/mq_timedsend/mq_timedsend01.c    | 29 +++++++++++++++++--
 testcases/kernel/syscalls/utils/mq_timed.h    |  2 ++
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
index 8e24651c9..d99538e4b 100644
--- a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
+++ b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
@@ -123,6 +123,13 @@ static struct test_case tcase[] = {
 		.ret = -1,
 		.err = EINTR,
 	},
+	{
+		.fd = &fd,
+		.len = 16,
+		.bad_ts_addr = 1,
+		.ret = -1,
+		.err = EFAULT,
+	}
 };
 
 static void setup(void)
@@ -144,6 +151,7 @@ static void do_test(unsigned int i)
 	size_t len = MAX_MSGSIZE;
 	char rmsg[len];
 	pid_t pid = -1;
+	void *abs_timeout;
 
 	tst_ts_set_sec(&ts, tc->tv_sec);
 	tst_ts_set_nsec(&ts, tc->tv_nsec);
@@ -164,7 +172,12 @@ static void do_test(unsigned int i)
 	if (tc->invalid_msg)
 		len -= 1;
 
-	TEST(tv->receive(*tc->fd, rmsg, len, &prio, tst_ts_get(tc->rq)));
+	if (tc->bad_ts_addr)
+		abs_timeout = tst_get_bad_addr(cleanup_common);
+	else
+		abs_timeout = tst_ts_get(tc->rq);
+
+	TEST(tv->receive(*tc->fd, rmsg, len, &prio, abs_timeout));
 
 	if (pid > 0)
 		kill_pid(pid);
diff --git a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
index f7fc2c533..7e220f297 100644
--- a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
+++ b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
@@ -129,6 +129,20 @@ static struct test_case tcase[] = {
 		.ret = -1,
 		.err = EINTR,
 	},
+	{
+		.fd = &fd,
+		.len = 16,
+		.bad_msg_addr = 1,
+		.ret = -1,
+		.err = EFAULT,
+	},
+	{
+		.fd = &fd,
+		.len = 16,
+		.bad_ts_addr = 1,
+		.ret = -1,
+		.err = EFAULT,
+	}
 };
 
 static void setup(void)
@@ -150,6 +164,7 @@ static void do_test(unsigned int i)
 	size_t len = MAX_MSGSIZE;
 	char rmsg[len];
 	pid_t pid = -1;
+	void *msg_ptr, *abs_timeout;
 
 	tst_ts_set_sec(&ts, tc->tv_sec);
 	tst_ts_set_nsec(&ts, tc->tv_nsec);
@@ -168,7 +183,17 @@ static void do_test(unsigned int i)
 			}
 	}
 
-	TEST(tv->send(*tc->fd, smsg, tc->len, tc->prio, tst_ts_get(tc->rq)));
+	if (tc->bad_msg_addr)
+		msg_ptr = tst_get_bad_addr(cleanup_common);
+	else
+		msg_ptr = smsg;
+
+	if (tc->bad_ts_addr)
+		abs_timeout = tst_get_bad_addr(cleanup_common);
+	else
+		abs_timeout = tst_ts_get(tc->rq);
+
+	TEST(tv->send(*tc->fd, msg_ptr, tc->len, tc->prio, abs_timeout));
 
 	if (pid > 0)
 		kill_pid(pid);
@@ -179,7 +204,7 @@ static void do_test(unsigned int i)
 				"mq_timedsend() failed unexpectedly, expected %s",
 				tst_strerrno(tc->err));
 		else
-			tst_res(TPASS | TTERRNO, "mq_timedreceive() failed expectedly");
+			tst_res(TPASS | TTERRNO, "mq_timedsend() failed expectedly");
 
 		if (*tc->fd == fd)
 			cleanup_queue(fd);
diff --git a/testcases/kernel/syscalls/utils/mq_timed.h b/testcases/kernel/syscalls/utils/mq_timed.h
index 3a99d9eef..a217e864e 100644
--- a/testcases/kernel/syscalls/utils/mq_timed.h
+++ b/testcases/kernel/syscalls/utils/mq_timed.h
@@ -41,6 +41,8 @@ struct test_case {
 	int send;
 	int signal;
 	int timeout;
+	int bad_msg_addr;
+	int bad_ts_addr;
 	int ret;
 	int err;
 };
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
