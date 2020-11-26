Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B352C4D56
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 03:17:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EC0A3C5E3E
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 03:17:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D3A2A3C2451
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 03:17:32 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 8355F1A00695
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 03:17:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606357049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T1PHl85Q/xnkx1/jeHiLbTy7dKkrR5GbQ8KqK2BdlIQ=;
 b=aA6qu5c4nxN/oGd9C+EYV/friGbcH+YC/jqXLc5NzdF1Vv4ePXhYRe1kQRvq0xyDJcfmS2
 eTLHea6kkpYrnOHeR6bmMYAARzh1vAJO5P3vQHPE0ZsHoM8Z9HmRKPuNnPNKLZDJGEC+jN
 Z2xTv9axQ2lFAjQKjDfqYpG9fVYZq/4=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-QkquE8y0MxaW1h3InMdoQw-1; Wed, 25 Nov 2020 21:17:27 -0500
X-MC-Unique: QkquE8y0MxaW1h3InMdoQw-1
Received: by mail-yb1-f199.google.com with SMTP id c9so936278ybs.8
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 18:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T1PHl85Q/xnkx1/jeHiLbTy7dKkrR5GbQ8KqK2BdlIQ=;
 b=Hg5p0JCYxfzCZkMi4fO0rYi5sZPgACsnuVOFLl892CuxCUuJqMnIZQ0afZKIa2Wl+F
 N+alKnMAPI3XGSFki7Nm5LrZ9AS2rEBlhzIXUUfPWcX1CND0Ea2YNXjVTMHnK+izaVDo
 cAUqhWIwVdmDCtzMm0l7rw0pb1FC8CaCXxOn9waSY5i3LGmfSFCqbTQl1Pe6X7glPqc+
 90lW5n3w3jDd76Zs+ut4+g0y1suEft4ETzsGlnmiQeSAwh1dD79Hkk6kTNK51dHnRXfM
 nwf9bKdOWwpvxEg5mwVwS58FEtiQ02aQ1ojYFREVGh0q1TP3OFwjM6/Ptoa9xY1LHNsd
 JivQ==
X-Gm-Message-State: AOAM533ciUlJR2USx1mBbIh0A+GPzVrUn7rjgk8dgBY8BJPMyG0prHbD
 9pmUVWPdrSya3Uq6YIcFUoUzQoXqWs2q020FT7FTxMEnE+c1Taq0UklmFdw9sPPUrTI9QdJcFdZ
 pw3Wg1iFlqrXEXk3ri+AcAXOmfTQ=
X-Received: by 2002:a05:6902:50e:: with SMTP id
 x14mr824167ybs.252.1606357046314; 
 Wed, 25 Nov 2020 18:17:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzGzg22ZRA5Kp/PPrGRI9WLbjyOG7E6midY4DxxRNSlVrZlSuTqdLH1Dv02sQm+eQtltjBAuEKrLfiZ7lyIfo=
X-Received: by 2002:a05:6902:50e:: with SMTP id
 x14mr824151ybs.252.1606357046047; 
 Wed, 25 Nov 2020 18:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20201113131428.13199-1-chrubis@suse.cz>
 <20201113131428.13199-2-chrubis@suse.cz>
 <20201113202828.GA2229@pevik>
 <CAEemH2fXD-gFF_7PogAPB1txUrgQmmzeK8p=MaMSn1zam0YeVg@mail.gmail.com>
 <20201119130824.GC12628@yuki.lan> <20201125131803.GB30149@yuki.lan>
 <CAEemH2dWwLD-J+cP6mJ3LAHcbGBtZ+ZaUMBiBZBDBsyK-q8Zww@mail.gmail.com>
 <20201125155716.GA5358@yuki.lan>
In-Reply-To: <20201125155716.GA5358@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 26 Nov 2020 10:17:14 +0800
Message-ID: <CAEemH2fLWzGYfiaGfBNd+x29Ts-sO31JRRF+-UH-g=GRd0aGFw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH 01/10] lib: Introduce more TEST_* macros
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
Content-Type: multipart/mixed; boundary="===============1594103856=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1594103856==
Content-Type: multipart/alternative; boundary="0000000000001cd1f105b4f9259f"

--0000000000001cd1f105b4f9259f
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 11:56 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > Is anyone against pushing this initial patchset as it is?
> > >
> >
> > Another bit of concern I have is the TEST_FAIL might cause
> > confusion in code reading. It looks like the test will be failed here
> > but in finish the test report pass, maybe we'd better tell people the
> > failure is expected?
> > (that was just my feeling on TEST_FAIL at the first glance)
> >
> > Or rename them to:
> >
> > TEST_EXP_PASS
> > TEST_EXP_FAIL
> > TEST_EXP_FD
>
> Fair enough, let's rename them like this.
>
> Any other concerns?
>

No more from me, thank you.
-- 
Regards,
Li Wang

--0000000000001cd1f105b4f9259f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 11:56 PM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; Is anyone against pushing this initial patchset as it is?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Another bit of concern I have is the TEST_FAIL might cause<br>
&gt; confusion in code reading. It looks like the test will be failed here<=
br>
&gt; but in finish the test report pass, maybe we&#39;d better tell people =
the<br>
&gt; failure is expected?<br>
&gt; (that was just my feeling on TEST_FAIL at the first glance)<br>
&gt; <br>
&gt; Or rename them to:<br>
&gt; <br>
&gt; TEST_EXP_PASS<br>
&gt; TEST_EXP_FAIL<br>
&gt; TEST_EXP_FD<br>
<br>
Fair enough, let&#39;s rename them like this.<br>
<br>
Any other concerns?<br></blockquote><div><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">No more from me, thank you.</div><div class=
=3D"gmail_default" style=3D"font-size:small"></div></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><di=
v>Li Wang<br></div></div></div></div>

--0000000000001cd1f105b4f9259f--


--===============1594103856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1594103856==--

