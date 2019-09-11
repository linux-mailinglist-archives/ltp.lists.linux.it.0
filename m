Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D053AFC4D
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 14:13:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3E913C20A9
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 14:13:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 33B963C1481
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 14:13:50 +0200 (CEST)
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C7B7B2014BF
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 14:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=jQZI0
 S74JnvgqJBgZZymS71Szy75Z9lSAR0br+Va/kQ=; b=TSl8aMe/NTAF/vYLVJ6xV
 72hFzdqDJgqOLm2zgrEleyni3gBhoVDPpLy0YirYjcR4kb9dQdvKgT/N1o1HmslD
 VfvFZ7UPJldGlD3E+pYJPK7mVsgHHddsAc8QTyBDHdLMgWfqyIkufQaPOeKXkyK/
 jreu4hGbpb5UWjT73oPJAY=
Received: from localhost.cn (unknown [114.247.175.195])
 by smtp10 (Coremail) with SMTP id NuRpCgDnzlH15HhdVXwiMg--.3606S2;
 Wed, 11 Sep 2019 20:13:42 +0800 (CST)
From: "Wu,Haiqiang" <frequentemail@126.com>
To: frequentemail@126.com,
	ltp@lists.linux.it
Date: Wed, 11 Sep 2019 20:13:39 +0800
Message-Id: <20190911121339.1359-1-frequentemail@126.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CM-TRANSID: NuRpCgDnzlH15HhdVXwiMg--.3606S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4rGryUKF15Kr45GF4Durg_yoW8WF48pF
 9FvrZ2vr4fJF1kAw40qws5Cr1rJw45XF4xGF4jyw4fGr4xAF1UW3Wv9Fy2vas0grZxW3yS
 yF4ktr4Fgw1rtaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRhmiiUUUUU=
X-Originating-IP: [114.247.175.195]
X-CM-SenderInfo: 5iuh135hqwvzxdloqiyswou0bp/1tbi2hAtHFuwKPOJWAAAsa
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] [Fixes]:#570
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

---
 testcases/kernel/syscalls/dup2/dup201.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/testcases/kernel/syscalls/dup2/dup201.c b/testcases/kernel/syscalls/dup2/dup201.c
index 4507ac19a..066428edf 100644
--- a/testcases/kernel/syscalls/dup2/dup201.c
+++ b/testcases/kernel/syscalls/dup2/dup201.c
@@ -75,9 +75,6 @@ int maxfd;
 int goodfd = 5;
 int badfd = -1;
 int mystdout = 0;
-int fd, fd1;
-int mypid;
-char fname[20];
 
 struct test_case_t {
 	int *ofd;
@@ -86,17 +83,14 @@ struct test_case_t {
 	void (*setupfunc) ();
 } TC[] = {
 	/* First fd argument is less than 0 - EBADF */
-	{
-	&badfd, &goodfd, EBADF, NULL},
+	{&badfd, &goodfd, EBADF, NULL},
 	    /* First fd argument is getdtablesize() - EBADF */
-	{
-	&maxfd, &goodfd, EBADF, NULL},
+	{&maxfd, &goodfd, EBADF, NULL},
 	    /* Second fd argument is less than 0 - EBADF */
-	{
-	&mystdout, &badfd, EBADF, NULL},
+	{&mystdout, &badfd, EBADF, NULL},
 	    /* Second fd argument is getdtablesize() - EBADF */
-	{
-&mystdout, &maxfd, EBADF, NULL},};
+	{&mystdout, &maxfd, EBADF, NULL},
+};
 
 int main(int ac, char **av)
 {
@@ -137,12 +131,6 @@ int main(int ac, char **av)
 					 strerror(TC[i].error));
 			}
 		}
-		/* cleanup things in case we are looping */
-		for (j = fd1; j < maxfd; j++) {
-			sprintf(fname, "dup201.%d.%d", j, mypid);
-			(void)close(j);
-			(void)unlink(fname);
-		}
 	}
 	cleanup();
 
@@ -163,7 +151,6 @@ void setup(void)
 
 	/* get some test specific values */
 	maxfd = getdtablesize();
-	mypid = getpid();
 }
 
 /*
@@ -172,6 +159,5 @@ void setup(void)
  */
 void cleanup(void)
 {
-
 	tst_rmdir();
 }
-- 
Wu,Haiqiang<frequentemail@126.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
