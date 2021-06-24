Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6BD3B26DD
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 07:34:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3655B3C8E23
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 07:34:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 22F983C6F63
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 07:33:44 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9F9571000F4F
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 07:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1624512822; i=@fujitsu.com;
 bh=RuuPTTe0L1hZ0Aoj6badOf/t0InuA1UyMlpeLfy9KbE=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=V7BZlEsNxwDplZzFr4R8dOxrvQBxshphsrmZpPZs8mJSuwwfVamaq0IvR/n8wiWbi
 +e1rMPv90HJBe7wm+Mngv68+IFYyIEBWRLEZDU73l+is+4+uH+9m6pV9uvH9mU+/Pf
 spPe428o23hPI1eP6PawdbW/Ad/AqhpesaVosacJxlWgFIyGxYgF+Kaq7KD09kS7PT
 lZwk6oRbdLZ4QxcEKngSpyer61LvWsqa9DDinUN5a3dFxOK68eDPcTfWWnAUzCUEQj
 fxxAW5x2Cc57bP6FDKWVWRp2ydQdcILMZoUN2UdRKF4UM69Odd/+0onc1aG/Xsz0SC
 hGyrIECWYvFOQ==
Received: from [100.113.7.10] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.eu-central-1.aws.symcld.net id C3/96-33341-63914D06;
 Thu, 24 Jun 2021 05:33:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MRqmsqeSX
 BYMEWPYvpL46yWaz4voPRgclj3+91rB5nFhxhD2CKYs3MS8qvSGDNWP86uOC4SMXNtS4NjJ94
 uhi5OIQEXjNKrJrVy9rFyAnk7GGU+PdZDcRmE9CUeNa5gBnEFhEQlfg8/RyYzSxgK/H84SU2E
 FtYwEvi3JTTYL0sAqoSu/Y1sncxcnDwCnhI3FuVBhKWEFCQmPLwPTNImFPAU2JXszaIKSSQKH
 H5uDJIBa+AoMTJmU9YIIZLSBx88YIZolNR4lLHN0YIu0JixoxtbBMY+WchaZmFpGUBI9MqRsu
 kosz0jJLcxMwcXUMDA11DQ2NdU10jA0O9xCrdJL3UUt3k1LySokSgrF5iebFecWVuck6KXl5q
 ySZGYGimFLKe3ME46c0HvUOMkhxMSqK89/mvJAjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4L0lC
 pQTLEpNT61Iy8wBxglMWoKDR0mE96MwUJq3uCAxtzgzHSJ1ilFRSpz3uxhQQgAkkVGaB9cGi8
 1LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR574BM4cnMK4Gb/gpoMRPQYoXfF0EWlyQipKQ
 amBYnL3y/Ze88kdgpEYHiu0v8Jy9z+cwa6tq5gM1jTwzL4wu1ymIZfF0SM1pFFV2jb3ytuut/
 /ppQiPKb869UvxUWO0ut6Txz8Gke18TAecevRa7teD/7dJO+ypqtgpYxs7Zvr2+92Jx4oPOEb
 iZ7266N2uunCT378OzV/ajMeTzp9wsYnbMc3/00MQy9Nc0toStD4llw6Ymj3c3LGM4wOYcten
 u5d2nHxsoPUr7nlnyVEFl7+PzkLK4jx/9nHhOXiblnPn/l6d9GgX9jporaJZ/99vrIu2fKCt/
 XmChpMixfn5U631nBPFmi5cZ71tpNRyxCZPZZqd7//35djAzftNWfjh3MaLxtrJX0eZ5KzWcl
 luKMREMt5qLiRAAYL7LxSAMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-9.tower-245.messagelabs.com!1624512821!84530!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3391 invoked from network); 24 Jun 2021 05:33:41 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-9.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Jun 2021 05:33:41 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O5Xbw9027551
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 24 Jun 2021 06:33:37 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 06:33:27 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 24 Jun 2021 13:33:46 +0800
Message-ID: <1624512827-3256-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624512827-3256-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <YNM4rlDJLzb4xk6v@yuki>
 <1624512827-3256-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/3] include/tst_test_macro.h: Add TST_EXP_FAIL2
 macros
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 doc/c-test-api.txt        | 11 +++++++++++
 include/tst_test_macros.h |  8 ++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index 4cccbdc10..e3ca27696 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -281,6 +281,17 @@ The 'TST_EXP_FAIL()' is similar to 'TST_EXP_PASS()' but it fails the test if
 the call haven't failed with -1 and 'errno' wasn't set to the expected one
 passed as the second argument.
 
+[source,c]
+-------------------------------------------------------------------------------
+static void test(void)
+{
+	...
+	TST_EXP_FAIL2(msgget(key, flags), EINVAL, "msgget(%i, %i)", key, flags);
+	...
+}
+The 'TST_EXP_FAIL2()' is the same as 'TST_EXP_FAIL' the only difference is that
+the return value is a non-negative integer if call passes.
+
 [source,c]
 -------------------------------------------------------------------------------
 const char *tst_strsig(int sig);
diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 89dfe5a31..78cee47de 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -120,13 +120,13 @@ extern void *TST_RET_PTR;
 			TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
 	} while (0)                                                            \
 
-#define TST_EXP_FAIL(SCALL, ERRNO, ...)                                        \
+#define TST_EXP_FAIL_(PASS_COND, SCALL, ERRNO, ...)                            \
 	do {                                                                   \
 		TEST(SCALL);                                                   \
 		                                                               \
 		TST_PASS = 0;                                                  \
 		                                                               \
-		if (TST_RET == 0) {                                            \
+		if (PASS_COND) {                                               \
 			TST_MSG_(TFAIL, " succeeded", #SCALL, ##__VA_ARGS__);  \
 		        break;                                                 \
 		}                                                              \
@@ -150,4 +150,8 @@ extern void *TST_RET_PTR;
 		}                                                              \
 	} while (0)
 
+#define TST_EXP_FAIL(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET == 0, SCALL, ERRNO, __VA_ARGS__)
+
+#define TST_EXP_FAIL2(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET >= 0, SCALL, ERRNO, __VA_ARGS__)
+
 #endif	/* TST_TEST_MACROS_H__ */
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
