Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD817215421
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 10:44:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 603953C29D9
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 10:44:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4A5213C04FD
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 10:44:23 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 10D3E200AED
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 10:44:21 +0200 (CEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0668WtX5086309; Mon, 6 Jul 2020 04:44:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 322nxx3amj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 04:44:17 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0668WwHX086601;
 Mon, 6 Jul 2020 04:44:17 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 322nxx3akw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 04:44:17 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0668aWNm027267;
 Mon, 6 Jul 2020 08:44:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 322hd7t2me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 08:44:15 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0668iCrw52232376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 08:44:13 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D357DA4062;
 Mon,  6 Jul 2020 08:44:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB551A4054;
 Mon,  6 Jul 2020 08:44:10 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.1.42])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jul 2020 08:44:10 +0000 (GMT)
To: Li Wang <liwang@redhat.com>, Cyril Hrubis <chrubis@suse.cz>
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
 <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
 <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
 <20200703125927.GA11556@yuki.lan>
 <CAEemH2cN735haDmyqbNa_LwDgumFqAspYfJaKRpsOg0Rij9tEA@mail.gmail.com>
From: Harish <harish@linux.ibm.com>
Message-ID: <1513894e-d23e-055e-df27-d8cf36b8c609@linux.ibm.com>
Date: Mon, 6 Jul 2020 14:14:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2cN735haDmyqbNa_LwDgumFqAspYfJaKRpsOg0Rij9tEA@mail.gmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_04:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007060064
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 5/6] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Donghai Qiao <dqiao@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 arnd@arndb.de
Content-Type: multipart/mixed; boundary="===============0403734558=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============0403734558==
Content-Type: multipart/alternative;
 boundary="------------D13FFF7A887E4D1CB650B3C7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D13FFF7A887E4D1CB650B3C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I tried the suggested patch, but was unsuccessful in running the test. 
Here is my diff.

diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index bc0bef273..7b465b1f6 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -14,11 +14,11 @@

  typedef int (*mysyscall)(clockid_t clk_id, void *ts);

-int syscall_supported_by_kernel(mysyscall func)
+int syscall_supported_by_kernel(long sysnr)
  {
      int ret;

-    ret = func(0, NULL);
+    ret = syscall(sysnr, 0, NULL);
      if (ret == -1 && errno == ENOSYS)
          return 0;

@@ -32,13 +32,13 @@ int tst_clock_getres(clockid_t clk_id, struct 
timespec *res)
      int ret;

  #if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)
-    if (!func && syscall_supported_by_kernel(sys_clock_getres64)) {
+    if (!func && syscall_supported_by_kernel(__NR_clock_getres_time64)) {
          func = sys_clock_getres64;
          tts.type = TST_KERN_TIMESPEC;
      }
  #endif

-    if (!func && syscall_supported_by_kernel(sys_clock_getres)) {
+    if (!func && syscall_supported_by_kernel(__NR_clock_getres)) {
          func = sys_clock_getres;
          tts.type = TST_KERN_OLD_TIMESPEC;
      }
@@ -62,13 +62,13 @@ int tst_clock_gettime(clockid_t clk_id, struct 
timespec *ts)
      int ret;

  #if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
-    if (!func && syscall_supported_by_kernel(sys_clock_gettime64)) {
+    if (!func && syscall_supported_by_kernel(__NR_clock_gettime64)) {
          func = sys_clock_gettime64;
          tts.type = TST_KERN_TIMESPEC;
      }
  #endif

-    if (!func && syscall_supported_by_kernel(sys_clock_gettime)) {
+    if (!func && syscall_supported_by_kernel(__NR_clock_gettime)) {
          func = sys_clock_gettime;
          tts.type = TST_KERN_OLD_TIMESPEC;
      }
@@ -91,13 +91,13 @@ int tst_clock_settime(clockid_t clk_id, struct 
timespec *ts)
      static mysyscall func;

  #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
-    if (!func && syscall_supported_by_kernel(sys_clock_settime64)) {
+    if (!func && syscall_supported_by_kernel(__NR_clock_settime64)) {
          func = sys_clock_settime64;
          tts.type = TST_KERN_TIMESPEC;
      }
  #endif

-    if (!func && syscall_supported_by_kernel(sys_clock_settime)) {
+    if (!func && syscall_supported_by_kernel(__NR_clock_settime)) {
          func = sys_clock_settime;
          tts.type = TST_KERN_OLD_TIMESPEC;
      }


$ ./runltp -s max_map_count
...
...
Running tests.......
<<<test_start>>>
tag=max_map_count stime=1594019344
cmdline="max_map_count -i 10"
contacts=""
analysis=exit
<<<test_output>>>
incrementing stop
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
../include/tst_timer.h:214: CONF: syscall(403) __NR_clock_gettime64 not 
supported

Summary:
passed   0
failed   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=32 corefile=no
cutime=0 cstime=0
<<<test_end>>>

Is there anything I am missing here? Thanks in advance.

Regards,
Harish

On 7/4/20 12:44 PM, Li Wang wrote:
> Hi Cyril,
>
> On Fri, Jul 3, 2020 at 8:59 PM Cyril Hrubis <chrubis@suse.cz 
> <mailto:chrubis@suse.cz>> wrote:
>
>     Hi!
>     I guess that we need:
>
>
> This method works for me, plz could you correct some typos as below.
>
>
>     diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
>     index bc0bef273..c0727a34c 100644
>     --- a/lib/tst_clocks.c
>     +++ b/lib/tst_clocks.c
>     @@ -14,11 +14,11 @@
>
>      typedef int (*mysyscall)(clockid_t clk_id, void *ts);
>
>     -int syscall_supported_by_kernel(mysyscall func)
>     +int syscall_supported_by_kernel(long sysnr)
>      {
>             int ret;
>
>     -       ret = func(0, NULL);
>     +       ret = syscall(sysnr, func(0, NULL);
>
> This line should be: ret = syscall(sysnr, 0, NULL);
>
>             if (ret == -1 && errno == ENOSYS)
>                     return 0;
>
>     @@ -32,13 +32,13 @@ int tst_clock_getres(clockid_t clk_id, struct
>     timespec *res)
>             int ret;
>
>      #if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)
>     -       if (!func &&
>     syscall_supported_by_kernel(sys_clock_getres64)) {
>     +       if (!func &&
>     syscall_supported_by_kernel(__NR_clock_getres64)) {
>
> if (!func && syscall_supported_by_kernel(__NR_clock_getres_time64 )) {
>
>                     func = sys_clock_getres64;
>                     tts.type = TST_KERN_TIMESPEC;
>             }
>      #endif
>
>     -       if (!func && syscall_supported_by_kernel(sys_clock_getres)) {
>     +       if (!func && syscall_supported_by_kernel(__NR_clock_getres)) {
>                     func = sys_clock_getres;
>                     tts.type = TST_KERN_OLD_TIMESPEC;
>             }
>     @@ -62,13 +62,13 @@ int tst_clock_gettime(clockid_t clk_id, struct
>     timespec *ts)
>             int ret;
>
>      #if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
>     -       if (!func &&
>     syscall_supported_by_kernel(sys_clock_gettime64)) {
>     +       if (!func &&
>     syscall_supported_by_kernel(__NR_clock_gettime64)) {
>                     func = sys_clock_gettime64;
>                     tts.type = TST_KERN_TIMESPEC;
>             }
>      #endif
>
>     -       if (!func && syscall_supported_by_kernel(sys_clock_gettime)) {
>     +       if (!func &&
>     syscall_supported_by_kernel(__NR_clock_gettime)) {
>                     func = sys_clock_gettime;
>                     tts.type = TST_KERN_OLD_TIMESPEC;
>             }
>     @@ -91,13 +91,13 @@ int tst_clock_settime(clockid_t clk_id, struct
>     timespec *ts)
>             static mysyscall func;
>
>      #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
>     -       if (!func &&
>     syscall_supported_by_kernel(sys_clock_settime64)) {
>     +       if (!func &&
>     syscall_supported_by_kernel(__NR_clock_settime64)) {
>                     func = sys_clock_settime64;
>                     tts.type = TST_KERN_TIMESPEC;
>             }
>      #endif
>
>     -       if (!func && syscall_supported_by_kernel(sys_clock_settime)) {
>     +       if (!func &&
>     syscall_supported_by_kernel(__NR_clock_settime)) {
>                     func = sys_clock_settime;
>                     tts.type = TST_KERN_OLD_TIMESPEC;
>             }
>
>     -- 
>     Cyril Hrubis
>     chrubis@suse.cz <mailto:chrubis@suse.cz>
>
>
>
> -- 
> Regards,
> Li Wang
>

--------------D13FFF7A887E4D1CB650B3C7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="-1">Hi,<br>
        <br>
        I tried the suggested patch, but was unsuccessful in running the
        test. Here is my diff.<br>
        <br>
        diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c<br>
        index bc0bef273..7b465b1f6 100644<br>
        --- a/lib/tst_clocks.c<br>
        +++ b/lib/tst_clocks.c<br>
        @@ -14,11 +14,11 @@<br>
         <br>
         typedef int (*mysyscall)(clockid_t clk_id, void *ts);<br>
         <br>
        -int syscall_supported_by_kernel(mysyscall func)<br>
        +int syscall_supported_by_kernel(long sysnr)<br>
         {<br>
             int ret;<br>
         <br>
        -    ret = func(0, NULL);<br>
        +    ret = syscall(sysnr, 0, NULL);<br>
             if (ret == -1 &amp;&amp; errno == ENOSYS)<br>
                 return 0;<br>
         <br>
        @@ -32,13 +32,13 @@ int tst_clock_getres(clockid_t clk_id,
        struct timespec *res)<br>
             int ret;<br>
         <br>
         #if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)<br>
        -    if (!func &amp;&amp;
        syscall_supported_by_kernel(sys_clock_getres64)) {<br>
        +    if (!func &amp;&amp;
        syscall_supported_by_kernel(__NR_clock_getres_time64)) {<br>
                 func = sys_clock_getres64;<br>
                 tts.type = TST_KERN_TIMESPEC;<br>
             }<br>
         #endif<br>
         <br>
        -    if (!func &amp;&amp;
        syscall_supported_by_kernel(sys_clock_getres)) {<br>
        +    if (!func &amp;&amp;
        syscall_supported_by_kernel(__NR_clock_getres)) {<br>
                 func = sys_clock_getres;<br>
                 tts.type = TST_KERN_OLD_TIMESPEC;<br>
             }<br>
        @@ -62,13 +62,13 @@ int tst_clock_gettime(clockid_t clk_id,
        struct timespec *ts)<br>
             int ret;<br>
         <br>
         #if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)<br>
        -    if (!func &amp;&amp;
        syscall_supported_by_kernel(sys_clock_gettime64)) {<br>
        +    if (!func &amp;&amp;
        syscall_supported_by_kernel(__NR_clock_gettime64)) {<br>
                 func = sys_clock_gettime64;<br>
                 tts.type = TST_KERN_TIMESPEC;<br>
             }<br>
         #endif<br>
         <br>
        -    if (!func &amp;&amp;
        syscall_supported_by_kernel(sys_clock_gettime)) {<br>
        +    if (!func &amp;&amp;
        syscall_supported_by_kernel(__NR_clock_gettime)) {<br>
                 func = sys_clock_gettime;<br>
                 tts.type = TST_KERN_OLD_TIMESPEC;<br>
             }<br>
        @@ -91,13 +91,13 @@ int tst_clock_settime(clockid_t clk_id,
        struct timespec *ts)<br>
             static mysyscall func;<br>
         <br>
         #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)<br>
        -    if (!func &amp;&amp;
        syscall_supported_by_kernel(sys_clock_settime64)) {<br>
        +    if (!func &amp;&amp;
        syscall_supported_by_kernel(__NR_clock_settime64)) {<br>
                 func = sys_clock_settime64;<br>
                 tts.type = TST_KERN_TIMESPEC;<br>
             }<br>
         #endif<br>
         <br>
        -    if (!func &amp;&amp;
        syscall_supported_by_kernel(sys_clock_settime)) {<br>
        +    if (!func &amp;&amp;
        syscall_supported_by_kernel(__NR_clock_settime)) {<br>
                 func = sys_clock_settime;<br>
                 tts.type = TST_KERN_OLD_TIMESPEC;<br>
             }<br>
        <br>
        <br>
        $ ./runltp -s max_map_count<br>
        ...<br>
        ...<br>
        Running tests.......<br>
        &lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
        tag=max_map_count stime=1594019344<br>
        cmdline="max_map_count -i 10"<br>
        contacts=""<br>
        analysis=exit<br>
        &lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
        incrementing stop<br>
        tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s<br>
        ../include/tst_timer.h:214: CONF: syscall(403)
        __NR_clock_gettime64 not supported<br>
        <br>
        Summary:<br>
        passed   0<br>
        failed   0<br>
        skipped  1<br>
        warnings 0<br>
        &lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
        initiation_status="ok"<br>
        duration=0 termination_type=exited termination_id=32 corefile=no<br>
        cutime=0 cstime=0<br>
        &lt;&lt;&lt;test_end&gt;&gt;&gt;<br>
        <br>
        Is there anything I am missing here? Thanks in advance.<br>
        <br>
        Regards,<br>
        Harish</font><br>
    </p>
    <div class="moz-cite-prefix">On 7/4/20 12:44 PM, Li Wang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEemH2cN735haDmyqbNa_LwDgumFqAspYfJaKRpsOg0Rij9tEA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small">Hi Cyril,</div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Jul 3, 2020 at 8:59
            PM Cyril Hrubis &lt;<a href="mailto:chrubis@suse.cz"
              moz-do-not-send="true">chrubis@suse.cz</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Hi!<br>
            I guess that we need:<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">This
              method works for me, plz could you correct some typos as
              below.</div>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c<br>
            index bc0bef273..c0727a34c 100644<br>
            --- a/lib/tst_clocks.c<br>
            +++ b/lib/tst_clocks.c<br>
            @@ -14,11 +14,11 @@<br>
            <br>
             typedef int (*mysyscall)(clockid_t clk_id, void *ts);<br>
            <br>
            -int syscall_supported_by_kernel(mysyscall func)<br>
            +int syscall_supported_by_kernel(long sysnr)<br>
             {<br>
                    int ret;<br>
            <br>
            -       ret = func(0, NULL);<br>
            +       ret = syscall(sysnr, func(0, NULL);<br>
          </blockquote>
          <div> </div>
          <div><span class="gmail_default" style="font-size:small">This
              line should be: ret = syscall(sysnr, 0, NULL);</span></div>
          <div><span class="gmail_default" style="font-size:small"></span> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
                    if (ret == -1 &amp;&amp; errno == ENOSYS)<br>
                            return 0;<br>
            <br>
            @@ -32,13 +32,13 @@ int tst_clock_getres(clockid_t clk_id,
            struct timespec *res)<br>
                    int ret;<br>
            <br>
             #if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)<br>
            -       if (!func &amp;&amp;
            syscall_supported_by_kernel(sys_clock_getres64)) {<br>
            +       if (!func &amp;&amp;
            syscall_supported_by_kernel(__NR_clock_getres64)) {</blockquote>
          <div> </div>
          <div><span class="gmail_default" style="font-size:small">if
              (!func &amp;&amp;
              syscall_supported_by_kernel(__NR_clock_getres_time64 )) {</span></div>
          <div><span class="gmail_default" style="font-size:small"></span> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"> </blockquote>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
                            func = sys_clock_getres64;<br>
                            tts.type = TST_KERN_TIMESPEC;<br>
                    }<br>
             #endif<br>
            <br>
            -       if (!func &amp;&amp;
            syscall_supported_by_kernel(sys_clock_getres)) {<br>
            +       if (!func &amp;&amp;
            syscall_supported_by_kernel(__NR_clock_getres)) {<br>
                            func = sys_clock_getres;<br>
                            tts.type = TST_KERN_OLD_TIMESPEC;<br>
                    }<br>
            @@ -62,13 +62,13 @@ int tst_clock_gettime(clockid_t clk_id,
            struct timespec *ts)<br>
                    int ret;<br>
            <br>
             #if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)<br>
            -       if (!func &amp;&amp;
            syscall_supported_by_kernel(sys_clock_gettime64)) {<br>
            +       if (!func &amp;&amp;
            syscall_supported_by_kernel(__NR_clock_gettime64)) {<br>
                            func = sys_clock_gettime64;<br>
                            tts.type = TST_KERN_TIMESPEC;<br>
                    }<br>
             #endif<br>
            <br>
            -       if (!func &amp;&amp;
            syscall_supported_by_kernel(sys_clock_gettime)) {<br>
            +       if (!func &amp;&amp;
            syscall_supported_by_kernel(__NR_clock_gettime)) {<br>
                            func = sys_clock_gettime;<br>
                            tts.type = TST_KERN_OLD_TIMESPEC;<br>
                    }<br>
            @@ -91,13 +91,13 @@ int tst_clock_settime(clockid_t clk_id,
            struct timespec *ts)<br>
                    static mysyscall func;<br>
            <br>
             #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)<br>
            -       if (!func &amp;&amp;
            syscall_supported_by_kernel(sys_clock_settime64)) {<br>
            +       if (!func &amp;&amp;
            syscall_supported_by_kernel(__NR_clock_settime64)) {<br>
                            func = sys_clock_settime64;<br>
                            tts.type = TST_KERN_TIMESPEC;<br>
                    }<br>
             #endif<br>
            <br>
            -       if (!func &amp;&amp;
            syscall_supported_by_kernel(sys_clock_settime)) {<br>
            +       if (!func &amp;&amp;
            syscall_supported_by_kernel(__NR_clock_settime)) {<br>
                            func = sys_clock_settime;<br>
                            tts.type = TST_KERN_OLD_TIMESPEC;<br>
                    }<br>
            <br>
            -- <br>
            Cyril Hrubis<br>
            <a href="mailto:chrubis@suse.cz" target="_blank"
              moz-do-not-send="true">chrubis@suse.cz</a><br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">
            <div>Regards,<br>
            </div>
            <div>Li Wang<br>
            </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D13FFF7A887E4D1CB650B3C7--


--===============0403734558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0403734558==--

