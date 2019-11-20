Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79410317E
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 03:19:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C71E93C22AE
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 03:19:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F369C3C13DE
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 03:19:33 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A8AC220096F
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 03:19:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574216370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kEjwpvNO5/HKPNbjgQTaXUSgfm8fEH40Zu4c5ofTb7c=;
 b=EMyYKUK+BU+erCMMc5X6Cuwc1Bmj3QuTtYQp3bGqzwKujCqGDl/tY8g2+ieyP+HmCH/isW
 Ak0Bd8w2ccwluUwlD0OnJ710T6DtAj139zaMXNpiZ7pIKhU92EsDGJQK4TSgVoxbJZz5Uk
 4KJJU9lOKxWaPTazfyFDLLrz/QBV0A8=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-Z-qOD3VcOGyPMVbL79BdxA-1; Tue, 19 Nov 2019 21:19:27 -0500
Received: by mail-oi1-f200.google.com with SMTP id k145so11768105oih.12
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 18:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+LqVXfmVl9TBfsNuvFnWIueizydqAGqiCAi+IKhlkE=;
 b=EWrhTZPXaa1y7tx1ljmtsLgqjHYbRaZoVhZU2XOKLWe6QcVzdTH92wBNtrruMUaAZb
 eVRL0lYI44wPReXcXvmzZAj4pnDUxpgCaQOlpcdFUlsObmL/fjdsz/lBVwipwxUQtWJ3
 h9/jA++Z7GMp6u1OxRzcDCVaNbYi7Ih6UEJPbDWgPcR+vPPLa8b1LXHecGG59j92Oi28
 xHEAGhyv/0oNDjJKDCbVt8PoOOdU3QhSH32n4FXzideGQQ2BGXTOHPkpmXbc7bYGZt4+
 QEiobCeGoox9VK2z+IV1FZ0ZWiBAKEQ1den5AY4vDxpBoCHdJV+Btk0/1Ye1QMeHMOzG
 hIFA==
X-Gm-Message-State: APjAAAXwfrS+CRrxA8tm4VLtXvHsj4WEfBz4DRwAv+frJVfkKyYC7NMf
 kKXSaY9MmN9qrpq6r93zMuevVu/4xuNfO92CiCgFfEjTuInqaM9PbrNN2Lh/y3sLCgIet1paVsF
 CPjcCcr44YgCc8UbWWllBpgWzvfU=
X-Received: by 2002:aca:4a84:: with SMTP id x126mr567182oia.47.1574216366405; 
 Tue, 19 Nov 2019 18:19:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzRuRaE5eRk9orBWkZKe8rlo5HQ9Fuzq63k1VTFNUupXeoXldzd7StvrdHw/5Q/UdPZ/E/qRtUCnlmHEbTqfxc=
X-Received: by 2002:aca:4a84:: with SMTP id x126mr567169oia.47.1574216366151; 
 Tue, 19 Nov 2019 18:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20191119094156.20348-1-liwang@redhat.com>
 <1860355560.12961927.1574161647388.JavaMail.zimbra@redhat.com>
 <CAEemH2cN8qv_YpsFKJazcOKEvgfjXpacZOV_Er-0bjK86=6VpQ@mail.gmail.com>
 <c9d278e6-5700-6c16-019b-1770a6ede0ff@suse.cz>
In-Reply-To: <c9d278e6-5700-6c16-019b-1770a6ede0ff@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 20 Nov 2019 10:19:15 +0800
Message-ID: <CAEemH2dZCm5MVyhzWiFKVK-jt+UUw65u5CRFk-moUVUgpDHHWg@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-MC-Unique: Z-qOD3VcOGyPMVbL79BdxA-1
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
Content-Type: multipart/mixed; boundary="===============1526388948=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1526388948==
Content-Type: multipart/alternative; boundary="0000000000004e124d0597bdcfe6"

--0000000000004e124d0597bdcfe6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 10:24 PM Martin Doucha <mdoucha@suse.cz> wrote:

> On 11/19/19 3:03 PM, Li Wang wrote:
> > On Tue, Nov 19, 2019 at 7:07 PM Jan Stancek <jstancek@redhat.com
> > <mailto:jstancek@redhat.com>> wrote:
> >
> >     ----- Original Message -----
> >     > -             while (len) {
> >     > +             while (len >=3D fi.f_bsize) {
> >
> >     Let's say f_bsize is 512, and len is 1023. We hit ENOSPC for 1023,
> >     len for next round is 511. Loop ends, but we never tried write with
> >     f_bsize or smaller value.
> >
> >     I think we should try len < fi.f_bsize at least once.
> >
> >
> > Good point. At least for len =3D fi.f_bsize.
>
> You don't need to reduce the write size in the first place. Kernel will
> happily do short writes for you if the file system somehow finds some
>

You're probably right, but here I just want to enhance the tst_fill_fs
routine, it obviously couldn't  be guaranteed way to perfectly fill a
filesystem, this action from userspace is what I can think of.


> free blocks. The more important question is how to trigger garbage
> collection of internal file system book-keeping data.
>

Okay. I'm not good at FS issues. Or, do you have a better idea for that?

--=20
Regards,
Li Wang

--0000000000004e124d0597bdcfe6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 19, 2019 at 10:24 PM Martin Doucha &lt;=
<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 11/19/19 3:03 PM, Li W=
ang wrote:<br>
&gt; On Tue, Nov 19, 2019 at 7:07 PM Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jstancek@redhat.com" target=3D"_blank">js=
tancek@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0----- Original Message -----<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0while (len) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0while (len &gt;=3D fi.f_bsize) {<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Let&#39;s say f_bsize is 512, and len is 1023. We h=
it ENOSPC for 1023,<br>
&gt;=C2=A0 =C2=A0 =C2=A0len for next round is 511. Loop ends, but we never =
tried write with<br>
&gt;=C2=A0 =C2=A0 =C2=A0f_bsize or smaller value.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I think we should try len &lt; fi.f_bsize at least =
once.<br>
&gt; <br>
&gt; <br>
&gt; Good point. At least for len =3D fi.f_bsize.<br>
<br>
You don&#39;t need to reduce the write size in the first place. Kernel will=
<br>
happily do short writes for you if the file system somehow finds some<br></=
blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"">You&=
#39;re probably right, but here I just want to enhance the tst_fill_fs rout=
ine, it obviously couldn&#39;t=C2=A0 be guaranteed way to perfectly fill a =
filesystem, this action from userspace is what I can think of.</div></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
free blocks. The more important question is how to trigger garbage<br>
collection of internal file system book-keeping data.<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Okay.=
 I&#39;m not good at FS issues. Or, do you have a better idea for that?</di=
v></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--0000000000004e124d0597bdcfe6--


--===============1526388948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1526388948==--

