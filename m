Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A591622A5
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:49:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B0D23C254C
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:49:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D5E563C17C4
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:49:53 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 28B3920112B
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582015791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UJ5REfYqIYWb2r8Mm/4OxaQdmF+8EMW+079d+YJiSt4=;
 b=XV2vSWo6kx4IVcFDdgZZ4NhvyuO2krUfXja9OKlIOfxfkcVoYmgAdPc//yiE//djnTRj6u
 ZalELC76VM4blx+Ve0EIkjDpI0sTwfV2e7yLg8woyWPiAjoafW72+ccq4XgeMHE4bLG90k
 37rTHoLYFOTHItFcmR7ArDsBywVe1NM=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-fpIjBfHjOQuRGh4ubdgVoQ-1; Tue, 18 Feb 2020 03:49:45 -0500
Received: by mail-oi1-f198.google.com with SMTP id c4so9661632oiy.0
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 00:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RFG9AllPWEyySzZtQKR0kig4uZ5UcqCF31EGNkUeQpw=;
 b=fYYcCGOt6I6BboBMBI4VHc7JH1DC/7T6NkCQhfmek+d53cLSgUr6hmq5hRmVM6t9BL
 kBNymzskSc2KHPTUlsk4PNIv0mh5M0VJR7b/Ywa68Om4tZ2GWzRfkTfJBKDA70+3lHN0
 7vy/JlC4vkC3GKLtTYL8BF1mRuTj1lhV4lSeSsELGWrYmUw7/pwVr1QsnqtxEB+kKcfW
 ZhBDUp/6e9pDbGU1kX8TLUqAQIWp8SOE+tMJQ6Yo5oMw6QfExS3abGhTOz7kjMji5uh7
 o1zVTEBI+4qOQFUsNrLzJ4M71L+3Zs7OdfGDFmjYa23EALy7SV97gd/e+yPXz7CCVrma
 nV4g==
X-Gm-Message-State: APjAAAXbin/R3+nP8qfUrdUQfcwGbOkdPzrvvEX8egxkPTOM497bBqRV
 JZRc6jFZ9jGogY3Js4ZDD4+Bj+BKz48/R2wvzO3pUxgiXYfL7ncAVagqqpCewp9tEeW5htogPun
 M4fpJeRNDK+U5PH3bK6LM5QOiZHk=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr527596oic.138.1582015784426; 
 Tue, 18 Feb 2020 00:49:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyBa+ikkiLcHmTp10dFO9VnqINfqoiNQsHn+aUfcnT0GJk3TjHgt1+Z7xfkVBEAicakBhlp/NX4R8nWID7bfY=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr527590oic.138.1582015784227; 
 Tue, 18 Feb 2020 00:49:44 -0800 (PST)
MIME-Version: 1.0
References: <CAEemH2dEco268yqDyDjX25FPs3V7wTBija4HiMrf8nr0W7qVQQ@mail.gmail.com>
 <20200217141622.26912-1-mdoucha@suse.cz>
 <20200217141622.26912-2-mdoucha@suse.cz>
 <CAEemH2fvquWe_+-Au-Z0wRaYt0V943A1zszJVPCXO6HrLWH9Yg@mail.gmail.com>
 <7d52d4b5-c9ae-2cf8-5742-85ce4e55ff67@suse.cz>
In-Reply-To: <7d52d4b5-c9ae-2cf8-5742-85ce4e55ff67@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Feb 2020 16:49:33 +0800
Message-ID: <CAEemH2esmZq12fFL4U-TzzvaKrKS1a-+nz7jZoN923880+dTZw@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-MC-Unique: fpIjBfHjOQuRGh4ubdgVoQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] Split off executable code from
 bpf/bpf_common.h
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
Content-Type: multipart/mixed; boundary="===============1481134073=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1481134073==
Content-Type: multipart/alternative; boundary="000000000000d92d01059ed5c0b7"

--000000000000d92d01059ed5c0b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2020 at 4:44 PM Martin Doucha <mdoucha@suse.cz> wrote:

> On 2/18/20 9:15 AM, Li Wang wrote:
> >     diff --git a/testcases/kernel/syscalls/bpf/Makefile
> >     b/testcases/kernel/syscalls/bpf/Makefile
> >     index 990c8c83c..2241bce9b 100644
> >     --- a/testcases/kernel/syscalls/bpf/Makefile
> >     +++ b/testcases/kernel/syscalls/bpf/Makefile
> >     @@ -5,6 +5,9 @@ top_srcdir              ?=3D ../../../..
> >
> >      include $(top_srcdir)/include/mk/testcases.mk <http://testcases.mk=
>
> >
> >     +FILTER_OUT_MAKE_TARGETS        :=3D bpf_common
> >      CFLAGS                 +=3D -D_GNU_SOURCE
> >
> >      include $(top_srcdir)/include/mk/generic_leaf_target.mk
> >     <http://generic_leaf_target.mk>
> >     +
> >     +$(MAKE_TARGETS): %: %.o bpf_common.o
> >
> >
> > May I ask why we need to reserve these *.o binary files in the compilin=
g?
>
> Sorry, I don't understand the question.
>

Sorry for the unclear question. I mean can we modify the Makefile as:

--- a/testcases/kernel/syscalls/bpf/Makefile
+++ b/testcases/kernel/syscalls/bpf/Makefile
@@ -10,4 +10,4 @@ CFLAGS                        +=3D -D_GNU_SOURCE

 include $(top_srcdir)/include/mk/generic_leaf_target.mk

-$(MAKE_TARGETS): %: %.o bpf_common.o
+$(MAKE_TARGETS): %: bpf_common.o


--=20
Regards,
Li Wang

--000000000000d92d01059ed5c0b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Feb 18, 2020 at 4:44 PM Martin Doucha &lt;<=
a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On 2/18/20 9:15 AM, Li Wan=
g wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/testcases/kernel/syscalls/bpf/Makefile=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/testcases/kernel/syscalls/bpf/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 990c8c83c..2241bce9b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/testcases/kernel/syscalls/bpf/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/testcases/kernel/syscalls/bpf/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -5,6 +5,9 @@ top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D ../../../..<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include $(top_srcdir)/include/mk/<a href=3D"h=
ttp://testcases.mk" rel=3D"noreferrer" target=3D"_blank">testcases.mk</a> &=
lt;<a href=3D"http://testcases.mk" rel=3D"noreferrer" target=3D"_blank">htt=
p://testcases.mk</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+FILTER_OUT_MAKE_TARGETS=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 :=3D bpf_common<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0+=3D -D_GNU_SOURCE<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include $(top_srcdir)/include/mk/<a href=3D"h=
ttp://generic_leaf_target.mk" rel=3D"noreferrer" target=3D"_blank">generic_=
leaf_target.mk</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://generic_leaf_target.mk" rel=
=3D"noreferrer" target=3D"_blank">http://generic_leaf_target.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+$(MAKE_TARGETS): %: %.o bpf_common.o<br>
&gt; <br>
&gt; <br>
&gt; May I ask why we need to reserve these *.o binary files in the compili=
ng?<br>
<br>
Sorry, I don&#39;t understand the question.<br></blockquote><div>=C2=A0</di=
v></div><div class=3D"gmail_default" style=3D"font-size:small">Sorry for th=
e unclear question. I mean can we modify the Makefile as:</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div>--- a/testcases/kern=
el/syscalls/bpf/Makefile<br>+++ b/testcases/kernel/syscalls/bpf/Makefile<br=
>@@ -10,4 +10,4 @@ CFLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D -D_GNU_SOURCE<br>=C2=A0<br>=C2=A0inc=
lude $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.mk">gen=
eric_leaf_target.mk</a><br>=C2=A0<br>-$(MAKE_TARGETS): %: %.o bpf_common.o<=
br>+$(MAKE_TARGETS): %: bpf_common.o<br><div class=3D"gmail_default" style=
=3D"font-size:small"></div><br clear=3D"all"><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div>=
<div>Li Wang<br></div></div></div></div>

--000000000000d92d01059ed5c0b7--


--===============1481134073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1481134073==--

