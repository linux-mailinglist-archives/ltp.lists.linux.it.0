Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7D5160B0D
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 07:48:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06BFD3C2447
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 07:48:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E85163C2387
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 07:48:47 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 5D74014012B8
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 07:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581922124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LfmPEw/pQ5b5uo+FtrKIZ6LgS5K+H2Ng19gPidq8T1I=;
 b=Y9NviY+LLxw+hnrPql7z/4orKirj4z7TMp/EcKv4I4ie79CmbLPs/0LLQbULWMZZiKNiBF
 RH0by06PJbQ6cvYHS69mEFQ8k/qxkTz4/M92J2Q0/7EkGubZWi3xWScP4yWrkX9u6Xqdgm
 NU/jU3O6mJGDmYY/tWQUuONs4DJpo0s=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-lWVasS_rNiW0ufLGcs7YeQ-1; Mon, 17 Feb 2020 01:48:35 -0500
Received: by mail-oi1-f199.google.com with SMTP id e22so7800470oig.1
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 22:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LfmPEw/pQ5b5uo+FtrKIZ6LgS5K+H2Ng19gPidq8T1I=;
 b=nBZWSXmxpGkTwpDJeoNDri70qYR9miY+hh/Txjta1POF6zgjoRv9PycaT9UgxLWKnE
 HcGUWFH4G1o/7qGaeLvKUxTUKIQShkolNFLdZoVV0Inq1FH+uNK91hvbC2RoqQbkwx7W
 O8fofl3qlB07tXGMomgstO+DhNQKz+FWYpG+LBhSA1HcKFzwrPqbr2SYOFY9lD34CSOi
 zwxh5lMT/qasrAYzcvJC/apauRSBBivUMQTFNMev2wnRlG2ZRXP2laCJeswdmlBYBaoj
 g+QbGC7JIVQsilJMmJ95ypzjSaBTEw4cmK7GEqE9YEVgBbdn/VtiO/aNoKMKniWu/yo7
 UWkA==
X-Gm-Message-State: APjAAAWBnSL2jeUl2mZ4ZCkohD/3M8YffPohjddfQsLg65LhFlVjrOAg
 xBdJ2H0KmjdAu/dXx0/j94Kj5o1kvoFZYAW1ukiLDvFPmcv1GIt39g5JZMwyvi0h32RJzDaiNLL
 VG0t1PqKbRAj3PsNmOGPJuVrYo7k=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr8587555oic.138.1581922114538; 
 Sun, 16 Feb 2020 22:48:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzKYc3RKXeh1iwW/m1IOyXQjmf8uJXQZQz6giFEL3CF7DwP0UjXTbLwjLO/6y5Kjy8ZeiVFdvvl1oTlpyEPmZU=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr8587544oic.138.1581922114214; 
 Sun, 16 Feb 2020 22:48:34 -0800 (PST)
MIME-Version: 1.0
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207144105.19947-2-pvorel@suse.cz>
 <CAEemH2f0db1i7Tpg-4jqa5h5j9KZpH+d4aRg-M3Xn3Mw9NU1eA@mail.gmail.com>
 <20200216131723.GA2725117@x230>
In-Reply-To: <20200216131723.GA2725117@x230>
From: Li Wang <liwang@redhat.com>
Date: Mon, 17 Feb 2020 14:48:23 +0800
Message-ID: <CAEemH2ewgh=OnRzEs+1X4rvsiChrLRRMxeK-ChZL3wDqco_iLg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: lWVasS_rNiW0ufLGcs7YeQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/2] syscalls/fsmount01: Add test for new mount
 API v5.2
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0914536030=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0914536030==
Content-Type: multipart/alternative; boundary="000000000000ae331e059ebff1d6"

--000000000000ae331e059ebff1d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Sun, Feb 16, 2020 at 9:17 PM Petr Vorel <pvorel@suse.cz> wrote:

> ...
> > >  include/lapi/syscalls/powerpc64.in            |  4 +
> > Is there any reason why only add syscall num for ppc64?
> The other numbers are already there:
> 01e4dc222 lapi/syscalls: Add MIPS support
> c2f27f6e9 Add syscall numbers for new file-system related syscalls
>

Good to know this.

Not sure if we should add a note in the commit message to prevent confusion
> later (probably not needed).
>

Or just mentionion that commit(c2f27f6e9 Add syscall numbers ...) message.

> BTW, I like the way Viresh Kumar gives in his fsmount.h, it looks more
> tidy
> > and clean.
> > http://lists.linux.it/pipermail/ltp/2020-February/015413.html
> Hm, competing implementations.
> Both tries to handle preventing redefinitions (e.g. FSOPEN_CLOEXEC) once
> the API hits libc headers (at least in musl it might be soon).
> Zorro tries to bind them to function check (e.g. #ifndef HAVE_FSMOUNT,
> #ifndef
> HAVE_MOVE_MOUNT), Viresh just use single check #ifndef OPEN_TREE_CLONE.
> I slightly prefer Viresh way (it's unlikely that libc headers would
> include just
>
+1 Viresh way.


> part of the new mount API definitions, although obviously the most safest
> way
> would be to either guard with #ifndef each definition or just give up on
> testing
> header and copy whole include/uapi/linux/mount.h (+ avoid using
> sys/mount.h;
> that's the way used for include/lapi/bpf.h).
>

@Cyril, @Jan, any else suggestion?

Btw, we have to include "lapi/fcntl.h" in the test to get rid of build
error from old(RHEL5.11) distro:

fsmount01.c:71: error: =E2=80=98AT_FDCWD=E2=80=99 undeclared (first use in =
this function)
fsmount01.c:71: error: (Each undeclared identifier is reported only once
fsmount01.c:71: error: for each function it appears in.)

--=20
Regards,
Li Wang

--000000000000ae331e059ebff1d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 16, 2020 at 9:17 PM Petr Vorel=
 &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><spa=
n class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; &gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=
=3D"noreferrer" target=3D"_blank">powerpc64.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 +<br>
&gt; Is there any reason why only add syscall num for ppc64?<br>
The other numbers are already there:<br>
01e4dc222 lapi/syscalls: Add MIPS support<br>
c2f27f6e9 Add syscall numbers for new file-system related syscalls<br></blo=
ckquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Good to know this.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Not sure if we should add a note in the commit message to prevent confusion=
<br>
later (probably not needed).<br></blockquote><div><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Or just mentionion that commit(c2f2=
7f6e9 Add syscall numbers ...) message.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; BTW, I like the way Viresh Kumar gives in his fsmount.h, it looks more=
 tidy<br>
&gt; and clean.<br>
&gt; <a href=3D"http://lists.linux.it/pipermail/ltp/2020-February/015413.ht=
ml" rel=3D"noreferrer" target=3D"_blank">http://lists.linux.it/pipermail/lt=
p/2020-February/015413.html</a><br>
Hm, competing implementations.<br>
Both tries to handle preventing redefinitions (e.g. FSOPEN_CLOEXEC) once<br=
>
the API hits libc headers (at least in musl it might be soon).<br>
Zorro tries to bind them to function check (e.g. #ifndef HAVE_FSMOUNT, #ifn=
def<br>
HAVE_MOVE_MOUNT), Viresh just use single check #ifndef OPEN_TREE_CLONE.<br>
I slightly prefer Viresh way (it&#39;s unlikely that libc headers would inc=
lude just<br></blockquote><div><span class=3D"gmail_default" style=3D"font-=
size:small">+1 Viresh way.</span></div><div><span class=3D"gmail_default" s=
tyle=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
part of the new mount API definitions, although obviously the most safest w=
ay<br>
would be to either guard with #ifndef each definition or just give up on te=
sting<br>
header and copy whole include/uapi/linux/mount.h (+ avoid using sys/mount.h=
;<br>
that&#39;s the way used for include/lapi/bpf.h).<br></blockquote><div><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">@Cyril, @Jan, a=
ny else=C2=A0suggestion?</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"></div><div>=C2=A0</div></div><div class=3D"gmail_default" style=
=3D"font-size:small">Btw, we have to include=C2=A0&quot;lapi/fcntl.h&quot; =
in the test to get rid of build error from old(RHEL5.11) distro:</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div>fsmount01.c:71:=
 error: =E2=80=98AT_FDCWD=E2=80=99 undeclared (first use in this function)<=
br>fsmount01.c:71: error: (Each undeclared identifier is reported only once=
<br>fsmount01.c:71: error: for each function it appears in.)<div><br></div>=
-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wan=
g<br></div></div></div></div>

--000000000000ae331e059ebff1d6--


--===============0914536030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0914536030==--

