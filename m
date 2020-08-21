Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AA624CD67
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 07:49:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D30C83C2F78
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 07:49:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5D01C3C2616
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 07:49:19 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 43FA060071C
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 07:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597988956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0TT/Plo+cnyD6rZ4TGE74xWAUXCI9I26JQEclrgfifg=;
 b=XAfhuAOFTioUOXgXml/5r3FR3YGAthN2lyhUt6NN4uJkUl4JiCPThCTt9SPquFuOZQ2dwi
 AKf5BbP0uk2Yl6Wv0VZtlWPi5Solgwxi88NAGyd4Jw/YmZRVqdwuu4XcQ2p7Zb1yJGYwk4
 9ETjaOvYS5vxj6276W1gxh7fqns4uig=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-TgtHQsHOMKG75YTtU_X9cg-1; Fri, 21 Aug 2020 01:49:13 -0400
X-MC-Unique: TgtHQsHOMKG75YTtU_X9cg-1
Received: by mail-yb1-f198.google.com with SMTP id o8so1042062ybg.16
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 22:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0TT/Plo+cnyD6rZ4TGE74xWAUXCI9I26JQEclrgfifg=;
 b=IEragXDgL7n1+BrynsGQkrJZql+PP5emA8vmcUm8d6/64k3T1n7MqnvmpvPZ3YG+fJ
 jzblLL4EVYN01WNTTlmc7e9dYDJwpe7oRlGPixytcPaiU0nBa7qENvLyj4SsAXORGAzl
 jnH2PASP0k/aNjWxWIhdcTKr8gxnNkv0YA9IM4iSxhLUJNUrfv/DYA0pmkxdot2gFwtU
 88IoKDBRfQCIyVQKdkxswefJAtGws3wCKrcp7HhPlIN47i/u/5kqHlyhHhrlzUTFJ41h
 ld8tDrlEDUoR+/yqada7Ugxa13iuVJUr6bONcjImloqWjTZkQss+ul/u9X+6Z9DeZ1xg
 38cA==
X-Gm-Message-State: AOAM532C3924hW6O5CXuIGzcX64/Slh/JwxIGuVLZOMdxUVJk9ZGkJR9
 HMiC6YmD0woRjwyMLc8pd7R4bEmTAaW5GTOo51zinJqvyPX6/0BEaBsuqp/9if1IVJpPh0V3OtL
 rKsg0AoVXZtTLyxrkuzzy1TYn3i4=
X-Received: by 2002:a25:7b44:: with SMTP id w65mr1670916ybc.243.1597988952986; 
 Thu, 20 Aug 2020 22:49:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4vISqZVdxeAdntmrHH2LaDPVueEaBdbdhaDCyBT+sqLN0JJxUgHy5fV8yOHWU8/Kan1en1kaQcgVVwqscC9Y=
X-Received: by 2002:a25:7b44:: with SMTP id w65mr1670900ybc.243.1597988952781; 
 Thu, 20 Aug 2020 22:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <1597919168-10702-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1597919168-10702-3-git-send-email-zhufy.jy@cn.fujitsu.com>
In-Reply-To: <1597919168-10702-3-git-send-email-zhufy.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 21 Aug 2020 13:49:01 +0800
Message-ID: <CAEemH2f2pSyYGSvd0cxNoufAWMQTpObkE+OU974AJQmaH-+9eQ@mail.gmail.com>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
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
Subject: Re: [LTP] [PATCH 3/4] syscalls/kill05:Cleanup && Convert to new
 library
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
Content-Type: multipart/mixed; boundary="===============1297461658=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1297461658==
Content-Type: multipart/alternative; boundary="000000000000e2cb2305ad5ccb6b"

--000000000000e2cb2305ad5ccb6b
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 20, 2020 at 6:27 PM Feiyu Zhu <zhufy.jy@cn.fujitsu.com> wrote:

> ...
>   *     Looping with the -i option does not work correctly.
>

This line should be removed since it works well with -i.

> +static void wait_for_flag(int value)
>  {
>         while (1) {
>                 if (*flag == value)
>

Sleep 1sec is too long here, we can use usleep(100) for a replacement.

+static struct tst_test test = {
> +       .setup = setup,
> +       .cleanup = cleanup,
> +       .test_all = verify_kill,
> +       .needs_tmpdir = 1,
>

'.needs_tmdir' is redundant.


> +       .needs_root = 1,
> +       .forks_child = 1,
> +};
>
The remaining part looks good.

-- 
Regards,
Li Wang

--000000000000e2cb2305ad5ccb6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Aug 20, 2020 at 6:27 PM Feiyu Zhu &lt;<a hr=
ef=3D"mailto:zhufy.jy@cn.fujitsu.com" target=3D"_blank">zhufy.jy@cn.fujitsu=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">.<span class=3D"gmail_default" style=3D"font-size:small">..</span><br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0Looping with the -i option does not work correc=
tly.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">This line should be removed since it works well with -=
i.</div></div><div class=3D"gmail_default" style=3D"font-size:small"></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+static void wait_for_flag(int value)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*flag =3D=3D va=
lue)<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Sleep 1sec is too long here, we can use usleep(100) fo=
r a replacement.</div></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D verify_kill,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_tmpdir =3D 1,<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">&#39;.need=
s_tmdir&#39; is redundant.</div></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.forks_child =3D 1,<br>
+};<br>
</blockquote></div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">The remain=
ing part looks good.</div></div><div><br></div>-- <br><div dir=3D"ltr"><div=
 dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div=
>

--000000000000e2cb2305ad5ccb6b--


--===============1297461658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1297461658==--

