Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5819027C50A
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 13:29:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1980E3C2A9D
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 13:29:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 104AC3C2A0F
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 13:29:43 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 75EF81400E70
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 13:29:42 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601378981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LKhYCOIJDjBMNESQ+lqwVrHGe7s5qd0NrEVmMuAqsx0=;
 b=ZxHK21zmNnWYO4eVxU8kve3d8Y4fJdaWGFK9DpjfLs6Fy442jr8EoL20uciH5pC34mL+r6
 /N9SZDBUHicZ6Ao5PpyN+J12LApy8Gw8Y0uVnn8v4D1H5QDsvq/UVNC89M48t0DRC8ycBU
 IaZtD8U4GQ7v0t23alpLYH69JbITp4E=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-BA6SpVXQMTu28iCiTTr0hg-1; Tue, 29 Sep 2020 07:29:38 -0400
X-MC-Unique: BA6SpVXQMTu28iCiTTr0hg-1
Received: by mail-yb1-f200.google.com with SMTP id b8so4423707yba.10
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 04:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LKhYCOIJDjBMNESQ+lqwVrHGe7s5qd0NrEVmMuAqsx0=;
 b=MaUisd3PKPPkUv3VDCIhVMA3NIZAm/JXGA4N5Xqq/cUszZ/7HjBRz2K6mFDp0kB/7Y
 I71DL50r90IPaffnAE58+IPmf2zDuxzk/jR0Met9deUaX1bRlJBM9lAjEvxsYwCWvmTW
 HPEo0Jsmg8BezphI//RzeMNbORC0MM0dcaV1mu31m/8XyNVaK/v6b2grbWAeQORCS5Gs
 nxJF6fO3Duw82HmRUNCl028u7uYsLGvN/aAv+GXr429baQ6O5tLR3bMTnArEYyk/9Xd9
 Go353kQSbWc7aAS4apF2WAOYhcIJnQz7EtD4X1mATdZTci4u+/uEtFnbFEy/aYk+qM7R
 M4WA==
X-Gm-Message-State: AOAM533OB/g2n9hYaXAW9wXABBMrD9nWxSTZtc1jpxYK02a7Tex8Q2j7
 DYd5zx+xMqsrc7DvrindMHKtfVyS7Rstl2JCS0CIquN7HH1ifHe4BjPkGsR3GZLHe4DzsF0HAv9
 VQU+r+CXm+RrlWkIra3WQl99wMtY=
X-Received: by 2002:a25:69cb:: with SMTP id e194mr5362087ybc.243.1601378978076; 
 Tue, 29 Sep 2020 04:29:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyawSjJLDC2NTeICMoiKSPIzf8fwzdMZeNwVHruUdq3CQcJeayQZRpRq2C6s3/1veiBZwADJrfvduKJTPDLeM=
X-Received: by 2002:a25:69cb:: with SMTP id e194mr5362053ybc.243.1601378977779; 
 Tue, 29 Sep 2020 04:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200925121941.10475-1-rpalethorpe@suse.com>
 <CAEemH2eo6qVt0D36QVDFeW_2csWFEDnnghxRjd3_Ysu=CD-8Hw@mail.gmail.com>
 <87y2kuwa1x.fsf@suse.de>
In-Reply-To: <87y2kuwa1x.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Tue, 29 Sep 2020 19:29:26 +0800
Message-ID: <CAEemH2ef9t+az4b=1zWyjuWYnUOkENL7471g0KczhUx-XFRFjQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC][PATCH] tst_cgroup: Attempt to use CGroups V2 then
 V1 instead of guessing
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
Content-Type: multipart/mixed; boundary="===============1776386832=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1776386832==
Content-Type: multipart/alternative; boundary="0000000000001f2d7505b072194c"

--0000000000001f2d7505b072194c
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 5:00 PM Richard Palethorpe <rpalethorpe@suse.de>
wrote:

> Hello Li,
>
> Li Wang <liwang@redhat.com> writes:
>
> >>
> >> -static void tst_cgroup2_mount(const char *mnt_path, const char
> *new_path)
> >> +static int cgroup2_mount(const char *mnt_path, const char *new_path)
> >>
> >
> > We'd like to make the series function name starts with tst_*.
> >
>
> The idea is this will be an internal/static function and
> tst_cgroup2_mount will be a public function if it is needed. I guess
> that eventually there will be features only available in cgroup2, in
> which case the test author will want to call tst_cgroup2_mount not
> tst_cgroup_mount and they will just want it to fail with tst_brk if
> cgroup2 can't be mounted.
>

Sounds good.


>
> Infact, if the user wants cpuset or some other V1 only controller, then
> they should probably call tst_cgroup1_mount. AFAICT some of these
> controllers will not be moved to V2. OTOH a functionally similar feature
> may be available in V2, but with a different interface. There is a
> difference between requiring a specific controller to test it and
> needing some functionality without caring how it is provided.
>
> So I suggest providing an API for mounting specific cgroup versions and
> controllers and an API to mount specific controllers of either version
> (i.e. tst_cgroup_mount). Then we can create helper functions to provide
> functionality without caring how it is achieved, if we need to do that.
>

This is a really good suggestion.


> Other comments sound good! I will try creating another patch with
> diagnostics.
>

Thanks!
-- 
Regards,
Li Wang

--0000000000001f2d7505b072194c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Sep 28, 2020 at 5:00 PM Richard Palethorpe =
&lt;<a href=3D"mailto:rpalethorpe@suse.de">rpalethorpe@suse.de</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Li,<br>
<br>
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt;&gt;<br>
&gt;&gt; -static void tst_cgroup2_mount(const char *mnt_path, const char *n=
ew_path)<br>
&gt;&gt; +static int cgroup2_mount(const char *mnt_path, const char *new_pa=
th)<br>
&gt;&gt;<br>
&gt;<br>
&gt; We&#39;d like to make the series function name starts with tst_*.<br>
&gt;<br>
<br>
The idea is this will be an internal/static function and<br>
tst_cgroup2_mount will be a public function if it is needed. I guess<br>
that eventually there will be features only available in cgroup2, in<br>
which case the test author will want to call tst_cgroup2_mount not<br>
tst_cgroup_mount and they will just want it to fail with tst_brk if<br>
cgroup2 can&#39;t be mounted.<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Sounds good.</div></div><div>=
<span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Infact, if the user wants cpuset or some other V1 only controller, then<br>
they should probably call tst_cgroup1_mount. AFAICT some of these<br>
controllers will not be moved to V2. OTOH a functionally similar feature<br=
>
may be available in V2, but with a different interface. There is a<br>
difference between requiring a specific controller to test it and<br>
needing some functionality without caring how it is provided.<br>
<br>
So I suggest providing an API for mounting specific cgroup versions and<br>
controllers and an API to mount specific controllers of either version<br>
(i.e. tst_cgroup_mount). Then we can create helper functions to provide<br>
functionality without caring how it is achieved, if we need to do that.<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">This is a really good suggestion.</div></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Other comments sound good! I will try creating another patch with<br>
diagnostics.<br></blockquote><div><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Thanks!</div><div class=3D"gmail_default" style=3D"=
font-size:small"></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--0000000000001f2d7505b072194c--


--===============1776386832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1776386832==--

