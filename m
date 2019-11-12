Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A72B5F8CDA
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:31:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 698453C255A
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:31:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8C2D73C2550
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 11:31:52 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0B6DE201DC4
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 11:31:50 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,295,1569254400"; d="scan'208,217";a="78329050"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Nov 2019 18:31:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id A13F84CE1A01;
 Tue, 12 Nov 2019 18:23:36 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 12 Nov 2019 18:31:38 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191108142434.GA5913@rei>
 <1573462752-6679-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191111163144.GB16894@rei.lan>
 <43e4f419-0100-dc52-7159-2355e9de1639@cn.fujitsu.com>
 <5DCA5206.3040508@cn.fujitsu.com>
 <ac6040e3-d561-cd53-e538-e3e6c8953ecc@cn.fujitsu.com>
 <20191112101512.GB9373@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <a41ad6e5-3ee0-e87a-3a2c-5ccd2fa0c396@cn.fujitsu.com>
Date: Tue, 12 Nov 2019 18:31:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191112101512.GB9373@rei.lan>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: A13F84CE1A01.AC060
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0927552981=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0927552981==
Content-Type: multipart/alternative;
	boundary="------------1272F53198083A65033DB858"

--------------1272F53198083A65033DB858
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/11/12 18:15, Cyril Hrubis wrote:

> Hi!
>>> 1) Can undefined error be triggered on old kernel if you use ifdef?  It seems unnecessary for ifdef method to include lapi header.
>> Yes. It can be triggered and it should use #if HAVE_DECL_PR_GET_SPECULATION_CTRL instead of #ifdef.
>> Yes. And we should add more check( such as PR_SET_SECCOMP undefined 2.6.18-398.el5) in m4/ltp-prctl.m4 so that we cannot include lapi header.
>>
>>> 2) Undfined option in glibc doesn't mean that kernel doesn't support it as well.
>> options definitions is in linux/prctl.h. For most distributions, I think if it is in supported in kernel-header, it should also been
>> supported on kernel.
> That is usually the case, but there are cons that I explained in the
> previous email.

OK.

>
>>>> IMO, we only test options that kernel supports.
>>>> If we test an unsupported option, our case reports EINVAL that will give user a false impression(kernel
>>>> supports it, but argument or environment is bad). I think we should check they whether supported before run
>>>> (ifdef is a way).
>>>>
>>>> ps: If we test EPERM error(cap is not in PI or PP) of PR_CAP_AMBIENT on old kernel,  they will report EINVAL.
>>>> So, I think ifdef is needed.
>>> Why don't we check if the specified option is supported by calling it
>>> with correct args?(i.e. don't mix unsupported option up with wrong args).
>>>
>> It sounds reasonable.  I will try it in verify_prctl function if you and cyril have strong opposition to #if.
> Okay, that will work. Calling it with correct parameters in test setup
> is 100% correct way how to find out if kernel implements the
> functionality.

OK. I will use correct parameters to check whether kernel implements the functionality in setup.
Thanks for your patiently explation.

ps: I will make v5 patch tomorrow.

>



--------------1272F53198083A65033DB858
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
      <pre>on 2019/11/12 18:15, Cyril Hrubis wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191112101512.GB9373@rei.lan">
      <pre class="moz-quote-pre" wrap="">Hi!
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">1) Can undefined error be triggered on old kernel if you use ifdef?  It seems unnecessary for ifdef method to include lapi header.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes. It can be triggered and it should use #if HAVE_DECL_PR_GET_SPECULATION_CTRL instead of #ifdef.
Yes. And we should add more check( such as PR_SET_SECCOMP undefined 2.6.18-398.el5) in m4/ltp-prctl.m4 so that we cannot include lapi header.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">2) Undfined option in glibc doesn't mean that kernel doesn't support it as well.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
options definitions is in linux/prctl.h. For most distributions, I think if it is in supported in kernel-header, it should also been
supported on kernel.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That is usually the case, but there are cons that I explained in the
previous email.</pre>
    </blockquote>
    <pre>OK.</pre>
    <blockquote type="cite" cite="mid:20191112101512.GB9373@rei.lan">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">IMO, we only test options that kernel supports.
If we test an unsupported option, our case reports EINVAL that will give user a false impression(kernel
supports it, but argument or environment is bad). I think we should check they whether supported before run
(ifdef is a way).

ps: If we test EPERM error(cap is not in PI or PP) of PR_CAP_AMBIENT on old kernel,  they will report EINVAL.
So, I think ifdef is needed.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Why don't we check if the specified option is supported by calling it 
with correct args?(i.e. don't mix unsupported option up with wrong args).

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">It sounds reasonable.  I will try it in verify_prctl function if you and cyril have strong opposition to #if.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Okay, that will work. Calling it with correct parameters in test setup
is 100% correct way how to find out if kernel implements the
functionality.</pre>
    </blockquote>
    <pre>OK. I will use correct parameters to check whether kernel implements the functionality in setup.
Thanks for your patiently explation.

ps: I will make v5 patch tomorrow.
</pre>
    <blockquote type="cite" cite="mid:20191112101512.GB9373@rei.lan">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------1272F53198083A65033DB858--

--===============0927552981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0927552981==--
