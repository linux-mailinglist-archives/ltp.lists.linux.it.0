Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE1023ECB6
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:41:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DAE03C31E9
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:41:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C6A973C260F
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:41:36 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20136.outbound.protection.outlook.com [40.107.2.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EB7001401139
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:41:35 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuMds6WzFr0m4MH5dfyqv8HFPfzhMeB+PV879um/gvIvrzcrozSGrlvJX8YMSpC36RtI2SMz3ws3Le3jDUzy+3L617Oe9A5ky/58PEIB8z0c28fak3H2J4D7t33cLa7hhDRMGfFYS9iGlip2RHe9tRZS9x4NBsJcBuWrW/lQfUEbMiAASoPLjagemjb4xufJzuXg2C2eALIS1RGHdTVy75QIUOkWH6sGvOFA1lQR+qxz+sTLM0ACmoYPvAkV+YoSXf56rm3Jby5878421/FIptD9tmZxmaO8aDShbTBCMYzZhvJakZpay7m8oYJyLm/gB8A9JOsl5Hi3BXqwRrJUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+Mr0WJ6Bp2OXt5p+zFb9DUqbFSJulGOPP6sV0+ZiFw=;
 b=NmJ6nqd3VAd0ocOpYFjDLoV/5pUj37HKp2fe4+ajr0Kzb9oM1vCVwY+XUtfy20CNiweJQVFNLJT0TVyCYKZIsMroWNpB+tV7I32L5yi/DVTjYtOLI1npZffyVULFl5OI1hirqKJmzQN2iyO4t0ILEsKsr69OAJ/ZkXqywGQdvGHau58oE//2kMlulsbJy0R1iF0ML9P8s/fVidz/N99LPAtS3VtoLfvrNKOYVeCMr68kyu0FyiI3L7YYaJ5thT+4RzlDgQo33hSczj+v2+vunGPQ66335ZGhe+tnjNfOsP4puAyD/POPonBx/ZgCy0h82m4M9BTtEKG4dhkpCIzi/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+Mr0WJ6Bp2OXt5p+zFb9DUqbFSJulGOPP6sV0+ZiFw=;
 b=pHfFTIEX9THDDxMXEt+AzdCh5U2bd526AhWi7C9FYVg2zibH4fqzqgBdNFdFVDzHqYjzPrfZZq2CQuY06jbGMHHU+YM88DgYwVjo1myke0RZ7kutQ9r8r7i3VQg7JWFYt/IZpCQC6+YfAUzZaQZyxCHW0zpWDkkoMF6g2wm69Yw=
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
Date: Fri,  7 Aug 2020 13:39:49 +0200
Message-Id: <20200807113950.69052-3-Filip.Bozuta@syrmia.com>
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
 15.20.3261.18 via Frontend Transport; Fri, 7 Aug 2020 11:41:30 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.235]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55639520-8be1-4c9f-1250-08d83ac6d3e6
X-MS-TrafficTypeDiagnostic: AM6PR03MB4839:
X-Microsoft-Antispam-PRVS: <AM6PR03MB4839FD8CFEDAF5DFC9E5A563EB490@AM6PR03MB4839.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CXo4CgedS4V2VdMGoUz0KwYIBINJvwWsoFV1U/2/bFpFtlTuDQHfiSaOGzr/hOGaLq3KsJAqZftMvAboIY+49WXHMWiJqtRcX//w/3unuv0bJBmlLSahxa87E2rS6KaZvEzk/yzZBTeTrYTkQ8DrV5c6s6cWX+OtVzpWIo8kaeJUabUcT6v95ADg1pptKLyNN+9jR7ze+F8vnEwcec+TlOQ9+GrS29vJ9Dp+HnkEX0m+ek8ONsVTrnAQTb0RteeTBM4NfUS0f2i4BYdMqTrkH+LjKYAmLN8XZB5Xn2B4LQHbK8ble1ZXwO2LzsBAi+aLgkwGOudqLGOC9W4Ha4o6Vc9qlRqGviakgzZi3Yt9CW+3FUr+4Sfz3f4F/ro0Mj60
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(346002)(39830400003)(396003)(366004)(66476007)(1076003)(66556008)(66946007)(4326008)(16526019)(36756003)(186003)(8936002)(8676002)(26005)(316002)(508600001)(6512007)(6506007)(52116002)(5660300002)(6486002)(69590400007)(956004)(86362001)(2616005)(6916009)(83380400001)(6666004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: K7y2QsVAHN10Cgt8bLqhtLGKjPNvAz/l7zKzfGaQrNQRelBC23oHFyEZQG4qjpRihBgZcKTFHpwW0xcMxu9eJSFstlUBdXreCtEzIa75jVu46PJEGSLPM+J/YmBOwWwWTYrEZ5UczbJ7ngN0cN2TyPD6Wam8PHBwtGi/O+d11AliBqFmGjHexQS1MqAP45OCtu1fJXqIScn4ehH9qiOv6JZURBvJ+zZizOjfKUwPs0kZdTFk+7+Zx1Sp9ZT0nNi32QdmnTrI+6NWJu6kFXwyJ22LdRAKO5vonVdHfQ6adAfy6abg36Uq2lRbR3oqKRlC0iZ5RGnHJZXJWcQQN0amt9D5blidi3wBVYwmNW79n1n/vLnrO9gIM/kTs/Dvd2+o5/yHKhelP+kPn5w/rVZVY23s4ga4hlbajGNHK1nE7pCcNVdYjZydXj12sYZae0CCcXXDywUFjWL5RiWFo0FQ+lJDsWbY3b0R0X8Ffq95NxoyBQ8bUvapqAjk6rXYOzSH1RKM1Gc9Jxku4flam6W9k9WF4LDIwuulc5mkjinafma2+82oUZpxJoho7R6P600zyl2NrZXOD67KUa78L8vuzyD7ifsOcV8egHkF9lYIzg9jm6i14rNeMjRNlfcysTp9mg0qxbjqrDUpo07jfCJpYg==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55639520-8be1-4c9f-1250-08d83ac6d3e6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 11:41:30.7870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSPpC+u7mGt4D5nPxa2LjcRno+2TlLddp8wUYRtfNM0N7HJfq3f4p4YMNW7AC1ifsP0f4FrN8HMu4LkBgdkTZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4839
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] syscalls/clock_nanosleep: add a test case for
 bad timespec address
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

This patch introduces test cases for already existing test
for syscall 'clock_nanosleep()' (clock_nanosleep01). These test
cases are for situations when bad timespec addresses are passed
for arguments 'request' and 'remain' in which case errno
EFAULT ('Bad address') is expected to be set.

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
---
 .../clock_nanosleep/clock_nanosleep01.c       | 35 +++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
index 4542995f2..66108ed8e 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
@@ -20,6 +20,8 @@ static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
 enum test_type {
 	NORMAL,
 	SEND_SIGINT,
+	BAD_TS_ADDR_REQ,
+	BAD_TS_ADDR_REM,
 };
 
 #define TYPE_NAME(x) .ttype = x, .desc = #x
@@ -78,6 +80,22 @@ static struct test_case tcase[] = {
 		.exp_ret = -1,
 		.exp_err = EINTR,
 	},
+	{
+		TYPE_NAME(BAD_TS_ADDR_REQ),
+		.clk_id = CLOCK_REALTIME,
+		.flags = 0,
+		.exp_ret = -1,
+		.exp_err = EFAULT,
+	},
+	{
+		TYPE_NAME(BAD_TS_ADDR_REM),
+		.clk_id = CLOCK_REALTIME,
+		.flags = 0,
+		.tv_sec = 10,
+		.tv_nsec = 0,
+		.exp_ret = -1,
+		.exp_err = EFAULT,
+	},
 };
 
 static struct tst_ts *rq;
@@ -106,24 +124,37 @@ void setup(void)
 	SAFE_SIGNAL(SIGINT, sighandler);
 }
 
+void cleanup(void) {}
+
 static void do_test(unsigned int i)
 {
 	struct test_variants *tv = &variants[tst_variant];
 	struct test_case *tc = &tcase[i];
 	pid_t pid = 0;
+	void *request, *remain;
 
 	memset(rm, 0, sizeof(*rm));
 	rm->type = rq->type;
 
 	tst_res(TINFO, "case %s", tc->desc);
 
-	if (tc->ttype == SEND_SIGINT)
+	if (tc->ttype == SEND_SIGINT || tc->ttype == BAD_TS_ADDR_REM)
 		pid = create_sig_proc(SIGINT, 40, 500000);
 
 	tst_ts_set_sec(rq, tc->tv_sec);
 	tst_ts_set_nsec(rq, tc->tv_nsec);
 
-	TEST(tv->func(tc->clk_id, tc->flags, tst_ts_get(rq), tst_ts_get(rm)));
+	if (tc->ttype == BAD_TS_ADDR_REQ)
+		request = tst_get_bad_addr(cleanup);
+	else
+		request = tst_ts_get(rq);
+
+	if (tc->ttype == BAD_TS_ADDR_REM)
+		remain = tst_get_bad_addr(cleanup);
+	else
+		remain = tst_ts_get(rm);
+
+	TEST(tv->func(tc->clk_id, tc->flags, request, remain));
 
 	if (tv->func == libc_clock_nanosleep) {
 		/*
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
