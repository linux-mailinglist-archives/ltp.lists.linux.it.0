Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EAA1C3824
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 13:33:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF5303C039E
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 13:33:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2ED803C0270
 for <ltp@lists.linux.it>; Mon,  4 May 2020 13:32:57 +0200 (CEST)
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CD8BA1000A1A
 for <ltp@lists.linux.it>; Mon,  4 May 2020 13:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=GygS9
 kXlIvT4w/hLPpQtwc78dPJLLAjz5pit4ONWjjA=; b=Ok6338kkCg2gyfGnDT2Et
 c6N3SNismv7qSkHCXlYvbyFCZwkokdbASCr1ad0EpqHXMBjO5X7MG+9qeL56ff5o
 5BZ4B7YeDqzoWKfs6NyPp6mWfiFoX9XaJ/FCOtU49s32jrOcWpvgBEVctVlQ2dBU
 WUH9CtCKmR0V9JRpofDK4k=
Received: from [192.168.0.10] (unknown [223.64.162.136])
 by smtp11 (Coremail) with SMTP id D8CowAAHLQFK_a9eI8sTBQ--.7S2;
 Mon, 04 May 2020 19:32:26 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200504050937.oassdcfg4x5zh4nm@vireshk-i7>
 <43140aa8.315c.171dece8540.Coremail.ice_yangxiao@163.com>
Message-ID: <19216dad-ec85-692c-e7fa-baa402f60b31@163.com>
Date: Mon, 4 May 2020 19:32:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <43140aa8.315c.171dece8540.Coremail.ice_yangxiao@163.com>
Content-Language: en-US
X-CM-TRANSID: D8CowAAHLQFK_a9eI8sTBQ--.7S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1xCFW5GrWDZFy7XF1DWrg_yoW5Zr1rpF
 s3AF4xCrWDJrZ7Can3Ca17tF15uw18Ar15Jrn8JryrXF1jvr93Xr4Sg3WrCFW5GrW8tFW0
 qFy8Jr13G34UGrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-NVgUUUUU=
X-Originating-IP: [223.64.162.136]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiqAsaXlc7O8K0zgAAsI
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Content-Type: multipart/mixed; boundary="===============1269910324=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============1269910324==
Content-Type: multipart/alternative;
 boundary="------------31ABCA48D200CF43D623B88B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------31ABCA48D200CF43D623B88B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Viresh,

Please ignore this reply.

Thanks,

Xiao Yang

On 5/4/20 4:30 PM, 杨晓 wrote:
>
> ----- Original Message -----
> From: "Viresh Kumar" <viresh.kumar@linaro.org>
> To: "Xiao Yang" <yangx.jy@cn.fujitsu.com>
> Cc: ltp@lists.linux.it
> Sent: Mon, 4 May 2020 10:39:37 +0530
> Subject: Re: [LTP] [PATCH 1/2] syscalls/pidfd_open01.c: Add check for close-on-exec flag 
>
>
> On 30-04-20, 16:57, Xiao Yang wrote:
> > pidfd_open(2) will set close-on-exec flag on the file descriptor as it
> > manpage states, so check close-on-exec flag by fcntl(2).
> >
> > Also avoid compiler warning by replacing (long) TST_RET with (int) pidfd:
> > ------------------------------------------------------
> > In file included from pidfd_open01.c:9:
> > pidfd_open01.c: In function ‘run’:
> > ../../../../include/tst_test.h:76:41: warning: format ‘%i’ expects argument of type ‘int’, but argument 5 has type ‘long int’ [-Wformat=]
> >    76 |   tst_brk_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
> >       |                                         ^~~~~~~~~
> > ../../../../include/tst_safe_macros.h:224:5: note: in expansion of macro ‘tst_brk’
> >   224 |     tst_brk(TBROK | TERRNO,                          \
> >       |     ^~~~~~~
> > pidfd_open01.c:20:9: note: in expansion of macro ‘SAFE_FCNTL’
> >    20 |  flag = SAFE_FCNTL(TST_RET, F_GETFD);
>
> This log isn't useful as the warning started coming after your change
> only and not before.
>
> Hi，
>
> Right，just add a hint why I use pidfd instead so I want to keep it. 
>  Of course，I will say that avoid compiler warning from my change in v2 
> patch.
>
> Thanks，
> Xiao Yang
>
> > ------------------------------------------------------
> >
> > Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> > ---
> >  .../kernel/syscalls/pidfd_open/pidfd_open01.c  | 18 ++++++++++++++----
> >  1 file changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
> > index 93bb86687..293e93b63 100644
> > --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
> > +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
> > @@ -6,17 +6,27 @@
> >   * Basic pidfd_open() test, fetches the PID of the current process and tries to
> >   * get its file descriptor.
> >   */
> > +
> > +#include <sys/types.h>
> > +#include <unistd.h>
> > +#include <fcntl.h>
> >  #include "tst_test.h"
> >  #include "lapi/pidfd_open.h"
> >
> >  static void run(void)
> >  {
> > - TEST(pidfd_open(getpid(), 0));
> > + int pidfd = 0, flag = 0;
>
> None of these need to be initialized.
>
> > +
> > + pidfd = pidfd_open(getpid(), 0);
> > + if (pidfd == -1)
> > + tst_brk(TFAIL | TERRNO, "pidfd_open(getpid(), 0) failed");
>
> This could have been written as:
>         TEST(pidfd = pidfd_open(getpid(), 0));
>
> > +
> > + flag = SAFE_FCNTL(pidfd, F_GETFD);
> >
> > - if (TST_RET == -1)
> > - tst_brk(TFAIL | TTERRNO, "pidfd_open(getpid(), 0) failed");
> > + SAFE_CLOSE(pidfd);
> >
> > - SAFE_CLOSE(TST_RET);
> > + if (!(flag & FD_CLOEXEC))
> > + 
> tst_brk(TFAIL, "pidfd_open(getpid(), 0) didn't set close-on-exec flag");
> >
> >   tst_res(TPASS, "pidfd_open(getpid(), 0) passed");
> >  }
> > --
> > 2.21.0
> >
> >
>
> -- 
> viresh
>
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>
>

--------------31ABCA48D200CF43D623B88B
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Viresh,</p>
    <p>Please ignore this reply.</p>
    <p>Thanks,</p>
    <p>Xiao Yang<br>
    </p>
    <div class="moz-cite-prefix">On 5/4/20 4:30 PM, 杨晓 wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:43140aa8.315c.171dece8540.Coremail.ice_yangxiao@163.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <br>
      ----- Original Message -----
      <br>
      From: "Viresh Kumar" <a class="moz-txt-link-rfc2396E" href="mailto:viresh.kumar@linaro.org">&lt;viresh.kumar@linaro.org&gt;</a>
      <br>
      To: "Xiao Yang" <a class="moz-txt-link-rfc2396E" href="mailto:yangx.jy@cn.fujitsu.com">&lt;yangx.jy@cn.fujitsu.com&gt;</a>
      <br>
      Cc: <a class="moz-txt-link-abbreviated" href="mailto:ltp@lists.linux.it">ltp@lists.linux.it</a>
      <br>
      Sent: Mon, 4 May 2020 10:39:37 +0530
      <br>
Subject: Re: [LTP] [PATCH 1/2] syscalls/pidfd_open01.c: Add check for close-on-exec flag
      <br>
      <br>
      On 30-04-20, 16:57, Xiao Yang wrote:<br>
&gt; pidfd_open(2) will set close-on-exec flag on the file descriptor as it<br>
      &gt; manpage states, so check close-on-exec flag by fcntl(2).<br>
      &gt; <br>
&gt; Also avoid compiler warning by replacing (long) TST_RET with (int) pidfd:<br>
      &gt; ------------------------------------------------------<br>
      &gt; In file included from pidfd_open01.c:9:<br>
      &gt; pidfd_open01.c: In function ‘run’:<br>
&gt; ../../../../include/tst_test.h:76:41: warning: format ‘%i’ expects argument of type ‘int’, but argument 5 has type ‘long int’ [-Wformat=]<br>
&gt;    76 |   tst_brk_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\<br>
      &gt;       |                                         ^~~~~~~~~<br>
&gt; ../../../../include/tst_safe_macros.h:224:5: note: in expansion of macro ‘tst_brk’<br>
&gt;   224 |     tst_brk(TBROK | TERRNO,                          \<br>
      &gt;       |     ^~~~~~~<br>
      &gt; pidfd_open01.c:20:9: note: in expansion of macro ‘SAFE_FCNTL’<br>
      &gt;    20 |  flag = SAFE_FCNTL(TST_RET, F_GETFD);<br>
      <br>
This log isn't useful as the warning started coming after your change<br>
      only and not before.
      <div><br>
      </div>
      <div>Hi，</div>
      <div><br>
      </div>
      <div>Right，just add a hint why I use pidfd instead so I want to
        keep it.  Of course，I will <span style="background-color:
          transparent;">say that avoid compiler warning from my change
          in v2 patch.</span></div>
      <div><br>
      </div>
      <div>Thanks，</div>
      <div>Xiao Yang</div>
      <div><br>
        &gt; ------------------------------------------------------<br>
        &gt; <br>
        &gt; Signed-off-by: Xiao Yang <a class="moz-txt-link-rfc2396E" href="mailto:yangx.jy@cn.fujitsu.com">&lt;yangx.jy@cn.fujitsu.com&gt;</a><br>
        &gt; ---<br>
&gt;  .../kernel/syscalls/pidfd_open/pidfd_open01.c  | 18 ++++++++++++++----<br>
        &gt;  1 file changed, 14 insertions(+), 4 deletions(-)<br>
        &gt; <br>
&gt; diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c<br>
        &gt; index 93bb86687..293e93b63 100644<br>
        &gt; --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c<br>
        &gt; +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c<br>
        &gt; @@ -6,17 +6,27 @@<br>
&gt;   * Basic pidfd_open() test, fetches the PID of the current process and tries to<br>
        &gt;   * get its file descriptor.<br>
        &gt;   */<br>
        &gt; +<br>
        &gt; +#include &lt;sys/types.h&gt;<br>
        &gt; +#include &lt;unistd.h&gt;<br>
        &gt; +#include &lt;fcntl.h&gt;<br>
        &gt;  #include "tst_test.h"<br>
        &gt;  #include "lapi/pidfd_open.h"<br>
        &gt;  <br>
        &gt;  static void run(void)<br>
        &gt;  {<br>
        &gt; - TEST(pidfd_open(getpid(), 0));<br>
        &gt; + int pidfd = 0, flag = 0;<br>
        <br>
        None of these need to be initialized.<br>
        <br>
        &gt; +<br>
        &gt; + pidfd = pidfd_open(getpid(), 0);<br>
        &gt; + if (pidfd == -1)<br>
        &gt; +
        tst_brk(TFAIL | TERRNO, "pidfd_open(getpid(), 0) failed");<br>
        <br>
        This could have been written as:<br>
                TEST(pidfd = pidfd_open(getpid(), 0));<br>
        <br>
        &gt; +<br>
        &gt; + flag = SAFE_FCNTL(pidfd, F_GETFD);<br>
        &gt;  <br>
        &gt; - if (TST_RET == -1)<br>
        &gt; -
        tst_brk(TFAIL | TTERRNO, "pidfd_open(getpid(), 0) failed");<br>
        &gt; + SAFE_CLOSE(pidfd);<br>
        &gt;  <br>
        &gt; - SAFE_CLOSE(TST_RET);<br>
        &gt; + if (!(flag &amp; FD_CLOEXEC))<br>
        &gt; +
        tst_brk(TFAIL, "pidfd_open(getpid(), 0) didn't set close-on-exec flag");<br>
        &gt;  <br>
        &gt;   tst_res(TPASS, "pidfd_open(getpid(), 0) passed");<br>
        &gt;  }<br>
        &gt; -- <br>
        &gt; 2.21.0<br>
        &gt; <br>
        &gt; <br>
        <br>
        -- <br>
        viresh<br>
        <br>
        -- <br>
        Mailing list info: <a class="moz-txt-link-freetext" href="https://lists.linux.it/listinfo/ltp">https://lists.linux.it/listinfo/ltp</a><br>
      </div>
      <br>
      <br>
      <span title="neteasefooter">
        <p> </p>
      </span><br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------31ABCA48D200CF43D623B88B--


--===============1269910324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1269910324==--

