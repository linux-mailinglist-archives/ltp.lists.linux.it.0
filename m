Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DD4B5A18
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 05:21:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD90E3C20B6
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 05:21:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E23E23C1833
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 05:21:28 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 37075602187
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 05:21:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1568776885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P2V9vOFhl+cJe+S46OGj6fIe1YLKgYAnWdzAfhnB+Ig=;
 b=S8372OCmFPKwrrwZ67ksN4O7PzULfR9pz26OjvvH/G7OZeVk6c10R6DTw7GDb9ycivQ3mB
 cBtPlKixxBwefWgnK964dIFe2gXnit0ALQaxknGPipnBtk18yvfeEyZn3panXwfrWUVK7q
 RMUrjd97OvsmjJUI+KZbRdY40Zo5AU8=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-_ls_w1KhPHS6AeB5uqz_Kw-1; Tue, 17 Sep 2019 23:21:23 -0400
Received: by mail-oi1-f197.google.com with SMTP id r17so2853743oij.0
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 20:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TdaY9e+Fz+kpSAH6JQpmhpG7ZEgQRowzNyXCj77PATM=;
 b=EvKl3A6C+CiXCuzJxZfDB0nuE/jVK/O48rTbh8mlqQG9kZGwMgQ99zCzayW7O3axaa
 9IUIz3pwIBmU06AmXgtNHNlqqrr5/UU1x6D6Dif7OqsPyuArV85/SeKoDdKtd0rswNJu
 wPnBvegAjzgUd9obhto7VKj876k27+YZ3Nn6QnLuPHSN/JcMNYCJQQyoT3s0sOYWuttf
 ww3Ez5niZAhTYyYin2vxDjDWKOuO85x/eBDfBM2Rdt6VksRvBEr6pp+x+CxC0N6M5HTp
 aMtW+qSjcTb+anikAtbnjJtdbiyT1jQdSzWIL8t3MWt0gNEWS35O4mAMbIfwAF3Hz1jb
 rpoA==
X-Gm-Message-State: APjAAAVpziA5rJytedvvhM5030x7gtEfwTxUG/VKP2BBI/UFcKtSthlg
 Pz4SDKEIUn75aMSbptwjAAirQmIpp4atmO4Kq34IMQvPcUtrVw7pvmtbG4pr4J6wEU23dyto6OF
 q+iFloai+B0LuMR6KuVd8TRLtUBA=
X-Received: by 2002:a9d:2043:: with SMTP id n61mr1619232ota.17.1568776882862; 
 Tue, 17 Sep 2019 20:21:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycggOtV1IIRHyyMmcy2peuxtET/yubeQp/HeLV+YJw7URu+eh7+/s0B2o7TQE0po+2Nk10W6jhWWG0V+Y1fS0=
X-Received: by 2002:a9d:2043:: with SMTP id n61mr1619223ota.17.1568776882654; 
 Tue, 17 Sep 2019 20:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190913125823.17314-1-pvorel@suse.cz>
 <20190913125823.17314-3-pvorel@suse.cz>
 <CAEemH2f4oeSvN-p7xSzjo2ZFvndxjX2sQ+M9f6fYV_bN2ewn=A@mail.gmail.com>
 <20190917165520.GA30320@x230>
In-Reply-To: <20190917165520.GA30320@x230>
From: Li Wang <liwang@redhat.com>
Date: Wed, 18 Sep 2019 11:21:11 +0800
Message-ID: <CAEemH2cHYS6jd4DCzJsy-vKLqShcFO6fU_-Rk=zxu=yD=7YLVg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: _ls_w1KhPHS6AeB5uqz_Kw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] shell: Introduce TST_TIMEOUT variable
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
Content-Type: multipart/mixed; boundary="===============1344014321=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1344014321==
Content-Type: multipart/alternative; boundary="000000000000d2b17d0592cb544c"

--000000000000d2b17d0592cb544c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> > Here as well, why we need to distinguish the float and int, is the floa=
t
> > expression does not work for integer?
> Because it brings awk dependency on whole library, which I'm not sure if =
we
> want (awk is a must on linux distros, it's in busybox; it's missing on
> android
> toolsbox, but android project concentrates on syscalls, probably nobody
> uses
> shell tests on android). Also I'm not sure about containers, JeOS etc. (i=
t
> sometimes miss a basic dependency).
> If awk dependency is ok, it'd simplify test a bit.


But it doesn't solve the dependency issue because, if the awk is missing,
it will still tst_brk on float $LTP_TIMEOUT_MUL at:
    tst_test_cmds awk
and never goes to the integer expression branch.

So, maybe that could be as a reason to disable float support for
$LTP_TIMEOUT_MUL?

--=20
Regards,
Li Wang

--000000000000d2b17d0592cb544c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; Here as well, why we need to distinguish the float and int, is the flo=
at<br>
&gt; expression does not work for integer?<br>
Because it brings awk dependency on whole library, which I&#39;m not sure i=
f we<br>
want (awk is a must on linux distros, it&#39;s in busybox; it&#39;s missing=
 on android<br>
toolsbox, but android project concentrates on syscalls, probably nobody use=
s<br>
shell tests on android). Also I&#39;m not sure about containers, JeOS etc. =
(it<br>
sometimes miss a basic dependency).<br>
If awk dependency is ok, it&#39;d simplify test a bit.</blockquote><div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">But it d=
oesn&#39;t solve the dependency issue because, if the awk is missing, it wi=
ll still tst_brk on float $LTP_TIMEOUT_MUL at:</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">=C2=A0 =C2=A0 tst_test_cmds awk</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">and never goes to the inte=
ger expression branch.</div></div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">So, maybe that could be as a reason to disable float support for $LTP_T=
IMEOUT_MUL?</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"m_-3=
398414773949520838gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div>=
<div>Li Wang<br></div></div></div></div>

--000000000000d2b17d0592cb544c--


--===============1344014321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1344014321==--

