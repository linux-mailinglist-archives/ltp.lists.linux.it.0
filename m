Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E08012C8082
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 10:03:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AECE63C2C8E
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 10:03:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 32CB93C242E
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 10:03:52 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 857866008D8
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 10:03:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606727030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MHO5Y1Ashi/IHGApUdAzz+oeJN/MyqMkY6i+/5syEvg=;
 b=R6RwCGPuxI/Hipqu0MiMqh2xfvl9h+wnMF06zy7BRvjaC7zuw7Svb8bjC0+cJvHaRe9Ktk
 lS4giOIWmGGYjLxOR+Z6oVxSpjqy3q0xyW0qlCMZM+qGWn2Kk2YAQ/Ic3gCpOdwjJAaOu0
 Fmuvt7Dz+3Fs+9J5J4H5PP1+qb4YywY=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-gQ-nWEo-NVSyZ-OXDNPbIA-1; Mon, 30 Nov 2020 04:03:45 -0500
X-MC-Unique: gQ-nWEo-NVSyZ-OXDNPbIA-1
Received: by mail-yb1-f198.google.com with SMTP id z29so14732514ybi.23
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 01:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHO5Y1Ashi/IHGApUdAzz+oeJN/MyqMkY6i+/5syEvg=;
 b=HZgO6Fbe3iHTSwzR1gK+qRlrmFFiStPYs7PaEb+uqeYS1aDrARusowL+CK6htsJeKK
 Bp4+hjk9RU7cqlEg0UxVgWl4JIKXw2ZvGB8sT9GMBenYk2NLG+45K/uI2TW61MtU9Q6X
 umAneTE4+hPi/YInQTMkRyQcIag6C99WL0uJrRqTDqn30meXfFhdCwhhegcF+IhmVePQ
 B8XanOGhKQ1vCVYhcRLpN3d6zzl6+cyMhHcWRxK5knoeOb3BrD/Oxu90+kjr9HAhW1Vj
 8HjiBP1pRzSsZ4LCQkRIf5ceRx+zjKsyuKTWFjZeHjpekaUaS+Djt3WOTaO1VLpkGuvS
 Eomg==
X-Gm-Message-State: AOAM5330ojwYE+nHV6dsDC87ysyceEe1gKDbKnzWKih9L/pBAE118FpF
 3XObnCEibSaaYzeA53iEfHwmayvCRKy23EXWvRDslSntwO2Q2Yd7dP6V4W8ADJPyAHVjUS0/hCC
 FD6gFjABk70NZqEO2/FWa/8sYOgY=
X-Received: by 2002:a25:d7d4:: with SMTP id
 o203mr12099744ybg.286.1606727024523; 
 Mon, 30 Nov 2020 01:03:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHGpmY/o+OMjLgdTBIOcnjWKpWdbgJ5KHbB9WukBupvElzEjD6JkxbKZQqdkQ0eJ7QG0o0N0c4vxH6weiZSgg=
X-Received: by 2002:a25:d7d4:: with SMTP id
 o203mr12099724ybg.286.1606727024314; 
 Mon, 30 Nov 2020 01:03:44 -0800 (PST)
MIME-Version: 1.0
References: <20201125101633.30154-1-liwang@redhat.com> <87eekhof3i.fsf@suse.de>
 <04c4b073-6ad3-836a-7f63-7632a4e6ddb7@suse.cz> <87blflo9hx.fsf@suse.de>
 <f9b2e084-f2e0-1016-f505-6218d7c1853e@jv-coder.de>
 <CAEemH2fXpPXvQVi_UUovp+eB5JeWfdTjv47KXnCBhF=VG0Rsog@mail.gmail.com>
 <821eeadf-acd2-0de6-033d-1c3442a20407@jv-coder.de>
In-Reply-To: <821eeadf-acd2-0de6-033d-1c3442a20407@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Nov 2020 17:03:32 +0800
Message-ID: <CAEemH2duSNvpEvTGNhWO1ZkAMGUeOhjiJxhN-zCjkjeUN0O72Q@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1534634414=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1534634414==
Content-Type: multipart/alternative; boundary="00000000000089226005b54f49b4"

--00000000000089226005b54f49b4
Content-Type: text/plain; charset="UTF-8"

Hi Joerg,

On Mon, Nov 30, 2020 at 4:39 PM Joerg Vehlow <lkml@jv-coder.de> wrote:

> Hi Li,
>
> On 11/30/2020 9:14 AM, Li Wang wrote:
> > Hi Joerg,
> >
> > On Mon, Nov 30, 2020 at 3:53 PM Joerg Vehlow <lkml@jv-coder.de
> > <mailto:lkml@jv-coder.de>> wrote:
> >
> >     Hi,
> >     >> No, af_alg07 requires 2 CPUs, otherwise it'll report false
> >     positives.
> >     >> The test will pass only if fchownat() hits a half-closed socket
> and
> >     >> returns error. But IIRC the half-closed socket will be
> >     destroyed during
> >     >> reschedule which means there's no race window to hit anymore.
> >     But it
> >     >> would be better to put the TCONF condition into the test itself.
> >     > Interesting, I wonder if this is also true for the real-time
> >     kernel with
> >     > the threads set to RT priority?
> >     It looks like the test can fail even with more than one cpu. I've
> >     seen
> >     this sporadic failure on different hardware with more than two
> >     cores, at
> >     least on intel denverton (x86_64) and renesas r-car (aarch64)
> >     systems.
> >     Both with kernel 4.19 with the fix included, on the denverton
> >     system the
> >     rt parches were included and on the r-car not. The test passes
> >     most of
> >     the time, but sometimes fails with the message Li posted.
> >
> >     It also seems to fail sporadically on other systems as well:
> >     https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1892860
> >     <https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1892860>
> >
> >     Additionally I tested on qemu-x86 with 4.19 with and without rt
> >     patches.
> >     The test succeeds even with only one virtualized cpu. So either
> >     Martin's
> >     assumption is wrong or it holds only for newer kernel versions?
> >
> >
> > No, Mertin is not wrong, and you are also right.
> >
> > They are totally two different issues of af_alg07, the test on 1CPU
> > should be fixed with TCONF. But the fail with aarch64 is more like a
> > hardware issue, Chunyu has a drafted patch to add init delay value for
> > such a system.
> I think you misunderstood something. I see random fails with "TFAIL:
> fchownat() failed to fail, kernel may be vulnerable" on both x86_64 and
> aarch64 with more than one cpu core (4 for x86_64 and 2 or 4 for aarch64).
>

Well, seems I was somewhat arbitrary on this problem a moment ago.

Probably I was missing the 4cores fails on x86_64 you mentioned, we just
observed that FAIL on 1CPU x86_64 and hpe_moonshot(aarch64) so far.
The tentative conclusion of our debugging result:

  1. FAIL with 1CPU KVM x86_64 is false positives
  2. FAIL with hpe_moonshot aarch64 is caused by cache line design


>
> I see no error ("TPASS: fchownat() failed successfully: ENOENT (2)") on
> single core qemu-x86. This is why I think Martin's assumption may be
> wrong. If it was right, it should never succeed on a single core system
> right?
>

Hmm, it's hard to say never, it is also possible to create a race window on
a single-core system.
Anyway, we need to do more investigation.

-- 
Regards,
Li Wang

--00000000000089226005b54f49b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Joerg,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Nov 30, 2020 at 4:39 PM Joerg Vehlow =
&lt;<a href=3D"mailto:lkml@jv-coder.de">lkml@jv-coder.de</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
On 11/30/2020 9:14 AM, Li Wang wrote:<br>
&gt; Hi Joerg,<br>
&gt;<br>
&gt; On Mon, Nov 30, 2020 at 3:53 PM Joerg Vehlow &lt;<a href=3D"mailto:lkm=
l@jv-coder.de" target=3D"_blank">lkml@jv-coder.de</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:lkml@jv-coder.de" target=3D"_blank">lkml@=
jv-coder.de</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; No, af_alg07 requires 2 CPUs, otherwise it=
&#39;ll report false<br>
&gt;=C2=A0 =C2=A0 =C2=A0positives.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; The test will pass only if fchownat() hits=
 a half-closed socket and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; returns error. But IIRC the half-closed so=
cket will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0destroyed during<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; reschedule which means there&#39;s no race=
 window to hit anymore.<br>
&gt;=C2=A0 =C2=A0 =C2=A0But it<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; would be better to put the TCONF condition=
 into the test itself.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Interesting, I wonder if this is also true for=
 the real-time<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel with<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the threads set to RT priority?<br>
&gt;=C2=A0 =C2=A0 =C2=A0It looks like the test can fail even with more than=
 one cpu. I&#39;ve<br>
&gt;=C2=A0 =C2=A0 =C2=A0seen<br>
&gt;=C2=A0 =C2=A0 =C2=A0this sporadic failure on different hardware with mo=
re than two<br>
&gt;=C2=A0 =C2=A0 =C2=A0cores, at<br>
&gt;=C2=A0 =C2=A0 =C2=A0least on intel denverton (x86_64) and renesas r-car=
 (aarch64)<br>
&gt;=C2=A0 =C2=A0 =C2=A0systems.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Both with kernel 4.19 with the fix included, on the=
 denverton<br>
&gt;=C2=A0 =C2=A0 =C2=A0system the<br>
&gt;=C2=A0 =C2=A0 =C2=A0rt parches were included and on the r-car not. The =
test passes<br>
&gt;=C2=A0 =C2=A0 =C2=A0most of<br>
&gt;=C2=A0 =C2=A0 =C2=A0the time, but sometimes fails with the message Li p=
osted.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0It also seems to fail sporadically on other systems=
 as well:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://bugs.launchpad.net/ubuntu-kernel=
-tests/+bug/1892860" rel=3D"noreferrer" target=3D"_blank">https://bugs.laun=
chpad.net/ubuntu-kernel-tests/+bug/1892860</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.launchpad.net/ubuntu-ke=
rnel-tests/+bug/1892860" rel=3D"noreferrer" target=3D"_blank">https://bugs.=
launchpad.net/ubuntu-kernel-tests/+bug/1892860</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Additionally I tested on qemu-x86 with 4.19 with an=
d without rt<br>
&gt;=C2=A0 =C2=A0 =C2=A0patches.<br>
&gt;=C2=A0 =C2=A0 =C2=A0The test succeeds even with only one virtualized cp=
u. So either<br>
&gt;=C2=A0 =C2=A0 =C2=A0Martin&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0assumption is wrong or it holds only for newer kern=
el versions?<br>
&gt;<br>
&gt;<br>
&gt; No, Mertin is not wrong, and you are also right.<br>
&gt;<br>
&gt; They are totally two different issues of af_alg07, the test on 1CPU<br=
>
&gt; should=C2=A0be fixed with TCONF. But the fail with aarch64 is more lik=
e a<br>
&gt; hardware issue, Chunyu has a drafted patch to add init delay value for=
<br>
&gt; such a system.<br>
I think you misunderstood something. I see random fails with &quot;TFAIL: <=
br>
fchownat() failed to fail, kernel may be vulnerable&quot; on both x86_64 an=
d <br>
aarch64 with more than one cpu core (4 for x86_64 and 2 or 4 for aarch64).<=
br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Well, seems I was=C2=A0<span style=3D"color:rgb(51,51,51);f=
ont-size:14px">somewhat arbitrary on this problem=C2=A0</span>a moment ago<=
span style=3D"color:rgb(51,51,51);font-size:14px">.</span></div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">Probably I was m=
issing the 4cores fails on x86_64 you mentioned, we just=C2=A0</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">observed that FAIL on 1CPU =
x86_64 and hpe_moonshot(aarch64) so far.</div></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">The tentative conclusion of our debugging r=
esult:</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 1. FAIL wit=
h 1CPU KVM x86_64 is false positives</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 2. FAIL with hpe_moonshot aarch64 is caused by=
 cache line design</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
I see no error (&quot;TPASS: fchownat() failed successfully: ENOENT (2)&quo=
t;) on <br>
single core qemu-x86. This is why I think Martin&#39;s assumption may be <b=
r>
wrong. If it was right, it should never succeed on a single core system <br=
>
right?<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Hmm, it&#39;s hard to say never, it is also possible to c=
reate a race window on a single-core system.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Anyway, we need to do more investigation.</di=
v></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></d=
iv>

--00000000000089226005b54f49b4--


--===============1534634414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1534634414==--

