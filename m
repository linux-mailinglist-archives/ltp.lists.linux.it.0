Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E036FECBF7
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Nov 2019 00:39:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A86E3C239E
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Nov 2019 00:39:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 944993C229A
 for <ltp@lists.linux.it>; Sat,  2 Nov 2019 00:39:37 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 6ED2660086D
 for <ltp@lists.linux.it>; Sat,  2 Nov 2019 00:39:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572651574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oBYEba37giIKH0qY+jTL36ZcV1ZjewOiLdyycI6S+wo=;
 b=KIBkRnjc4w/IxRsIWo9fXO4OzR6gRdJz6nLEimLCo13ugGW0QoP091dN+GUUusxgFmi/JC
 LXJ+efuZhRJJabPKilulelgp2/KNiv8nJ/V018hVpSreVqCVt4nv2KetGg1MvWHd3uJjR5
 NAltAbHyLCg9dcPOKCUSqYm1w5Jsu8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-S09mapU2PbqGuKTDDtkcjQ-1; Fri, 01 Nov 2019 19:39:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B746F107ACC0;
 Fri,  1 Nov 2019 23:39:30 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D6605D6B7;
 Fri,  1 Nov 2019 23:39:28 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Sat,  2 Nov 2019 00:39:24 +0100
Message-Id: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: S09mapU2PbqGuKTDDtkcjQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] kernel: use ktime_get_real_ts64() to calculate
 acct.ac_btime
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
Cc: kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
 rfontana@redhat.com, viro@zeniv.linux.org.uk, tglx@linutronix.de,
 ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

fill_ac() calculates process creation time from current time as:
   ac->ac_btime = get_seconds() - elapsed

get_seconds() doesn't accumulate nanoseconds as regular time getters.
This creates race for user-space (e.g. LTP acct02), which typically
uses gettimeofday(), because process creation time sometimes appear
to be dated 'in past':

    acct("myfile");
    time_t start_time = time(NULL);
    if (fork()==0) {
        sleep(1);
        exit(0);
    }
    waitpid(NULL);
    acct(NULL);

    // acct.ac_btime == 1572616777
    // start_time == 1572616778

Testing: 10 hours of LTP acct02 on s390x with CONFIG_HZ=100,
         test failed on unpatched kernel in 15 minutes

Signed-off-by: Jan Stancek <jstancek@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Richard Fontana <rfontana@redhat.com>
---
 kernel/acct.c   | 4 +++-
 kernel/tsacct.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/acct.c b/kernel/acct.c
index 81f9831a7859..991c898160cd 100644
--- a/kernel/acct.c
+++ b/kernel/acct.c
@@ -417,6 +417,7 @@ static void fill_ac(acct_t *ac)
 	struct pacct_struct *pacct = &current->signal->pacct;
 	u64 elapsed, run_time;
 	struct tty_struct *tty;
+	struct timespec64 ts;
 
 	/*
 	 * Fill the accounting struct with the needed info as recorded
@@ -448,7 +449,8 @@ static void fill_ac(acct_t *ac)
 	}
 #endif
 	do_div(elapsed, AHZ);
-	ac->ac_btime = get_seconds() - elapsed;
+	ktime_get_real_ts64(&ts);
+	ac->ac_btime = ts.tv_sec - elapsed;
 #if ACCT_VERSION==2
 	ac->ac_ahz = AHZ;
 #endif
diff --git a/kernel/tsacct.c b/kernel/tsacct.c
index 7be3e7530841..4d10854255ab 100644
--- a/kernel/tsacct.c
+++ b/kernel/tsacct.c
@@ -24,6 +24,7 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 	const struct cred *tcred;
 	u64 utime, stime, utimescaled, stimescaled;
 	u64 delta;
+	struct timespec64 ts;
 
 	BUILD_BUG_ON(TS_COMM_LEN < TASK_COMM_LEN);
 
@@ -34,7 +35,8 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 	stats->ac_etime = delta;
 	/* Convert to seconds for btime */
 	do_div(delta, USEC_PER_SEC);
-	stats->ac_btime = get_seconds() - delta;
+	ktime_get_real_ts64(&ts);
+	stats->ac_btime = ts.tv_sec - delta;
 	if (thread_group_leader(tsk)) {
 		stats->ac_exitcode = tsk->exit_code;
 		if (tsk->flags & PF_FORKNOEXEC)
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
