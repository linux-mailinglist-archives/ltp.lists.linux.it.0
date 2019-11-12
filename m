Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B9F89AF
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 08:27:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F26F3C2271
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 08:27:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 403EC3C1865
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 08:27:53 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 13F111A0174E
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 08:27:49 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,295,1569254400"; d="scan'208,217";a="78306624"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Nov 2019 15:27:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 38DD14CE1A05;
 Tue, 12 Nov 2019 15:19:32 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 12 Nov 2019 15:27:39 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20191108142434.GA5913@rei>
 <1573462752-6679-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191111163144.GB16894@rei.lan>
 <43e4f419-0100-dc52-7159-2355e9de1639@cn.fujitsu.com>
 <5DCA5206.3040508@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <ac6040e3-d561-cd53-e538-e3e6c8953ecc@cn.fujitsu.com>
Date: Tue, 12 Nov 2019 15:27:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5DCA5206.3040508@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 38DD14CE1A05.AE9A7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/prctl02: add more error tests
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0953546247=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0953546247==
Content-Type: multipart/alternative;
	boundary="------------32AC8AE5CFCBFB5DFBA6FC8C"

--------------32AC8AE5CFCBFB5DFBA6FC8C
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/11/12 14:32, Xiao Yang wrote:

> On 2019/11/12 11:02, Yang Xu wrote:
>>
>>
>> on 2019/11/12 0:31, Cyril Hrubis wrote:
>>> Hi!
>>>> +static const struct sock_fprog strict = {
>>>> +	.len = (unsigned short)ARRAY_SIZE(strict_filter),
>>>> +	.filter = (struct sock_filter *)strict_filter
>>>> +};
>>>> +
>>>> +static const struct sock_fprog *strict_addr = &strict;
>>> This should be:
>>>
>>> static unsigned long strict_addr = (unsigned long)&strict;
>> OK.
>>>> +static unsigned long bad_addr;
>>>> +static unsigned long num_0;
>>>> +static unsigned long num_1 = 1;
>>>> +static unsigned long num_2 = 2;
>>>> +static unsigned long num_invalid = 999;
>>>>   
>>>>   static struct tcase {
>>>>   	int option;
>>>> -	unsigned long arg2;
>>>> +	unsigned long *arg2;
>>>> +	unsigned long *arg3;
>>>>   	int exp_errno;
>>>>   } tcases[] = {
>>>> -	{OPTION_INVALID, 0, EINVAL},
>>>> -	{PR_SET_PDEATHSIG, INVALID_ARG, EINVAL},
>>>> +	{OPTION_INVALID, &num_1, &num_0, EINVAL},
>>>> +	{PR_SET_PDEATHSIG, &num_invalid, &num_0, EINVAL},
>>>> +	{PR_SET_DUMPABLE, &num_2, &num_0, EINVAL},
>>>> +	{PR_SET_NAME, &bad_addr, &num_0, EFAULT},
>>>> +	{PR_SET_SECCOMP, &num_2, &bad_addr, EFAULT},
>>>> +	{PR_SET_SECCOMP, &num_2, &strict_addr, EACCES},
>>>> +	{PR_SET_TIMING, &num_1, &num_0, EINVAL},
>>>> +#ifdef HAVE_DECL_PR_SET_NO_NEW_PRIVS
>>>> +	{PR_SET_NO_NEW_PRIVS, &num_0, &num_0, EINVAL},
>>>> +	{PR_SET_NO_NEW_PRIVS, &num_1, &num_0, EINVAL},
>>>> +	{PR_GET_NO_NEW_PRIVS, &num_1, &num_0, EINVAL},
>>>> +#endif
>>>> +#ifdef HAVE_DECL_PR_SET_THP_DISABLE
>>>> +	{PR_SET_THP_DISABLE, &num_0, &num_1, EINVAL},
>>>> +	{PR_GET_THP_DISABLE, &num_1, &num_1, EINVAL},
>>>> +#endif
>>>> +#ifdef HAVE_DECL_PR_CAP_AMBIENT
>>>> +	{PR_CAP_AMBIENT, &num_2, &num_1, EINVAL},
>>>> +#endif
>>>> +#ifdef HAVE_DECL_PR_GET_SPECULATION_CTRL
>>>> +	{PR_GET_SPECULATION_CTRL, &num_1, &num_0, EINVAL},
>>>> +#endif
>>> Why the ifdefs, you have even added a fallback definitions into the lapi
>>> header?
>>>
>>> The usuall way how to deal with these is to:
>>>
>>> 1) Add fallback definitions to lapi
>>> 2) Ensure these tests does not fail on older kernels
>>>
>>>     We do expect EINVAL in these cases anyways, which is what we would
>>>     get if the prctl() option is unknown to the kernel anyways, so here
>>>     we can just get rid of these ifdefs and things should work fine.
>> For me, a fallback definitions into the lapi header is only for fixing undefined error on old kernel.
> Hi Yang,
>
> 1) Can undefined error be triggered on old kernel if you use ifdef?  It seems unnecessary for ifdef method to include lapi header.

Yes. It can be triggered and it should use #if HAVE_DECL_PR_GET_SPECULATION_CTRL instead of #ifdef.
Yes. And we should add more check( such as PR_SET_SECCOMP undefined 2.6.18-398.el5) in m4/ltp-prctl.m4 so that we cannot include lapi header.

> 2) Undfined option in glibc doesn't mean that kernel doesn't support it as well.

options definitions is in linux/prctl.h. For most distributions, I think if it is in supported in kernel-header, it should also been
supported on kernel.

>> IMO, we only test options that kernel supports.
>> If we test an unsupported option, our case reports EINVAL that will give user a false impression(kernel
>> supports it, but argument or environment is bad). I think we should check they whether supported before run
>> (ifdef is a way).
>>
>> ps: If we test EPERM error(cap is not in PI or PP) of PR_CAP_AMBIENT on old kernel,  they will report EINVAL.
>> So, I think ifdef is needed.
> Why don't we check if the specified option is supported by calling it 
> with correct args?(i.e. don't mix unsupported option up with wrong args).
>
It sounds reasonable.  I will try it in verify_prctl function if you and cyril have strong opposition to #if.

>
> Best Regards,
> Xiao Yang
>>>> +	{PR_SET_SECUREBITS, &num_0, &num_0, EPERM},
>>>> +	{PR_CAPBSET_DROP, &num_1, &num_0, EPERM},
>>>>   };
>>>>   
>>>>   static void verify_prctl(unsigned int n)
>>>>   {
>>>>   	struct tcase *tc = &tcases[n];
>>>>   
>>>> -	TEST(prctl(tc->option, tc->arg2));
>>>> +	TEST(prctl(tc->option, *tc->arg2, *tc->arg3));
>>>>   	if (TST_RET == 0) {
>>>>   		tst_res(TFAIL, "prctl() succeeded unexpectedly");
>>>>   		return;
>>>>   	}
>>>>   
>>>>   	if (tc->exp_errno == TST_ERR) {
>>>> -		tst_res(TPASS | TTERRNO, "prctl() failed as expected");
>>>> +		tst_res(TPASS | TTERRNO, "prctl() %d failed as expected", tc->option);
>>>>   	} else {
>>>> -		tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
>>>> +		if (tc->option == PR_SET_SECCOMP && TST_ERR == EINVAL)
>>>> +			tst_res(TCONF, "current system was not built with CONFIG_SECCOMP.");
>>>> +		else
>>>> +			tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
>>>>   				tst_strerrno(tc->exp_errno));
>>>>   	}
>>>>   }
>>>>   
>>>> +static void setup(void)
>>>> +{
>>>> +	bad_addr = (unsigned long)tst_get_bad_addr(NULL);
>>>> +}
>>>> +
>>>>   static struct tst_test test = {
>>>> +	.setup = setup,
>>>>   	.tcnt = ARRAY_SIZE(tcases),
>>>>   	.test = verify_prctl,
>>>> +	.caps = (struct tst_cap []) {
>>>> +		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
>>>> +		TST_CAP(TST_CAP_DROP, CAP_SETPCAP),
>>>> +		{}
>>>> +	},
>>>>   };
>>>> -- 
>>>> 2.18.0
>>>>
>>>>
>>>>
>>
>>
>



--------------32AC8AE5CFCBFB5DFBA6FC8C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/12 14:32, Xiao Yang wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:5DCA5206.3040508@cn.fujitsu.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      On 2019/11/12 11:02, Yang Xu wrote:
      <blockquote
        cite="mid:43e4f419-0100-dc52-7159-2355e9de1639@cn.fujitsu.com"
        type="cite">
        <p><br>
        </p>
        <div class="moz-cite-prefix">
          <pre>on 2019/11/12 0:31, Cyril Hrubis wrote:</pre>
        </div>
        <blockquote type="cite"
          cite="mid:20191111163144.GB16894@rei.lan">
          <pre class="moz-quote-pre" wrap="">Hi!
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+static const struct sock_fprog strict = {
+	.len = (unsigned short)ARRAY_SIZE(strict_filter),
+	.filter = (struct sock_filter *)strict_filter
+};
+
+static const struct sock_fprog *strict_addr = &amp;strict;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">This should be:

static unsigned long strict_addr = (unsigned long)&amp;strict;</pre>
        </blockquote>
        <pre>OK. </pre>
        <blockquote type="cite"
          cite="mid:20191111163144.GB16894@rei.lan">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+static unsigned long bad_addr;
+static unsigned long num_0;
+static unsigned long num_1 = 1;
+static unsigned long num_2 = 2;
+static unsigned long num_invalid = 999;
 
 static struct tcase {
 	int option;
-	unsigned long arg2;
+	unsigned long *arg2;
+	unsigned long *arg3;
 	int exp_errno;
 } tcases[] = {
-	{OPTION_INVALID, 0, EINVAL},
-	{PR_SET_PDEATHSIG, INVALID_ARG, EINVAL},
+	{OPTION_INVALID, &amp;num_1, &amp;num_0, EINVAL},
+	{PR_SET_PDEATHSIG, &amp;num_invalid, &amp;num_0, EINVAL},
+	{PR_SET_DUMPABLE, &amp;num_2, &amp;num_0, EINVAL},
+	{PR_SET_NAME, &amp;bad_addr, &amp;num_0, EFAULT},
+	{PR_SET_SECCOMP, &amp;num_2, &amp;bad_addr, EFAULT},
+	{PR_SET_SECCOMP, &amp;num_2, &amp;strict_addr, EACCES},
+	{PR_SET_TIMING, &amp;num_1, &amp;num_0, EINVAL},
+#ifdef HAVE_DECL_PR_SET_NO_NEW_PRIVS
+	{PR_SET_NO_NEW_PRIVS, &amp;num_0, &amp;num_0, EINVAL},
+	{PR_SET_NO_NEW_PRIVS, &amp;num_1, &amp;num_0, EINVAL},
+	{PR_GET_NO_NEW_PRIVS, &amp;num_1, &amp;num_0, EINVAL},
+#endif
+#ifdef HAVE_DECL_PR_SET_THP_DISABLE
+	{PR_SET_THP_DISABLE, &amp;num_0, &amp;num_1, EINVAL},
+	{PR_GET_THP_DISABLE, &amp;num_1, &amp;num_1, EINVAL},
+#endif
+#ifdef HAVE_DECL_PR_CAP_AMBIENT
+	{PR_CAP_AMBIENT, &amp;num_2, &amp;num_1, EINVAL},
+#endif
+#ifdef HAVE_DECL_PR_GET_SPECULATION_CTRL
+	{PR_GET_SPECULATION_CTRL, &amp;num_1, &amp;num_0, EINVAL},
+#endif
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Why the ifdefs, you have even added a fallback definitions into the lapi
header?

The usuall way how to deal with these is to:

1) Add fallback definitions to lapi
2) Ensure these tests does not fail on older kernels

   We do expect EINVAL in these cases anyways, which is what we would
   get if the prctl() option is unknown to the kernel anyways, so here
   we can just get rid of these ifdefs and things should work fine.</pre>
        </blockquote>
        <pre>For me, a fallback definitions into the lapi header is only for fixing undefined error on old kernel. 
</pre>
      </blockquote>
      Hi Yang, <br>
      <br>
      <pre>1) Can undefined error be triggered on old kernel if you use ifdef?  It seems unnecessary for ifdef method to include lapi header.</pre>
    </blockquote>
    <pre>Yes. It can be triggered and it should use #if HAVE_DECL_PR_GET_SPECULATION_CTRL instead of #ifdef. 
Yes. And we should add more check( such as PR_SET_SECCOMP undefined 2.6.18-398.el5) in m4/ltp-prctl.m4 so that we cannot include lapi header.
</pre>
    <blockquote type="cite" cite="mid:5DCA5206.3040508@cn.fujitsu.com">
      <pre>
2) Undfined option in glibc doesn't mean that kernel doesn't support it as well.</pre>
    </blockquote>
    <pre>options definitions is in linux/prctl.h. For most distributions, I think if it is in supported in kernel-header, it should also been 
supported on kernel.<span class="gt-baf-term-text"><span class="gt-baf-cell gt-baf-word-clickable"></span></span></pre>
    <blockquote type="cite" cite="mid:5DCA5206.3040508@cn.fujitsu.com">
      <pre>
</pre>
      <blockquote
        cite="mid:43e4f419-0100-dc52-7159-2355e9de1639@cn.fujitsu.com"
        type="cite">
        <pre>IMO, we only test options that kernel supports. 
If we test an unsupported option, our case reports EINVAL that will give user a false impression(kernel 
supports it, but argument or environment is bad). I think we should check they whether supported before run
(ifdef is a way).

ps: If we test EPERM error(cap is not in PI or PP) of PR_CAP_AMBIENT on old kernel,  they will report EINVAL. 
So, I think ifdef is needed. 
</pre>
      </blockquote>
      Why don't we check if the specified option is supported by calling
      it with correct args?(i.e. don't mix unsupported option up with
      wrong args).<br>
      <br>
    </blockquote>
    <pre>It sounds reasonable.  I will try it in verify_prctl function if you and cyril have strong opposition to #if. </pre>
    <blockquote type="cite" cite="mid:5DCA5206.3040508@cn.fujitsu.com">
      <br>
      Best Regards,<br>
      Xiao Yang<br>
      <blockquote
        cite="mid:43e4f419-0100-dc52-7159-2355e9de1639@cn.fujitsu.com"
        type="cite">
        <blockquote type="cite"
          cite="mid:20191111163144.GB16894@rei.lan">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+	{PR_SET_SECUREBITS, &amp;num_0, &amp;num_0, EPERM},
+	{PR_CAPBSET_DROP, &amp;num_1, &amp;num_0, EPERM},
 };
 
 static void verify_prctl(unsigned int n)
 {
 	struct tcase *tc = &amp;tcases[n];
 
-	TEST(prctl(tc-&gt;option, tc-&gt;arg2));
+	TEST(prctl(tc-&gt;option, *tc-&gt;arg2, *tc-&gt;arg3));
 	if (TST_RET == 0) {
 		tst_res(TFAIL, "prctl() succeeded unexpectedly");
 		return;
 	}
 
 	if (tc-&gt;exp_errno == TST_ERR) {
-		tst_res(TPASS | TTERRNO, "prctl() failed as expected");
+		tst_res(TPASS | TTERRNO, "prctl() %d failed as expected", tc-&gt;option);
 	} else {
-		tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
+		if (tc-&gt;option == PR_SET_SECCOMP &amp;&amp; TST_ERR == EINVAL)
+			tst_res(TCONF, "current system was not built with CONFIG_SECCOMP.");
+		else
+			tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
 				tst_strerrno(tc-&gt;exp_errno));
 	}
 }
 
+static void setup(void)
+{
+	bad_addr = (unsigned long)tst_get_bad_addr(NULL);
+}
+
 static struct tst_test test = {
+	.setup = setup,
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



</pre>
          </blockquote>
        </blockquote>
        <pre wrap=""><fieldset class="mimeAttachmentHeader"></fieldset>

</pre>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------32AC8AE5CFCBFB5DFBA6FC8C--

--===============0953546247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0953546247==--
