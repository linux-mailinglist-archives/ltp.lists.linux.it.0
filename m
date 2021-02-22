Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 623E7320FA5
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 04:12:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26D463C61CB
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 04:12:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 555D33C1C4F
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 04:12:12 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8B9E2600467
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 04:12:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613963529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eUA3B5W1ErD2Ack7uCiGWqE2hFN5fb3CJkTQG3SQnfI=;
 b=VEXZZWMuD0yQ/AZ+qZuVGnCVOSZp4JYc0TIlbIskMVKaoEor9sZWsMzfv4yrNgP95tIU9o
 hOqF5CrqhYYkzkOXDjnQpe66nwaNulbhPoIKHALvFWDCeNtgHROBgBZ1T7z4+LxYosAhSl
 xwzywg4ayA0JYTJO3T1NzXOlm7hhgjo=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-rqumJ0GfN7OyLLXdup5hkQ-1; Sun, 21 Feb 2021 22:12:07 -0500
X-MC-Unique: rqumJ0GfN7OyLLXdup5hkQ-1
Received: by mail-yb1-f200.google.com with SMTP id u17so15277127ybi.10
 for <ltp@lists.linux.it>; Sun, 21 Feb 2021 19:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUA3B5W1ErD2Ack7uCiGWqE2hFN5fb3CJkTQG3SQnfI=;
 b=OtJTf2dCWbCaLeXdCpCDxDCNmer5CU9xyPF3R7kzUkpw30JS8tpcsPZGazMJDapNlH
 dVNkmsY9iZ+HYue5K5Jp3ufORXaTZEQe1TS4wdQ4RDaDe5ZLwn/2R5JQtelonlknj37h
 dhcd2sMlIRGwY8hqZzErvW1pwPbUlJhA/pZ1yRL9qK/Iaevw7N7HkMophzYv8elDclO1
 l6r4CWL8xgu66dSan2uKFLVieGcixXBYFQBy4wPvb/zjNCZ5D6tH7KlRvlDmeOGg64lE
 B/Bp0crbD15/lE937VK2+PN3g9fwgZT8UFG25VzDtdCSLgwjaKVOKjiCk1mD1nSm9IZH
 oo7w==
X-Gm-Message-State: AOAM531znPGX+f1zYmmFY3WggN5Zaf9j95wXNSr8TzX1F1dU76oxN0v0
 CScdkhDrH1NUSQ9h8BUVXBS0V+RNqHia/0NApVa6LXg4RwyuFgeBuOuqvEgnlUJiYuQDXV1jjO4
 xRz1wzckbBwJzd11CxG1YY+lJ2dc=
X-Received: by 2002:a25:ea06:: with SMTP id p6mr31147680ybd.243.1613963527120; 
 Sun, 21 Feb 2021 19:12:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLvaiFTYrVidhWMuGlm1ixb0pVH7J+ZWVp42rPgnnUqOaKx1zoXF+9FJqTjYvInut6rHSMMZWJOOSxZouBz2Y=
X-Received: by 2002:a25:ea06:: with SMTP id p6mr31147660ybd.243.1613963526901; 
 Sun, 21 Feb 2021 19:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20210220123724.16939-1-liwang@redhat.com>
 <60331FCB.2020108@cn.fujitsu.com>
In-Reply-To: <60331FCB.2020108@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 22 Feb 2021 11:11:55 +0800
Message-ID: <CAEemH2fO_kcboA0RYXZPGgua_Uv2aB8YDHEOViRy27=tNXS4cw@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
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
Subject: Re: [LTP] [PATCH] open_posix_testsuite: correct fork11-1 report log
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
Content-Type: multipart/mixed; boundary="===============0410397659=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0410397659==
Content-Type: multipart/alternative; boundary="000000000000b3a87405bbe42a07"

--000000000000b3a87405bbe42a07
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

Merged, thanks for your review!

On Mon, Feb 22, 2021 at 11:06 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Hi Li
> Looks good to me,
> Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>
> ps: My pc (I use it to merge patch) is not with me, you can merge this
> yourself.
> > Signed-off-by: Li Wang<liwang@redhat.com>
> > ---
> >   .../open_posix_testsuite/conformance/interfaces/fork/11-1.c   | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git
> a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> > index 8a7796cfd..e31f3896f 100644
> > --- a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> > +++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> > @@ -47,7 +47,7 @@ static int child(int fd)
> >
> >       if (fcntl(fd, F_SETLK,&fl) == -1) {
> >               if (errno == EACCES || errno == EAGAIN) {
> > -                     printf("PASSED: child did not inherit the lock\n");
> > +                     printf("PASSED: Child locked file already locked
> by parent\n");
> >                       return PTS_PASS;
> >               }
> >
> > @@ -56,7 +56,7 @@ static int child(int fd)
> >               return PTS_UNRESOLVED;
> >       }
> >
> > -     printf("Child locked file already locked by parent\n");
> > +     printf("Child did not inherit the lock\n");
> >       return PTS_FAIL;
> >   }
> >
>
>
>
>

-- 
Regards,
Li Wang

--000000000000b3a87405bbe42a07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Merged, thanks for your review!</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, Feb 22, 2021 at 11:06 AM Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.f=
ujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi Li<br>
Looks good to me,<br>
Reviewed-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" ta=
rget=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
<br>
ps: My pc (I use it to merge patch) is not with me, you can merge this <br>
yourself.<br>
&gt; Signed-off-by: Li Wang&lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../open_posix_testsuite/conformance/interfaces/fork/11-1.=
c=C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/testcases/open_posix_testsuite/conformance/interfaces/for=
k/11-1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.=
c<br>
&gt; index 8a7796cfd..e31f3896f 100644<br>
&gt; --- a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.=
c<br>
&gt; +++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.=
c<br>
&gt; @@ -47,7 +47,7 @@ static int child(int fd)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fcntl(fd, F_SETLK,&amp;fl) =3D=3D -1) {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D=
 EACCES || errno =3D=3D EAGAIN) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0printf(&quot;PASSED: child did not inherit the lock\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0printf(&quot;PASSED: Child locked file already locked by parent\n&qu=
ot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return PTS_PASS;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; @@ -56,7 +56,7 @@ static int child(int fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTS_UNRES=
OLVED;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0printf(&quot;Child locked file already locked by =
parent\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;Child did not inherit the lock\n&quo=
t;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return PTS_FAIL;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000b3a87405bbe42a07--


--===============0410397659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0410397659==--

