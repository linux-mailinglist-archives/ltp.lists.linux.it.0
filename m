Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A223692F0
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 15:19:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 123F53C6A0A
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 15:19:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8AD6D3C2652
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 15:19:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 98152601CD2
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 15:19:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E24C1ADD7;
 Fri, 23 Apr 2021 13:19:46 +0000 (UTC)
Date: Fri, 23 Apr 2021 15:03:25 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: 20210420133839.145408-1-xieziyao@huawei.com
Message-ID: <YILFnTZv5k23bM/Q@yuki>
References: <20210423095944.118255-1-xieziyao@huawei.com>
 <20210423095944.118255-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423095944.118255-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/sendfile: Convert sendfile04 to the
 new API
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

Hi!
I've simplified the code even a bit more and pushed, thanks.

I've did a minor adjustenment such as:

- there is no need to reopen the in_fd since we do not actually read
  from it

- no need to define OFF_T to off_t

- no need for the SOCKETPAIR, the in_fd and out_fd can be any fds as
  long as in is opened for reading and out opened for writing

full diff:

diff --git a/testcases/kernel/syscalls/sendfile/sendfile04.c b/testcases/kernel/syscalls/sendfile/sendfile04.c
index 42600a8ac..4cbc48edc 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile04.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile04.c
@@ -9,7 +9,7 @@
  * [Description]
  *
  * Testcase to test that sendfile(2) system call returns EFAULT when passing
- * wrong buffer.
+ * wrong offset pointer.
  *
  * [Algorithm]
  *
@@ -31,16 +31,8 @@
 
 #include "tst_test.h"
 
-#ifndef OFF_T
-#define OFF_T off_t
-#endif
-
-#define IN_FILE "sendfile04_infile"
-
-int in_fd;
-int out_fd;
-int out[2];
-static char buf[] = "abcdefghijklmnopqrstuvwxyz";
+static int in_fd;
+static int out_fd;
 
 struct test_case_t {
 	int protection;
@@ -56,40 +48,33 @@ struct test_case_t {
 
 static void setup(void)
 {
-	in_fd = SAFE_CREAT(IN_FILE, 00700);
-	SAFE_WRITE(1, in_fd, buf, strlen(buf));
-	SAFE_CLOSE(in_fd);
-
-	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, out);
-	out_fd = out[0];
+	in_fd = SAFE_CREAT("in_file", O_RDONLY);
+	out_fd = SAFE_CREAT("out_file", O_WRONLY);
+	SAFE_WRITE(1, in_fd, "a", 1);
 }
 
 static void cleanup(void)
 {
-	SAFE_CLOSE(out[0]);
-	SAFE_CLOSE(out[1]);
+	SAFE_CLOSE(in_fd);
+	SAFE_CLOSE(out_fd);
 }
 
 static void run(unsigned int i)
 {
-	OFF_T *protected_buffer;
+	off_t *protected_buffer;
 	protected_buffer = SAFE_MMAP(NULL, sizeof(*protected_buffer),
 			             tc[i].protection,
-				     MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+				     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
 	if (tc[i].pass_unmapped_buffer)
 		SAFE_MUNMAP(protected_buffer, sizeof(*protected_buffer));
 
-	struct stat sb;
-	SAFE_STAT(IN_FILE, &sb);
-	in_fd = SAFE_OPEN(IN_FILE, O_RDONLY);
-
-	TST_EXP_FAIL(sendfile(out_fd, in_fd, protected_buffer, sb.st_size),
+	TST_EXP_FAIL(sendfile(out_fd, in_fd, protected_buffer, 1),
 		     EFAULT, "sendfile(..) with %s, protection=%d",
 		     tc[i].desc, tc[i].protection);
 
 	if (!tc[i].pass_unmapped_buffer)
 		SAFE_MUNMAP(protected_buffer, sizeof(*protected_buffer));
-	SAFE_CLOSE(in_fd);
 }
 
 static struct tst_test test = {

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
