Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC55F2EAB
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:00:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A8353C2284
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:00:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2F7093C1D5C
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:46:26 +0100 (CET)
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 55F231001F4C
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:46:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xa3xcbvcNii0ckLDCeWLHK/ql7ey1ORYLLY0djGGeQI=; b=G+b5F0zsTBN+89jWdmm+g3GUT
 dAp0DdRzLdcdJt3d/VA9pu3ahL7Uspd+ccWn2SDhwCutIaN0FES4q/uTVaUihfitkSe/4BPdomRBn
 jo2BbmEllza+WOBsq0BCfHtnJhco/BmOP5Z7J8n4+8EHBdPb2kF9i13edAE+GgFtAq1DbufjCSUnZ
 mUg8UYhtZLV80L2GVxYA3KoIyDK8pD7pnfhay26rVUDZ5ftZelLPpWLsueZNXIdBqZKa79+myWtc/
 unCYTqzClb1hBngRB896GlSl7hagF6dkPl2XUpi1wapvGxfmKvQmtYKWYb7jwJ97kDrKR3Wn0YF69
 eOHvcNAYA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iShB4-0005kt-9O; Thu, 07 Nov 2019 12:46:18 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1144A301747;
 Thu,  7 Nov 2019 13:45:11 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 91DF52025EDA7; Thu,  7 Nov 2019 13:46:15 +0100 (CET)
Date: Thu, 7 Nov 2019 13:46:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20191107124615.GG4131@hirez.programming.kicks-ass.net>
References: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
 <20191107123224.GA6315@hirez.programming.kicks-ass.net>
 <alpine.DEB.2.21.1911071335320.4256@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1911071335320.4256@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 07, 2019 at 01:40:47PM +0100, Thomas Gleixner wrote:
> Typing real_start_time makes me really cringe.

I have a patch fixing that...

---
Subject: kernel: Rename tsk->real_start_time
From: Peter Zijlstra <peterz@infradead.org>
Date: Thu Nov  7 11:07:58 CET 2019

Since it stores CLOCK_BOOTTIME, not, as the name suggests,
CLOCK_REALTIME, let's rename real_start_time.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1132,7 +1132,7 @@ static int de_thread(struct task_struct
 		 * also take its birthdate (always earlier than our own).
 		 */
 		tsk->start_time = leader->start_time;
-		tsk->real_start_time = leader->real_start_time;
+		tsk->start_boottime = leader->start_boottime;
 
 		BUG_ON(!same_thread_group(leader, tsk));
 		BUG_ON(has_group_leader_pid(tsk));
--- a/fs/proc/array.c
+++ b/fs/proc/array.c
@@ -533,7 +533,7 @@ static int do_task_stat(struct seq_file
 	nice = task_nice(task);
 
 	/* convert nsec -> ticks */
-	start_time = nsec_to_clock_t(task->real_start_time);
+	start_time = nsec_to_clock_t(task->start_boottime);
 
 	seq_put_decimal_ull(m, "", pid_nr_ns(pid, ns));
 	seq_puts(m, " (");
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -879,7 +879,7 @@ struct task_struct {
 	u64				start_time;
 
 	/* Boot based time in nsecs: */
-	u64				real_start_time;
+	u64				start_boottime;
 
 	/* MM fault and swap info: this can arguably be seen as either mm-specific or thread-specific: */
 	unsigned long			min_flt;
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2130,7 +2130,7 @@ static __latent_entropy struct task_stru
 	 */
 
 	p->start_time = ktime_get_ns();
-	p->real_start_time = ktime_get_boottime_ns();
+	p->start_boottime = ktime_get_boottime_ns();
 
 	/*
 	 * Make it visible to the rest of the system, but dont wake it up yet.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
