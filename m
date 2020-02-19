Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTP id 22E20163BBB
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 04:57:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DFB43C210E
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 04:57:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 17E503C07E2
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 04:57:47 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 26D9860080B
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 04:57:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582084665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pw1NfPLU8fbFwwEDFSRdI7G95/BlhbKSD5Afu6gS/g8=;
 b=CSnMAzmRi1/o3HmxuCDQSr6sM6JX0QllA/aYXEE78UnGWDFhoOD0eQ8LTim9zh2aF3iAfL
 S61HOsDpV0TQJN78kqA95Y8msa8imZQLE4pLZYcVqi25s3AfARruxNlbfFyYaZjdzp7Yxn
 l4vJ1dQfTaHUFiUBARhWrSQluT7TcMI=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-kxuZ9OA7NeKUccL5Rm-Taw-1; Tue, 18 Feb 2020 22:57:42 -0500
Received: by mail-ot1-f70.google.com with SMTP id z62so13695857otb.0
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 19:57:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Fjs/7ysZiJ4BrOk9lGanPO7Q9Q1Tqf3OGxmYVBpSLA=;
 b=j+G4ppLl8BHdJ4kxntiJikwEDoNW8ub8K56c/n26k5WlCwqf0N1rJ4X0qiEzYRR8Bp
 CPG9TnPOZUmCTyFZ0oXjFX2j0KT3Kdad+Df4TcE/47TBF3WECzekCxQLs40zBHE53WxN
 4y7+r6dWfncpwyVSRg/3vovibT/bj0mTZgbcO1ONjQ7XAw248uf1l97CH3ziLzjXb+n7
 x54JQ+jIR/MscBA7XIkLgvn0xAEsbi3kIcqqOgLO1eTjheN6XSBgYp6IXjeO4OKkrjBS
 eSqD0a5IODeET1sVja7P2yE5IVvKqfNyswijMmPi/hL0LtZrG69Q9c7Wy34rOSyZsA/v
 3Svg==
X-Gm-Message-State: APjAAAWr+96puvdLa19pEB3/csdeOuwBj4dDrLuXHOCmg/buA6w0WmJD
 bdpNd9/OqrsiUKt/XvEZy+DGi2joACxX8B6RKKhUXwlmVLmLj8zYRpyE+BZj8ddZJK8nTbl28HV
 id0TFpiUJllnsv+HQ3KCKMAb+74E=
X-Received: by 2002:a9d:7:: with SMTP id 7mr17420530ota.26.1582084661699;
 Tue, 18 Feb 2020 19:57:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7V415CvmxwvFhNUe8kL/CuHAJGe/SJYF79w4yurzJiXqcIzWCZgwrS48HiMzc7KRPparT6oiw2n4ef5giVYo=
X-Received: by 2002:a9d:7:: with SMTP id 7mr17420525ota.26.1582084661450; Tue,
 18 Feb 2020 19:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20200218115918.32203-1-liwang@redhat.com>
 <a3d98743-8c77-3282-97dd-a2864886e8c6@163.com>
In-Reply-To: <a3d98743-8c77-3282-97dd-a2864886e8c6@163.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 19 Feb 2020 11:57:30 +0800
Message-ID: <CAEemH2cg=r3tjefzm=dSj0FZca-gMorGue3C0uGugpniSnZjBA@mail.gmail.com>
To: Yang Xu <xuyang_jy_0410@163.com>
X-MC-Unique: kxuZ9OA7NeKUccL5Rm-Taw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cleanup: avoid to generate many redundant obj
 files
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
Content-Type: multipart/mixed; boundary="===============1303139225=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1303139225==
Content-Type: multipart/alternative; boundary="00000000000040325a059ee5ca7f"

--00000000000040325a059ee5ca7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yang,

On Tue, Feb 18, 2020 at 10:21 PM Yang Xu <xuyang_jy_0410@163.com> wrote:

> Hi Li
>
> This patch looks good to me, feel free to add
> Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com> <xuyang2018.jy@cn.fuj=
itsu.com>
>
> Also, I think we can replace GPL with SPDX-License-Identifier in these ma=
kefiles
>
> Yes, I have fixed that as you suggest and pushed. Thanks!


> (Also for
> all ltp makefiles, we have converted SPDX-License-Identifier in few heade=
r since commit b288957a88b1 ).
>
> Good point, but I haven't found a way to do the replacement for whole
files.

--=20
Regards,
Li Wang

--00000000000040325a059ee5ca7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Yang,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 18, 2020 at 10:21 PM Yang Xu &=
lt;<a href=3D"mailto:xuyang_jy_0410@163.com">xuyang_jy_0410@163.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <pre>Hi Li

This patch looks good to me, feel free to add
Reviewed-by: Yang Xu <a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=
=3D"_blank">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>

Also, I think we can replace GPL with SPDX-License-Identifier in these make=
files</pre></div></blockquote><div><span class=3D"gmail_default" style=3D"f=
ont-size:small">Yes, I have fixed that as you suggest and pushed. Thanks!</=
span></div><div><span class=3D"gmail_default" style=3D"font-size:small"></s=
pan>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><pre>(Als=
o for
all ltp makefiles, we have converted SPDX-License-Identifier in few header =
since commit b288957a88b1 ).<br></pre></blockquote><div><span class=3D"gmai=
l_default" style=3D"font-size:small">Good point, but I haven&#39;t found a =
way to do the replacement for whole files.</span>=C2=A0</div><div>=C2=A0</d=
iv></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000040325a059ee5ca7f--


--===============1303139225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1303139225==--

