Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF82FE65E
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 10:30:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42BD03C6391
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 10:30:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1FC553C303F
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 10:30:41 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 3F1DE140015E
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 10:30:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611221439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JCxcU1E1MYXoENKTSQmCFOhmceO0ggHb5pz7cnz85w8=;
 b=hVHnx0qEhLk2kZsVve70g7/FDtBH5lVF45PZKoXG5llk4uIVsRJ0ZDHRZ5j/QtAhko/8rX
 1/duDrCsaoJzCIuLhuDoMOwC0VOXuExspRtQ+zDShbgw/14K+VKJSfOiq/rsr295JKTeiZ
 Y/mx+lYU5ZqMREsy37YFMkqawjmU/48=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-MXWvuZybNIevjx9STrsfHg-1; Thu, 21 Jan 2021 04:30:36 -0500
X-MC-Unique: MXWvuZybNIevjx9STrsfHg-1
Received: by mail-yb1-f200.google.com with SMTP id p80so1707072ybg.10
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 01:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JCxcU1E1MYXoENKTSQmCFOhmceO0ggHb5pz7cnz85w8=;
 b=tJdxDfdbPIjpkbdzYS+Mdl7OhrveXEhd3Ge7yK4RNlH6+mACZa+mrMniQ6Gef1Mwxm
 LH6cCnjwC+jro3Kc5pzEn4R2CX21p80s+Hpp04D8kpvzDszpQxRM0kBP1FLMEnIAnBYV
 1850dB5li4ZV7YGCwt2Y2U9snGbQYn92IYZdfKgYGI4CqrbM4SqLC0QL+21gAMPmNEiF
 xupxTMOBnGHJey4/WwjhKVZzW3ozetXzvZoMbDM3vQbwbiZ4SjuVeku8P5mtq0stB3WS
 91h7RsZbc33xvTvpiv5TnlT9nts0FX3dbLKLkV88B3rYc01ogksdCySi9T5nzumdp4/2
 v6xQ==
X-Gm-Message-State: AOAM530D3PTIjFb+ubow1t/PMzzCq7HXmgzWMVQj3SU/g6Pyh5hYns0y
 ZEYGGvEXJkWchrW/eVqQuO2UxrrVYzvjZg6CQAEeGNy5/YcjcSHBHiHDjViye7rfDgUqZdDBUHM
 jEL+EECFL/7f4kp1E+tNjHSj77a8=
X-Received: by 2002:a25:da06:: with SMTP id n6mr19952769ybf.97.1611221436083; 
 Thu, 21 Jan 2021 01:30:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR6vJDIuLaW9a+2cwQ0QDH1gj4JVvvKosVNDgRdQOtixXTjQsaxQCSURXraiGSqyXJaS8WTehjz9ok4tA39AU=
X-Received: by 2002:a25:da06:: with SMTP id n6mr19952745ybf.97.1611221435795; 
 Thu, 21 Jan 2021 01:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
 <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
 <87zh14rrxm.fsf@oc8242746057.ibm.com>
In-Reply-To: <87zh14rrxm.fsf@oc8242746057.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 21 Jan 2021 17:30:23 +0800
Message-ID: <CAEemH2fy8Zsu6Vz_DWOSHtBxQDMSemsw3bQNDqTdLOG27JiMPQ@mail.gmail.com>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
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
Content-Type: multipart/mixed; boundary="===============0583237191=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0583237191==
Content-Type: multipart/alternative; boundary="00000000000055e6b505b965b965"

--00000000000055e6b505b965b965
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Wed, Jan 20, 2021 at 3:26 PM Alexander Egorenkov <egorenar@linux.ibm.com>
wrote:

> ...
>
> Hi,
>
> i did more tests as promised.
> Your patch didn't help :( Still seeing failures.
>
> With your patch:
> ----------------
> swapping01.c:148: TPASS: no heavy swapping detected, 7282 MB swapped.
> swapping01.c:107: TINFO: available physical memory: 7303 MB
> swapping01.c:110: TINFO: try to allocate: 9494 MB
> swapping01.c:113: TINFO: memory allocated: 9494 MB
> swapping01.c:148: TPASS: no heavy swapping detected, 6204 MB swapped.
> swapping01.c:107: TINFO: available physical memory: 7299 MB
> swapping01.c:110: TINFO: try to allocate: 9488 MB
> swapping01.c:113: TINFO: memory allocated: 9488 MB
> swapping01.c:144: TFAIL: heavy swapping detected: 9490 MB swapped.
>
> Summary:
> passed   27
> failed   1
> skipped  0
> warnings 0
>
>
> W/O your patch:
> ---------------
> swapping01.c:147: TPASS: no heavy swapping detected, 2229 MB swapped.
> swapping01.c:106: TINFO: available physical memory: 7311 MB
> swapping01.c:109: TINFO: try to allocate: 9504 MB
> swapping01.c:112: TINFO: memory allocated: 9504 MB
> swapping01.c:147: TPASS: no heavy swapping detected, 2249 MB swapped.
> swapping01.c:106: TINFO: available physical memory: 7306 MB
> swapping01.c:109: TINFO: try to allocate: 9498 MB
> swapping01.c:112: TINFO: memory allocated: 9498 MB
> swapping01.c:143: TFAIL: heavy swapping detected: 9496 MB swapped.
>
> Summary:
> passed   23
> failed   1
> skipped  0
> warnings 0
>
>
>
> I can easily reproduce the problem inside an LPAR with 8GB RAM and 20GB
> swap. But could *NOT* reproduce it inside a zVM w/o any patches, might be
> fluke or some other unknown factors probably.


> My patch seems to work very well, couldn't reproduce the problem with it
> applied :/
>

I'm now a little bit doubt the lawful of swapping01 since I can easily get
heavy-swapping[1] when increasing the value of COE_SLIGHT_OVER
(which means just to request more available memory).

The original purpose of swapping01 seems to verify NO heavy-swapping
with slightly over-use available memory, but it doesn't have a standard
to evaluate/say how much is slightly over-use(the default set 1.3*phy_mem).
But I guess that might influence by different config of system, e.g the
system
you tried with 8GB RAM and 20GB swap, that swap more likely to be overused.

Anyway, these are my personal perspective, maybe wrong, we still need more
investigation.

[1] the conception of heavy-swapping in this test define by:
     swapped > mem_available_init

--------------------------------

The test FAIL(With and W/O your patch) on an aarch64 platform:
(allocate 2*mem_available but not 1.3*mem_available)

# free -h
              total        used        free      shared  buff/cache
available
Mem:          5.4Gi       329Mi       5.0Gi       0.0Ki       152Mi
4.6Gi
Swap:         6.0Gi       194Mi       5.8Gi

 # ./swapping01
tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s
swapping01.c:107: TINFO: available physical memory: 4745 MB
swapping01.c:109: TINFO: try to allocate: 9491 MB
swapping01.c:112: TINFO: memory allocated: 9491 MB
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6107200,
swap_free_now = 1339520, swap_consum(swap_free_init - swap_free_now) =
4767680
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6107200,
swap_free_now = 1196160, swap_consum(swap_free_init - swap_free_now) =
4911040
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6107200,
swap_free_now = 1200256, swap_consum(swap_free_init - swap_free_now) =
4906944
swapping01.c:150: TFAIL: heavy swapping detected: 4791 MB swapped.

(Debug-Info shows that 'swap_free_now' dynamically changes
not only decrease but also increase during the testing, it looks like
the system tries to reclaim some memory and do balance for a while.
But the worth saying, no OOM occurred during the above memory
overused.)

-- 
Regards,
Li Wang

--00000000000055e6b505b965b965
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Alexander,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 20, 2021 at 3:26 PM Alexander =
Egorenkov &lt;<a href=3D"mailto:egorenar@linux.ibm.com">egorenar@linux.ibm.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
<br>
Hi,<br>
<br>
i did more tests as promised.<br>
Your patch didn&#39;t help :( Still seeing failures.<br>
<br>
With your patch:<br>
----------------<br>
swapping01.c:148: TPASS: no heavy swapping detected, 7282 MB swapped.<br>
swapping01.c:107: TINFO: available physical memory: 7303 MB<br>
swapping01.c:110: TINFO: try to allocate: 9494 MB<br>
swapping01.c:113: TINFO: memory allocated: 9494 MB<br>
swapping01.c:148: TPASS: no heavy swapping detected, 6204 MB swapped.<br>
swapping01.c:107: TINFO: available physical memory: 7299 MB<br>
swapping01.c:110: TINFO: try to allocate: 9488 MB<br>
swapping01.c:113: TINFO: memory allocated: 9488 MB<br>
swapping01.c:144: TFAIL: heavy swapping detected: 9490 MB swapped.<br>
<br>
Summary:<br>
passed=C2=A0 =C2=A027<br>
failed=C2=A0 =C2=A01<br>
skipped=C2=A0 0<br>
warnings 0<br>
<br>
<br>
W/O your patch:<br>
---------------<br>
swapping01.c:147: TPASS: no heavy swapping detected, 2229 MB swapped.<br>
swapping01.c:106: TINFO: available physical memory: 7311 MB<br>
swapping01.c:109: TINFO: try to allocate: 9504 MB<br>
swapping01.c:112: TINFO: memory allocated: 9504 MB<br>
swapping01.c:147: TPASS: no heavy swapping detected, 2249 MB swapped.<br>
swapping01.c:106: TINFO: available physical memory: 7306 MB<br>
swapping01.c:109: TINFO: try to allocate: 9498 MB<br>
swapping01.c:112: TINFO: memory allocated: 9498 MB<br>
swapping01.c:143: TFAIL: heavy swapping detected: 9496 MB swapped.<br>
<br>
Summary:<br>
passed=C2=A0 =C2=A023<br>
failed=C2=A0 =C2=A01<br>
skipped=C2=A0 0<br>
warnings 0<br>
<br>
<br>
<br>
I can easily reproduce the problem inside an LPAR with <span class=3D"gmail=
_default" style=3D"font-size:small"></span>8GB RAM and 20GB<br>
swap. But could *NOT* reproduce it inside a zVM w/o any patches, might be<b=
r>
fluke or some other unknown factors probably.=C2=A0</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
My patch seems to work very well, couldn&#39;t reproduce the problem with i=
t<br>
applied :/ <br></blockquote><div><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">I&#39;m now a little bit doubt the lawful of swappin=
g01 since I can easily get</div><div class=3D"gmail_default" style=3D"font-=
size:small">heavy-swapping[1] when increasing the value of COE_SLIGHT_OVER=
=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">(which m=
eans just to request more available memory).</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">The original purpose of swapping01 seems to verify NO =
heavy-swapping</div><div class=3D"gmail_default" style=3D"font-size:small">=
with slightly over-use available memory, but it doesn&#39;t have a standard=
</div><div class=3D"gmail_default" style=3D"font-size:small">to evaluate/sa=
y how much is slightly over-use(the default set 1.3*phy_mem).</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">But I guess that might influ=
ence by different config of system, e.g the system</div><div class=3D"gmail=
_default" style=3D"font-size:small">you tried with=C2=A0<span class=3D"gmai=
l_default"></span>8GB RAM and 20GB swap, that swap more likely to be overus=
ed.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Anyway, these are my =
personal perspective, maybe wrong, we still need more investigation.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">[1] the conception of heavy-sw=
apping in this test define by:=C2=A0</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0swapped &gt;=C2=A0mem_available_i=
nit</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">---------------------=
-----------</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">The test FAIL=
(With and W/O your patch) on an aarch64 platform:</div><div class=3D"gmail_=
default" style=3D"font-size:small">(allocate 2*mem_available but not 1.3*me=
m_available)</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small"># free -h<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 total =C2=A0 =C2=A0 =C2=
=A0 =C2=A0used =C2=A0 =C2=A0 =C2=A0 =C2=A0free =C2=A0 =C2=A0 =C2=A0shared =
=C2=A0buff/cache =C2=A0 available<br>Mem: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A05.4Gi =C2=A0 =C2=A0 =C2=A0 329Mi =C2=A0 =C2=A0 =C2=A0 5.0Gi =C2=A0 =C2=
=A0 =C2=A0 0.0Ki =C2=A0 =C2=A0 =C2=A0 152Mi =C2=A0 =C2=A0 =C2=A0 4.6Gi<br>S=
wap: =C2=A0 =C2=A0 =C2=A0 =C2=A0 6.0Gi =C2=A0 =C2=A0 =C2=A0 194Mi =C2=A0 =
=C2=A0 =C2=A0 5.8Gi<br><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">=C2=A0# ./swapping01 <br>tst_test.c:1263: TINFO: Timeout per r=
un is 0h 05m 00s<br>swapping01.c:107: TINFO: available physical memory: 474=
5 MB<br>swapping01.c:109: TINFO: try to allocate: 9491 MB<br>swapping01.c:1=
12: TINFO: memory allocated: 9491 MB<br>swapping01.c:135: TINFO: DEBUG-INFO=
: swap_free_init =3D 6107200, swap_free_now =3D 1339520, swap_consum(swap_f=
ree_init - swap_free_now) =3D 4767680<br>swapping01.c:135: TINFO: DEBUG-INF=
O: swap_free_init =3D 6107200, swap_free_now =3D 1196160, swap_consum(swap_=
free_init - swap_free_now) =3D 4911040<br>swapping01.c:135: TINFO: DEBUG-IN=
FO: swap_free_init =3D 6107200, swap_free_now =3D 1200256, swap_consum(swap=
_free_init - swap_free_now) =3D 4906944<br>swapping01.c:150: TFAIL: heavy s=
wapping detected: 4791 MB swapped.<br><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">(Debug-Info shows that &#39;swap_free_now&#39; =
dynamically changes</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">not only decrease=C2=A0but also increase=C2=A0during the testing, it l=
ooks like</div><div class=3D"gmail_default" style=3D"font-size:small">the s=
ystem tries to reclaim=C2=A0some memory and do balance for a while.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">But the worth saying, =
no OOM occurred during the above=C2=A0memory</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">overused.)</div></div><div><br></div>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br=
></div><div>Li Wang<br></div></div></div></div>

--00000000000055e6b505b965b965--


--===============0583237191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0583237191==--

