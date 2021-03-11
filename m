Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A51C9336DF8
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 09:40:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 429CA3C3333
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 09:40:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EBFA13C3286
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 09:40:09 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4E24E600F50
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 09:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615452008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SYj2pjnmdcPxkC05dy7GkSzmMWmBvMN+RkAkBnqqXo4=;
 b=IeudByukU6O8BHdOtm2Ei4I3qHsRYP1RnJxlx2eEvHcWRkpEZMTRbmbn22yMAHDEd49d5r
 JizF7xffHhj7YuvJh2eOw81xdf9KnAt1bUSKyGHnBbPzzfENy6v+nfIxPmJylSUS9Pj6fr
 reBAfvvBOlj9whugVnHp+xeHhAH6FAc=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-8rM8VB6DNJy2gdozL2cPFg-1; Thu, 11 Mar 2021 03:40:05 -0500
X-MC-Unique: 8rM8VB6DNJy2gdozL2cPFg-1
Received: by mail-yb1-f198.google.com with SMTP id 131so24930837ybp.16
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 00:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SYj2pjnmdcPxkC05dy7GkSzmMWmBvMN+RkAkBnqqXo4=;
 b=JSdt4YOei9uSfcu/ojIEf0e6RB2A2LH75eQwxzNiqu2eS7LeUzkHA6umQtwpWoLUK1
 i2gJK3Gyo1uYOZnXfB390Y6fo8QXO9IFksYs/DuEQAVWyXZfUWYwO3azhwlEJTtDVqQ/
 rN2Klee1lY5pqN8H+YgUO8pmU2ALxJ15t5/vVWxDm0YySDBiCdxED3r0xqd6vOGCS2Yw
 Cm4jHZvcWqP+FEcEfSXWb91m0ZhkI2QlQGsggVUxd7WzYPuooBiNEsOQfIyedUAgYtCN
 CL4FYo47imE3EF4BzqxSK3sj4TPDH413K9WJhACedLl6cuznvEDhY7p8qmGzmChMLB/n
 S67g==
X-Gm-Message-State: AOAM531sf6hbWW4frrHb+WICGwtw3jY6Yo5LGuW09SqvttzK3w/jYdJt
 gk9pBWPfO70N6wt7xprYfhc5TfExNHCZ9axvE7Gk2VS23iWyp8kDhdrF7W+GbMysddpRd1r4N2x
 +Jmx0or1vnUYJEiJiwz1IZyfyFH8=
X-Received: by 2002:a25:e7d7:: with SMTP id
 e206mr10120882ybh.110.1615452005043; 
 Thu, 11 Mar 2021 00:40:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz156chuINekN71Dsu6Zr1vjAlDMma+EEjFeMD6i5rGhKG1qG7Dh9g+wfkqaWNIf6/XOFEwD+w6weE8CgRp2Ac=
X-Received: by 2002:a25:e7d7:: with SMTP id
 e206mr10120856ybh.110.1615452004824; 
 Thu, 11 Mar 2021 00:40:04 -0800 (PST)
MIME-Version: 1.0
References: <20210310122625.25425-1-chrubis@suse.cz>
 <20210310122625.25425-2-chrubis@suse.cz>
 <30fec758-5e18-fceb-ec23-646253ba0e46@suse.cz> <YEjyLBZQ+D1CHqnq@rei.lan>
 <b3391506-259b-1376-2c51-4d2a1557a44a@suse.cz>
In-Reply-To: <b3391506-259b-1376-2c51-4d2a1557a44a@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 11 Mar 2021 16:39:53 +0800
Message-ID: <CAEemH2dzPtskPCJR+639u08k3LV3-XPB6AzNj4adDDvjY9Dydw@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/3] lib: Add proper filesystem skiplist
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
Content-Type: multipart/mixed; boundary="===============1332273041=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1332273041==
Content-Type: multipart/alternative; boundary="000000000000e655bd05bd3eba4b"

--000000000000e655bd05bd3eba4b
Content-Type: text/plain; charset="UTF-8"

Hi Cyril,

On Thu, Mar 11, 2021 at 12:34 AM Martin Doucha <mdoucha@suse.cz> wrote:

> On 10. 03. 21 17:22, Cyril Hrubis wrote:
> > Hi!
> >>> +static int has_kernel_support(const char *fs_type, const char *const
> *skiplist)
> >>>  {
> >>>     static int fuse_supported = -1;
> >>>     const char *tmpdir = getenv("TMPDIR");
> >>>     char buf[128];
> >>>     int ret;
> >>>
> >>> +   if (tst_fs_in_skiplist(fs_type, skiplist))
> >>> +           return 0;
> >>> +
> >>>     if (!tmpdir)
> >>>             tmpdir = "/tmp";
> >>>
> >>> @@ -84,26 +105,24 @@ static int has_kernel_support(const char
> *fs_type, int flags)
> >>>             return 0;
> >>>     }
> >>>
> >>> -   if (flags & TST_FS_SKIP_FUSE) {
> >>> -           tst_res(TINFO, "Skipping FUSE as requested by the test");
> >>> +   if (tst_fs_in_skiplist("fuse", skiplist))
> >>>             return 0;
> >>> -   }
> >>>
> >>>     tst_res(TINFO, "FUSE does support %s", fs_type);
> >>>     return 1;
> >>>  }
> >>
> >> I don't think that has_kernel_support() should look at the skiplist at
> >> all. The entire skiplist logic should be handled in
> >> tst_get_supported_fs_types(). But has_kernel_support() could return
> >> different (non-zero) values for native support and for FUSE support.
> >
> > I do not agree, that would add more complexity to an internal function
> > that is not exported outside the library.
>
> Your patchset adds complexity to tst_fs_is_supported() which is a public
> wrapper of has_kernel_support(), even though it's only used indirectly
> in shell tests. Some tests might use that function directly in the
> future so let's make the interface cleaner, not hairier.
>

+1

I have the same view as Martin. Since only regarding the function name
has_kernel_support() should only take care of the kernel supported
filesystem
but not include any blacklist from users. That will make people confused in
code reading.


-- 
Regards,
Li Wang

--000000000000e655bd05bd3eba4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Cyril,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 12:34 AM Martin Douch=
a &lt;<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 10. 03. 21 17:22=
, Cyril Hrubis wrote:<br>
&gt; Hi!<br>
&gt;&gt;&gt; +static int has_kernel_support(const char *fs_type, const char=
 *const *skiplist)<br>
&gt;&gt;&gt;=C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0static int fuse_supported =3D -1;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0const char *tmpdir =3D getenv(&quot;TMPDIR&=
quot;);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0char buf[128];<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt; +=C2=A0 =C2=A0if (tst_fs_in_skiplist(fs_type, skiplist))<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0if (!tmpdir)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpdir =3D &quo=
t;/tmp&quot;;<br>
&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt; @@ -84,26 +105,24 @@ static int has_kernel_support(const char =
*fs_type, int flags)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt; -=C2=A0 =C2=A0if (flags &amp; TST_FS_SKIP_FUSE) {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot=
;Skipping FUSE as requested by the test&quot;);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0if (tst_fs_in_skiplist(&quot;fuse&quot;, skiplis=
t))<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0}<br>
&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;FUSE does support %s&q=
uot;, fs_type);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t think that has_kernel_support() should look at the ski=
plist at<br>
&gt;&gt; all. The entire skiplist logic should be handled in<br>
&gt;&gt; tst_get_supported_fs_types(). But has_kernel_support() could retur=
n<br>
&gt;&gt; different (non-zero) values for native support and for FUSE suppor=
t.<br>
&gt; <br>
&gt; I do not agree, that would add more complexity to an internal function=
<br>
&gt; that is not exported outside the library.<br>
<br>
Your patchset adds complexity to tst_fs_is_supported() which is a public<br=
>
wrapper of has_kernel_support(), even though it&#39;s only used indirectly<=
br>
in shell tests. Some tests might use that function directly in the<br>
future so let&#39;s make the interface cleaner, not hairier.<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">+1</div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">I have the same view as Martin. Since only regarding the function name=
</div><div class=3D"gmail_default" style=3D"font-size:small">has_kernel_sup=
port() should only take care of the kernel supported filesystem</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">but not include any blackl=
ist from users. That will make people confused in</div><div class=3D"gmail_=
default" style=3D"font-size:small">code reading.</div></div><div><br></div>=
</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div=
 dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div=
>

--000000000000e655bd05bd3eba4b--


--===============1332273041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1332273041==--

