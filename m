Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BD9AFC69
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 14:21:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B93C63C20C6
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 14:21:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 510C23C1481
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 14:21:48 +0200 (CEST)
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id F1B5A1003AA0
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 14:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tZg8a
 hPVN3ZRuhugSJha+KOyWsbPUuE3V78vYNwe2ik=; b=bmW/rig4nf+cudiRUggTm
 +h5LTLrDS++39imPMlZ7boH6zeZkfSWvirZ5Bm+fJ04yH7drJmz7r3i1+4udZuac
 uwfY3dSqAIAwSR50qZs+Se47l/njxEy093/SCfiUIvdKF3JkcU7dkIMTjN9WP9aa
 c7H7o8U1xVnx/ZyF+lLXeE=
Received: from localhost.cn (unknown [114.247.175.195])
 by smtp9 (Coremail) with SMTP id NeRpCgCH2nrW5nhdpfZwAg--.1966S2;
 Wed, 11 Sep 2019 20:21:42 +0800 (CST)
From: "Wu,Haiqiang" <frequentemail@126.com>
To: frequentemail@126.com,
	ltp@lists.linux.it
Date: Wed, 11 Sep 2019 20:21:41 +0800
Message-Id: <20190911122141.28113-1-frequentemail@126.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CM-TRANSID: NeRpCgCH2nrW5nhdpfZwAg--.1966S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWUWw15trWkGF1fXrWUurg_yoW8Ww4kpF
 9Fvrs2vr4fJF1kAw40qws5ur1rJw45XF4xGF4jyw4fGr4xAF1UW34v9Fy2vasIqrZxW3yS
 yF4ktr4Fgw1rtaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRqiihUUUUU=
X-Originating-IP: [114.247.175.195]
X-CM-SenderInfo: 5iuh135hqwvzxdloqiyswou0bp/1tbi7RYtHFpD8jnnEgAAst
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

Signed-off-by: Wu,Haiqiang <frequentemail@126.com>
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
