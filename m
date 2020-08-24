Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD0424F5A2
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 10:51:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AF903C56C9
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 10:51:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5A45B3C2EE3
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 10:51:38 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 9352B60055B
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 10:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598259096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7/rmX5IfFeiOAYaADz5YJSO6faUxEd2B7SWTH6JLJ9c=;
 b=NWatBSXoM6I8A2bvSwmj53qJDEhNy/Avikvco9Mk0GgqrjyTAUIGJ38cDqmHn670faz2RU
 YSvXINWybTfqfCF/8b+bSlqxLCUkpPbhlLXVI5TNR7dYMPtr7A6g46VC9NbTajuVbgs5oX
 119UXXJJM7Vrxly6AUhUI3yL5uNxgiM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-3uuihMN5Mje1mbswKY0X5Q-1; Mon, 24 Aug 2020 04:51:33 -0400
X-MC-Unique: 3uuihMN5Mje1mbswKY0X5Q-1
Received: by mail-yb1-f199.google.com with SMTP id l13so10080839ybf.5
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 01:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7/rmX5IfFeiOAYaADz5YJSO6faUxEd2B7SWTH6JLJ9c=;
 b=ozDEhYTfcxzfrqzo8KQJA4tN+1LgmvtAGorswkpEncP5LvK27wH1HdhEAkL2AZTX8z
 fyIM7zJOKQI7oBk7dENdzwPTbXzU+og0POiLEdJXapcejqMcQ1heorACmBVd537wHUFJ
 qAzhi9w9IWZEIyatJs651fguwHGMYXSb5oh4w+qntU0QjxdmiSGB64jSTez/aGH+N5YU
 PwMVOfT1FQH/nHdqm0o50wydZtcXv7lcgbSqTBg3819zQyC15G741SR6IY/tlwmxZUbc
 44BYpFscb/HDnE/MhAFXreCnhOVsfsOtEBQd4yJu2NUbuwnicEi8Zr4q26Rk6WI2jQ7l
 OOxQ==
X-Gm-Message-State: AOAM533N8fgc+H6n5N8jXBBr69U7N08XkUKGNVNFMPGecsN2CYNOnTHU
 DKN8AsxLMOtOsDLf8iHaexSN+Mp7sA6L5rotIHycHSpvs4PYQ5+N1hRYsqB38iKpIN0iG7gy2Tt
 JUo/or1kWkZuxhM7ShrpmKh4B0aY=
X-Received: by 2002:a25:da82:: with SMTP id n124mr5945489ybf.366.1598259092702; 
 Mon, 24 Aug 2020 01:51:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM9l3xWy+S4XkBRf61hhimBXNWVr5X1k2sW0rA0OOTrE6gvUfBc6b2tPEP8yjEVXVebszerkBozeYFVCGbRZo=
X-Received: by 2002:a25:da82:: with SMTP id n124mr5945480ybf.366.1598259092497; 
 Mon, 24 Aug 2020 01:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200820015211.u7xdye5ggbe34fsp@xzhoux.usersys.redhat.com>
 <CAEemH2faf5g0JUdBFNvqrNRHB5orbTvHnrwHCm5enF7tt7N=YA@mail.gmail.com>
 <20200821021416.4jkqe2e57d42xkmx@xzhoux.usersys.redhat.com>
In-Reply-To: <20200821021416.4jkqe2e57d42xkmx@xzhoux.usersys.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 24 Aug 2020 16:51:20 +0800
Message-ID: <CAEemH2fYW2Q8CdQgEtfc3ao-XYGZ3x3OTNCgcCY07j0DLkN-Vg@mail.gmail.com>
To: Murphy Zhou <jencce.kernel@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setxattr03: TCONF if failed to set immutable flag
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
Content-Type: multipart/mixed; boundary="===============0707801991=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0707801991==
Content-Type: multipart/alternative; boundary="00000000000077c0b205ad9bb11b"

--00000000000077c0b205ad9bb11b
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 21, 2020 at 10:14 AM Murphy Zhou <jencce.kernel@gmail.com>
wrote:

> Hi Li,
>
> On Thu, Aug 20, 2020 at 02:16:07PM +0800, Li Wang wrote:
> > Hi Murphy,
> >
> > On Thu, Aug 20, 2020 at 9:52 AM Murphy Zhou <jencce.kernel@gmail.com>
> wrote:
> >
> > > Instead of TBROK, probably the underlying filesystem not support this
> flag.
> > >
> >
> > Which filesystem do you mean here? What kind of error it was given?
> > Maybe we should confirm the errno is EINVAL or ENOTSUP before TCONF.
>
> NFS, with latest upstream kernel.
>

It sounds like a new issue appears in the mainline kernel testing.


> Like:
>
> tst_test.c:1247: INFO: Timeout per run is 0h 15m 00s
> setxattr03.c:142: BROK: Set setxattr03immutable immutable failed: ENOTTY
> (25)
> setxattr03.c:154: WARN: Unset setxattr03immutable immutable failed: ENOTTY
> (25)
>

I noticed the setxattr03 skipped on kernel v5.8-rc6, which means the newer
kernel
starts to support xattr in NFSv4.2? if so, shouldn't we check why it
returns ENOTTY
but not ENOTSUP in failed setxflags?

(btw, I assumed you guys did NOT change the mount way with user_xattr
option)

    Kernel Version: 5.8.0-rc6+
    setxattr03.c:135: CONF: No xattr support in fs or fs mounted without
user_xattr option


>
> The reason not checking errno is that `chattr +i` is a very basic
> operation,
> if it fails, most probably it's not supported. NFS returning ENOTTY
> makes checking errno more tricky. So I did not check it and made it as
> simple as the checking in xfstests.
>
> Thanks very much for reviewing!
>
> >
> > --
> > Regards,
> > Li Wang
>
> --
> Murphy
>
>

-- 
Regards,
Li Wang

--00000000000077c0b205ad9bb11b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 21, 2020 at 10:14 AM Murphy Zhou &lt;<a=
 href=3D"mailto:jencce.kernel@gmail.com">jencce.kernel@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
On Thu, Aug 20, 2020 at 02:16:07PM +0800, Li Wang wrote:<br>
&gt; Hi Murphy,<br>
&gt; <br>
&gt; On Thu, Aug 20, 2020 at 9:52 AM Murphy Zhou &lt;<a href=3D"mailto:jenc=
ce.kernel@gmail.com" target=3D"_blank">jencce.kernel@gmail.com</a>&gt; wrot=
e:<br>
&gt; <br>
&gt; &gt; Instead of TBROK, probably the underlying filesystem not support =
this flag.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Which filesystem do you mean here? What kind of error it was given?<br=
>
&gt; Maybe we should confirm the errno is EINVAL or ENOTSUP before TCONF.<b=
r>
<br>
NFS, with latest upstream kernel.<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">It sounds like a new issu=
e appears in the mainline kernel testing.</div></div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Like:<br>
<br>
tst_test.c:1247: INFO: Timeout per run is 0h 15m 00s<br>
setxattr03.c:142: BROK: Set setxattr03immutable immutable failed: ENOTTY (2=
5)<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>setxattr03.c=
:154: WARN: Unset setxattr03immutable immutable failed: ENOTTY (25)<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><span style=3D"color:rgb(51,51,51);font-family:&quot;Liberation Sa=
ns&quot;,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14=
px">I noticed the=C2=A0</span><span class=3D"gmail_default"></span>setxattr=
03<span style=3D"color:rgb(51,51,51);font-family:&quot;Liberation Sans&quot=
;,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px">=C2=
=A0skipped on kernel v5.8-rc6, which means the newer kernel</span></div><di=
v class=3D"gmail_default" style=3D"font-size:small">starts<span style=3D"co=
lor:rgb(51,51,51);font-family:&quot;Liberation Sans&quot;,&quot;Helvetica N=
eue&quot;,Helvetica,Arial,sans-serif;font-size:14px"> to support xattr in=
=C2=A0</span>NFSv4.2<span style=3D"color:rgb(51,51,51);font-family:&quot;Li=
beration Sans&quot;,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;f=
ont-size:14px">? if so, shouldn&#39;t we check why it returns ENOTTY</span>=
</div><div class=3D"gmail_default" style=3D"font-size:small"><span style=3D=
"color:rgb(51,51,51);font-family:&quot;Liberation Sans&quot;,&quot;Helvetic=
a Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px">but not ENOTSUP in =
failed setxflags?</span></div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><span style=3D"color:rgb(51,51,51);font-family:&quot;Liberation S=
ans&quot;,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:1=
4px"><br></span></div><div class=3D"gmail_default" style=3D"font-size:small=
"><span style=3D"color:rgb(51,51,51);font-family:&quot;Liberation Sans&quot=
;,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px">(bt=
w, I assumed you guys did NOT change the mount way with=C2=A0</span>user_xa=
ttr option)</div>=C2=A0 =C2=A0</div><div><span class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 </span>Kernel Version: 5.8.0-rc6+<br>=
=C2=A0 =C2=A0 setxattr03.c:135: CONF: No xattr support in fs or fs mounted =
without user_xattr option<br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
The reason not checking errno is that `chattr +i` is a very basic operation=
,<br>
if it fails, most probably it&#39;s not supported. NFS returning ENOTTY<br>
makes checking errno more tricky. So I did not check it and made it as<br>
simple as the checking in xfstests.<br>
<br>
Thanks very much for reviewing!<br>
<br>
&gt; <br>
&gt; -- <br>
&gt; Regards,<br>
&gt; Li Wang<br>
<br>
-- <br>
Murphy<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000077c0b205ad9bb11b--


--===============0707801991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0707801991==--

