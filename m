Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 654B42C408F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 13:50:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A8C43C2E47
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 13:50:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5442E3C2451
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 13:50:57 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id DD2CA1A00FAA
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 13:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606308654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6HUliFgFaCb+AgvfDTEb/UPZf7bMNMIC8JH7pgYodfM=;
 b=DuDZgkxDRHVfCP2ttj21jH8QUJuB2xp7AnxxedOAooVjPicrPhuMPyi5XnaY7JzEwUEDW/
 iLTLR89ZlDArAInzQn2tD18Ha+PsokC8hyvNwzpBDAc2HwJn8zJEoGIHOiZcS5jtv0TrQp
 m8CDBhq+VdMkpEWVUc1cEA2yYx3Kw6A=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-XLTnx5TZMTygypajblJC-g-1; Wed, 25 Nov 2020 07:50:52 -0500
X-MC-Unique: XLTnx5TZMTygypajblJC-g-1
Received: by mail-qk1-f198.google.com with SMTP id l7so2323285qkl.16
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 04:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6HUliFgFaCb+AgvfDTEb/UPZf7bMNMIC8JH7pgYodfM=;
 b=XxGPwFQidETACU67JdpxYmivojxkv5Ro9ONuIJLT+Wra6iBO+9yBffAC6q9wauA0/+
 jaYJH2Dr2Za+C65bOAjJfAlrj9LpaK+z0m3fKfTnAfuIPinmHY9HJkw2FEyY0x05/w1E
 E1TNPJSSRYa4fcdqv26LZyFqxyYDk7vlFeYVq1ZmqPItohhX7fNbCUugBjBu+TiIgL3/
 vWDSMYm+KB7vwfZ62IeJmPhXpw5retp8bABGs/fg0G6S6gbyYpZtztWNyKl74i58vGnq
 KRRNdqVPp+uiM7Nr81t9MphiZ7Tiiv1uX+w9bxWuNyZ7byJLUQC6SKdwXA4QcIWMc9jm
 7s2A==
X-Gm-Message-State: AOAM5308WfRbY23WpKV5dX9tgjlrv7j4gCoZUDf28uvkTh9iFLwhZPD2
 3c71ZTPbR9AG5tAWFINpyYSUqw1cUgTdVGKYYMLGI4Ge2kyY2Ge9FStK6p//PbJHrHcibtE48N5
 o8EaLo45cEC1PA1OR2UYzgeSFvxY=
X-Received: by 2002:a05:6902:50e:: with SMTP id
 x14mr3361024ybs.252.1606308651812; 
 Wed, 25 Nov 2020 04:50:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv3GuwakZDMk2D2eK95JjWWaVwL7KMz+s8pd3ciTWfSaqM5c0Ye1LqLROc9+3G9cPeXvVKOXEmSj7ldRm7Rec=
X-Received: by 2002:a05:6902:50e:: with SMTP id
 x14mr3361010ybs.252.1606308651641; 
 Wed, 25 Nov 2020 04:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20201125101633.30154-1-liwang@redhat.com> <87eekhof3i.fsf@suse.de>
 <04c4b073-6ad3-836a-7f63-7632a4e6ddb7@suse.cz>
In-Reply-To: <04c4b073-6ad3-836a-7f63-7632a4e6ddb7@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 25 Nov 2020 20:50:39 +0800
Message-ID: <CAEemH2ctWEp-B1yfB0cfCy6eP0dSwWLxcdsukV45GyF4SEQVmg@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0646757454=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0646757454==
Content-Type: multipart/alternative; boundary="00000000000094c74d05b4ede040"

--00000000000094c74d05b4ede040
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 7:56 PM Martin Doucha <mdoucha@suse.cz> wrote:

> On 25. 11. 20 12:22, Richard Palethorpe wrote:
> > Hello Li,
> >
> > Li Wang <liwang@redhat.com> writes:
> >
> >> It makes no sense to run parallel thread to simulate race conditions on
> >> system with CPU number less than two, especially for kvm guest, it does
> >> not have any chance to get real parallel running and probably encounter
> >> failure as below:
> >
> > Most of the tests using FuzzySync do not need true parallism. We were
> > able to reproduce a number of race conditions on a single vCPU. Infact
> > it may actually benefit some races because one thread has to pause to
> > allow the other to run, perhaps creating a huge race window.

>
> >>
> >> === 100% reproducible on a 1cpu guest ===
> >>
> >> cmdline="af_alg07"
> >> contacts=""
> >> analysis=exit
> >> <<<test_output>>>
> >> tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s
> >> ../../../include/tst_fuzzy_sync.h:507: TINFO: Minimum sampling period
> ended
> >> ../../../include/tst_fuzzy_sync.h:330: TINFO: loop = 1024, delay_bias =
> 0
> >> ../../../include/tst_fuzzy_sync.h:318: TINFO: start_a - start_b: { avg
> = -137522ns, avg_dev = 854248ns, dev_ratio = 6.21 }
> >> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - start_a  : { avg
> =  1915ns, avg_dev =   535ns, dev_ratio = 0.28 }
> >> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_b - start_b  : { avg
> =  1885ns, avg_dev =    42ns, dev_ratio = 0.02 }
> >> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - end_b    : { avg
> = -137492ns, avg_dev = 854818ns, dev_ratio = 6.22 }
> >> ../../../include/tst_fuzzy_sync.h:318: TINFO: spins            : { avg
> = 554786  , avg_dev =  7355  , dev_ratio = 0.01 }
> >> ../../../include/tst_fuzzy_sync.h:636: TINFO: Exceeded execution time,
> requesting exit
> >> af_alg07.c:96: TFAIL: fchownat() failed to fail, kernel may be
> vulnerable
> >>
> >> Signed-off-by: Li Wang <liwang@redhat.com>
> >> CC: Richard Palethorpe <rpalethorpe@suse.de>
> >> ---
> >>  include/tst_fuzzy_sync.h | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> >> index 4141f5c64..2e864b312 100644
> >> --- a/include/tst_fuzzy_sync.h
> >> +++ b/include/tst_fuzzy_sync.h
> >> @@ -281,6 +281,9 @@ static void tst_init_stat(struct tst_fzsync_stat *s)
> >>  static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
> >>                                void *(*run_b)(void *))
> >>  {
> >> +    if (get_nprocs() < 2)
> >> +            tst_brk(TCONF, "Fuzzy Sync requires at least two CPUs
> available");
> >> +
> >>      tst_fzsync_pair_cleanup(pair);
> >>
> >>      tst_init_stat(&pair->diff_ss);
> >
> > Perhaps this test would pass with more loops and a big enough delay
> > range, but this is also wasting time on a single vCPU. I'm not sure
> > whether we should filter this test at the LTP level; it may trigger the
> > bug on some single CPU configs.
>
> No, af_alg07 requires 2 CPUs, otherwise it'll report false positives.
> The test will pass only if fchownat() hits a half-closed socket and
> returns error. But IIRC the half-closed socket will be destroyed during
> reschedule which means there's no race window to hit anymore. But it
> would be better to put the TCONF condition into the test itself.
>

+1
Correct, I stand by Martin's point.

And we can avoid adding this patch to FuzzySync lib, but for af_alg07 2cpus
is required.
(maybe go with Cyril's suggest to add .min_cpus)

-- 
Regards,
Li Wang

--00000000000094c74d05b4ede040
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 7:56 PM Martin Doucha &lt;<=
a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On 25. 11. 20 12:22, Richa=
rd Palethorpe wrote:<br>
&gt; Hello Li,<br>
&gt; <br>
&gt; Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liw=
ang@redhat.com</a>&gt; writes:<br>
&gt; <br>
&gt;&gt; It makes no sense to run parallel thread to simulate race conditio=
ns on<br>
&gt;&gt; system with CPU number less than two, especially for kvm guest, it=
 does<br>
&gt;&gt; not have any chance to get real parallel running and probably enco=
unter<br>
&gt;&gt; failure as below:<br>
&gt; <br>
&gt; Most of the tests using FuzzySync do not need true parallism. We were<=
br>
&gt; able to reproduce a number of race conditions on a single vCPU. Infact=
<br>
&gt; it may actually benefit some races because one thread has to pause to<=
br>
&gt; allow the other to run, perhaps creating a huge race window.</blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D 100% reproducible on a 1cpu guest =3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; cmdline=3D&quot;af_alg07&quot;<br>
&gt;&gt; contacts=3D&quot;&quot;<br>
&gt;&gt; analysis=3Dexit<br>
&gt;&gt; &lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
&gt;&gt; tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s<br>
&gt;&gt; ../../../include/tst_fuzzy_sync.h:507: TINFO: Minimum sampling per=
iod ended<br>
&gt;&gt; ../../../include/tst_fuzzy_sync.h:330: TINFO: loop =3D 1024, delay=
_bias =3D 0<br>
&gt;&gt; ../../../include/tst_fuzzy_sync.h:318: TINFO: start_a - start_b: {=
 avg =3D -137522ns, avg_dev =3D 854248ns, dev_ratio =3D 6.21 }<br>
&gt;&gt; ../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - start_a=C2=
=A0 : { avg =3D=C2=A0 1915ns, avg_dev =3D=C2=A0 =C2=A0535ns, dev_ratio =3D =
0.28 }<br>
&gt;&gt; ../../../include/tst_fuzzy_sync.h:318: TINFO: end_b - start_b=C2=
=A0 : { avg =3D=C2=A0 1885ns, avg_dev =3D=C2=A0 =C2=A0 42ns, dev_ratio =3D =
0.02 }<br>
&gt;&gt; ../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - end_b=C2=A0 =
=C2=A0 : { avg =3D -137492ns, avg_dev =3D 854818ns, dev_ratio =3D 6.22 }<br=
>
&gt;&gt; ../../../include/tst_fuzzy_sync.h:318: TINFO: spins=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 : { avg =3D 554786=C2=A0 , avg_dev =3D=C2=A0 73=
55=C2=A0 , dev_ratio =3D 0.01 }<br>
&gt;&gt; ../../../include/tst_fuzzy_sync.h:636: TINFO: Exceeded execution t=
ime, requesting exit<br>
&gt;&gt; af_alg07.c:96: TFAIL: fchownat() failed to fail, kernel may be vul=
nerable<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" ta=
rget=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt;&gt; CC: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.de" =
target=3D"_blank">rpalethorpe@suse.de</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 include/tst_fuzzy_sync.h | 3 +++<br>
&gt;&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h<b=
r>
&gt;&gt; index 4141f5c64..2e864b312 100644<br>
&gt;&gt; --- a/include/tst_fuzzy_sync.h<br>
&gt;&gt; +++ b/include/tst_fuzzy_sync.h<br>
&gt;&gt; @@ -281,6 +281,9 @@ static void tst_init_stat(struct tst_fzsync_st=
at *s)<br>
&gt;&gt;=C2=A0 static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pa=
ir,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *(*run_b)(void *))<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 if (get_nprocs() &lt; 2)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, &quot;Fu=
zzy Sync requires at least two CPUs available&quot;);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 tst_fzsync_pair_cleanup(pair);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 tst_init_stat(&amp;pair-&gt;diff_ss);<br>
&gt; <br>
&gt; Perhaps this test would pass with more loops and a big enough delay<br=
>
&gt; range, but this is also wasting time on a single vCPU. I&#39;m not sur=
e<br>
&gt; whether we should filter this test at the LTP level; it may trigger th=
e<br>
&gt; bug on some single CPU configs.<br>
<br>
No, af_alg07 requires 2 CPUs, otherwise it&#39;ll report false positives.<b=
r>
The test will pass only if fchownat() hits a half-closed socket and<br>
returns error. But IIRC the half-closed socket will be destroyed during<br>
reschedule which means there&#39;s no race window to hit anymore. But it<br=
>
would be better to put the TCONF condition into the test itself.<br></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">+1</div><div class=3D"gmail_default" style=3D"font-size:small">Correc=
t, I stand by Martin&#39;s point.=C2=A0</div></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">And we can avoid adding this patch to=C2=A0FuzzySync l=
ib, but for af_alg07 2cpus is required.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">(maybe go with Cyril&#39;s suggest to add .min_cpu=
s)</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--00000000000094c74d05b4ede040--


--===============0646757454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0646757454==--

