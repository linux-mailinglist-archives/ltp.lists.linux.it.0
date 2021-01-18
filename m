Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D80252F9D30
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 11:50:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 815B13C3158
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 11:50:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EC2433C30BC
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 11:50:50 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C71BA6008DB
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 11:50:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610967048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yPp1K9B3b2WqD0qSUxc9nkPaImZGpLX1fHPsidlWh4o=;
 b=Q5QxZ69lrSx/bKiCci23HpGz6g30mR01lLuYQcP107OGxpYIyvm0W9gE6U7Ll1n+BraaiF
 rk0pqKpNieGaj4zvkIp5TGmpMU73HIH6+Vbm62WJI0h0c+i9/fcNQ9VMelfURuJJIpjD1O
 4yX++StsS+IPtBjwBe8RT7orIc5ELGg=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-bzQQm8EoPferxdO1w-mrXQ-1; Mon, 18 Jan 2021 05:50:43 -0500
X-MC-Unique: bzQQm8EoPferxdO1w-mrXQ-1
Received: by mail-yb1-f198.google.com with SMTP id x17so20211886ybs.12
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 02:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yPp1K9B3b2WqD0qSUxc9nkPaImZGpLX1fHPsidlWh4o=;
 b=iKImVdMNJG7iok7FDyzQZ8fdh/hYRLe1G1DMr8p2GKYdO6hzE00zwgxhFeZbcW+gWj
 US0D2El6yuwW8BGCAGahTXARkYyO2iO51rsk9una0wjDGLIbGquddZ5s6OnxjovrsvQ+
 jOKW4bn3rmtp3sGdUa6BZ2XOifn6SoHeIJr3iG0rdHN8jRQcC7N4XpINQcR5INWVrACr
 S0OvONIdS0KRireqlbQ0WsQpc2drBa+1OAQr64tzf381QPvunu0zRzu6u+derlleUNx/
 BBLSM7eGFN6cYNZ7SSUc5chpqSzyPgbagIPkyH9NhoTLOjWV48CRNGr2fV1xD53R9bqU
 l0Qg==
X-Gm-Message-State: AOAM532TBi8TYyMkLuNbAC15NSaDAbMtQOFy1N3gKNnxSO4fKGxW6ntT
 iKmGzBzGFy1iuG3C5EEeLeO6rr88BVA6WKDhMGLDsj1H/eX60T9DLYzIdlydaV6LioaZ89/R9gJ
 mB6EvfU+Yr8CrJgie+81hzYWXpIQ=
X-Received: by 2002:a25:c7c6:: with SMTP id
 w189mr35404511ybe.403.1610967042984; 
 Mon, 18 Jan 2021 02:50:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbNuPMVLgCqh9nzMgxz9EgWliNOcg0PU96Oji6gOWW13a/R18MqKXh1Qv+YmRwGQ2ZOaOkbVOeolRsGNOq4k8=
X-Received: by 2002:a25:c7c6:: with SMTP id
 w189mr35404491ybe.403.1610967042753; 
 Mon, 18 Jan 2021 02:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
In-Reply-To: <20210115143246.369676-1-egorenar@linux.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 18 Jan 2021 18:50:31 +0800
Message-ID: <CAEemH2dbTz0Q7KXw9saO8O12RAEA8kQQjt9AWKf4QwP2Z1x5DQ@mail.gmail.com>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] swapping01: make test more robust
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
Content-Type: multipart/mixed; boundary="===============1507662657=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1507662657==
Content-Type: multipart/alternative; boundary="000000000000542ce605b92a7ed7"

--000000000000542ce605b92a7ed7
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 15, 2021 at 10:33 PM Alexander Egorenkov <egorenar@linux.ibm.com>
wrote:

> Increase time waiting for swap memory to settle before
> performing checks with occupied swap memory. This decreases the chance
> of the test to fail in the case of the swap memory taking longer
> than expected to settle.
>
> This fixes sporadic failures observed on IBM s390x systems such as this:
>
> swapping01.c:149: TPASS: no heavy swapping detected, 4534 MB swapped.
> swapping01.c:106: TINFO: available physical memory: 7348 MB
> swapping01.c:109: TINFO: try to allocate: 9552 MB
> swapping01.c:112: TINFO: memory allocated: 9552 MB
> swapping01.c:140: TINFO: swap free init: 25019 MB
> swapping01.c:141: TINFO: swap free now: 20484 MB
> swapping01.c:149: TPASS: no heavy swapping detected, 4534 MB swapped.
> swapping01.c:106: TINFO: available physical memory: 7348 MB
> swapping01.c:109: TINFO: try to allocate: 9553 MB
> swapping01.c:112: TINFO: memory allocated: 9553 MB
> swapping01.c:140: TINFO: swap free init: 25018 MB
> swapping01.c:141: TINFO: swap free now: 17694 MB
> swapping01.c:149: TPASS: no heavy swapping detected, 7323 MB swapped.
> swapping01.c:106: TINFO: available physical memory: 7318 MB
> swapping01.c:109: TINFO: try to allocate: 9514 MB
> swapping01.c:112: TINFO: memory allocated: 9514 MB
> swapping01.c:140: TINFO: swap free init: 25019 MB
> swapping01.c:141: TINFO: swap free now: 17697 MB
> swapping01.c:145: TFAIL: heavy swapping detected: 7322 MB swapped.
>
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  testcases/kernel/mem/swapping/swapping01.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/mem/swapping/swapping01.c
> b/testcases/kernel/mem/swapping/swapping01.c
> index 24b8313f3..befb52e91 100644
> --- a/testcases/kernel/mem/swapping/swapping01.c
> +++ b/testcases/kernel/mem/swapping/swapping01.c
> @@ -127,10 +127,10 @@ static void check_swapping(void)
>
>         /* Still occupying memory, loop for a while */
>         i = 0;
> -       while (i < 10) {
> +       while (i < 30) {
>                 swap_free_now = SAFE_READ_MEMINFO("SwapFree:");
>                 sleep(1);
> -               if (labs(swap_free_now - SAFE_READ_MEMINFO("SwapFree:")) <
> 512)
> +               if (labs(swap_free_now - SAFE_READ_MEMINFO("SwapFree:")) <
> 10)
>

From test error above, if the system's swap-memory taking longer
than expected to settle, shouldn't we more even get a swapped
consumption (=swap_free_init - swap_free_now) less than mem_over_max?
I say this because am imagining the system's SwapFree keeps
decreasing during the while loop, as you extend the waiting time
then we might get a larger swapped value at the final, which makes
the test more easily to FAIL.

And the purpose is to detect heavy swapping on s390x but not
guarantee running with a purified system, there also possible
other daemons have a side effect on system swaping, so I slightly
suppose dropping caches before testing may be helpful.

Another thing I wondering, do we really need to loop 5 times for this
kind of stress testing? Guess one time is enough for testing.

mm:swapping01 swapping01 -i 5



>                         break;
>
>                 i++;
> --
> 2.26.2
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000542ce605b92a7ed7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jan 15, 2021 at 10:33 PM Alexander Egorenko=
v &lt;<a href=3D"mailto:egorenar@linux.ibm.com">egorenar@linux.ibm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Incre=
ase time waiting for swap memory to settle before<br>
performing checks with occupied swap memory. This decreases the chance<br>
of the test to fail in the case of the swap memory taking longer<br>
than expected to settle.<br>
<br>
This fixes sporadic failures observed on IBM s390x systems such as this:<br=
>
<br>
swapping01.c:149: TPASS: no heavy swapping detected, 4534 MB swapped.<br>
swapping01.c:106: TINFO: available physical memory: 7348 MB<br>
swapping01.c:109: TINFO: try to allocate: 9552 MB<br>
swapping01.c:112: TINFO: memory allocated: 9552 MB<br>
swapping01.c:140: TINFO: swap free init: 25019 MB<br>
swapping01.c:141: TINFO: swap free now: 20484 MB<br>
swapping01.c:149: TPASS: no heavy swapping detected, 4534 MB swapped.<br>
swapping01.c:106: TINFO: available physical memory: 7348 MB<br>
swapping01.c:109: TINFO: try to allocate: 9553 MB<br>
swapping01.c:112: TINFO: memory allocated: 9553 MB<br>
swapping01.c:140: TINFO: swap free init: 25018 MB<br>
swapping01.c:141: TINFO: swap free now: 17694 MB<br>
swapping01.c:149: TPASS: no heavy swapping detected, 7323 MB swapped.<br>
swapping01.c:106: TINFO: available physical memory: 7318 MB<br>
swapping01.c:109: TINFO: try to allocate: 9514 MB<br>
swapping01.c:112: TINFO: memory allocated: 9514 MB<br>
swapping01.c:140: TINFO: swap free init: 25019 MB<br>
swapping01.c:141: TINFO: swap free now: 17697 MB<br>
swapping01.c:145: TFAIL: heavy swapping detected: 7322 MB swapped.<br>
<br>
Signed-off-by: Alexander Egorenkov &lt;<a href=3D"mailto:egorenar@linux.ibm=
.com" target=3D"_blank">egorenar@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/mem/swapping/swapping01.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/testcases/kernel/mem/swapping/swapping01.c b/testcases/kernel/=
mem/swapping/swapping01.c<br>
index 24b8313f3..befb52e91 100644<br>
--- a/testcases/kernel/mem/swapping/swapping01.c<br>
+++ b/testcases/kernel/mem/swapping/swapping01.c<br>
@@ -127,10 +127,10 @@ static void check_swapping(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Still occupying memory, loop for a while */<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (i &lt; 10) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (i &lt; 30) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 swap_free_now =3D S=
AFE_READ_MEMINFO(&quot;SwapFree:&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (labs(swap_free_=
now - SAFE_READ_MEMINFO(&quot;SwapFree:&quot;)) &lt; 512)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (labs(swap_free_=
now - SAFE_READ_MEMINFO(&quot;SwapFree:&quot;)) &lt; 10)<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Fr=
om test error above, if the system&#39;s swap-memory taking longer</div><di=
v class=3D"gmail_default" style=3D"font-size:small">than expected to settle=
, shouldn&#39;t we more even get a swapped=C2=A0</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">consumption (=3Dswap_free_init - swap_fre=
e_now)  less than mem_over_max?=C2=A0</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">I say this because am imagining the system&#39;s Swa=
pFree keeps</div><div class=3D"gmail_default" style=3D"font-size:small">dec=
reasing during the while loop, as you extend the waiting time</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">then we might get a larger s=
wapped value at the final, which makes</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">the test more easily to FAIL.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">And the purpose is to detect heavy swapping on=
 s390x but not</div><div class=3D"gmail_default" style=3D"font-size:small">=
guarantee running with a purified system, there also possible=C2=A0</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">other daemons have a s=
ide effect on system swaping, so I slightly</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">suppose dropping caches before testing may be=
=C2=A0helpful.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">Another th=
ing I wondering, do we really need to loop 5 times for this</div><div class=
=3D"gmail_default" style=3D"font-size:small">kind of stress testing? Guess =
one time is enough for testing.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">mm:swapping01 swapping01 -i 5<br></div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
-- <br>
2.26.2<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000542ce605b92a7ed7--


--===============1507662657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1507662657==--

