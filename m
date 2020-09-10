Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E0263E66
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 09:19:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BB1E3C527A
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 09:19:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 6D0D53C240A
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 09:19:35 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id DD6991A00F4A
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 09:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599722373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=29MpzuyEuncliX7TiOxEXeQM8Td6v1HA0kaxZkqVRSo=;
 b=e+X2GLVQ9XTUMZs2/ACBoVFbdtKeBBzDWzitIS+KmARu2WhFdhEA9raQZVdSdxpFwoYe+r
 hz39DDB5NWnjg/mP2qvbDeyYCRkpmr5J03pTa7iTxQ+/nP8Dxb8Jd/NTOteglKrPc42VY8
 WYmAJmdGWExTcgJr3bqKTYY5Pxwmw8U=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-J1tTMyjdMTOI2XRnld9UCQ-1; Thu, 10 Sep 2020 03:19:31 -0400
X-MC-Unique: J1tTMyjdMTOI2XRnld9UCQ-1
Received: by mail-yb1-f199.google.com with SMTP id t127so4596095ybf.16
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 00:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29MpzuyEuncliX7TiOxEXeQM8Td6v1HA0kaxZkqVRSo=;
 b=puMsj+jdyu9lfoUgumc3VnQKcFyeT1GdZIP8x/V6uFYbzSkGG11DWadMzhXk1tyxzO
 Y9MoxN0RseFgVhy9zrFBo46Ihr5OWXR1EwKXfsu9YTwVkbYdNajhhC+KiBbWSqVZ/hAN
 BiKoa1XqkEnnnR5XkUxYrkN+fWJUFA3WaB9Dy8/jQJG5w3P/BB8X3SSjuK3ZHk/OlRE0
 t0GdWWyQGITiCrKDVKYcf132p8NnzwN91OdcwYL/kO3k1gbmFtYUyOdUNq9FkuzlVf58
 cQXIuwtuOPQMtGjiD2P6zhWfzA8aWBralY3k+EK5TWzRINo+sQia1FmJKOLO9Glu5Mws
 dFjQ==
X-Gm-Message-State: AOAM532k/UHFedWhDQY5UaKxgTm+GJtYydSgadV9FXCzSP7Kk7q2b31E
 cZ9gBJYoOTDEn8adCHDsL9xSfeOFWCmhZg6wvt+Cc9Hu0eca2v87Tpgvkqo6nfzqlgNfKLPddGv
 WKv52c4H0sdX80jgeUwhRK3utyV8=
X-Received: by 2002:a25:902:: with SMTP id 2mr10437088ybj.366.1599722370900;
 Thu, 10 Sep 2020 00:19:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtQvjgSnVISvtwBELKfYCjCoHxYaWkp7cOJvaOuSRMiAPINqYIWnr+PK+fJ51kB6cC9LWV8sZzzd5le6u/hIY=
X-Received: by 2002:a25:902:: with SMTP id 2mr10437071ybj.366.1599722370728;
 Thu, 10 Sep 2020 00:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan>
 <CAEemH2cHvM_KD7W6fyX6z3bc0qfVtkp=yEM8MDvvohouyj5N2w@mail.gmail.com>
 <20200908153659.GA16066@yuki.lan>
 <CAEemH2eq0fwF8zt1uez5vuwM0vtrLtoFd_45sFqE=iQ8hpudfQ@mail.gmail.com>
 <CAEemH2es3sMSfAar8Xj4_Vr+2nsD0isPws4v=8=csLyYROAQGQ@mail.gmail.com>
 <20200909131327.GA3241@yuki.lan> <20200909132703.GB3241@yuki.lan>
In-Reply-To: <20200909132703.GB3241@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 10 Sep 2020 15:19:19 +0800
Message-ID: <CAEemH2e+Ck8M22gdgL0OQ24ekBPyDu4FwGrdG+da9E62UZWjRQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: "Pravin Raghul S." <pravinraghul@zilogic.com>,
 LTP List <ltp@lists.linux.it>, "Vijay Kumar B." <vijaykumar@zilogic.com>
Content-Type: multipart/mixed; boundary="===============1762263586=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1762263586==
Content-Type: multipart/alternative; boundary="000000000000a5a0ad05aef06329"

--000000000000a5a0ad05aef06329
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 9, 2020 at 9:26 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > Also I would like to get rid of the -fno-optimize-sibling-calls in the
> > Makefile, this makes the test a bit fragile and less portable.
>

I'm not very sure, let me think/check a while.


> /*
>  * Returns negative number if stack grows down, possitive if stack grows up
>  */
> static int stack_dir(void)
> {
>         intptr_t addr = addr_func();
>
>         printf("%p %p\n", &addr, (void*)addr);
>

This method may be doable, but the second %p print (nil), I don't why.

# ./test
0x3ffe70feb48 (nil)
418387128
-- 
Regards,
Li Wang

--000000000000a5a0ad05aef06329
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 9, 2020 at 9:26 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; Also I would like to get rid of the -fno-optimize-sibling-calls in the=
<br>
&gt; Makefile, this makes the test a bit fragile and less portable.<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">I&#39;m not very sure, let me think/check a while.</div></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
/*<br>
=C2=A0* Returns negative number if stack grows down, possitive if stack gro=
ws up<br>
=C2=A0*/<br>
static int stack_dir(void)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 intptr_t addr =3D addr_func();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%p %p\n&quot;, &amp;addr, (void*)a=
ddr);<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">This method may be=C2=A0doable, but the second %p pri=
nt (nil), I don&#39;t why.</div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small"># ./test=C2=A0</div>0x3ffe70feb48 (nil)<br>41838=
7128<br><div class=3D"gmail_default" style=3D"font-size:small"></div></div>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000a5a0ad05aef06329--


--===============1762263586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1762263586==--

