Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B7D4DED
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 09:28:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 284B13C2218
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 09:28:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3BF073C1833
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 09:28:19 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6BF672009E2
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 09:28:17 +0200 (CEST)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35BFBC049E10
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 07:28:15 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id l24so6139170oii.16
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 00:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tcefN94mI86+xA+Lme4Hvd2MrVp+G77yWpcQu9CcIJs=;
 b=W9ZpjeiaIuIzp0RphET1TShhvKJpBugFRUHCMw9GJzZ5D+N2ywPNxHRkGYu9kYIS/o
 Mw7h+LjagnpXOUdzt7GbnA7mPaR7U4fS9U2yTFUK8QgaK5fDgWEJept73+ceDAFtLn1y
 70lm9BoipVuqVs5v+yrEBOUOvDB3EDzygBa9+YZTe9dYapzk8xtRG20tOEOLqF1j3xjY
 6yaxjCbFbRkGWrTzLofoE2EYQYDpPmuKyXUgDxA9fcNIslyOU/TTlGBBJPq4XDY/A3Rm
 PX3mRL2f5VXU6xcDCipFARFKIK4M356SJlQIbODtMi+BMQ2eguben2C/JtV6Q1IKkQch
 10DA==
X-Gm-Message-State: APjAAAWetoMfEjMOswyUKTAxAm17TH2ypYSnlwOTz1L4W1wokP6xcB5q
 w7YH4ChhEbX00BKmjxhzl3YWVAt0Acf6cFbD3MYvsAysz1bF34LdbaY44gsOy00pAx92dpUqAxl
 IMIco/RITBTO93skdCa9ZKleghrc=
X-Received: by 2002:a9d:61cd:: with SMTP id h13mr6165950otk.264.1570865294707; 
 Sat, 12 Oct 2019 00:28:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybk2IArJyOp3PCkm5miLG3Q8fHJtmdeN2XL1GOLJftQ2aqzJnkhZhHGjVOirAF5Zr8BKcSL35UFZ4ksrgeHhE=
X-Received: by 2002:a9d:61cd:: with SMTP id h13mr6165938otk.264.1570865294434; 
 Sat, 12 Oct 2019 00:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
 <8c5d507fd19bc3110561ed1c666b7ac47442e09e.1570632125.git.jstancek@redhat.com>
 <CAEemH2d82pP2mwHnw42h-17HipGsVeYesfzg7o4axvCiRKU0=Q@mail.gmail.com>
 <CAEemH2eYc1VVtavWKTE-x1gqY6q7qyMVZ-bETXJytPkdvHJriw@mail.gmail.com>
 <1445930938.5951899.1570861051806.JavaMail.zimbra@redhat.com>
 <CAEemH2f2_5wNfNB=a-+=E+KevFOVvjCQ0sjBEG-eS27dwQxarw@mail.gmail.com>
 <23965038.5952515.1570862960195.JavaMail.zimbra@redhat.com>
In-Reply-To: <23965038.5952515.1570862960195.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Sat, 12 Oct 2019 15:28:02 +0800
Message-ID: <CAEemH2cuxbW55Y_mv9t0u7PEJyQVr9dgtZVFrDYKLi51MSsLmg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] read_all: retry to queue work for any worker
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
Content-Type: multipart/mixed; boundary="===============1967871843=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1967871843==
Content-Type: multipart/alternative; boundary="000000000000dd85990594b193e9"

--000000000000dd85990594b193e9
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 12, 2019 at 2:49 PM Jan Stancek <jstancek@redhat.com> wrote:

> ...
> > > > Base on your patch, I'm thinking to achieve a new macro
> TST_INFILOOP_FUNC
> > > > which can repeat the @FUNC infinitely. Do you feel it satisfies your
> > > > requirements to some degree or meaningful to LTP?
> > >
> > > I'm OK with concept. I'd like more some variation of *RETRY* for name.
> > > Comments below.
> > >
> >
> > Thanks, what about naming: TST_INFI_RETRY_FUNC?
>
> Or just keep TST_RETRY_FUNC and add parameter to it?
>

Sounds better, we could add parameter @INFI to control the retry as a knob.

/* @INFI - 1: retry infinitely, 0: retry in limit times */

#define TST_RETRY_FUNC(FUNC, ERET, INFI) \
        TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, 1, INFI)


> >
> > And do you mind use it to replace your function work_push_retry()? I know
> > it may be not smarter than work_push_retry() but it looks tiny for code.
>
> It may need some wrapper, because work_push_retry() may be passing
> different
> argument to function on each retry, which was one of reasons for the patch.
>

I was not meaning to hack the work_push_retry() function, I mean to change
your patch as below after we improve the TST_RETRY_FUNC.

# git diff .
diff --git a/testcases/kernel/fs/read_all/read_all.c
b/testcases/kernel/fs/read_all/read_all.c
index 3dac20e..ccbc5eb 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -292,7 +292,7 @@ static void stop_workers(void)

        for (i = 0; i < worker_count; i++) {
                if (workers[i].q)
-                       TST_RETRY_FUNC(queue_push(workers[i].q, stop_code),
1);
+                       TST_RETRY_FUNC(queue_push(workers[i].q, stop_code),
1, 1);
        }

        for (i = 0; i < worker_count; i++) {
@@ -310,7 +310,7 @@ static void rep_sched_work(const char *path, int rep)
        for (i = j = 0; i < rep; i++, j++) {
                if (j >= worker_count)
                        j = 0;
-               TST_RETRY_FUNC(queue_push(workers[j].q, path), 1);
+               TST_RETRY_FUNC(queue_push(workers[j].q, path), 1, 1);
        }
 }


-- 
Regards,
Li Wang

--000000000000dd85990594b193e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Oct 12, 2019 at 2:49 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail=
_default" style=3D"font-size:small">...</span><br>
&gt; &gt; &gt; Base on your patch, I&#39;m thinking to achieve a new macro =
TST_INFILOOP_FUNC<br>
&gt; &gt; &gt; which can repeat the @FUNC infinitely. Do you feel it satisf=
ies your<br>
&gt; &gt; &gt; requirements to some degree or meaningful to LTP?<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m OK with concept. I&#39;d like more some variation of *RET=
RY* for name.<br>
&gt; &gt; Comments below.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Thanks, what about naming: TST_INFI_RETRY_FUNC?<br>
<br>
Or just keep TST_RETRY_FUNC and add parameter to it?<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Sounds=
 better, we could add parameter @INFI to control the retry as a knob.</div>=
</div><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">/* @INFI - 1: retry infinitely, 0: retry in limit times */</div></div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">#define TST_RETRY_FUNC(F=
UNC, ERET, INFI) \</div>	<span class=3D"gmail_default" style=3D"font-size:s=
mall">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>TST_RETRY_FN_EXP_BACKOFF(FUNC, ERE=
T, 1, INFI)<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; And do you mind use it to replace your function work_push_retry()? I k=
now<br>
&gt; it may be not smarter than work_push_retry() but it looks tiny for cod=
e.<br>
<br>
It may need some wrapper, because work_push_retry() may be passing differen=
t<br>
argument to function on each retry, which was one of reasons for the patch.=
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I was not meaning to hack the work_push_retry() function, =
I mean to change your patch as below after we improve the TST_RETRY_FUNC.=
=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small"># git diff .<br>di=
ff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/re=
ad_all/read_all.c<br>index 3dac20e..ccbc5eb 100644<br>--- a/testcases/kerne=
l/fs/read_all/read_all.c<br>+++ b/testcases/kernel/fs/read_all/read_all.c<b=
r>@@ -292,7 +292,7 @@ static void stop_workers(void)<br>=C2=A0<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; worker_count; i++) {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (workers[i].q)<br>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 T=
ST_RETRY_FUNC(queue_push(workers[i].q, stop_code), 1);<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_RETRY_FU=
NC(queue_push(workers[i].q, stop_code), 1, 1);<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; worker_=
count; i++) {<br>@@ -310,7 +310,7 @@ static void rep_sched_work(const char =
*path, int rep)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D j =3D 0; i &lt; r=
ep; i++, j++) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if (j &gt;=3D worker_count)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j =3D 0;<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_RETRY_FUNC(queue_push(workers[j].q, pat=
h), 1);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_RETRY_FUN=
C(queue_push(workers[j].q, path), 1, 1);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<b=
r>=C2=A0}<br></div><br></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000dd85990594b193e9--

--===============1967871843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1967871843==--
