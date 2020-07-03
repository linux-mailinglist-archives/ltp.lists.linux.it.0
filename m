Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 578CE21359E
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 10:01:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E7B93C2A2A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 10:01:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8BE473C0271
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 10:01:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 78688601CFD
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 10:01:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,307,1589212800"; d="scan'208,217";a="95753847"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Jul 2020 16:01:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 05C4D4CE3F1A;
 Fri,  3 Jul 2020 16:00:59 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 3 Jul 2020 16:00:59 +0800
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <325a43a851acca8bb242011a1d62063c8154653c.1593152309.git.viresh.kumar@linaro.org>
 <0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org>
 <902db9f8-22d9-b641-746b-6ec61b8eaa21@cn.fujitsu.com>
 <20200703075136.enu2ovlfo25cwyca@vireshk-i7>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <2ced43d0-4bf0-982a-fd7e-3628716890c4@cn.fujitsu.com>
Date: Fri, 3 Jul 2020 16:00:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703075136.enu2ovlfo25cwyca@vireshk-i7>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 05C4D4CE3F1A.AF470
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/sched_rr_get_interval: Validate the
 timeslice
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1839732174=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1839732174==
Content-Type: multipart/alternative;
	boundary="------------505FDF61E193AF138E166D93"

--------------505FDF61E193AF138E166D93
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Viresh

> On 03-07-20, 15:43, Yang Xu wrote:
>> Hi Viresh
>>
>> Can we add a linux tag for this case(also a regression test for the before kernel patch).
> Right, so this patch must be tested for kernels >= v3.9. I missed
> that. This is what you were referring to, right ?

We only need to check /proc/sys/kernel/sched_rr_timeslice_ms whether existed in setup phase and
then check proc value in run like prctl08.c[1].

[1]https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/prctl/prctl08.c

>
> What's the regression test you are suggesting here ?

The following kernel patch.

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed8732cb81f55c021c441ae662dd040b5

>



--------------505FDF61E193AF138E166D93
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <pre>Hi Viresh
</pre>
    <div class="moz-cite-prefix">
      <pre>
</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20200703075136.enu2ovlfo25cwyca@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">On 03-07-20, 15:43, Yang Xu wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Viresh

Can we add a linux tag for this case(also a regression test for the before kernel patch).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Right, so this patch must be tested for kernels &gt;= v3.9. I missed
that. This is what you were referring to, right ?</pre>
    </blockquote>
    <pre>We only need to check /proc/sys/kernel/sched_rr_timeslice_ms whether existed in setup phase and 
then check proc value in run like prctl08.c[1].

[1]<a class="moz-txt-link-freetext" href="https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/prctl/prctl08.c">https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/prctl/prctl08.c</a>
</pre>
    <blockquote type="cite"
      cite="mid:20200703075136.enu2ovlfo25cwyca@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">

What's the regression test you are suggesting here ?</pre>
    </blockquote>
    <pre>The following kernel patch. </pre>
    <pre class="moz-quote-pre" wrap=""> <a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed8732cb81f55c021c441ae662dd040b5">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed8732cb81f55c021c441ae662dd040b5</a></pre>
    <blockquote type="cite"
      cite="mid:20200703075136.enu2ovlfo25cwyca@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------505FDF61E193AF138E166D93--

--===============1839732174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1839732174==--
