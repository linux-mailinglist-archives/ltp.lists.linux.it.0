Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0632136F6
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 11:01:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A50BE3C2A2A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 11:01:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B99B83C0EC0
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 11:01:21 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 15B52601533
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 11:00:18 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,307,1589212800"; d="scan'208,217";a="95756174"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Jul 2020 17:01:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3B5D34CE4BD9;
 Fri,  3 Jul 2020 17:01:12 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 3 Jul 2020 17:01:13 +0800
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <325a43a851acca8bb242011a1d62063c8154653c.1593152309.git.viresh.kumar@linaro.org>
 <0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org>
 <902db9f8-22d9-b641-746b-6ec61b8eaa21@cn.fujitsu.com>
 <20200703075136.enu2ovlfo25cwyca@vireshk-i7>
 <2ced43d0-4bf0-982a-fd7e-3628716890c4@cn.fujitsu.com>
 <20200703081852.7mxbhkfz6vgjfwak@vireshk-i7>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <5487571b-cef7-9907-29f8-885f430d9c08@cn.fujitsu.com>
Date: Fri, 3 Jul 2020 17:01:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703081852.7mxbhkfz6vgjfwak@vireshk-i7>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3B5D34CE4BD9.A1994
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1574313390=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1574313390==
Content-Type: multipart/alternative;
	boundary="------------5B35BE730ABDD73695D8778A"

--------------5B35BE730ABDD73695D8778A
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Viresh


> Yeah I got that you were talking about this, but I am not sure of what
> regression test you are asking for and if we should be adding a test
> towards it at all as this is a kernel bug and we should keep showing
> the error for such kernels, isn't it ?

Yes, we only add a linux tag and comment as below:
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -5,6 +5,10 @@
   *
   * Gets round-robin time quantum by calling sched_rr_get_interval() and
   * checks that the value is sane.
+ *
+ * It is also a regression test for kernel
+ * commit 975e155ed873 ("sched/rt: Show the 'sched_rr_timeslice' SCHED_RR
+ * timeslice tuning knob in milliseconds").
   */

  #include <sched.h>
@@ -53,7 +57,6 @@ static void run(void)
                 tst_res(TFAIL | TTERRNO, "Test Failed, sched_rr_get_interval() returned %ld",
                         TST_RET);
         }
-
         if (!tst_ts_valid(&tp)) {
                 tst_res(TPASS, "Time quantum %llis %llins",
                         tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
@@ -61,7 +64,7 @@ static void run(void)
                 tst_res(TFAIL, "Invalid time quantum %llis %llins",
                         tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
         }
-
+       TST_ASSERT_INT("/proc/sys/kernel/sched_rr_timeslice_ms", tst_ts_to_ms(tp));
  }

  static struct tst_test test = {
@@ -69,4 +72,8 @@ static struct tst_test test = {
         .test_variants = ARRAY_SIZE(variants),
         .setup = setup,
         .needs_root = 1,
+       .tags = (const struct tst_tag[]) {
+               {"linux-git", "975e155ed873"},
+               {}
+       }
  };

so run this case without this kernel patch and config_hz=250 fail as below:
sched_rr_get_interval01.c:40: INFO: Testing variant: syscall with old kernel spec
sched_rr_get_interval01.c:55: PASS: sched_rr_get_interval() passed
sched_rr_get_interval01.c:62: PASS: Time quantum 0s 100000000ns
sched_rr_get_interval01.c:67: FAIL: /proc/sys/kernel/sched_rr_timeslice_ms != 100 got 25

HINT: You _MAY_ be missing kernel fixes, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed873




--------------5B35BE730ABDD73695D8778A
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <pre>Hi Viresh
</pre>
    <div class="moz-cite-prefix"><br>
    </div>
    <blockquote type="cite"
      cite="mid:20200703081852.7mxbhkfz6vgjfwak@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">Yeah I got that you were talking about this, but I am not sure of what
regression test you are asking for and if we should be adding a test
towards it at all as this is a kernel bug and we should keep showing
the error for such kernels, isn't it ?</pre>
    </blockquote>
    <pre>Yes, we only add a linux tag and comment as below:
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -5,6 +5,10 @@
  *
  * Gets round-robin time quantum by calling sched_rr_get_interval() and
  * checks that the value is sane.
+ *
+ * It is also a regression test for kernel
+ * commit 975e155ed873 ("sched/rt: Show the 'sched_rr_timeslice' SCHED_RR
+ * timeslice tuning knob in milliseconds").
  */

 #include &lt;sched.h&gt;
@@ -53,7 +57,6 @@ static void run(void)
                tst_res(TFAIL | TTERRNO, "Test Failed, sched_rr_get_interval() returned %ld",
                        TST_RET);
        }
-
        if (!tst_ts_valid(&amp;tp)) {
                tst_res(TPASS, "Time quantum %llis %llins",
                        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
@@ -61,7 +64,7 @@ static void run(void)
                tst_res(TFAIL, "Invalid time quantum %llis %llins",
                        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
        }
-
+       TST_ASSERT_INT("/proc/sys/kernel/sched_rr_timeslice_ms", tst_ts_to_ms(tp));
 }

 static struct tst_test test = {
@@ -69,4 +72,8 @@ static struct tst_test test = {
        .test_variants = ARRAY_SIZE(variants),
        .setup = setup,
        .needs_root = 1,
+       .tags = (const struct tst_tag[]) {
+               {"linux-git", "975e155ed873"},
+               {}
+       }
 };

so run this case without this kernel patch and config_hz=250 fail as below:
sched_rr_get_interval01.c:40: INFO: Testing variant: syscall with old kernel spec
sched_rr_get_interval01.c:55: PASS: sched_rr_get_interval() passed
sched_rr_get_interval01.c:62: PASS: Time quantum 0s 100000000ns
sched_rr_get_interval01.c:67: FAIL: /proc/sys/kernel/sched_rr_timeslice_ms != 100 got 25

HINT: You _MAY_ be missing kernel fixes, see:

<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed873">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed873</a>

</pre>
  </body>
</html>

--------------5B35BE730ABDD73695D8778A--

--===============1574313390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1574313390==--
