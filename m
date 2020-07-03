Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA43213547
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 09:43:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DEC13C5606
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 09:43:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 466AC3C1419
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 09:43:28 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D7B001401B60
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 09:43:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,307,1589212800"; d="scan'208,217";a="95753253"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Jul 2020 15:43:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8830D4CE4BD8;
 Fri,  3 Jul 2020 15:43:17 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 3 Jul 2020 15:43:18 +0800
To: Viresh Kumar <viresh.kumar@linaro.org>, <ltp@lists.linux.it>
References: <325a43a851acca8bb242011a1d62063c8154653c.1593152309.git.viresh.kumar@linaro.org>
 <0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <902db9f8-22d9-b641-746b-6ec61b8eaa21@cn.fujitsu.com>
Date: Fri, 3 Jul 2020 15:43:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8830D4CE4BD8.AF994
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de
Content-Type: multipart/mixed; boundary="===============1064730526=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1064730526==
Content-Type: multipart/alternative;
	boundary="------------F2E87FE1DEC5CF39388560D1"

--------------F2E87FE1DEC5CF39388560D1
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Viresh

Can we add a linux tag for this case(also a regression test for the before kernel patch).

> Validate the timespec returned by sched_rr_get_interval() against the
> value read from /proc/sys/kernel/sched_rr_timeslice_ms.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   .../syscalls/sched_rr_get_interval/sched_rr_get_interval01.c     | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
> index 31d7b5d56a52..f358c91ac505 100644
> --- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
> +++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
> @@ -62,6 +62,7 @@ static void run(void)
>   		        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
>   	}
>   
> +	TST_ASSERT_INT("/proc/sys/kernel/sched_rr_timeslice_ms", tst_ts_to_ms(tp));
>   }
>   
>   static struct tst_test test = {



--------------F2E87FE1DEC5CF39388560D1
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
      <pre>Can we add a linux tag for this case(also a regression test for the before kernel patch).
</pre>
    </div>
    <blockquote type="cite"
cite="mid:0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org">
      <pre class="moz-quote-pre" wrap="">Validate the timespec returned by sched_rr_get_interval() against the
value read from /proc/sys/kernel/sched_rr_timeslice_ms.

Signed-off-by: Viresh Kumar <a class="moz-txt-link-rfc2396E" href="mailto:viresh.kumar@linaro.org">&lt;viresh.kumar@linaro.org&gt;</a>
---
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval01.c     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index 31d7b5d56a52..f358c91ac505 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -62,6 +62,7 @@ static void run(void)
 		        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
 	}
 
+	TST_ASSERT_INT("/proc/sys/kernel/sched_rr_timeslice_ms", tst_ts_to_ms(tp));
 }
 
 static struct tst_test test = {
</pre>
    </blockquote>
  </body>
</html>

--------------F2E87FE1DEC5CF39388560D1--

--===============1064730526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1064730526==--
