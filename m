Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1E6213A0B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 14:26:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CEA03C2A34
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 14:26:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D27753C0739
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 14:26:23 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9F0D1601B29
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 14:25:21 +0200 (CEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063CBKKp075435; Fri, 3 Jul 2020 08:26:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3224f10c6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 08:26:17 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 063CQCoH113652;
 Fri, 3 Jul 2020 08:26:17 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3224f10c64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 08:26:17 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 063CQFZ0005740;
 Fri, 3 Jul 2020 12:26:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3217b01nqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 12:26:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 063CQDGh9568546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jul 2020 12:26:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 125E211C04A;
 Fri,  3 Jul 2020 12:26:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88CBC11C04C;
 Fri,  3 Jul 2020 12:26:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.70.153])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Jul 2020 12:26:11 +0000 (GMT)
To: Li Wang <liwang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
 <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
 <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
From: Harish <harish@linux.ibm.com>
Message-ID: <01e75ebb-224d-064c-7438-deb1da34204c@linux.ibm.com>
Date: Fri, 3 Jul 2020 17:56:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_06:2020-07-02,
 2020-07-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0
 cotscore=-2147483648 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007030086
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,TRACKER_ID autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: Donghai Qiao <dqiao@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 arnd@arndb.de
Content-Type: multipart/mixed; boundary="===============0266269353=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============0266269353==
Content-Type: multipart/alternative;
 boundary="------------8202B6B2C1FD4F35BFBDCE5B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8202B6B2C1FD4F35BFBDCE5B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

+1. I am also facing the same issue with many similar tests.

# uname -rm
4.18.0-211.el8.ppc64le ppc64le

Regards,
Harish

On 7/3/20 3:25 PM, Li Wang wrote:
> Hi Viresh,
> Seems this patch involved a new regression:(.
>
> Viresh Kumar <viresh.kumar@linaro.org 
> <mailto:viresh.kumar@linaro.org>> wrote:
>
>     ...
>
>     +typedef int (*mysyscall)(clockid_t clk_id, void *ts);
>     +
>     +int syscall_supported_by_kernel(mysyscall func)
>     +{
>     +       int ret;
>     +
>     +       ret = func(0, NULL); 
>
>     +       if (ret == -1 && errno == ENOSYS)
>     +               return 0;
>     +
>     +       return 1;
>     +}
>     ... }
>
>      int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
>      {
>     -       return tst_syscall(__NR_clock_gettime, clk_id, ts);
>     +       struct tst_ts tts = { 0, };
>     +       static mysyscall func;
>     +       int ret;
>     +
>     +#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
>     +       if (!func &&
>     syscall_supported_by_kernel(sys_clock_gettime64)) {
>
>
> To invoke sys_clock_gettime64 here makes no chance to choose the 
> correct syscall version since tst_syscall() will exit directly when 
> getting ENOSYS.
>
> We got many tests TCONF like the mmap18 did as below:
> -------------------
> # uname -rm
> 5.8.0-rc2+ aarch64
> # ./mmap18
> tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
> ../include/tst_timer.h:214: CONF: syscall(403) __NR_clock_gettime64 
> not supported
>
> the function call trace:
> -----------------------------
> testrun()
> get_time_ms
> ...
> tst_clock_gettime
> syscall_supported_by_kernel
> sys_clock_gettime64
> tst_syscall(__NR_clock_gettime64, ...)
>
>
> ---- syscalls/regen.sh -----
> #define tst_syscall(NR, ...) ({ \\
>         int tst_ret; \\
>         if (NR == __LTP__NR_INVALID_SYSCALL) { \\
>                 errno = ENOSYS; \\
>                 tst_ret = -1; \\
>         } else { \\
>                 tst_ret = syscall(NR, ##__VA_ARGS__); \\
>         } \\
>         if (tst_ret == -1 && errno == ENOSYS) { \\
>                 tst_brk(TCONF, "syscall(%d) " #NR " not supported", 
> NR); \\
>         } \\
>         tst_ret; \\
> })
>
>     +               func = sys_clock_gettime64;
>     +               tts.type = TST_KERN_TIMESPEC;
>     +       }
>     +#endif
>     +
>     +       if (!func && syscall_supported_by_kernel(sys_clock_gettime)) {
>     +               func = sys_clock_gettime;
>     +               tts.type = TST_KERN_OLD_TIMESPEC;
>     +       }
>     +
>     +       if (!func) {
>     +               tst_res(TCONF, "clock_gettime() not available");
>     +               errno = ENOSYS;
>     +               return -1;
>     +       }
>     +
>     +       ret = func(clk_id, tst_ts_get(&tts));
>     +       ts->tv_sec = tst_ts_get_sec(tts);
>     +       ts->tv_nsec = tst_ts_get_nsec(tts);
>     +       return ret;
>      }
>
>
> Regards,
> Li Wang
>

--------------8202B6B2C1FD4F35BFBDCE5B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="-1">Hi,<br>
        <br>
        +1. I am also facing the same issue with many similar tests.<br>
        <br>
        # uname -rm<br>
        4.18.0-211.el8.ppc64le ppc64le<br>
        <br>
        Regards,<br>
        Harish<br>
      </font><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 3:25 PM, Li Wang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small">Hi Viresh,</div>
        </div>
        <div class="gmail_default" style="font-size:small">Seems this
          patch involved a new regression:(.</div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">Viresh Kumar &lt;<a
              href="mailto:viresh.kumar@linaro.org"
              moz-do-not-send="true">viresh.kumar@linaro.org</a>&gt;
            wrote:<br>
          </div>
          <div dir="ltr" class="gmail_attr"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><span
              class="gmail_default" style="font-size:small">...</span><br>
            <br>
            +typedef int (*mysyscall)(clockid_t clk_id, void *ts);<br>
            +<br>
            +int syscall_supported_by_kernel(mysyscall func)<br>
            +{<br>
            +       int ret;<br>
            +<br>
            +       ret = func(0, NULL); </blockquote>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +       if (ret == -1 &amp;&amp; errno == ENOSYS)<br>
            +               return 0;<br>
            +<br>
            +       return 1;<br>
            +}<br>
            <span class="gmail_default" style="font-size:small">...</span> }<br>
            <br>
             int tst_clock_gettime(clockid_t clk_id, struct timespec
            *ts)<br>
             {<br>
            -       return tst_syscall(__NR_clock_gettime, clk_id, ts);<br>
            +       struct tst_ts tts = { 0, };<br>
            +       static mysyscall func;<br>
            +       int ret;<br>
            +<br>
            +#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)<br>
            +       if (!func &amp;&amp;
            syscall_supported_by_kernel(sys_clock_gettime64)) {<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">
              <div><span class="gmail_default">To
                  invoke sys_clock_gettime64 here makes no chance to
                  choose </span>the correct syscall version since
                tst_syscall() will exit directly when getting ENOSYS.</div>
              <div><span class="gmail_default"><br>
                  We got many tests TCONF like the mmap18 did as below:</span></div>
              <div><span class="gmail_default">-------------------<br>
                  # uname -rm<br>
                  5.8.0-rc2+ aarch64<br>
                  # ./mmap18<br>
                  tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s<br>
                  ../include/tst_timer.h:214: CONF: syscall(403)
                  __NR_clock_gettime64 not supported</span></div>
              <div><span class="gmail_default"><br>
                </span></div>
              <div><span class="gmail_default">the function call trace:</span></div>
              <div><span class="gmail_default">-----------------------------</span></div>
              <div><span class="gmail_default">
                  <div>
                    <div class="gmail_default">testrun()</div>
                    <div class="gmail_default">get_time_ms</div>
                    <div class="gmail_default">...</div>
                  </div>
                  <div>
                    <div class="gmail_default">tst_clock_gettime</div>
                    <div class="gmail_default">syscall_supported_by_kernel</div>
                    <div class="gmail_default">sys_clock_gettime64</div>
                    <div class="gmail_default">tst_syscall(__NR_clock_gettime64,
                      ...)</div>
                  </div>
                  <div><span class="gmail_default"><br>
                    </span></div>
                  <br>
                  ---- syscalls/regen.sh -----<br>
                  #define tst_syscall(NR, ...) ({ \\<br>
                          int tst_ret; \\<br>
                          if (NR == __LTP__NR_INVALID_SYSCALL) { \\<br>
                                  errno = ENOSYS; \\<br>
                                  tst_ret = -1; \\<br>
                          } else { \\<br>
                                  tst_ret = syscall(NR, ##__VA_ARGS__);
                  \\<br>
                          } \\<br>
                          if (tst_ret == -1 &amp;&amp; errno == ENOSYS)
                  { \\<br>
                                  tst_brk(TCONF, "syscall(%d) " #NR "
                  not supported", NR); \\<br>
                          } \\<br>
                          tst_ret; \\<br>
                  })</span></div>
            </div>
          </div>
          <div><br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +               func = sys_clock_gettime64;<br>
            +               tts.type = TST_KERN_TIMESPEC;<br>
            +       }<br>
            +#endif<br>
            +<br>
            +       if (!func &amp;&amp;
            syscall_supported_by_kernel(sys_clock_gettime)) {<br>
            +               func = sys_clock_gettime;<br>
            +               tts.type = TST_KERN_OLD_TIMESPEC;<br>
            +       }<br>
            +<br>
            +       if (!func) {<br>
            +               tst_res(TCONF, "clock_gettime() not
            available");<br>
            +               errno = ENOSYS;<br>
            +               return -1;<br>
            +       }<br>
            +<br>
            +       ret = func(clk_id, tst_ts_get(&amp;tts));<br>
            +       ts-&gt;tv_sec = tst_ts_get_sec(tts);<br>
            +       ts-&gt;tv_nsec = tst_ts_get_nsec(tts);<br>
            +       return ret;<br>
             }<br>
            <span class="gmail_default" style="font-size:small"></span></blockquote>
          <div><br>
          </div>
          <div> </div>
        </div>
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

--------------8202B6B2C1FD4F35BFBDCE5B--


--===============0266269353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0266269353==--

