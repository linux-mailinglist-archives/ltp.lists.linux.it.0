Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 784833B70E9
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:44:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF5683C8D88
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:44:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 894F43C1CC3
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:44:34 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 66D2E200B8C
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1624963472; i=@fujitsu.com;
 bh=cml1GTJvDpwYy0dAXPK2ez0smXqCeUi9XQNDm5zy9AY=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=yCxEl0B7mSCs/EXnQNyADgrv/JlHenLPCQtLYUdoXlU2wUWReF6FSchFD8gJB85KD
 bXNFr1lLzbHH+GoWvF98IGc9NBhpGPEIHKq2CKusJzTYiPkuHQ2tio4weErPB0Oyup
 z1b+NlM+e4PoH1Sl8UlVim3hGSKb8Ceknys1Pm+E7fwOGEYTRqWQNKqYL6HgllpzLo
 hSuTOyiIo5P4HiEAtgmv0hB9Q0pvR0LjDZbVgWF0OSKfXMUuLgd/47jAlm8ZmrlH3g
 2TkMJh88zCwKbT82ooDzTfM1fbqun8wwZ481sO0BimjexOSlGOfxdID8m8ttw6NQ9F
 mFucB17PleUGg==
Received: from [100.113.0.182] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 2C/77-39611-099FAD06;
 Tue, 29 Jun 2021 10:44:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxVbf/560
 EgwUN5hbTXxxls1jxfQejA5PHvt/rWD3OLDjCHsAUxZqZl5RfkcCasbFvPWvBBd2K7ysWMjcw
 /lHvYuTiEBJ4zSjRdm0WM4Szh1Fiyu7r7F2MnBxsApoSzzoXMIPYIgKiEp+nnwOzmQVsJZ4/v
 MQGYgsLuEu8PgZRzyKgKvHs3S+gOAcHr4CHxNZTpSBhCQEFiSkP34O1cgqoSFzpfsUKYgsJKE
 v8/HUJLM4rIChxcuYTFojxEhIHX7xghuhVlLjU8Y0Rwq6QmDFjG9sERv5ZSFpmIWlZwMi0itE
 yqSgzPaMkNzEzR9fQwEDX0NBY11DXyMBcL7FKN1EvtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeX
 WrKJERikKYWM53cwTn3zQe8QoyQHk5Io7/zjtxKE+JLyUyozEosz4otKc1KLDzHKcHAoSfDqf
 gfKCRalpqdWpGXmACMGJi3BwaMkwrsPJM1bXJCYW5yZDpE6xagoJc5rCJIQAElklObBtcGi9B
 KjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV6ZH0BTeDLzSuCmvwJazAS0eNGTmyCLSxIRUlI
 NTNFeV/eu2nQ2+rFMnKjhWeEDhq+WRsbdO/b2qE/LV7PF5q/NxXLXNyktOFOwzUb41rsb2ab6
 R10tH5R5LDeRPeYd8uX0Tu1NC848O6TRFrGFNV9DaKGJrYFbapNoM/eOFwmXpj2dPrHQNFq68
 Xsb04u1H9uZu4svXRbYr7iwZZnr9wmPlPe2hW882bix4N/0oAmNIs4hnblvxE7+33jJPMBnpq
 2IeZHHzUcCDT4TY5+ZXuQwmqqzWaWhrLbhxiUtzwCZjrhzO2b9Mf9qc+D+irqX//9LcFrfEuu
 T7+1LeZxW83g7N0eYx4P7GekCO1r3OfedPDFPtXXPxqPLunu/MTxqLZG85JcvuPdz/eRlCkos
 xRmJhlrMRcWJAG7ATVdNAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-13.tower-226.messagelabs.com!1624963471!24818!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20939 invoked from network); 29 Jun 2021 10:44:31 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-13.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2021 10:44:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15TAiJ8U002334
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 29 Jun 2021 11:44:24 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 11:44:16 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <chrubis@suse.cz>
Date: Tue, 29 Jun 2021 18:44:45 +0800
Message-ID: <1624963486-6614-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <YNHCQ8qWSBdHIAra@yuki>
References: <YNHCQ8qWSBdHIAra@yuki>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls: Use more accurate TST_EXP_FAIL2 macro
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

For these modified files, the return value is expected to be non-negative integer
if call passes. So they should use TST_EXP_FAIL2 macro.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/accept/accept01.c             | 2 +-
 testcases/kernel/syscalls/adjtimex/adjtimex02.c         | 2 +-
 testcases/kernel/syscalls/io_getevents/io_getevents01.c | 3 ++-
 testcases/kernel/syscalls/io_submit/io_submit03.c       | 2 +-
 testcases/kernel/syscalls/open/open02.c                 | 2 +-
 testcases/kernel/syscalls/open/open11.c                 | 2 +-
 testcases/kernel/syscalls/recvmmsg/recvmmsg01.c         | 2 +-
 testcases/kernel/syscalls/sendfile/sendfile03.c         | 2 +-
 testcases/kernel/syscalls/sendfile/sendfile04.c         | 2 +-
 9 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/accept/accept01.c b/testcases/kernel/syscalls/accept/accept01.c
index 52234b792..85af0f8af 100644
--- a/testcases/kernel/syscalls/accept/accept01.c
+++ b/testcases/kernel/syscalls/accept/accept01.c
@@ -97,7 +97,7 @@ void verify_accept(unsigned int nr)
 {
 	struct test_case *tcase = &tcases[nr];
 
-	TST_EXP_FAIL(accept(*tcase->fd, tcase->sockaddr, &tcase->salen),
+	TST_EXP_FAIL2(accept(*tcase->fd, tcase->sockaddr, &tcase->salen),
 	             tcase->experrno, "%s", tcase->desc);
 }
 
diff --git a/testcases/kernel/syscalls/adjtimex/adjtimex02.c b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
index 5d8d7019b..747d83254 100644
--- a/testcases/kernel/syscalls/adjtimex/adjtimex02.c
+++ b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
@@ -110,7 +110,7 @@ static void verify_adjtimex(unsigned int i)
 		}
 	}
 
-	TST_EXP_FAIL(tv->adjtimex(bufp), tc[i].exp_err, "adjtimex() error");
+	TST_EXP_FAIL2(tv->adjtimex(bufp), tc[i].exp_err, "adjtimex() error");
 
 	if (tc[i].exp_err == EPERM)
 		SAFE_SETEUID(0);
diff --git a/testcases/kernel/syscalls/io_getevents/io_getevents01.c b/testcases/kernel/syscalls/io_getevents/io_getevents01.c
index 9dba4addf..e8a426ab6 100644
--- a/testcases/kernel/syscalls/io_getevents/io_getevents01.c
+++ b/testcases/kernel/syscalls/io_getevents/io_getevents01.c
@@ -23,7 +23,8 @@ static void run(void)
 	aio_context_t ctx;
 
 	memset(&ctx, 0, sizeof(ctx));
-	TST_EXP_FAIL(tst_syscall(__NR_io_getevents, ctx, 0, 0, NULL, NULL), EINVAL);
+	TST_EXP_FAIL2(tst_syscall(__NR_io_getevents, ctx, 0, 0, NULL, NULL), EINVAL,
+		"io_getevents syscall with invalid ctx");
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/io_submit/io_submit03.c b/testcases/kernel/syscalls/io_submit/io_submit03.c
index 052b0c8cc..90780c0e4 100644
--- a/testcases/kernel/syscalls/io_submit/io_submit03.c
+++ b/testcases/kernel/syscalls/io_submit/io_submit03.c
@@ -103,7 +103,7 @@ static void cleanup(void)
 
 static void run(unsigned int i)
 {
-	TST_EXP_FAIL(tst_syscall(__NR_io_submit, *tc[i].ctx, tc[i].nr, tc[i].iocbs),
+	TST_EXP_FAIL2(tst_syscall(__NR_io_submit, *tc[i].ctx, tc[i].nr, tc[i].iocbs),
 		     tc[i].exp_errno, "io_submit() with %s", tc[i].desc);
 }
 
diff --git a/testcases/kernel/syscalls/open/open02.c b/testcases/kernel/syscalls/open/open02.c
index ca9839c2d..67bf423ae 100644
--- a/testcases/kernel/syscalls/open/open02.c
+++ b/testcases/kernel/syscalls/open/open02.c
@@ -49,7 +49,7 @@ static void verify_open(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 
-	TST_EXP_FAIL(open(tc->filename, tc->flag, 0444),
+	TST_EXP_FAIL2(open(tc->filename, tc->flag, 0444),
 	             tc->exp_errno, "open() %s", tc->desc);
 }
 
diff --git a/testcases/kernel/syscalls/open/open11.c b/testcases/kernel/syscalls/open/open11.c
index ded384fa8..3c3c11b84 100644
--- a/testcases/kernel/syscalls/open/open11.c
+++ b/testcases/kernel/syscalls/open/open11.c
@@ -278,7 +278,7 @@ static struct test_case {
 static void verify_open(unsigned int n)
 {
 	if (tc[n].err > 0) {
-		TST_EXP_FAIL(open(tc[n].path, tc[n].flags, tc[n].mode),
+		TST_EXP_FAIL2(open(tc[n].path, tc[n].flags, tc[n].mode),
 		             tc[n].err, "%s", tc[n].desc);
 	} else if (tc[n].err == 0) {
 		TST_EXP_FD(open(tc[n].path, tc[n].flags, tc[n].mode),
diff --git a/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c b/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
index 10eaa3dcd..fb21ea1e7 100644
--- a/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
+++ b/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
@@ -89,7 +89,7 @@ static void do_test(unsigned int i)
 	else
 		timeout = tst_ts_get(&ts);
 
-	TST_EXP_FAIL(tv->recvmmsg(*tc->fd, *tc->msg_vec, VLEN, 0, timeout),
+	TST_EXP_FAIL2(tv->recvmmsg(*tc->fd, *tc->msg_vec, VLEN, 0, timeout),
 	             tc->exp_errno, "recvmmsg() %s", tc->desc);
 }
 
diff --git a/testcases/kernel/syscalls/sendfile/sendfile03.c b/testcases/kernel/syscalls/sendfile/sendfile03.c
index dda651703..85a3b0f35 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile03.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile03.c
@@ -50,7 +50,7 @@ static void cleanup(void)
 
 static void run(unsigned int i)
 {
-	TST_EXP_FAIL(sendfile(*(tc[i].out_fd), *(tc[i].in_fd), NULL, 1),
+	TST_EXP_FAIL2(sendfile(*(tc[i].out_fd), *(tc[i].in_fd), NULL, 1),
 		     EBADF, "sendfile(..) with %s", tc[i].desc);
 }
 
diff --git a/testcases/kernel/syscalls/sendfile/sendfile04.c b/testcases/kernel/syscalls/sendfile/sendfile04.c
index 8ebeb3c10..9a8ec08b9 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile04.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile04.c
@@ -58,7 +58,7 @@ static void run(unsigned int i)
 	if (tc[i].pass_unmapped_buffer)
 		SAFE_MUNMAP(protected_buffer, sizeof(*protected_buffer));
 
-	TST_EXP_FAIL(sendfile(out_fd, in_fd, protected_buffer, 1),
+	TST_EXP_FAIL2(sendfile(out_fd, in_fd, protected_buffer, 1),
 		     EFAULT, "sendfile(..) with %s, protection=%d",
 		     tc[i].desc, tc[i].protection);
 
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
