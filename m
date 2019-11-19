Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE881025DB
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 15:04:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DD423C2219
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 15:04:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 003773C184E
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 15:04:08 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D96732016BD
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 15:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574172246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OhFCsA47CvUWzzjmPG0EzJvAMM5yJfYLHyjzxt2GxiE=;
 b=Q/vpiv8/nGyjqz0N4Bio6YZ5ZHuYA4vU3ttTryKLNoLHU3kPLSSRiPJoFJxl8/Re02NTuZ
 CdOCuNw+vml69XirbE8V7oZeR/eOBCjnvw7et4Q018o/v8h1+rrICLb3xMg+9EA9Mm5nPR
 /NMCfh4IzyG5lf1QkkSAxwMmIZU9cQw=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-IBhhDav9OzaBNLtQ4sf1VQ-1; Tue, 19 Nov 2019 09:04:02 -0500
Received: by mail-ot1-f70.google.com with SMTP id b110so3848830otc.15
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 06:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ugwk8UIy6/Sh4oy+x6442tpIZ5muBU8z/ERhKWccXwI=;
 b=TXxT72Ajc4GAflQCVUHRwSZHo3WBrzAv3dO+/5ILnxQ290yrzaPvBFkjEi+LP1V7sw
 P+vopQXKoThOQYHSnAkuHjX7lwfGOjk03qFejREPd1CHnytG5m9lQYm+YmhOFUUhwTWa
 YCJq+fYU++k54MxfAM9Zh1flTjkR72xDhmdkgOwJH7v3VAHPwYKLpnxBQCWVWP3CKfkl
 fsztxcHSudXojKX6CESbzc6Q0hy9rIgoD4q8ZvF1uPhSB7zZXL973AYghW0XfyYMJBml
 LP3gjAovH9IMVra31dwjemb94+178qwWQmlRG4ch9UK1xEUqwLSved/RlsMLEQ0/r94R
 LVug==
X-Gm-Message-State: APjAAAV93AeLq8CK7l1IOYT79Mz+R4c3dRjxIBzsY5B9mdv8fpmf+k+o
 TkNAdXo3UToBx62bPpb2jPeEMRfcGYgnrDdzJnsPD7a/rU2bJHCsn3DipI2qiQBaZP2nu/rgA1U
 J/QlhDRLUW7LFI81RWvBWrZy7dfc=
X-Received: by 2002:a9d:7b50:: with SMTP id f16mr3880405oto.264.1574172241317; 
 Tue, 19 Nov 2019 06:04:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqy702VlzVksLwKsf4tp+h5evauG8vXJEZKfSoFz7eDH2w9XRUaCJVok28Bz9og/VgzsEjgKCYLMoj9ZrDY4MtQ=
X-Received: by 2002:a9d:7b50:: with SMTP id f16mr3880355oto.264.1574172240742; 
 Tue, 19 Nov 2019 06:04:00 -0800 (PST)
MIME-Version: 1.0
References: <20191119094156.20348-1-liwang@redhat.com>
 <1860355560.12961927.1574161647388.JavaMail.zimbra@redhat.com>
In-Reply-To: <1860355560.12961927.1574161647388.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 19 Nov 2019 22:03:48 +0800
Message-ID: <CAEemH2cN8qv_YpsFKJazcOKEvgfjXpacZOV_Er-0bjK86=6VpQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: IBhhDav9OzaBNLtQ4sf1VQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_fill_fs: enhance the filesystem filling
 routine
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
Content-Type: multipart/mixed; boundary="===============1192292313=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1192292313==
Content-Type: multipart/alternative; boundary="00000000000039aa8a0597b389c5"

--00000000000039aa8a0597b389c5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 7:07 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > -             while (len) {
> > +             while (len >=3D fi.f_bsize) {
>
> Let's say f_bsize is 512, and len is 1023. We hit ENOSPC for 1023,
> len for next round is 511. Loop ends, but we never tried write with
> f_bsize or smaller value.
>
> I think we should try len < fi.f_bsize at least once.
>

Good point. At least for len =3D fi.f_bsize.


>
> >                       ret =3D write(fd, buf, MIN(len, sizeof(buf)));
> >
> >                       if (ret < 0) {
> > +                             if (errno =3D=3D ENOSPC) {
> > +                                     len /=3D 2;
> > +                                     continue;
> > +                             }
>
> The return below (in original code) doesn't appear to be reachable now.
>

Yes, but it doesn't make much sense there, maybe we could remove that part
directly?

--=20
Regards,
Li Wang

--00000000000039aa8a0597b389c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 19, 2019 at 7:07 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (len) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (len &gt;=3D fi=
.f_bsize) {<br>
<br>
Let&#39;s say f_bsize is 512, and len is 1023. We hit ENOSPC for 1023,<br>
len for next round is 511. Loop ends, but we never tried write with<br>
f_bsize or smaller value.<br>
<br>
I think we should try len &lt; fi.f_bsize at least once.<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Go=
od point. At least for len =3D fi.f_bsize.</div></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ret =3D write(fd, buf, MIN(len, sizeof(buf)));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D ENOSPC) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len /=3D 2;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
The return below (in original code) doesn&#39;t appear to be reachable now.=
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Yes, but it doesn&#39;t make much sense there, maybe we could r=
emove that part directly?</div></div><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000039aa8a0597b389c5--


--===============1192292313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1192292313==--

