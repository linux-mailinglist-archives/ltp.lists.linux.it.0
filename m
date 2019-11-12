Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A1AF8CC6
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:25:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD8063C24F9
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:25:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 75BF03C2479
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 11:25:40 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 3553F2015BA
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 11:25:38 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,295,1569254400"; d="scan'208,217";a="78328861"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Nov 2019 18:25:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 0A89F4B6EC71;
 Tue, 12 Nov 2019 18:17:23 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 12 Nov 2019 18:25:30 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191108142434.GA5913@rei>
 <1573462752-6679-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191111163144.GB16894@rei.lan>
 <43e4f419-0100-dc52-7159-2355e9de1639@cn.fujitsu.com>
 <20191112101054.GA9373@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <6c171124-c9fe-2384-bf01-d08c666013df@cn.fujitsu.com>
Date: Tue, 12 Nov 2019 18:25:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191112101054.GA9373@rei.lan>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 0A89F4B6EC71.AF402
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1162584975=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1162584975==
Content-Type: multipart/alternative;
	boundary="------------CEEF0AF0A7CAE3D76C8E2E4F"

--------------CEEF0AF0A7CAE3D76C8E2E4F
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit

on 2019/11/12 18:10, Cyril Hrubis wrote:

> Hi!
>>> 1) Add fallback definitions to lapi
>>> 2) Ensure these tests does not fail on older kernels
>>>
>>>      We do expect EINVAL in these cases anyways, which is what we would
>>>      get if the prctl() option is unknown to the kernel anyways, so here
>>>      we can just get rid of these ifdefs and things should work fine.
>> For me, a fallback definitions into the lapi header is only for fixing undefined error on old kernel.
>>
>> IMO, we only test options that kernel supports.
>> If we test an unsupported option, our case reports EINVAL that will give user a false impression(kernel
>> supports it, but argument or environment is bad). I think we should check they whether supported before run
>> (ifdef is a way).
> However using ifdefs to assert kernel features never worked at all. The
> kernel headers usally lag behind the installed kernel in distribution
> and it's even more wrong when you are testing latest kernel on any given
> distro.
>
> If you want to check for kernel support the best thing is to use the
> tst_kvercmp() that checks the kernel version and even that does not work
> 100% reliably.

Yes. most distros backport upstream kernel patch and tst_kvercmp maybe useless.

>> ps: If we test EPERM error(cap is not in PI or PP) of PR_CAP_AMBIENT on old kernel,  they will report EINVAL.
>> So, I think ifdef is needed.
> No, ifdefs are never solution here. It will still fail if you compiled
> the test on newer distro and booted it up with older kernel.

Now, I agree with you. If new distro and booted it with older kernel, the ifdef is useless. I think we should use correct argument
as xiao said to check whether kernel supports these options.

>



--------------CEEF0AF0A7CAE3D76C8E2E4F
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/12 18:10, Cyril Hrubis wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191112101054.GA9373@rei.lan">
      <pre class="moz-quote-pre" wrap="">Hi!
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">1) Add fallback definitions to lapi
2) Ensure these tests does not fail on older kernels

    We do expect EINVAL in these cases anyways, which is what we would
    get if the prctl() option is unknown to the kernel anyways, so here
    we can just get rid of these ifdefs and things should work fine.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
For me, a fallback definitions into the lapi header is only for fixing undefined error on old kernel.

IMO, we only test options that kernel supports.
If we test an unsupported option, our case reports EINVAL that will give user a false impression(kernel
supports it, but argument or environment is bad). I think we should check they whether supported before run
(ifdef is a way).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
However using ifdefs to assert kernel features never worked at all. The
kernel headers usally lag behind the installed kernel in distribution
and it's even more wrong when you are testing latest kernel on any given
distro.

If you want to check for kernel support the best thing is to use the
tst_kvercmp() that checks the kernel version and even that does not work
100% reliably.
</pre>
    </blockquote>
    <pre>Yes. most distros backport upstream kernel patch and tst_kvercmp maybe useless.</pre>
    <blockquote type="cite" cite="mid:20191112101054.GA9373@rei.lan">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">ps: If we test EPERM error(cap is not in PI or PP) of PR_CAP_AMBIENT on old kernel,  they will report EINVAL.
So, I think ifdef is needed.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No, ifdefs are never solution here. It will still fail if you compiled
the test on newer distro and booted it up with older kernel.</pre>
    </blockquote>
    <pre>Now, I agree with you. If new distro and booted it with older kernel, the ifdef is useless. I think we should use correct argument
as xiao said to check whether kernel supports these options.
</pre>
    <blockquote type="cite" cite="mid:20191112101054.GA9373@rei.lan">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------CEEF0AF0A7CAE3D76C8E2E4F--

--===============1162584975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1162584975==--
