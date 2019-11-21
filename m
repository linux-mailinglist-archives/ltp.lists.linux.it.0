Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4085C104885
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 03:29:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD4103C237D
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 03:29:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 29B8F3C14F6
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 03:29:46 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E5C1210060AA
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 03:29:42 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208,217";a="78821739"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 10:29:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6971B4CE1BF5;
 Thu, 21 Nov 2019 10:21:18 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 21 Nov 2019 10:29:35 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <d1d72a63-fd3b-e670-4559-c0216176546c@cn.fujitsu.com>
Date: Thu, 21 Nov 2019 10:29:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191120151244.GA28197@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6971B4CE1BF5.A1FC5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/quotactl01: Add Q_GETNEXTQUOTA
 test
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
Content-Type: multipart/mixed; boundary="===============0344257255=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0344257255==
Content-Type: multipart/alternative;
	boundary="------------C1398F7978A7BA894D6AA13D"

--------------C1398F7978A7BA894D6AA13D
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


on 2019/11/20 23:12, Petr Vorel wrote:

> Hi Jan, Cyril, Xu,
>
>> Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the
>> same as Q_GETQUOTA, but it returns quota information for the next ID
>> greater than or equal to id that has a quota set.
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> LGTM, with 2 questions.
>
>>   #ifndef LAPI_QUOTACTL_H__
>>   # define LAPI_QUOTACTL_H__
>> +#include <sys/quota.h>
>> +
>> +#ifdef HAVE_STRUCT_IF_NEXTDQBLK
>> +# include <linux/quota.h>
>> +#else
>> +# ifdef HAVE_LINUX_TYPES_H
>> +# include <linux/types.h>
> @Jan, @Cyril: Do we want to generally avoid loading <linux/types.h> if not really needed?
> __u64 can be uint64_t etc (as it's also visible in struct dqblk in <sys/quota.h>
> in various libc headers).
> We used this approach for /usr/include/linux/bpf.h and for fanotify fixes for
> musl (testcases/kernel/syscalls/fanotify/fanotify.h).
>
> So unless you're against this approach here I'll change it before merge
> (and add this info to next version of library API writing guidelines patch
> https://patchwork.ozlabs.org/patch/1166786/).

I have no objection about using uint64_t becuase Q_GETNEXTQUOTA man-pages also uses it.
I used  struct if_nextdqblk as same as <linux/quota.h> defined. But I don't know why we can't use
<linux/type.h> in lapi/quotactl.h and I also use it in lapi/seccomp.h. IMHO, they affected nothing.
Or, they have some redefined errors or not having this headers files in special linux distribution.

>> +struct if_nextdqblk {
>> +	__u64 dqb_bhardlimit;
>> +	__u64 dqb_bsoftlimit;
>> +	__u64 dqb_curspace;
>> +	__u64 dqb_ihardlimit;
>> +	__u64 dqb_isoftlimit;
>> +	__u64 dqb_curinodes;
>> +	__u64 dqb_btime;
>> +	__u64 dqb_itime;
>> +	__u32 dqb_valid;
>> +	__u32 dqb_id;
>> +};
> ...
>> +++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>   /*
>>   * Copyright (c) Crackerjack Project., 2007
>> -* Copyright (c) 2016 Fujitsu Ltd.
>> +* Copyright (c) 2016-2019 FUJITSU LIMITED. All rights reserved
> BTW correct formatting is
> /*
>   *
>   */
> Not
> /*
> *
> */
> I'll change it during merge (nit, the code is what matters, not formatting, of course).
>
> ...
>> +static int getnextquota_nsup;
> ...
>>   static void setup(void)
>>   {
>>   	const char *const cmd[] = {"quotacheck", "-ugF", "vfsv0", MNTPOINT, NULL};
>>   	int ret;
>> +	getnextquota_nsup = 0;
> This is not needed (getnextquota_nsup is static and it's called just once, I'll
> remove it before merge).

Yes.

>
>>   	ret = tst_run_cmd(cmd, NULL, NULL, 1);
>>   	switch (ret) {
>> @@ -146,6 +183,11 @@ static void setup(void)
>>   	if (access(GRPPATH, F_OK) == -1)
>>   		tst_brk(TFAIL | TERRNO, "group quotafile didn't exist");
>> +
>> +	TEST(quotactl(QCMD(Q_GETNEXTQUOTA, USRQUOTA), tst_device->dev,
>> +		test_id, (void *) &res_ndq));
>> +	if (TST_ERR == EINVAL || TST_ERR == ENOSYS)
> Does EINVAL really mans not supported? Shouldn't be just for ENOSYS.

EINVAL can mean non-supported  by using correct argument.

>> +		getnextquota_nsup = 1;
>>   }
> Looking at kernel sources - this does not look as not supported, but rather a
> failure (we might want to add some test for EINVAL):
> 	if (!qid_has_mapping(sb->s_user_ns, qid))
> 		return -EINVAL;
>
> kernel fs/quota/quota.c
> /*
>   * Return quota for next active quota >= this id, if any exists,
>   * otherwise return -ENOENT via ->get_nextdqblk
>   */
> static int quota_getnextquota(struct super_block *sb, int type, qid_t id,
> 			  void __user *addr)
> {
> 	struct kqid qid;
> 	struct qc_dqblk fdq;
> 	struct if_nextdqblk idq;
> 	int ret;
>
> 	if (!sb->s_qcop->get_nextdqblk)
> 		return -ENOSYS;
> 	qid = make_kqid(current_user_ns(), type, id);
> 	if (!qid_has_mapping(sb->s_user_ns, qid))
> 		return -EINVAL;
> 	ret = sb->s_qcop->get_nextdqblk(sb, &qid, &fdq);
> 	if (ret)
> 		return ret;
> 	/* struct if_nextdqblk is a superset of struct if_dqblk */
> 	copy_to_if_dqblk((struct if_dqblk *)&idq, &fdq);
> 	idq.dqb_id = from_kqid(current_user_ns(), qid);
> 	if (copy_to_user(addr, &idq, sizeof(idq)))
> 		return -EFAULT;
> 	return 0;
> }

Hi Petr

look do_quotactl function in fs/quota/quota.c.

static int do_quotactl(struct super_block *sb, int type, int cmd, qid_t id,
                        void __user *addr, const struct path *path)
{

     switch (cmd) {
         case Q_QUOTAON:
                 return quota_quotaon(sb, type, id, path);
         case Q_QUOTAOFF:
                 return quota_quotaoff(sb, type);
         case Q_GETFMT:
                 return quota_getfmt(sb, type, addr);
         case Q_GETINFO:
         ......

          default:
                 return -EINVAL;
         }
}

So if it doesn't have Q_GETNEXTQUOTA cmd, it should report EINVAL(we use correct argument and correct environment, so there is no failure).

> Kind regards,
> Petr
>
>



--------------C1398F7978A7BA894D6AA13D
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/20 23:12, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191120151244.GA28197@dell5510">
      <pre class="moz-quote-pre" wrap="">Hi Jan, Cyril, Xu,

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the
same as Q_GETQUOTA, but it returns quota information for the next ID
greater than or equal to id that has a quota set.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Yang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuyang2018.jy@cn.fujitsu.com">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Reviewed-by: Petr Vorel <a class="moz-txt-link-rfc2396E" href="mailto:pvorel@suse.cz">&lt;pvorel@suse.cz&gt;</a>

LGTM, with 2 questions.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> #ifndef LAPI_QUOTACTL_H__
 # define LAPI_QUOTACTL_H__
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#include &lt;sys/quota.h&gt;
+
+#ifdef HAVE_STRUCT_IF_NEXTDQBLK
+# include &lt;linux/quota.h&gt;
+#else
+# ifdef HAVE_LINUX_TYPES_H
+# include &lt;linux/types.h&gt;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">@Jan, @Cyril: Do we want to generally avoid loading &lt;linux/types.h&gt; if not really needed?
__u64 can be uint64_t etc (as it's also visible in struct dqblk in &lt;sys/quota.h&gt;
in various libc headers).
We used this approach for /usr/include/linux/bpf.h and for fanotify fixes for
musl (testcases/kernel/syscalls/fanotify/fanotify.h).

So unless you're against this approach here I'll change it before merge
(and add this info to next version of library API writing guidelines patch
<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/patch/1166786/">https://patchwork.ozlabs.org/patch/1166786/</a>).
</pre>
    </blockquote>
    <pre>I have no objection about using uint64_t becuase Q_GETNEXTQUOTA man-pages also uses it.
I used  struct if_nextdqblk as same as &lt;linux/quota.h&gt; defined. But I don't know why we can't use 
&lt;linux/type.h&gt; in lapi/quotactl.h and I also use it in lapi/seccomp.h. IMHO, they affected nothing.
Or, they have some redefined errors or not having this headers files in special linux distribution. 
</pre>
    <blockquote type="cite" cite="mid:20191120151244.GA28197@dell5510">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+struct if_nextdqblk {
+	__u64 dqb_bhardlimit;
+	__u64 dqb_bsoftlimit;
+	__u64 dqb_curspace;
+	__u64 dqb_ihardlimit;
+	__u64 dqb_isoftlimit;
+	__u64 dqb_curinodes;
+	__u64 dqb_btime;
+	__u64 dqb_itime;
+	__u32 dqb_valid;
+	__u32 dqb_id;
+};
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
...
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
 * Copyright (c) Crackerjack Project., 2007
-* Copyright (c) 2016 Fujitsu Ltd.
+* Copyright (c) 2016-2019 FUJITSU LIMITED. All rights reserved
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">BTW correct formatting is
/*
 *
 */
Not
/*
*
*/
I'll change it during merge (nit, the code is what matters, not formatting, of course).

...
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+static int getnextquota_nsup;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">...
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> static void setup(void)
 {
 	const char *const cmd[] = {"quotacheck", "-ugF", "vfsv0", MNTPOINT, NULL};
 	int ret;
+	getnextquota_nsup = 0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">This is not needed (getnextquota_nsup is static and it's called just once, I'll
remove it before merge).</pre>
    </blockquote>
    <pre>Yes.</pre>
    <blockquote type="cite" cite="mid:20191120151244.GA28197@dell5510">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	ret = tst_run_cmd(cmd, NULL, NULL, 1);
 	switch (ret) {
@@ -146,6 +183,11 @@ static void setup(void)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	if (access(GRPPATH, F_OK) == -1)
 		tst_brk(TFAIL | TERRNO, "group quotafile didn't exist");
+
+	TEST(quotactl(QCMD(Q_GETNEXTQUOTA, USRQUOTA), tst_device-&gt;dev,
+		test_id, (void *) &amp;res_ndq));
+	if (TST_ERR == EINVAL || TST_ERR == ENOSYS)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Does EINVAL really mans not supported? Shouldn't be just for ENOSYS.</pre>
    </blockquote>
    <pre>EINVAL can mean non-supported  by using correct argument.</pre>
    <blockquote type="cite" cite="mid:20191120151244.GA28197@dell5510">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+		getnextquota_nsup = 1;
 }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Looking at kernel sources - this does not look as not supported, but rather a
failure (we might want to add some test for EINVAL):
	if (!qid_has_mapping(sb-&gt;s_user_ns, qid))
		return -EINVAL;

kernel fs/quota/quota.c
/*
 * Return quota for next active quota &gt;= this id, if any exists,
 * otherwise return -ENOENT via -&gt;get_nextdqblk
 */
static int quota_getnextquota(struct super_block *sb, int type, qid_t id,
			  void __user *addr)
{
	struct kqid qid;
	struct qc_dqblk fdq;
	struct if_nextdqblk idq;
	int ret;

	if (!sb-&gt;s_qcop-&gt;get_nextdqblk)
		return -ENOSYS;
	qid = make_kqid(current_user_ns(), type, id);
	if (!qid_has_mapping(sb-&gt;s_user_ns, qid))
		return -EINVAL;
	ret = sb-&gt;s_qcop-&gt;get_nextdqblk(sb, &amp;qid, &amp;fdq);
	if (ret)
		return ret;
	/* struct if_nextdqblk is a superset of struct if_dqblk */
	copy_to_if_dqblk((struct if_dqblk *)&amp;idq, &amp;fdq);
	idq.dqb_id = from_kqid(current_user_ns(), qid);
	if (copy_to_user(addr, &amp;idq, sizeof(idq)))
		return -EFAULT;
	return 0;
}
</pre>
    </blockquote>
    <pre>Hi Petr</pre>
    <pre>look do_quotactl function in fs/quota/quota.c.

static int do_quotactl(struct super_block *sb, int type, int cmd, qid_t id,
                       void __user *addr, const struct path *path)
{</pre>
    <pre>    switch (cmd) {
        case Q_QUOTAON:
                return quota_quotaon(sb, type, id, path);
        case Q_QUOTAOFF:
                return quota_quotaoff(sb, type);
        case Q_GETFMT:
                return quota_getfmt(sb, type, addr);
        case Q_GETINFO:
        ......</pre>
    <pre>         default:
                return -EINVAL;
        }
}</pre>
    <pre>So if it doesn't have Q_GETNEXTQUOTA cmd, it should report EINVAL(we use correct argument and correct environment, so there is no failure).</pre>
    <blockquote type="cite" cite="mid:20191120151244.GA28197@dell5510">
      <pre class="moz-quote-pre" wrap="">
Kind regards,
Petr


</pre>
    </blockquote>
  </body>
</html>

--------------C1398F7978A7BA894D6AA13D--

--===============0344257255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0344257255==--
