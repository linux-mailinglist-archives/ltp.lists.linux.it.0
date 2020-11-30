Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AAA2C7F8A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 09:14:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 339003C2C76
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 09:14:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8593A3C2555
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 09:14:39 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4E8C41400B84
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 09:14:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606724077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S3RBYNTzKCF0aKzgmLQvPrPmkXLqDf+tIxzlzbbFnCU=;
 b=cdODHefYF0U0FY5xSzusBKjV8l+zTvwViUBGV8Whc8CMyTGzwvzW4ImJSwwcL593aIrBEl
 R74As986WElUILr3OHHz5GcYr0J+NiCjveg7gawVNDyJwZElaabQ8mOqdJ3q0E9RP2Kxql
 Klll0gK8adP4WfBnyPURc+Q24WSOZLg=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-OD3jQ8trMN-z9fJYtzKEAw-1; Mon, 30 Nov 2020 03:14:32 -0500
X-MC-Unique: OD3jQ8trMN-z9fJYtzKEAw-1
Received: by mail-yb1-f199.google.com with SMTP id e19so14616515ybc.5
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 00:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqdOIbTUgUkLMhRWNKs0lXAJpnu+vEnVvnJNA+38Hzw=;
 b=i+9pLHEU/GpMNsgN+nRJFjbkZu2UC1QORMR61ZJDFdd+B1Xaoy7mghdV/RHyJCJS4J
 9mELIGHYx8QTAUvPItdrZc4ztINwGV2j6of9VoTqX3a9ki2+5hpcih1XY0Bug8q4oVNE
 y1rHBIyOj9wAmpjLy8PGBKtPHsErH3i3XDx4V6VqLSvjecq59OX9qpiEqXLoIRoT9uv5
 raMu/Bc6YfJzpuGKw9k4nUtD+T35q0xx3sjIbGGCDbtzoZM1kVlBMV7Cs93dkMsxSjKa
 vWClEp1/qH3xplIESRxyO2NK5hHT+1x/XgWNmO3nMCe8IGYJGDoyRUeSp7NCCIyOwSfV
 V1bQ==
X-Gm-Message-State: AOAM533psVAM3GQgmgrwy1U1RcN9X52zU/eqe5N598N/r3bO0UtBZzfL
 zTl9TO8JIeAJN5ZYJoUFfZeOrveR4QINl+cG3A+/D3jGeDifgOZqXocy0FHLSO+9bPKzIvrm0lG
 x6eiMvG2pEH3G5xWj4SRAEqebiAA=
X-Received: by 2002:a25:da90:: with SMTP id
 n138mr26246900ybf.366.1606724071315; 
 Mon, 30 Nov 2020 00:14:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUGTHddXcVMspebh2Z3EVeSl7Kjww/Vsl42pfxjyXGbXRB7OWYo6PXOhsWKK17WYTJRXaouEwhaLzmlblCD4Y=
X-Received: by 2002:a25:da90:: with SMTP id
 n138mr26246864ybf.366.1606724070930; 
 Mon, 30 Nov 2020 00:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20201125101633.30154-1-liwang@redhat.com> <87eekhof3i.fsf@suse.de>
 <04c4b073-6ad3-836a-7f63-7632a4e6ddb7@suse.cz> <87blflo9hx.fsf@suse.de>
 <f9b2e084-f2e0-1016-f505-6218d7c1853e@jv-coder.de>
In-Reply-To: <f9b2e084-f2e0-1016-f505-6218d7c1853e@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Nov 2020 16:14:19 +0800
Message-ID: <CAEemH2fXpPXvQVi_UUovp+eB5JeWfdTjv47KXnCBhF=VG0Rsog@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
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
Subject: Re: [LTP] [PATCH] fzsync: skip test when avaliable CPUs less than 2
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
Cc: LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: multipart/mixed; boundary="===============0899304735=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0899304735==
Content-Type: multipart/alternative; boundary="00000000000080186a05b54e99c6"

--00000000000080186a05b54e99c6
Content-Type: text/plain; charset="UTF-8"

Hi Joerg,

On Mon, Nov 30, 2020 at 3:53 PM Joerg Vehlow <lkml@jv-coder.de> wrote:

> Hi,
> >> No, af_alg07 requires 2 CPUs, otherwise it'll report false positives.
> >> The test will pass only if fchownat() hits a half-closed socket and
> >> returns error. But IIRC the half-closed socket will be destroyed during
> >> reschedule which means there's no race window to hit anymore. But it
> >> would be better to put the TCONF condition into the test itself.
> > Interesting, I wonder if this is also true for the real-time kernel with
> > the threads set to RT priority?
> It looks like the test can fail even with more than one cpu. I've seen
> this sporadic failure on different hardware with more than two cores, at
> least on intel denverton (x86_64) and renesas r-car (aarch64) systems.
> Both with kernel 4.19 with the fix included, on the denverton system the
> rt parches were included and on the r-car not. The test passes most of
> the time, but sometimes fails with the message Li posted.
>
> It also seems to fail sporadically on other systems as well:
> https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1892860
>
> Additionally I tested on qemu-x86 with 4.19 with and without rt patches.
> The test succeeds even with only one virtualized cpu. So either Martin's
> assumption is wrong or it holds only for newer kernel versions?
>

No, Mertin is not wrong, and you are also right.

They are totally two different issues of af_alg07, the test on 1CPU
should be fixed with TCONF. But the fail with aarch64 is more like a
hardware issue, Chunyu has a drafted patch to add init delay value for
such a system.

Can you try this on your aarm64 platform?
-----------------------------
fzsync can't get a random delay range on hpe-moonshot systems, so run with
delay=0 during all the tests. This is probably the hardware issue such as
cache line design so can't get a stable state during the execution of the
critical
section. Provide an experience delay value on hpe-moonshot to make it hit
the race window immediately without exceeding samples.

---
 testcases/kernel/crypto/af_alg07.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/crypto/af_alg07.c
b/testcases/kernel/crypto/af_alg07.c
index 6ad86f4f3..24f5b8088 100644
--- a/testcases/kernel/crypto/af_alg07.c
+++ b/testcases/kernel/crypto/af_alg07.c
@@ -47,6 +47,7 @@ static void setup(void)
  fd = SAFE_OPEN("tmpfile", O_RDWR | O_CREAT, 0644);

  tst_fzsync_pair_init(&fzsync_pair);
+ fzsync_pair.delay_bias = 700;
 }

 static void *thread_run(void *arg)
-- 
2.19.1

-- 
Regards,
Li Wang

--00000000000080186a05b54e99c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Joerg,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Nov 30, 2020 at 3:53 PM Joerg Vehlow =
&lt;<a href=3D"mailto:lkml@jv-coder.de" target=3D"_blank">lkml@jv-coder.de<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i,<br>
&gt;&gt; No, af_alg07 requires 2 CPUs, otherwise it&#39;ll report false pos=
itives.<br>
&gt;&gt; The test will pass only if fchownat() hits a half-closed socket an=
d<br>
&gt;&gt; returns error. But IIRC the half-closed socket will be destroyed d=
uring<br>
&gt;&gt; reschedule which means there&#39;s no race window to hit anymore. =
But it<br>
&gt;&gt; would be better to put the TCONF condition into the test itself.<b=
r>
&gt; Interesting, I wonder if this is also true for the real-time kernel wi=
th<br>
&gt; the threads set to RT priority?<br>
It looks like the test can fail even with more than one cpu. I&#39;ve seen =
<br>
this sporadic failure on different hardware with more than two cores, at <b=
r>
least on intel denverton (x86_64) and renesas r-car (aarch64) systems. <br>
Both with kernel 4.19 with the fix included, on the denverton system the <b=
r>
rt parches were included and on the r-car not. The test passes most of <br>
the time, but sometimes fails with the message Li posted.<br>
<br>
It also seems to fail sporadically on other systems as well: <br>
<a href=3D"https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1892860" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net/ubuntu-kernel-=
tests/+bug/1892860</a><br>
<br>
Additionally I tested on qemu-x86 with 4.19 with and without rt patches. <b=
r>
The test succeeds even with only one virtualized cpu. So either Martin&#39;=
s <br>
assumption is wrong or it holds only for newer kernel versions?<br></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">No, Mertin is not wrong, and you are also right.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">They are totally two different issues of=
 af_alg07, the test on 1CPU</div><div class=3D"gmail_default" style=3D"font=
-size:small">should=C2=A0be fixed with TCONF. But the fail with aarch64 is =
more like a</div><div class=3D"gmail_default" style=3D"font-size:small">har=
dware issue, Chunyu has a drafted patch to add init delay value for</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">such a system.</div></=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Can you try this on your a=
arm64=C2=A0platform?</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">-----------------------------</div><div class=3D"gmail_default" style=
=3D"font-size:small">fzsync can&#39;t get a random delay range on hpe-moons=
hot systems, so run with<br>delay=3D0 during all the tests. This is probabl=
y the hardware issue such as<br>cache line design so can&#39;t get a stable=
 state during the execution of the critical<br>section. Provide an experien=
ce delay value on hpe-moonshot to make it hit<br>the race window immediatel=
y without exceeding samples.<br><br>---<br>=C2=A0testcases/kernel/crypto/af=
_alg07.c | 1 +<br>=C2=A01 file changed, 1 insertion(+)<br><br>diff --git a/=
testcases/kernel/crypto/af_alg07.c b/testcases/kernel/crypto/af_alg07.c<br>=
index 6ad86f4f3..24f5b8088 100644<br>--- a/testcases/kernel/crypto/af_alg07=
.c<br>+++ b/testcases/kernel/crypto/af_alg07.c<br>@@ -47,6 +47,7 @@ static =
void setup(void)<br>=C2=A0=09fd =3D SAFE_OPEN(&quot;tmpfile&quot;, O_RDWR |=
 O_CREAT, 0644);<br>=C2=A0<br>=C2=A0=09tst_fzsync_pair_init(&amp;fzsync_pai=
r);<br>+=09fzsync_pair.delay_bias =3D 700;<br>=C2=A0}<br>=C2=A0<br>=C2=A0st=
atic void *thread_run(void *arg)<br>-- <br>2.19.1<br></div></div><div><br><=
/div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>L=
i Wang<br></div></div></div></div>

--00000000000080186a05b54e99c6--


--===============0899304735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0899304735==--

