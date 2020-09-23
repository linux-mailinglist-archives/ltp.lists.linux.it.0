Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB982751C8
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 08:45:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DE833C4D3B
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 08:45:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C7EF73C29D8
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 08:45:46 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7A2F4200970
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 08:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600843544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WwzB4KQDievq0Xm9nzcgPpYnw7av8M3xVHenZYETIUY=;
 b=KTfPNg0tqPNLl6L2y7HkofH4O6ElHdAyVuU6k0ngw24ez2+boJNK5CC0VsZuSZjL5FCYFd
 LeUyv3UbmIozsk1NW0Flw/I1CvJRlMbPuO3ff852M44P4nLZ75eSrh1F6v76qZjTA93Ryg
 SDUzqvtzfvqKyZCbcJGpbIw26X6dT3o=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60--URg1cknOieFdczFUmSP4g-1; Wed, 23 Sep 2020 02:45:40 -0400
X-MC-Unique: -URg1cknOieFdczFUmSP4g-1
Received: by mail-yb1-f199.google.com with SMTP id u35so12495611ybd.13
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 23:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WwzB4KQDievq0Xm9nzcgPpYnw7av8M3xVHenZYETIUY=;
 b=eAOzm0iFCoVC49uGkJevfG9zse9FdsfFGwHYXFi1slU/aRtWlTTq0Lu5TnU17f8ocN
 JxGgv3AhwF49fseKf9utO1OrgljccC7Q2JLsfuU1VI5oLngzwrC82YaZxBbxge5/OHOS
 jsTmevFSQivuMu555Pc+whQUay0GfKXEFoJprwNQd1SFm2T1mOLumooh1MRbuAdZVRbG
 2Pg7NUzDHeXTxSn2g4FtH5XT5DpGUTcNoZq+PCh/m+HM/v6BEi1kd8a6VwzrPNCdlk3U
 Dp+XrEOsybOu6xXqpzXTY34EK0BqItSHXDFLS5I3O7eCyiz/J1Ziy6BeZ6+xY43rW3K2
 UVpQ==
X-Gm-Message-State: AOAM533HZKOdavo+8UfYvyxXGV9V29jQ7HuPOHTo/Zfkd6uEEliVGoJU
 Da+kFU7VATvcocTU73y/C794lv/vvnyd9mIggRsGW3GzSiW3N6tu9s7acer67AH9kkK1PAdRbng
 HdP+kW6rdQQTXL346LomRyFHcY3A=
X-Received: by 2002:a25:1cc3:: with SMTP id
 c186mr12063562ybc.252.1600843540383; 
 Tue, 22 Sep 2020 23:45:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFFy0+fSwKmzJMR4y8ksBVBlawdIlPT9TA81K3gq/1D4Ck8X3smQjvjdA5Gm9IT4DDc3cXBaIZDXj2wxVBhG0=
X-Received: by 2002:a25:1cc3:: with SMTP id
 c186mr12063536ybc.252.1600843539990; 
 Tue, 22 Sep 2020 23:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200922144237.9865-1-pvorel@suse.cz>
In-Reply-To: <20200922144237.9865-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Sep 2020 14:45:28 +0800
Message-ID: <CAEemH2coWxUma1Pm7E-MEz6xHx0V9NFyNcTEU57F3e_7gMBynA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_test.sh: More readable syntax
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
Content-Type: multipart/mixed; boundary="===============0385938050=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0385938050==
Content-Type: multipart/alternative; boundary="0000000000008ae75305aff56e49"

--0000000000008ae75305aff56e49
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 22, 2020 at 10:42 PM Petr Vorel <pvorel@suse.cz> wrote:

> "for cmd; do" works the same way as "for cmd in $*; do", but the latter
> is more readable. Also sync the code with tst_require_cmds().
>
> Fixes: dba1d50cb ("tst_test.sh: Add test cmd helper tst_check_cmds()")
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000008ae75305aff56e49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Sep 22, 2020 at 10:42 PM Petr Vorel &lt;<a =
href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">&quot;for cmd; do&quot; works =
the same way as &quot;for cmd in $*; do&quot;, but the latter<br>
is more readable. Also sync the code with tst_require_cmds().<br>
<br>
Fixes: dba1d50cb (&quot;tst_test.sh: Add test cmd helper tst_check_cmds()&q=
uot;)<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br></blockquote><div>=C2=A0</div><div><span c=
lass=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<=
a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><=
/div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div =
dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000008ae75305aff56e49--


--===============0385938050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0385938050==--

