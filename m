Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DA9F2EA8
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:00:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFFE13C2215
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:00:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 87B983C104D
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:32:35 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7D6D61A0118C
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:32:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5b6dL4GU7b0E4m+87rHIiqniNskuz8XJPlTDMY3zCsI=; b=QORicF9PleMxv8poQOXsiir5J
 1sBpNIs3/HKgGcSlGkkjPCArd7lTJ3NQI+txxI6GwMpcVaMyjWtACK2KlyPqXfuP/39LD8+ffKN9p
 fB/x73hq9tYzxCBYGYNufCDbWOLmqxtHWxvWursQSwMSKVgLjqldH7LM94UhsTH4Vl2kZQ+eXOrEO
 XQAIp1FFk/ZgutTuRWHIqXgHmF35kWbPvJdayt7DueI6Zh3uDG6rgnN5s0pwSlIaBnauPSftVYFCn
 dcObLkppz20g10ag6fBJUCr6a30vuKGSYDXedxFEXyKsQxu/w0wluU0c19jq7v5JCCttgU65+aDPv
 O5Npvlt8A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSgxf-00080d-5M; Thu, 07 Nov 2019 12:32:27 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DFAC0300692;
 Thu,  7 Nov 2019 13:31:19 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 57BED2025EDB3; Thu,  7 Nov 2019 13:32:24 +0100 (CET)
Date: Thu, 7 Nov 2019 13:32:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191107123224.GA6315@hirez.programming.kicks-ass.net>
References: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 07 Nov 2019 14:00:29 +0100
Subject: Re: [LTP] [PATCH] kernel: use ktime_get_real_ts64() to calculate
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
 linux-kernel@vger.kernel.org, rfontana@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, Nov 02, 2019 at 12:39:24AM +0100, Jan Stancek wrote:
> fill_ac() calculates process creation time from current time as:
>    ac->ac_btime = get_seconds() - elapsed
> 
> get_seconds() doesn't accumulate nanoseconds as regular time getters.
> This creates race for user-space (e.g. LTP acct02), which typically
> uses gettimeofday(), because process creation time sometimes appear
> to be dated 'in past':
> 
>     acct("myfile");
>     time_t start_time = time(NULL);
>     if (fork()==0) {
>         sleep(1);
>         exit(0);
>     }
>     waitpid(NULL);
>     acct(NULL);
> 
>     // acct.ac_btime == 1572616777
>     // start_time == 1572616778
> 

Lets start by saying this accounting stuff is terrible crap and it
deserves to fail and burn.

The only spec I found for what it actually wants in those fields is
Documentation/accounting/taskstats-struct.rst, that states:

	/* The time when a task begins, in [secs] since 1970. */
	__u32   ac_btime;               /* Begin time [sec since 1970] */

	/* The elapsed time of a task, in [usec]. */
	__u64   ac_etime;               /* Elapsed time [usec] */

But that is not really well defined. As implemented etime does not
include suspend time (maybe on purpose, maybe not).

And what does btime want? As implemented it jumps around if you ask the
question twice with an adjtime() call or suspend in between. Of course,
if we take an actual CLOCK_REALTIME timestamp at fork() the value
doesn't change, but then it can be in the future (DST,adjtime()), which
is exactly the reason why CLOCK_REALTIME is absolute shit for timestamps
(logging, accounting, etc.).

And your 'fix' is pretty terible too. Arguably ktime_get_seconds() wants
fixing for not having the ns accumulation and actually differing from
tv_sec, but now you accrue one source of ns while still disregarding
another (also, I friggin hate timespec, it's a terrible interface for
time).

All in all, I'm tempted to just declare this stuff broken and -EWONTFIX,
but if we have to do something, something like the below is at least
internally consistent.

---
diff --git a/kernel/tsacct.c b/kernel/tsacct.c
index 7be3e7530841..76d6325c2724 100644
--- a/kernel/tsacct.c
+++ b/kernel/tsacct.c
@@ -23,18 +23,31 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 {
 	const struct cred *tcred;
 	u64 utime, stime, utimescaled, stimescaled;
-	u64 delta;
+	u64 mono, real, btime;
 
 	BUILD_BUG_ON(TS_COMM_LEN < TASK_COMM_LEN);
 
+	mono = ktime_get_ns();
+	real = ktime_get_real_ns();
+
 	/* calculate task elapsed time in nsec */
-	delta = ktime_get_ns() - tsk->start_time;
+	delta = mono - tsk->start_time;
 	/* Convert to micro seconds */
 	do_div(delta, NSEC_PER_USEC);
 	stats->ac_etime = delta;
-	/* Convert to seconds for btime */
-	do_div(delta, USEC_PER_SEC);
-	stats->ac_btime = get_seconds() - delta;
+
+	/*
+	 * Compute btime by subtracting the elapsed time from the current
+	 * CLOCK_REALTIME.
+	 *
+	 * XXX totally buggered, because it changes results across
+	 * adjtime() calls and suspend/resume.
+	 */
+	delta = mono - tsk->start_time; // elapsed in ns
+	btime = real - delta;		// real ns - elapsed ns
+	do_div(btime, NSEC_PER_SEC);	// truncated to seconds
+	stats->ac_btime = btime;
+
 	if (thread_group_leader(tsk)) {
 		stats->ac_exitcode = tsk->exit_code;
 		if (tsk->flags & PF_FORKNOEXEC)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
