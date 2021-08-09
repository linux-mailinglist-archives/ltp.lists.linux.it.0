Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA683E4E11
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 22:44:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EB283C71CE
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 22:44:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D7FCB3C4E18
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 22:44:17 +0200 (CEST)
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DEC6D1400C60
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 22:44:15 +0200 (CEST)
Received: from in02.mta.xmission.com ([166.70.13.52]:42266)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mDC84-006eur-13; Mon, 09 Aug 2021 14:44:12 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:51854
 helo=email.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mDC82-003SLf-2z; Mon, 09 Aug 2021 14:44:11 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Naresh Kamboju <naresh.kamboju@linaro.org>
In-Reply-To: <CA+G9fYv+Azmu+_YUv6+C6RRM990k0FhUc0hgSJKssubmsWfvhA@mail.gmail.com>
 (Naresh Kamboju's message of "Fri, 6 Aug 2021 16:06:51 +0530")
References: <20210730062854.3601635-1-svens@linux.ibm.com>
 <YQn+GomdRCoYc/E8@Ryzen-9-3900X.localdomain> <875ywlat5e.fsf@disp2133>
 <94478003-8259-4b57-6d93-5a07e0750946@kernel.org>
 <87v94jalck.fsf@disp2133>
 <56b7c0fe-f2e1-7c4f-eb1b-1d9793dea5a8@kernel.org>
 <CA+G9fYv+Azmu+_YUv6+C6RRM990k0FhUc0hgSJKssubmsWfvhA@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Mon, 09 Aug 2021 15:43:56 -0500
Message-ID: <8735rijqlv.fsf_-_@disp2133>
MIME-Version: 1.0
X-XM-SPF: eid=1mDC82-003SLf-2z; ; ; mid=<8735rijqlv.fsf_-_@disp2133>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+R3wCFlQLiMNmQm42YcNlMYC9wsvdUJNU=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Naresh Kamboju <naresh.kamboju@linaro.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 558 ms - load_scoreonly_sql: 0.06 (0.0%),
 signal_user_changed: 10 (1.7%), b_tie_ro: 8 (1.5%), parse: 1.07 (0.2%),
 extract_message_metadata: 17 (3.0%), get_uri_detail_list: 3.2 (0.6%),
 tests_pri_-1000: 28 (5.0%), tests_pri_-950: 1.31 (0.2%),
 tests_pri_-900: 1.09 (0.2%), tests_pri_-90: 90 (16.2%), check_bayes:
 88 (15.8%), b_tokenize: 11 (1.9%), b_tok_get_all: 8 (1.5%),
 b_comp_prob: 2.4 (0.4%), b_tok_touch_all: 62 (11.1%), b_finish: 0.96
 (0.2%), tests_pri_0: 398 (71.3%), check_dkim_signature: 0.71 (0.1%),
 check_dkim_adsp: 2.7 (0.5%), poll_dns_idle: 0.81 (0.1%), tests_pri_10:
 2.3 (0.4%), tests_pri_500: 7 (1.2%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4] ucounts: add missing data type changes
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
Cc: Jan Kara <jack@suse.cz>, open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Alexey Gladkov <legion@kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


commit f9c82a4ea89c3 ("Increase size of ucounts to atomic_long_t")
changed the data type of ucounts/ucounts_max to long, but missed to
adjust a few other places. This is noticeable on big endian platforms
from user space because the /proc/sys/user/max_*_names files all
contain 0.

v4 - Made the min and max constants long so the sysctl values
     are actually settable on little endian machines.
     -- EWB

Fixes: f9c82a4ea89c ("Increase size of ucounts to atomic_long_t")
Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Alexey Gladkov <legion@kernel.org>
v1: https://lkml.kernel.org/r/20210721115800.910778-1-svens@linux.ibm.com
v2: https://lkml.kernel.org/r/20210721125233.1041429-1-svens@linux.ibm.com
v3: https://lkml.kernel.org/r/20210730062854.3601635-1-svens@linux.ibm.com
Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
---

Thanks everyone for testing and helping find the cause of this bug.  I
will push this out to linux-next shortly.

 fs/notify/fanotify/fanotify_user.c | 17 +++++++++++------
 fs/notify/inotify/inotify_user.c   | 17 +++++++++++------
 kernel/ucount.c                    | 19 +++++++++++--------
 3 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index 64864fb40b40..28b67cb9458d 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -54,22 +54,27 @@ static int fanotify_max_queued_events __read_mostly;
 
 #include <linux/sysctl.h>
 
+static long ft_zero = 0;
+static long ft_int_max = INT_MAX;
+
 struct ctl_table fanotify_table[] = {
 	{
 		.procname	= "max_user_groups",
 		.data	= &init_user_ns.ucount_max[UCOUNT_FANOTIFY_GROUPS],
-		.maxlen		= sizeof(int),
+		.maxlen		= sizeof(long),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
+		.proc_handler	= proc_doulongvec_minmax,
+		.extra1		= &ft_zero,
+		.extra2		= &ft_int_max,
 	},
 	{
 		.procname	= "max_user_marks",
 		.data	= &init_user_ns.ucount_max[UCOUNT_FANOTIFY_MARKS],
-		.maxlen		= sizeof(int),
+		.maxlen		= sizeof(long),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
+		.proc_handler	= proc_doulongvec_minmax,
+		.extra1		= &ft_zero,
+		.extra2		= &ft_int_max,
 	},
 	{
 		.procname	= "max_queued_events",
diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify_user.c
index 98f61b31745a..62051247f6d2 100644
--- a/fs/notify/inotify/inotify_user.c
+++ b/fs/notify/inotify/inotify_user.c
@@ -55,22 +55,27 @@ struct kmem_cache *inotify_inode_mark_cachep __read_mostly;
 
 #include <linux/sysctl.h>
 
+static long it_zero = 0;
+static long it_int_max = INT_MAX;
+
 struct ctl_table inotify_table[] = {
 	{
 		.procname	= "max_user_instances",
 		.data		= &init_user_ns.ucount_max[UCOUNT_INOTIFY_INSTANCES],
-		.maxlen		= sizeof(int),
+		.maxlen		= sizeof(long),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
+		.proc_handler	= proc_doulongvec_minmax,
+		.extra1		= &it_zero,
+		.extra2		= &it_int_max,
 	},
 	{
 		.procname	= "max_user_watches",
 		.data		= &init_user_ns.ucount_max[UCOUNT_INOTIFY_WATCHES],
-		.maxlen		= sizeof(int),
+		.maxlen		= sizeof(long),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
+		.proc_handler	= proc_doulongvec_minmax,
+		.extra1		= &it_zero,
+		.extra2		= &it_int_max,
 	},
 	{
 		.procname	= "max_queued_events",
diff --git a/kernel/ucount.c b/kernel/ucount.c
index 77be3bbe3cc4..bb51849e6375 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -58,14 +58,17 @@ static struct ctl_table_root set_root = {
 	.permissions = set_permissions,
 };
 
-#define UCOUNT_ENTRY(name)				\
-	{						\
-		.procname	= name,			\
-		.maxlen		= sizeof(int),		\
-		.mode		= 0644,			\
-		.proc_handler	= proc_dointvec_minmax,	\
-		.extra1		= SYSCTL_ZERO,		\
-		.extra2		= SYSCTL_INT_MAX,	\
+static long ue_zero = 0;
+static long ue_int_max = INT_MAX;
+
+#define UCOUNT_ENTRY(name)					\
+	{							\
+		.procname	= name,				\
+		.maxlen		= sizeof(long),			\
+		.mode		= 0644,				\
+		.proc_handler	= proc_doulongvec_minmax,	\
+		.extra1		= &ue_zero,			\
+		.extra2		= &ue_int_max,			\
 	}
 static struct ctl_table user_table[] = {
 	UCOUNT_ENTRY("max_user_namespaces"),
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
