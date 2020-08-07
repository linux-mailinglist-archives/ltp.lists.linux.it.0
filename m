Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 166D323EBC4
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 12:59:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C77803C31E6
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 12:58:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6A47F3C31D3
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 12:58:58 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 120C060094B
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 12:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596797936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=BhHTB32XcywZL97P6CvT/3mcd21mdJUZJQ5CFy28/bQ=;
 b=iakaeIq7Ly5hVsZ6volLNMCR10BnPMxjeorhWl0mM2Ce6k9Qo5cz/5uKbLF8dvh8LK0Sd6
 irwqm5gfQBq17L9mEDQ6/jfUuq/Efn96O8D/MjHjIv4GtRx+OANbs8TBiLYAYj6o6HwFDy
 u6pZ5sMgCeOc+ddTv9uCPyL4g2QDlGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-EkRoettQP7KHSAxkhbK9iw-1; Fri, 07 Aug 2020 06:58:54 -0400
X-MC-Unique: EkRoettQP7KHSAxkhbK9iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32E9A8005B0;
 Fri,  7 Aug 2020 10:58:53 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA00A61176;
 Fri,  7 Aug 2020 10:58:51 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  7 Aug 2020 12:58:44 +0200
Message-Id: <8eefb21d278f0846024a16281c5e19b0e3936979.1596797812.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/clone302: drop CLONE_CHILD_SETTID and
 CLONE_PARENT_SETTID
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
Cc: viresh.kumar@linaro.org, christian.brauner@ubuntu.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Per https://lore.kernel.org/linux-m68k/20200627122332.ki2otaiw3v7wndbl@wittgenstein/T/#u
EFAULT isn't propagated back to userspace so these will always appear
to succeed. Also issue is that multiple flags are tested together
and some arguments persisted between calls, because they were set
only when argument != NULL.

Cc: Christian Brauner <christian.brauner@ubuntu.com>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/clone3/clone302.c | 42 +++++++++++----------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/testcases/kernel/syscalls/clone3/clone302.c b/testcases/kernel/syscalls/clone3/clone302.c
index a30df6f8286e..54d59a1f571a 100644
--- a/testcases/kernel/syscalls/clone3/clone302.c
+++ b/testcases/kernel/syscalls/clone3/clone302.c
@@ -21,27 +21,33 @@ static struct tcase {
 	size_t size;
 	uint64_t flags;
 	int **pidfd;
-	int **child_tid;
-	int **parent_tid;
 	int exit_signal;
 	unsigned long stack;
 	unsigned long stack_size;
 	unsigned long tls;
 	int exp_errno;
 } tcases[] = {
-	{"invalid args", &invalid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
-	{"zero size", &valid_args, 0, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
-	{"short size", &valid_args, sizeof(*valid_args) - 1, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
-	{"extra size", &valid_args, sizeof(*valid_args) + 1, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
-	{"sighand-no-VM", &valid_args, sizeof(*valid_args), CLONE_SIGHAND, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
-	{"thread-no-sighand", &valid_args, sizeof(*valid_args), CLONE_THREAD, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
-	{"fs-newns", &valid_args, sizeof(*valid_args), CLONE_FS | CLONE_NEWNS, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
-	{"invalid pidfd", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, &invalid_address, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
-	{"invalid childtid", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, &invalid_address, NULL, SIGCHLD, 0, 0, 0, EFAULT},
-	{"invalid parenttid", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, NULL, &invalid_address, SIGCHLD, 0, 0, 0, EFAULT},
-	{"invalid signal", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, CSIGNAL + 1, 0, 0, 0, EINVAL},
-	{"zero-stack-size", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, (unsigned long)&stack, 0, 0, EINVAL},
-	{"invalid-stack", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 4, 0, EINVAL},
+	{"invalid args", &invalid_args, sizeof(*valid_args), 0, NULL, SIGCHLD, 0, 0, 0, EFAULT},
+	{"zero size", &valid_args, 0, 0, NULL, SIGCHLD, 0, 0, 0, EINVAL},
+	{"short size", &valid_args, sizeof(*valid_args) - 1, 0, NULL, SIGCHLD, 0, 0, 0, EINVAL},
+	{"extra size", &valid_args, sizeof(*valid_args) + 1, 0, NULL, SIGCHLD, 0, 0, 0, EFAULT},
+	{"sighand-no-VM", &valid_args, sizeof(*valid_args), CLONE_SIGHAND, NULL, SIGCHLD, 0, 0, 0, EINVAL},
+	{"thread-no-sighand", &valid_args, sizeof(*valid_args), CLONE_THREAD, NULL, SIGCHLD, 0, 0, 0, EINVAL},
+	{"fs-newns", &valid_args, sizeof(*valid_args), CLONE_FS | CLONE_NEWNS, NULL, SIGCHLD, 0, 0, 0, EINVAL},
+	{"invalid pidfd", &valid_args, sizeof(*valid_args), CLONE_PIDFD, &invalid_address, SIGCHLD, 0, 0, 0, EFAULT},
+	{"invalid signal", &valid_args, sizeof(*valid_args), 0, NULL, CSIGNAL + 1, 0, 0, 0, EINVAL},
+	{"zero-stack-size", &valid_args, sizeof(*valid_args), 0, NULL, SIGCHLD, (unsigned long)&stack, 0, 0, EINVAL},
+	{"invalid-stack", &valid_args, sizeof(*valid_args), 0, NULL, SIGCHLD, 0, 4, 0, EINVAL},
+	/*
+	 * Don't test CLONE_CHILD_SETTID and CLONE_PARENT_SETTID:
+	 * When the parent tid is written to the memory location for
+	 * CLONE_PARENT_SETTID we're past the point of no return of process
+	 * creation, i.e. the return value from put_user() isn't checked and
+	 * can't be checked anymore so you'd never receive EFAULT for a bogus
+	 * parent_tid memory address.
+	 *
+	 * https://lore.kernel.org/linux-m68k/20200627122332.ki2otaiw3v7wndbl@wittgenstein/T/#u
+	 */
 };
 
 static void setup(void)
@@ -63,10 +69,8 @@ static void run(unsigned int n)
 		args->flags = tc->flags;
 		if (tc->pidfd)
 			args->pidfd = (uint64_t)(*tc->pidfd);
-		if (tc->child_tid)
-			args->child_tid = (uint64_t)(*tc->child_tid);
-		if (tc->parent_tid)
-			args->parent_tid = (uint64_t)(*tc->parent_tid);
+		else
+			args->pidfd = 0;
 		args->exit_signal = tc->exit_signal;
 		args->stack = tc->stack;
 		args->stack_size = tc->stack_size;
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
