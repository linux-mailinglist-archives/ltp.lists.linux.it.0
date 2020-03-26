Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6493E1937BA
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 06:27:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED7CB3C336D
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 06:27:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4B0373C3361
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 06:27:51 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B5A731400BEA
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 06:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585200468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WKfVBNPrhHa3Vh/9dZkXTZ1sBZFmK3fdGxBqcNQ+B04=;
 b=L+ePGftux1//6FTur813JjDPmZdspXHtm4ky8VG01E1FwF1B/DcYhpbsQ5uGw64mRTeNnL
 FJgXd+klhdvohYTWxfvrf+zBzJrHumm7/1iXtBgrGdnPG8sPj3zAeYAXm/f5IbYx2mVA18
 fiMjQ5Ltdp2fPnjcHgfVqHrfIxmUNgQ=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-n2M8qfHeMaqb0WVC_a3SEQ-1; Thu, 26 Mar 2020 01:27:45 -0400
X-MC-Unique: n2M8qfHeMaqb0WVC_a3SEQ-1
Received: by mail-ot1-f71.google.com with SMTP id 60so3639788otp.16
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 22:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFXIxK40leCz0SwiSHgiaudJU5USbZ9yhS4nMiJAuRM=;
 b=crgUXlOhJGckdGDj/EVu3brTYES+O2t0ivHgNTo+6Ikk09aToP1LrsF3w7fi5UCUiO
 KTzDYOtQ+D001gHsXFf/9QNPeMbSFJg7rQsMdIbw8YOwUar1Rzdk2CA5ucD7IHWcy8/T
 Tu9KhcGIkuawbIhG9uV/tbsPoA1HGVDHX4mMpbZlicefVel3Ff+vsr+TyrL7xCTAv/1b
 kR7ulyLns17M3D/0KUXn9fzeOmvfgWfng5NPoOYMJq9vgxb8K3ik8eeQRzzVJEDo1/cX
 v+lJsI9Qa1zXtYQ9DXwnC2zZgzLrS5P2uK7IOAaAruj316jf920yFs8jBNG0Z3Vqw/lO
 STTQ==
X-Gm-Message-State: ANhLgQ0iYhblskk1JzCeXVYJwSDpD99H06dhnzCkRIAiTJ8YXylULbc4
 z3Hku1oLRkRmwuI+1j96jKpWzRJxzvPTC2ttu1Ckw6qC1EQ7CMjf91gnLD0oheKAzS/j2dny3rD
 ZWevTJKIOeFvYTITUqkNh9BazrY0=
X-Received: by 2002:a9d:2c64:: with SMTP id f91mr5342875otb.17.1585200464495; 
 Wed, 25 Mar 2020 22:27:44 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvGvy/HiLGqihT5l0i00PXNIufZWnyILDMMmPVs+x4mPTaPmmewr2hbqh6D2IBDlV/nPkrTbvb4UN7GDPeOoL4=
X-Received: by 2002:a9d:2c64:: with SMTP id f91mr5342867otb.17.1585200464216; 
 Wed, 25 Mar 2020 22:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
 <20200323160415.GC15673@dell5510> <20200324235150.GC4521@yuki.lan>
 <20200324172102.GA1307@dell5510> <20200325015324.GA15127@yuki.lan>
 <CAEemH2doL4m4-TLBBWTHygTRPSTa68dkoAFjZJrDmzrkmgUrSQ@mail.gmail.com>
 <20200325170739.GA2461@yuki.lan> <20200325093427.GA23023@dell5510>
 <1dea6ff2-f32d-c797-b52d-716efe73d4a6@cn.fujitsu.com>
 <20200325155624.GC21800@dell5510>
In-Reply-To: <20200325155624.GC21800@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Thu, 26 Mar 2020 13:27:32 +0800
Message-ID: <CAEemH2dQdR59VuugEjX+aNAUdKS+dqAPXcZK=pcoySXAVBnN4g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Content-Type: multipart/mixed; boundary="===============0790724394=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0790724394==
Content-Type: multipart/alternative; boundary="000000000000915b8305a1bb3e20"

--000000000000915b8305a1bb3e20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 11:57 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Xu,
>
> > I have seen the history about this problem. We have few C cases to use
> many
> > commands(copy_file_range02.c is a specify case, I ported it from xfstes=
t
> to
> > increase coverage), do we really want to implement need_cmd or
> > want_cmds(Usually, we seldom use command in c case and  we should avoid
> this
> > for reduce unnecessary dependencies, except user level command such as
> mkfs
> > or makeswap or useradd)? It will give user a mislead.
>
> > ps:copy_file_range02.c should use swapon and swapoff syscall instead of
> > command.
> Yes, rewriting to C would be an improvement for non-standard linux
> platforms
> (but then you need to deal with other exceptions: e.g. whether
> swapon()/swapoff() is even supported on platforms like Android and you
> might
> endup with 1) much more code 2) TCONF anyway for these platforms.
> And there is also chattr and mkswap.
>

That's right. Rewrite into C can't solve the problem by the roots.


>
> Besides this IMHO there will always be a need for running some command vi=
a
> tst_run_cmd() in the test instead of reimplementing a wheel. Some of othe=
r
> dependencies:
>

Agree. We at least need achieve the tst_cmd_available() for tst_run_cmd()
or .needs_cmds, let's try it together in code first then help to find best
solution in patch polishing.


>
> cat (testcases/cve/stack_clash.c this one could be using C code),
> mpdprobe, make, mkswap, quotacheck,
> useradd/userdel (I plan to put these into the library, but still it's muc=
h
> easier to use them than reimplement code in C).
>
> Also library itself (these will not use the flag): insmod, modprobe,
> rmmod,  mkfs.*,
> systemd-detect-virt (this one is not a hard dependency).
>
> Kind regards,
> Petr
>
>

--=20
Regards,
Li Wang

--000000000000915b8305a1bb3e20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 25, 2020 at 11:57 PM Petr Vorel &lt;<a =
href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Xu,<br>
<br>
&gt; I have seen the history about this problem. We have few C cases to use=
 many<br>
&gt; commands(copy_file_range02.c is a specify case, I ported it from xfste=
st to<br>
&gt; increase coverage), do we really want to implement need_cmd or<br>
&gt; want_cmds(Usually, we seldom use command in c case and=C2=A0 we should=
 avoid this<br>
&gt; for reduce unnecessary dependencies, except user level command such as=
 mkfs<br>
&gt; or makeswap or useradd)? It will give user a mislead.<br>
<br>
&gt; ps:copy_file_range02.c should use swapon and swapoff syscall instead o=
f<br>
&gt; command.<br>
Yes, rewriting to C would be an improvement for non-standard linux platform=
s<br>
(but then you need to deal with other exceptions: e.g. whether<br>
swapon()/swapoff() is even supported on platforms like Android and you migh=
t<br>
endup with 1) much more code 2) TCONF anyway for these platforms.<br>
And there is also chattr and mkswap.<br></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">That&#39;s right. Rewr=
ite into C can&#39;t solve the problem by the roots.</div></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Besides this IMHO there will always be a need for running some command via<=
br>
tst_run_cmd() in the test instead of reimplementing a wheel. Some of other<=
br>
dependencies:<br></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Agree. We at least need achieve the tst_cmd_a=
vailable() for tst_run_cmd() or .needs_cmds, let&#39;s try it together in c=
ode first then help to find best solution in patch=C2=A0polishing.</div></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
cat (testcases/cve/stack_clash.c this one could be using C code),<br>
mpdprobe, make, mkswap, quotacheck,<br>
useradd/userdel (I plan to put these into the library, but still it&#39;s m=
uch<br>
easier to use them than reimplement code in C).<br>
<br>
Also library itself (these will not use the flag): insmod, modprobe, rmmod,=
=C2=A0 mkfs.*,<br>
systemd-detect-virt (this one is not a hard dependency).<br>
<br>
Kind regards,<br>
Petr<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000915b8305a1bb3e20--


--===============0790724394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0790724394==--

