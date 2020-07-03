Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C72133BC
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 07:52:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2ECCF3C5603
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 07:52:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 309143C0ECC
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 07:52:43 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 67AEB600F00
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 07:51:39 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,307,1589212800"; d="scan'208,217";a="95749634"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Jul 2020 13:52:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6BE164CE4BD6;
 Fri,  3 Jul 2020 13:52:33 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 3 Jul 2020 13:52:34 +0800
To: Viresh Kumar <viresh.kumar@linaro.org>, Cyril Hrubis <chrubis@suse.cz>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <325a43a851acca8bb242011a1d62063c8154653c.1593152309.git.viresh.kumar@linaro.org>
 <20200702130654.GC9101@yuki.lan> <20200703031532.bjkwhkpfobdsxj4p@vireshk-i7>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <fb2f4706-2739-9ab7-3b1f-a741cf055680@cn.fujitsu.com>
Date: Fri, 3 Jul 2020 13:52:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703031532.bjkwhkpfobdsxj4p@vireshk-i7>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6BE164CE4BD6.A03D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 05/19] syscalls/sched_rr_get_interval: Add
 support for time64 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 arnd@arndb.de
Content-Type: multipart/mixed; boundary="===============1350983280=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1350983280==
Content-Type: multipart/alternative;
	boundary="------------E35D7B9C0939D0BF92212452"

--------------E35D7B9C0939D0BF92212452
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Viresh

> On 02-07-20, 15:06, Cyril Hrubis wrote:
>> Btw, we may as well add a check that the value is consistent with
>> /proc/sys/kernel/sched_rr_timeslice_ms.

I guess cyril may want to add a check using TST_ASSERT_INT api like this

TST_ASSERT_INT("/proc/sys/kernel/sched_rr_timeslice_ms", tst_ts_to_ms(tp));

> diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
> index 31d7b5d56a52..0641b6651502 100644
> --- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
> +++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
> @@ -44,6 +44,7 @@ static void setup(void)
>   static void run(void)
>   {
>          struct test_variants *tv = &variants[tst_variant];
> +       unsigned long long timeslice_ms;
>   
>          TEST(tv->func(0, tst_ts_get(&tp)));
>   
> @@ -54,6 +55,8 @@ static void run(void)
>                          TST_RET);
>          }
>   
> +       SAFE_FILE_SCANF("/proc/sys/kernel/sched_rr_timeslice_ms", "%llu", &timeslice_ms);
> +
>          if (!tst_ts_valid(&tp)) {
>                  tst_res(TPASS, "Time quantum %llis %llins",
>                          tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
> @@ -62,6 +65,7 @@ static void run(void)
>                          tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
>          }
>   
> +       tst_res(TINFO, "%llu: %llu", timeslice_ms, tst_ts_to_ms(tp));
>   }
>   
>   static struct tst_test test = {
>
>
>
> and it is coming as:
>
> sched_rr_get_interval01.c:68: INFO: 25: 100
>
> They aren't consistent here. Perhaps because first one is system wide
> while other one is per process ?

It is strange.
On my machine, the two values are all 100. AFAIK, it has a bug (set in milliseconds but the result is shown in jiffies.) on old kernel whenCONFIG_HZ is not 1000. what kernel version do you test?
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed8732cb81f55c021c441ae662dd040b5

>



--------------E35D7B9C0939D0BF92212452
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
      cite="mid:20200703031532.bjkwhkpfobdsxj4p@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">On 02-07-20, 15:06, Cyril Hrubis wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Btw, we may as well add a check that the value is consistent with
/proc/sys/kernel/sched_rr_timeslice_ms.
</pre>
      </blockquote>
    </blockquote>
    <pre>I guess cyril may want to add a check using TST_ASSERT_INT api like this</pre>
    <pre>TST_ASSERT_INT("/proc/sys/kernel/sched_rr_timeslice_ms", tst_ts_to_ms(tp));</pre>
    <blockquote type="cite"
      cite="mid:20200703031532.bjkwhkpfobdsxj4p@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index 31d7b5d56a52..0641b6651502 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -44,6 +44,7 @@ static void setup(void)
 static void run(void)
 {
        struct test_variants *tv = &amp;variants[tst_variant];
+       unsigned long long timeslice_ms;
 
        TEST(tv-&gt;func(0, tst_ts_get(&amp;tp)));
 
@@ -54,6 +55,8 @@ static void run(void)
                        TST_RET);
        }
 
+       SAFE_FILE_SCANF("/proc/sys/kernel/sched_rr_timeslice_ms", "%llu", &amp;timeslice_ms);
+
        if (!tst_ts_valid(&amp;tp)) {
                tst_res(TPASS, "Time quantum %llis %llins",
                        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
@@ -62,6 +65,7 @@ static void run(void)
                        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
        }
 
+       tst_res(TINFO, "%llu: %llu", timeslice_ms, tst_ts_to_ms(tp));
 }
 
 static struct tst_test test = {



and it is coming as:

sched_rr_get_interval01.c:68: INFO: 25: 100

They aren't consistent here. Perhaps because first one is system wide
while other one is per process ?</pre>
    </blockquote>
    <pre>It is strange.
On my machine, the two values are all 100. AFAIK, it has a bug (<span style="display: inline !important; float: none; background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-family: monospace; font-size: 13.33px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: pre; word-spacing: 0px;">set in milliseconds 
but the result is shown in jiffies.</span>) on old kernel when <span style="display: inline !important; float: none; background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-family: monospace; font-size: 13.33px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: pre; word-spacing: 0px;">CONFIG_HZ is not 1000. what kernel version
do you test?
</span>
[1] <a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed8732cb81f55c021c441ae662dd040b5">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed8732cb81f55c021c441ae662dd040b5</a>
</pre>
    <blockquote type="cite"
      cite="mid:20200703031532.bjkwhkpfobdsxj4p@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------E35D7B9C0939D0BF92212452--

--===============1350983280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1350983280==--
