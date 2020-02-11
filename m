Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC5158B76
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 09:50:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B77463C2686
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 09:50:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 336F43C233A
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 09:50:02 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B498B1401853
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 09:50:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581410996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RfKWCmIDZWdP6vGMkuPhGqgVbS80kGaVIfPP655VOsM=;
 b=howyhIOgC+THZKXBvzHYk1dyxU12l7hzpo0ifUgw4wHah8kAtkQ1m0b6NVVApkQx6seRLd
 YNMXfrjIHwreuO6yAWqlDbqOxG75yVq5OmnaZQpiaEoyJaFUfAY5vQiQSYUXiIuXGlpqy/
 uN/sr1xr4LBn0XUKA6qyLHXq51xq+JM=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-D8J_4QScNKO5qoxUX3NsiQ-1; Tue, 11 Feb 2020 03:49:53 -0500
Received: by mail-ot1-f71.google.com with SMTP id e11so6648002otq.1
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 00:49:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XKeh4LB4ucb3FB3BXzUqVPAdOpt4SnJgi20oV63nmQs=;
 b=CWh2MKrgJQWxN8wCs8cORBhsKokhaZuyxRn1IGVCOj/NlJyXWeiAiBED9jBZH4593z
 r/07LqM8EBWYckonkexiD7Oau8NSxPqx6vA59HhaafgmnFq1o4qdIl/YJw8/vMXTZNL/
 rCa0P2U9Br17n3RdjqYl5soaCMVLguJZWzHKPSBXJHn19ItcaQgVgWUWdgpCDkPSvmAM
 Ja3cqB2/WG9Ms5nskELWBROT0YOhD4kS5JHGghUDQjDIJIGGe1TfJgvZj1A/T2/Wq1Le
 Bl17ASfGcTq8Qy6+rQ5urqMff1WPZDzngewSEd+hPiLaCdLU6cNI+ql1cvSZdkDABf/3
 9aHg==
X-Gm-Message-State: APjAAAWhmXuzIevlCWugKtXSIb/DuHHx168Xy4tO0tVAdom/yj3wp6nT
 FR4tflJ+0EEHz+69E0LqJloKemlRTq3m85IIBi4Wgjh/mt9ZuC06tTpvJnu1X0BAu5STqaJFIXQ
 W8QUEur2kjBjHy0GZK1k6sjBb3aI=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr4262900otl.118.1581410992966; 
 Tue, 11 Feb 2020 00:49:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqzudxw7AZG0r/fTjdp3Pzre4+m4jpbybTk4wGK75ySSNhsMgxZ3cw4GxZmdkrJDVnKw9srz09UuATmuebM70yY=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr4262886otl.118.1581410992682; 
 Tue, 11 Feb 2020 00:49:52 -0800 (PST)
MIME-Version: 1.0
References: <87e6761eb699c7912e2064dea222f5ac7fd04a6b.1581338640.git.jstancek@redhat.com>
In-Reply-To: <87e6761eb699c7912e2064dea222f5ac7fd04a6b.1581338640.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 11 Feb 2020 16:49:41 +0800
Message-ID: <CAEemH2f90MPBV_w2+gw331cg0Fiu-=aqgp3M1BHhBCXcFUbyyg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: D8J_4QScNKO5qoxUX3NsiQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setrlimit06: lower RLIMIT_CPU parameters
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1367000476=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1367000476==
Content-Type: multipart/alternative; boundary="000000000000769090059e48f066"

--000000000000769090059e48f066
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 8:47 PM Jan Stancek <jstancek@redhat.com> wrote:

> Lower the parameters so that test completes faster where possible.
>
> This also increases alarm timer slightly, which in combination with
> lower RLIMIT_CPU aims to avoid false positives in environments with
> high steal time, where it can take multiple of wall clock seconds
> to spend single second on a cpu.
>

This patch could reduce the test failure possibility, but I'm afraid it
can't fix the problem radically, because with `stress -c 20' to overload an
s390x system(2cpus) in the background then setrlimit06(patched) still
easily gets failed:
    setrlimit06.c:98: FAIL: Got only SIGXCPU after reaching both limit

Another way I can think of is to raise the priority before its running, not
sure if that will disturb the original test but from my test, it always
gets a pass even with too much overload.

--- a/testcases/kernel/syscalls/setrlimit/setrlimit06.c
+++ b/testcases/kernel/syscalls/setrlimit/setrlimit06.c
@@ -25,6 +25,7 @@
 #include <sys/wait.h>
 #include <stdlib.h>
 #include <sys/mman.h>
+#include <sys/resource.h>

 #include "tst_test.h"

@@ -37,6 +38,8 @@ static void sighandler(int sig)

 static void setup(void)
 {
+       setpriority(PRIO_PROCESS, 0, -20);
+
        SAFE_SIGNAL(SIGXCPU, sighandler);

        end =3D SAFE_MMAP(NULL, sizeof(int), PROT_READ | PROT_WRITE,
@@ -110,6 +113,7 @@ static void verify_setrlimit(void)
 }

 static struct tst_test test =3D {
+       .needs_root =3D 1,
        .test_all =3D verify_setrlimit,
        .setup =3D setup,
        .cleanup =3D cleanup,

--=20
Regards,
Li Wang

--000000000000769090059e48f066
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Feb 10, 2020 at 8:47 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Lower the parameters=
 so that test completes faster where possible.<br>
<br>
This also increases alarm timer slightly, which in combination with<br>
lower RLIMIT_CPU aims to avoid false positives in environments with<br>
high steal time, where it can take multiple of wall clock seconds<br>
to spend single second on a cpu.<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">This patch could reduce th=
e test failure possibility, but I&#39;m afraid it can&#39;t fix the problem=
 radically, because with `stress -c 20&#39; to overload an s390x system(2cp=
us) in the background then setrlimit06(patched) still easily gets failed:</=
div></div><div><div class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0 =C2=A0 setrlimit06.c:98: FAIL: Got only SIGXCPU after reaching both lim=
it </div></div></div><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Another=C2=A0way I can think of is to raise the priori=
ty=C2=A0before its running, not sure if that will disturb the original test=
 but from my test, it always gets a pass even with too much overload.</div>=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">--- a/testcases/kernel/s=
yscalls/setrlimit/setrlimit06.c<br>+++ b/testcases/kernel/syscalls/setrlimi=
t/setrlimit06.c<br>@@ -25,6 +25,7 @@<br>=C2=A0#include &lt;sys/wait.h&gt;<b=
r>=C2=A0#include &lt;stdlib.h&gt;<br>=C2=A0#include &lt;sys/mman.h&gt;<br>+=
#include &lt;sys/resource.h&gt;<br>=C2=A0<br>=C2=A0#include &quot;tst_test.=
h&quot;<br>=C2=A0<br>@@ -37,6 +38,8 @@ static void sighandler(int sig)<br>=
=C2=A0<br>=C2=A0static void setup(void)<br>=C2=A0{<br>+ =C2=A0 =C2=A0 =C2=
=A0 setpriority(PRIO_PROCESS, 0, -20);<br>+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
SAFE_SIGNAL(SIGXCPU, sighandler);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
end =3D SAFE_MMAP(NULL, sizeof(int), PROT_READ | PROT_WRITE,<br>@@ -110,6 +=
113,7 @@ static void verify_setrlimit(void)<br>=C2=A0}<br>=C2=A0<br>=C2=A0s=
tatic struct tst_test test =3D {<br>+ =C2=A0 =C2=A0 =C2=A0 .needs_root =3D =
1,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .test_all =3D verify_setrlimit,<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cle=
anup =3D cleanup,<br></div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000769090059e48f066--


--===============1367000476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1367000476==--

