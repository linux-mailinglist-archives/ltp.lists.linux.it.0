Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B53FA2AEEFE
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 11:51:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 670793C2F3E
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 11:51:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1C3833C2650
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 11:51:47 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 80BCF600CFB
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 11:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605091905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AVM1/Al+mXzn8mhWtlGrVPU57e4dLkU2CB/AovST7YM=;
 b=Y8c6iglQtygp+PCb1yClym+KGS/Me6luthMCB9KxO3u1FKTpEpFeN6nA0MFi/QORPZOHPu
 pi6J+oG4nhIDBTGk+n/tkXoD9JCGBE2w5mhJcOKJtGxxiv+0feLuPJNCrVt4U48PhEIqvT
 ao2rnfsJmnxFWwfu+BrLcWXz6Gabwtk=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-fpHrZ450PEWfKSrejJm5Jg-1; Wed, 11 Nov 2020 05:51:42 -0500
X-MC-Unique: fpHrZ450PEWfKSrejJm5Jg-1
Received: by mail-yb1-f199.google.com with SMTP id x141so2015327ybe.16
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 02:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AVM1/Al+mXzn8mhWtlGrVPU57e4dLkU2CB/AovST7YM=;
 b=K6bVYMTaazsHeS9NKrMEQPC4HFbj7g7S52aIXW42NFkjtnTR0i5Y/feiYlGO49WLt1
 +/iKNDSu8nf46lgfrDX3NH+oo7ff3eXpSJ3TOZpubWRRrkl/tWHOE/7ZKTVA0HpVBYsB
 Mr1qPEyIOAbQXPUSYPoxptuTHs2rNNxu38pHiPgyAALZL7hnXlDJ9pN8KUVgK8Fap5dq
 nAqm+jYF5QEdgE+hnpuR6/ErVeC68VExUdQkuQHELBGFIlVFbrD5/H+CTY2KCBQ35oNI
 Bz7Q4Sx2pwsqpC7aBCt1GIDiOrb6ag/MiRrsy8RH662/YLQIN+41mepkOwXSId6i2tPJ
 9owQ==
X-Gm-Message-State: AOAM530Hb5KU9vsCPDlRhrmyMOFFpScFK2tWUFyNnIP6wbsL5tzWfmC+
 xMVTPWUlDqspczYWC+hTdkGS/pvoMc+PCuhS5oviUms4OqMiM0q2vgPqHlyDjUT5nbwqriE50HM
 6CDcef7ABqe3uwEkskWVx5uqIIDc=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr31287024ybj.366.1605091901468; 
 Wed, 11 Nov 2020 02:51:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpYyneYE0+vg8tyOGLpiHatRULp1CIG+vRLP2zltZOgqOt9rEvIc+M9Jm0A6V+ewY6VS337AhgVUp9A5cMP5E=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr31287005ybj.366.1605091901209; 
 Wed, 11 Nov 2020 02:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20201110120923.21759-1-pvorel@suse.cz>
 <20201111093934.GA5870@yuki.lan>
 <CAEemH2cyoSpQhTH5S=EWWoD7DaLz6WKFFadLFHMxkW8LHYM5CA@mail.gmail.com>
 <20201111095553.GA8524@pevik>
In-Reply-To: <20201111095553.GA8524@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 11 Nov 2020 18:51:29 +0800
Message-ID: <CAEemH2c4qTU1f99MBXTyVgvX-L=LNRneRJvmctkF9YiQ68u_-Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/1] m4: Remove workaround for old pkg-config
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
Content-Type: multipart/mixed; boundary="===============0943286325=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0943286325==
Content-Type: multipart/alternative; boundary="0000000000009a9abd05b3d2940d"

--0000000000009a9abd05b3d2940d
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2020 at 5:56 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> > On Wed, Nov 11, 2020 at 5:38 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> > > Hi!
> > > Looks good to me, let's apply this unless anybody complains.
>
>
> > Hold on, please.
>
> > Seems we have to replace TIRPC_LIBS/TIRPC_CFLAGS with LIBTIRPC_* in all
> > respective Makefiles? Otherwise, it will fail like the Travis CI job I
> > guess.
>
> Correct, currently would fail without it.
> https://travis-ci.org/github/pevik/ltp/builds/742685737
>
> I'll send v2 where I implement this.
>

Thanks, I modified base on your patch, test result FYI
https://github.com/wangli5665/ltp/commit/dad10021771101e7fdd416af894be7484fcb7a52
https://travis-ci.org/github/wangli5665/ltp/builds/742909686


-- 
Regards,
Li Wang

--0000000000009a9abd05b3d2940d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 11, 2020 at 5:56 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; On Wed, Nov 11, 2020 at 5:38 PM Cyril Hrubis &lt;<a href=3D"mailto:chr=
ubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; wrote:<br>
<br>
&gt; &gt; Hi!<br>
&gt; &gt; Looks good to me, let&#39;s apply this unless anybody complains.<=
br>
<br>
<br>
&gt; Hold on, please.<br>
<br>
&gt; Seems we have to replace TIRPC_LIBS/TIRPC_CFLAGS with LIBTIRPC_* in al=
l<br>
&gt; respective Makefiles? Otherwise, it will fail like the Travis CI job I=
<br>
&gt; guess.<br>
<br>
Correct, currently would fail without it.<br>
<a href=3D"https://travis-ci.org/github/pevik/ltp/builds/742685737" rel=3D"=
noreferrer" target=3D"_blank">https://travis-ci.org/github/pevik/ltp/builds=
/742685737</a><br>
<br>
I&#39;ll send v2 where I implement this.<br></blockquote><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">Thanks, I modified=
 base on your patch, test result FYI</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><a href=3D"https://github.com/wangli5665/ltp/commit/d=
ad10021771101e7fdd416af894be7484fcb7a52">https://github.com/wangli5665/ltp/=
commit/dad10021771101e7fdd416af894be7484fcb7a52</a></div><div class=3D"gmai=
l_default" style=3D"font-size:small"><a href=3D"https://travis-ci.org/githu=
b/wangli5665/ltp/builds/742909686">https://travis-ci.org/github/wangli5665/=
ltp/builds/742909686</a></div><br></div></div><div><br></div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div=
><div>Li Wang<br></div></div></div></div>

--0000000000009a9abd05b3d2940d--


--===============0943286325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0943286325==--

