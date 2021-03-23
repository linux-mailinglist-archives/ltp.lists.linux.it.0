Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9923457B8
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 07:22:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED5213C2878
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 07:22:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id EA26A3C284A
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 07:22:12 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 546481400DB6
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 07:22:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616480529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Me9imGcGkwafSN/+YHNi3JBeI+YGjpKs5eKPx3pdHFQ=;
 b=ewUGeBC63/qJrfABPjjTkEUa+kr48aq1TKxDqbf26+U4Ikt+ZJ3c8SyETUQV23hapRIyz7
 Z84ipgzxSb6B5Y1cDYohBK/wdxr+M2RKTImn2/99OPsMVbU78VMW33AR9yuTphMcfURti8
 wLcjSEd8gYvW35kqOT92CfzPiHKTBUc=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-VXqBSPsPPx6ToiqGos9VKg-1; Tue, 23 Mar 2021 02:22:04 -0400
X-MC-Unique: VXqBSPsPPx6ToiqGos9VKg-1
Received: by mail-yb1-f198.google.com with SMTP id o9so1690964yba.18
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 23:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Me9imGcGkwafSN/+YHNi3JBeI+YGjpKs5eKPx3pdHFQ=;
 b=YqDLUIBAUAzzufLg/tgOpfZ/26ZPduX5nsFCGkZy79C1c0Z25G5Iv0LrfNQyihFgun
 EnwjqqWXs2Nv+ksN8GTK3xNI7J0l6RoDTuSK+ajI44KTGpCgMugPxOARpvxiI+rgw2cK
 5wM7DwA2lwkv+w4YTN6BtLcWfGQwda1XYTWEQhWrBqdF0XXeppyIdTf7GYkBglrLrcyK
 wK3y76BP44oRIM8Wl68WiqujF/gji2Ln1FhsJJoLPeyDyaHALI7dcJ8tJPZwKmsesM31
 r/sHjou+o1T4NUe0c4Xmd1jrtC6cDjb66lf95cggOpk1G5grhxELj4QIoJ4IW9XgxMgY
 +C4A==
X-Gm-Message-State: AOAM530DFmSOnnKi1ebUSVclySVu1kI/EiOxgYwY4Fp6jA2gpqbuWAPr
 +A2IO38XuUjYPD/PdGlYb3TQGtJWulac9YhPJwvE7yS1q0zKO+hAfGKJmi0kyWOvdB0ZM2dAohQ
 m5DPS39BYkP1VQnAADkEI2rT2f1Y=
X-Received: by 2002:a5b:787:: with SMTP id b7mr3199832ybq.243.1616480524316;
 Mon, 22 Mar 2021 23:22:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVgyA+6QXkLzYWaBtU6b/9FIO1pZ4hYZQy7reqZ5QBQ28/M+HnLru8RBZ/SC7tGBYSjwfhCfgOgYQQB1pfUw0=
X-Received: by 2002:a5b:787:: with SMTP id b7mr3199799ybq.243.1616480523991;
 Mon, 22 Mar 2021 23:22:03 -0700 (PDT)
MIME-Version: 1.0
From: Li Wang <liwang@redhat.com>
Date: Tue, 23 Mar 2021 14:21:52 +0800
Message-ID: <CAEemH2cELFSMzEYM-Gd1LxNuFzVE2PcG1chzyaVhW2YCJjjzdw@mail.gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [s390x vDSO Bug?] clock_gettime(CLOCK_MONOTONIC_RAW,
 ...) gets abnormal ts value
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
Cc: linux-s390@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 LTP List <ltp@lists.linux.it>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: multipart/mixed; boundary="===============1308793801=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1308793801==
Content-Type: multipart/alternative; boundary="0000000000006b50f305be2e33f7"

--0000000000006b50f305be2e33f7
Content-Type: text/plain; charset="UTF-8"

Hi linux-s390 experts,

We observed that LTP/clock_gettime04 always FAIL on s390x with
kernel-v5.12-rc3.
To simply show the problem, I rewrite the LTP reproducer as a simple C
below.
Maybe it's a new bug introduced from the kernel-5.12 series branch?

PASS:
------------
# uname -r
5.11.0-*.s390x

# grep TIME_NS /boot/config-5.11.0-*.s390x
no TIME_NS enabled

## ./test-timer
vdso_ts_nsec = 898169901815, vdso_ts.tv_sec = 898, vdso_ts.tv_nsec =
169901815
sys_ts_nsec  = 898169904269, sys_ts.tv_sec  = 898, sys_ts.tv_nsec  =
169904269
===> PASS

FAIL:
----------
# uname -r
5.12.0-0.rc3.*.s390x

# grep TIME_NS /boot/config-5.12.0-0.rc3.s390x
CONFIG_TIME_NS=y
CONFIG_GENERIC_VDSO_TIME_NS=y

# ./test-timer
vdso_ts_nsec = 4484351380985507, vdso_ts.tv_sec = 4484351, vdso_ts.tv_nsec
= 380985507
sys_ts_nsec  = 1446923235377, sys_ts.tv_sec  = 1446, sys_ts.tv_nsec  =
923235377
===> FAIL


# cat test-timer.c

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <time.h>
#include <sys/time.h>
#include <asm/unistd_64.h>

long long ts_to_ns(struct timespec ts)
{
        return (ts.tv_sec * 1000000000 + ts.tv_nsec);
}

int main(void)
{
        long long vdso_ts_nsec, sys_ts_nsec;

        struct timespec vdso_ts, sys_ts;

        clock_gettime(CLOCK_MONOTONIC_RAW, &vdso_ts); //vdso way
        syscall(__NR_clock_gettime, CLOCK_MONOTONIC_RAW, &sys_ts);

        vdso_ts_nsec = ts_to_ns(vdso_ts);
        sys_ts_nsec  = ts_to_ns(sys_ts);


        printf("vdso_ts_nsec = %lld, vdso_ts.tv_sec = %ld, vdso_ts.tv_nsec
= %ld\n", vdso_ts_nsec, vdso_ts.tv_sec, vdso_ts.tv_nsec);
        printf("sys_ts_nsec  = %lld, sys_ts.tv_sec  = %ld, sys_ts.tv_nsec
 = %ld\n", sys_ts_nsec, sys_ts.tv_sec, sys_ts.tv_nsec);

        if ((vdso_ts_nsec - sys_ts_nsec) > 1000000)
                printf("===> FAIL\n");
        else
                printf("===> PASS\n");

        return 0;
}

-- 
Regards,
Li Wang

--0000000000006b50f305be2e33f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi =
linux-s390 experts,</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">We ob=
served that LTP/clock_gettime04 always FAIL on s390x with kernel-v5.12-rc3.=
</div><div class=3D"gmail_default" style=3D"font-size:small">To simply show=
 the problem, I rewrite the LTP reproducer as a simple C below.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Maybe it&#39;s a new bug i=
ntroduced from the kernel-5.12 series branch?</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">PASS:</div><div class=3D"gmail_default" style=3D"font-=
size:small">------------</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"># uname -r<br>5.11.0-*.s390x<br></div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small"># grep TIME_NS /boot/config-5.11.0-*.s390x<br></div><div =
class=3D"gmail_default" style=3D"font-size:small">no TIME_NS enabled</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">## ./test-timer<br></div>vdso_=
ts_nsec =3D 898169901815, vdso_ts.tv_sec =3D 898, vdso_ts.tv_nsec =3D 16990=
1815<br>sys_ts_nsec =C2=A0=3D 898169904269, sys_ts.tv_sec =C2=A0=3D 898, sy=
s_ts.tv_nsec =C2=A0=3D 169904269<br>=3D=3D=3D&gt; PASS<br><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">FAIL:</div><div class=3D"gmail_default" style=
=3D"font-size:small">----------</div><div class=3D"gmail_default" style=3D"=
font-size:small"># uname -r<br>5.12.0-0.rc3.*.s390x<br></div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"># grep TIME_NS /boot/config-5.12.0-0.rc3.s39=
0x <br>CONFIG_TIME_NS=3Dy<br>CONFIG_GENERIC_VDSO_TIME_NS=3Dy<br></div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small"># ./test-timer <br>vdso_ts_nsec =3D=
 4484351380985507, vdso_ts.tv_sec =3D 4484351, vdso_ts.tv_nsec =3D 38098550=
7<br>sys_ts_nsec =C2=A0=3D 1446923235377, sys_ts.tv_sec =C2=A0=3D 1446, sys=
_ts.tv_nsec =C2=A0=3D 923235377<br>=3D=3D=3D&gt; FAIL<br></div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small"><br># cat test-timer.c=C2=A0</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">#include &lt;stdio.h&gt;<br>#include=
 &lt;unistd.h&gt;<br>#include &lt;sys/types.h&gt;<br>#include &lt;time.h&gt=
;<br>#include &lt;sys/time.h&gt;<br>#include &lt;asm/unistd_64.h&gt;<br><br=
>long long ts_to_ns(struct timespec ts)<br>{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return (ts.tv_sec * 1000000000 + ts.tv_nsec);<br>}<br><br>int main(void)<b=
r>{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 long long vdso_ts_nsec, sys_ts_nsec;<br>=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec vdso_ts, sys_ts;<br><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 clock_gettime(CLOCK_MONOTONIC_RAW, &amp;vdso_ts); =
//vdso way<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall(__NR_clock_gettime, CLOCK=
_MONOTONIC_RAW, &amp;sys_ts);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdso_ts_ns=
ec =3D ts_to_ns(vdso_ts);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys_ts_nsec =C2=A0=
=3D ts_to_ns(sys_ts);<br><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;v=
dso_ts_nsec =3D %lld, vdso_ts.tv_sec =3D %ld, vdso_ts.tv_nsec =3D %ld\n&quo=
t;, vdso_ts_nsec, vdso_ts.tv_sec, vdso_ts.tv_nsec);<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 printf(&quot;sys_ts_nsec =C2=A0=3D %lld, sys_ts.tv_sec =C2=A0=3D %l=
d, sys_ts.tv_nsec =C2=A0=3D %ld\n&quot;, sys_ts_nsec, sys_ts.tv_sec, sys_ts=
.tv_nsec);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((vdso_ts_nsec - sys_ts_ns=
ec) &gt; 1000000)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;=3D=3D=3D&gt; FAIL\n&quot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(=
&quot;=3D=3D=3D&gt; PASS\n&quot;);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n 0;<br>}<br></div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div>-- <br><div dir=3D"ltr" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000006b50f305be2e33f7--


--===============1308793801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1308793801==--

