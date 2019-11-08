Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7581EF4A85
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Nov 2019 13:12:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA72C3C1CED
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Nov 2019 13:12:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5E2D23C1815
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 13:12:25 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A506310006CD
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 13:12:22 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,281,1569254400"; d="scan'208,217";a="78065281"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 20:12:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id D27864CE1A01;
 Fri,  8 Nov 2019 20:04:09 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 8 Nov 2019 20:12:13 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191101084933.GA14639@dell5510>
 <1572613170-20757-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191107145416.GA25608@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <3d882118-533e-f3a3-810b-b494f3f734d4@cn.fujitsu.com>
Date: Fri, 8 Nov 2019 20:12:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191107145416.GA25608@rei.lan>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: D27864CE1A01.ADA28
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/prctl02: add more error tests
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
Content-Type: multipart/mixed; boundary="===============1212821747=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1212821747==
Content-Type: multipart/alternative;
	boundary="------------8C2E3B0A7C9733B8B0DE1544"

--------------8C2E3B0A7C9733B8B0DE1544
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/11/07 22:54, Cyril Hrubis wrote:

> Hi!
>>   #include <errno.h>
>>   #include <signal.h>
>>   #include <sys/prctl.h>
>> -
>> +#include <linux/filter.h>
>> +#include <linux/capability.h>
>> +#include <unistd.h>
>> +#include <stdlib.h>
>> +#include <stddef.h>
>> +#include "config.h"
>> +#include "lapi/prctl.h"
>> +#include "lapi/seccomp.h"
>> +#include "lapi/syscalls.h"
>>   #include "tst_test.h"
>> +#include "tst_capability.h"
>>   
>>   #define OPTION_INVALID 999
>>   #define INVALID_ARG 999
>>   
>> +static const struct sock_filter  strict_filter[] = {
>> +	BPF_STMT(BPF_LD | BPF_W | BPF_ABS, (offsetof (struct seccomp_data, nr))),
>> +
>> +	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_close, 5, 0),
>> +	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_exit,  4, 0),
>> +	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_wait4, 3, 0),
>> +	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_write, 2, 0),
>> +	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_clone, 1, 0),
>> +
>> +	BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
>> +	BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW)
>> +};
>> +
>> +static const struct sock_fprog  strict = {
>> +	.len = (unsigned short)ARRAY_SIZE(strict_filter),
>> +	.filter = (struct sock_filter *)strict_filter
>> +};
> We do have the exact same bytecode in the prctl04.c, can we put it to a
> header and include it in both tests?
>
> Or alternatively do we need more than just one-liner with
> BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW) here?

we only need one-liner with BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW) here.

>
>>   static struct tcase {
>>   	int option;
>>   	unsigned long arg2;
>> +	unsigned long arg3;
>>   	int exp_errno;
>> +	int bad_addr;
>>   } tcases[] = {
>> -	{OPTION_INVALID, 0, EINVAL},
>> -	{PR_SET_PDEATHSIG, INVALID_ARG, EINVAL},
>> +	{OPTION_INVALID, 0, 0, EINVAL, 0},
>> +	{PR_SET_PDEATHSIG, INVALID_ARG, 0, EINVAL, 0},
>> +	{PR_SET_DUMPABLE, 2, 0, EINVAL, 0},
>> +	{PR_SET_NAME, 0, 0, EFAULT, 1},
>> +	{PR_SET_SECCOMP, 2, 0, EFAULT, 1},
>> +	{PR_SET_SECCOMP, 2, 2, EACCES, 0},
>> +	{PR_SET_TIMING, 1, 0, EINVAL, 0},
>> +#ifdef HAVE_DECL_PR_SET_NO_NEW_PRIVS
>> +	{PR_SET_NO_NEW_PRIVS, 0, 0, EINVAL, 0},
>> +	{PR_SET_NO_NEW_PRIVS, 1, 1, EINVAL, 0},
>> +	{PR_GET_NO_NEW_PRIVS, 1, 0, EINVAL, 0},
>> +#endif
>> +#ifdef HAVE_DECL_PR_SET_THP_DISABLE
>> +	{PR_SET_THP_DISABLE, 0, 1, EINVAL, 0},
>> +	{PR_GET_THP_DISABLE, 1, 0, EINVAL, 0},
>> +#endif
>> +#ifdef HAVE_DECL_PR_CAP_AMBIENT
>> +	{PR_CAP_AMBIENT, 2, 1, EINVAL, 0},
>> +#endif
>> +#ifdef HAVE_DECL_PR_GET_SPECULATION_CTR
>> +	{PR_GET_SPECULATION_CTRL, 1, 0, EINVAL, 0},
>> +#endif
>> +	{PR_SET_SECUREBITS, 0, 0, EPERM, 0},
>> +	{PR_CAPBSET_DROP, 1, 0, EPERM, 0},
>>   };
>>   
>>   static void verify_prctl(unsigned int n)
>>   {
>>   	struct tcase *tc = &tcases[n];
>>   
>> -	TEST(prctl(tc->option, tc->arg2));
>> +	if (tc->arg3 == 2)
>> +		tc->arg3 = (unsigned long)&strict;
>> +	if (tc->bad_addr) {
>> +		if (tc->arg2)
>> +			tc->arg3 = (unsigned long)tst_get_bad_addr(NULL);
>> +		else
>> +			tc->arg2 = (unsigned long)tst_get_bad_addr(NULL);
>> +	}
> I do not like this hackery, can't we just change the test to use
> pointers to pointers and initialize global variables in the test setup
> as we usually do?

Ok. I will do it as we usually do.

>
>> +	TEST(prctl(tc->option, tc->arg2, tc->arg3));
>>   	if (TST_RET == 0) {
>>   		tst_res(TFAIL, "prctl() succeeded unexpectedly");
>>   		return;
>> @@ -38,7 +123,10 @@ static void verify_prctl(unsigned int n)
>>   	if (tc->exp_errno == TST_ERR) {
>>   		tst_res(TPASS | TTERRNO, "prctl() failed as expected");
>>   	} else {
>> -		tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
>> +		if (tc->option == PR_SET_SECCOMP && TST_ERR == EINVAL)
>> +			tst_res(TCONF, "current system was not built with CONFIG_SECCOMP.");
>> +		else
>> +			tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
>>   				tst_strerrno(tc->exp_errno));
>>   	}
>>   }
>> @@ -46,4 +134,9 @@ static void verify_prctl(unsigned int n)
>>   static struct tst_test test = {
>>   	.tcnt = ARRAY_SIZE(tcases),
>>   	.test = verify_prctl,
>> +	.caps = (struct tst_cap []) {
>> +		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
>> +		TST_CAP(TST_CAP_DROP, CAP_SETPCAP),
>> +		{}
>> +	},
>>   };
>> -- 
>> 2.18.0
>>
>>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp



--------------8C2E3B0A7C9733B8B0DE1544
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/07 22:54, Cyril Hrubis wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191107145416.GA25608@rei.lan">
      <pre class="moz-quote-pre" wrap="">Hi!
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> #include &lt;errno.h&gt;
 #include &lt;signal.h&gt;
 #include &lt;sys/prctl.h&gt;
-
+#include &lt;linux/filter.h&gt;
+#include &lt;linux/capability.h&gt;
+#include &lt;unistd.h&gt;
+#include &lt;stdlib.h&gt;
+#include &lt;stddef.h&gt;
+#include "config.h"
+#include "lapi/prctl.h"
+#include "lapi/seccomp.h"
+#include "lapi/syscalls.h"
 #include "tst_test.h"
+#include "tst_capability.h"
 
 #define OPTION_INVALID 999
 #define INVALID_ARG 999
 
+static const struct sock_filter  strict_filter[] = {
+	BPF_STMT(BPF_LD | BPF_W | BPF_ABS, (offsetof (struct seccomp_data, nr))),
+
+	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_close, 5, 0),
+	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_exit,  4, 0),
+	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_wait4, 3, 0),
+	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_write, 2, 0),
+	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_clone, 1, 0),
+
+	BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
+	BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW)
+};
+
+static const struct sock_fprog  strict = {
+	.len = (unsigned short)ARRAY_SIZE(strict_filter),
+	.filter = (struct sock_filter *)strict_filter
+};
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We do have the exact same bytecode in the prctl04.c, can we put it to a
header and include it in both tests?

Or alternatively do we need more than just one-liner with
BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW) here?</pre>
    </blockquote>
    <pre>we only need one-liner with BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW) here.
</pre>
    <blockquote type="cite" cite="mid:20191107145416.GA25608@rei.lan">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> static struct tcase {
 	int option;
 	unsigned long arg2;
+	unsigned long arg3;
 	int exp_errno;
+	int bad_addr;
 } tcases[] = {
-	{OPTION_INVALID, 0, EINVAL},
-	{PR_SET_PDEATHSIG, INVALID_ARG, EINVAL},
+	{OPTION_INVALID, 0, 0, EINVAL, 0},
+	{PR_SET_PDEATHSIG, INVALID_ARG, 0, EINVAL, 0},
+	{PR_SET_DUMPABLE, 2, 0, EINVAL, 0},
+	{PR_SET_NAME, 0, 0, EFAULT, 1},
+	{PR_SET_SECCOMP, 2, 0, EFAULT, 1},
+	{PR_SET_SECCOMP, 2, 2, EACCES, 0},
+	{PR_SET_TIMING, 1, 0, EINVAL, 0},
+#ifdef HAVE_DECL_PR_SET_NO_NEW_PRIVS
+	{PR_SET_NO_NEW_PRIVS, 0, 0, EINVAL, 0},
+	{PR_SET_NO_NEW_PRIVS, 1, 1, EINVAL, 0},
+	{PR_GET_NO_NEW_PRIVS, 1, 0, EINVAL, 0},
+#endif
+#ifdef HAVE_DECL_PR_SET_THP_DISABLE
+	{PR_SET_THP_DISABLE, 0, 1, EINVAL, 0},
+	{PR_GET_THP_DISABLE, 1, 0, EINVAL, 0},
+#endif
+#ifdef HAVE_DECL_PR_CAP_AMBIENT
+	{PR_CAP_AMBIENT, 2, 1, EINVAL, 0},
+#endif
+#ifdef HAVE_DECL_PR_GET_SPECULATION_CTR
+	{PR_GET_SPECULATION_CTRL, 1, 0, EINVAL, 0},
+#endif
+	{PR_SET_SECUREBITS, 0, 0, EPERM, 0},
+	{PR_CAPBSET_DROP, 1, 0, EPERM, 0},
 };
 
 static void verify_prctl(unsigned int n)
 {
 	struct tcase *tc = &amp;tcases[n];
 
-	TEST(prctl(tc-&gt;option, tc-&gt;arg2));
+	if (tc-&gt;arg3 == 2)
+		tc-&gt;arg3 = (unsigned long)&amp;strict;
+	if (tc-&gt;bad_addr) {
+		if (tc-&gt;arg2)
+			tc-&gt;arg3 = (unsigned long)tst_get_bad_addr(NULL);
+		else
+			tc-&gt;arg2 = (unsigned long)tst_get_bad_addr(NULL);
+	}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I do not like this hackery, can't we just change the test to use
pointers to pointers and initialize global variables in the test setup
as we usually do?</pre>
    </blockquote>
    <pre>Ok. I will do it as we usually do.</pre>
    <blockquote type="cite" cite="mid:20191107145416.GA25608@rei.lan">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	TEST(prctl(tc-&gt;option, tc-&gt;arg2, tc-&gt;arg3));
 	if (TST_RET == 0) {
 		tst_res(TFAIL, "prctl() succeeded unexpectedly");
 		return;
@@ -38,7 +123,10 @@ static void verify_prctl(unsigned int n)
 	if (tc-&gt;exp_errno == TST_ERR) {
 		tst_res(TPASS | TTERRNO, "prctl() failed as expected");
 	} else {
-		tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
+		if (tc-&gt;option == PR_SET_SECCOMP &amp;&amp; TST_ERR == EINVAL)
+			tst_res(TCONF, "current system was not built with CONFIG_SECCOMP.");
+		else
+			tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
 				tst_strerrno(tc-&gt;exp_errno));
 	}
 }
@@ -46,4 +134,9 @@ static void verify_prctl(unsigned int n)
 static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_prctl,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
+		TST_CAP(TST_CAP_DROP, CAP_SETPCAP),
+		{}
+	},
 };
-- 
2.18.0




-- 
Mailing list info: <a class="moz-txt-link-freetext" href="https://lists.linux.it/listinfo/ltp">https://lists.linux.it/listinfo/ltp</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8C2E3B0A7C9733B8B0DE1544--

--===============1212821747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1212821747==--
