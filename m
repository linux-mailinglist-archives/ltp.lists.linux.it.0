Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE99175386
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 07:11:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 902E73C681C
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 07:11:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EB7D83C67EE
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 07:11:13 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 1941B704D75
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 07:11:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583129469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=obU5Saghj6lOu2q9TagySalC1+xyyJFg0YjiusHCvkw=;
 b=TszLoNmKMs101deOWGY3RSMsCQHpnDDTS7fjnnHJsv46XsOGS59+lG7T7eQjo39rOkPl0z
 BjukIi3pKkTt9MN4Magq34z0sWCQdU1Vf6LzMYLBcH6C0ZqyWbsP9yCEaZ5aLO6cdQr7mk
 oWO1CcmH97QGmmyyjGOQ2H7hurrrDYE=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-yYqTk0__Pp2c4Cd3Dtze6A-1; Mon, 02 Mar 2020 01:11:01 -0500
X-MC-Unique: yYqTk0__Pp2c4Cd3Dtze6A-1
Received: by mail-oi1-f198.google.com with SMTP id 16so4552844oii.18
 for <ltp@lists.linux.it>; Sun, 01 Mar 2020 22:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3tKSUJiaHu+XcNX5q8TV0iiBU0/JPT4pCPYJC9i9UXM=;
 b=S1KGuEz7J1reMkZiSxzJ2H7auk2q9942zA9HWeA3zkK070QYdbZf64lDr1OWGFA5Ke
 ctYjNq+dGYaZabEDh8nf1Yu/uWiWxMeUbILOWuKsYxdMjv/Jvn398JSNLVcdXuP1mdA4
 pYXI+mA0DBBwUjUd80vWYpfwQlV/k6X2WiDzeii4GR3i7oJXb0M8JDJsEcTARheoEb+c
 tpwtX0PV5+06nUyfDvNrlOxmJS2stZ9GQE9iWY/aLctYj1LbYzkm3kf/aXDrid21kfON
 /G0HmHok92eTW2doVkxDtnLdTPdl6VjqBoATYZH+DGpIV4AuKVoE9wn1DS2c6AG0ZhIq
 qYJg==
X-Gm-Message-State: APjAAAWzK53rCQmI5Nm7m13h1lchOks0IPexpx7drwwykdfX2u8A6n24
 NwQzvi4CsIBQ5XuyNVzT7IoBlzxkMyflLnaKDNbMJjdPVRpLA9uvHxpuhRdHiTqTe/T/zvSqEVh
 IRrfbDCH72zJwwFIEbB/3ZbXO3kM=
X-Received: by 2002:a9d:395:: with SMTP id f21mr12215591otf.67.1583129460307; 
 Sun, 01 Mar 2020 22:11:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqzk9n1kGf9eWGnQjmMslTmvzEmY6HsSBbeZWYibCmO7pmSEbJcFPwwWax9YjtwxjGU4p1/Lj8DWrLHp+AW1Nac=
X-Received: by 2002:a9d:395:: with SMTP id f21mr12215581otf.67.1583129460026; 
 Sun, 01 Mar 2020 22:11:00 -0800 (PST)
MIME-Version: 1.0
References: <2365a007-02fe-c48c-2df5-04aedc076208@google.com>
In-Reply-To: <2365a007-02fe-c48c-2df5-04aedc076208@google.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 2 Mar 2020 14:10:49 +0800
Message-ID: <CAEemH2csQSdvaFkQu7aRDNdp44Ri7tgbzzrtQJh40f-EPFPU=w@mail.gmail.com>
To: Steve Muckle <smuckle@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] use of pthread_cancel in tst_fuzzy_sync.h
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1474059457=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1474059457==
Content-Type: multipart/alternative; boundary="0000000000001945c7059fd90d89"

--0000000000001945c7059fd90d89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Thanks for reporting this.

On Sat, Feb 29, 2020 at 3:47 AM Steve Muckle <smuckle@google.com> wrote:

> Hi Li,
>
> While integrating the latest LTP release into Android's VTS test suite I
> ran into trouble with this commit:
>
> commit cad524797ba4cee2e40985043f113256419f4a90
> Author: Li Wang <liwang@redhat.com>
> Date:   Thu Sep 26 17:39:21 2019 +0800
>
>      fzsync: revoke thread_b if parent hits accidental break
>
> It introduces a dependency on pthread_cancel() which Android does not
> implement:
>
>
> https://android.googlesource.com/platform/bionic/+/refs/heads/master/docs=
/status.md
>
> In the short term I can work around this, taking out the
> pthread_cancel() should be fine as far as I can tell as it is just used
>

Yes, for currently, we don't see another test(besides cve-2016-7117.c) that
hits the accidental break. So I think it's safe for you to revert my patch
on your branch:).

We also have fixed on cve-2016-7117.c for the break problem in a simple way=
:

commit 2e74d9963c882289be0551df63d33f5b7dee56d8
Author: Richard Palethorpe <rpalethorpe@suse.com>
Date:   Thu Jan 10 10:59:50 2019 +0100

    Check recvmmsg exists before entering fuzzy loop



> to avoid a timeout in certain circumstances. Long term though, could
> this be reworked to use pthread_kill() or some other mechanism?
>

Sure, it is a tiny defect in LTP test fuzzy synchronization. As before in
my patch V2[1], it tried to use pthread_kill/pthread_exit for solving the
problem, unfortunately, pthread_exit is not signal-safety function. So we
go pthread_cancel way for the fix. I'm thinking if we can go back to merge
these two way together now. Or maybe another idea is also welcomed~

[1] http://lists.linux.it/pipermail/ltp/2019-January/010489.html

--=20
Regards,
Li Wang

--0000000000001945c7059fd90d89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Steve,</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Thanks for reporting this.</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 29, 2020 at 3:47 AM Steve M=
uckle &lt;<a href=3D"mailto:smuckle@google.com">smuckle@google.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br=
>
<br>
While integrating the latest LTP release into Android&#39;s VTS test suite =
I <br>
ran into trouble with this commit:<br>
<br>
commit cad524797ba4cee2e40985043f113256419f4a90<br>
Author: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">=
liwang@redhat.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Thu Sep 26 17:39:21 2019 +0800<br>
<br>
=C2=A0 =C2=A0 =C2=A0fzsync: revoke thread_b if parent hits accidental break=
<br>
<br>
It introduces a dependency on pthread_cancel() which Android does not <br>
implement:<br>
<br>
<a href=3D"https://android.googlesource.com/platform/bionic/+/refs/heads/ma=
ster/docs/status.md" rel=3D"noreferrer" target=3D"_blank">https://android.g=
ooglesource.com/platform/bionic/+/refs/heads/master/docs/status.md</a><br>
<br>
In the short term I can work around this, taking out the <br>
pthread_cancel() should be fine as far as I can tell as it is just used <br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Yes, for currently, we don&#39;t see another test(besides cve=
-2016-7117.c) that hits the accidental break. So I think it&#39;s safe for =
you to revert my patch on your branch:).</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">We also have fixed on=C2=A0cve-2016-7117.c for the break pr=
oblem in a simple way:</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">co=
mmit 2e74d9963c882289be0551df63d33f5b7dee56d8<br>Author: Richard Palethorpe=
 &lt;<a href=3D"mailto:rpalethorpe@suse.com">rpalethorpe@suse.com</a>&gt;<b=
r>Date: =C2=A0 Thu Jan 10 10:59:50 2019 +0100<br><br>=C2=A0 =C2=A0 Check re=
cvmmsg exists before entering fuzzy loop<br></div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
to avoid a timeout in certain circumstances. Long term though, could <br>
this be reworked to use pthread_kill() or some other mechanism?<br></blockq=
uote><div><br></div>Sure, <span class=3D"gmail_default" style=3D"">it is a =
tiny defect in LTP test fuzzy synchronization.=C2=A0A</span>s=C2=A0<span cl=
ass=3D"gmail_default" style=3D"font-size:small">before</span> in my patch V=
2<span class=3D"gmail_default" style=3D"font-size:small">[1]</span>, it <sp=
an class=3D"gmail_default" style=3D"font-size:small">tried to</span>=C2=A0<=
span class=3D"gmail_default" style=3D"font-size:small">use </span>pthread_k=
ill/pthread_exit for solving the problem, unfortunately, pthread_exit is no=
t signal-safety<span class=3D"gmail_default" style=3D"font-size:small"> fun=
ction</span>. So we go <span class=3D"gmail_default" style=3D"font-size:sma=
ll">pthread_cancel </span>way for the fix.<span class=3D"gmail_default" sty=
le=3D"font-size:small"> I&#39;m thinking if we can go back to merge these t=
wo way together now. Or maybe another idea is also welcomed~</span></div><b=
r clear=3D"all"><div><div class=3D"gmail_default" style=3D"font-size:small"=
>[1]=C2=A0<a href=3D"http://lists.linux.it/pipermail/ltp/2019-January/01048=
9.html">http://lists.linux.it/pipermail/ltp/2019-January/010489.html</a></d=
iv><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000001945c7059fd90d89--


--===============1474059457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1474059457==--

