Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E626FF8866
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 07:13:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9457D3C2271
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 07:13:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2560C3C076F
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 07:13:01 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 10DA71401B6E
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 07:12:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573539178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pp94LTrTUj/m229Ur08Gs30o+Nah5N3Mz0HcbMX9wy4=;
 b=ZebOx46lA5QMhaQA1LE5lKfUV1m7flmFxPZ86472toZbvEDSvYIaqPQbbKcUg9TIE8S+1O
 25oCTED102f1N3PevSbCVGQIXtB4vhq62z3DvXK8DnNPFS6/FLWDN7a3SlPthiq1+VGc33
 qQMvfEWlbiplOzW00SQ6WGPDD3Uqeh8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-MeElLbYYMdWnsiY65k6W1w-1; Tue, 12 Nov 2019 01:12:56 -0500
Received: by mail-oi1-f198.google.com with SMTP id j23so12849397oii.21
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 22:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+NV7u2SMdAgfinwIl6QNZiElqopfcq5U91ufl1exGgo=;
 b=n2Suxx6BFqYk9Ffi+bjqQbfRDy9GvOP6WF9mE9KimFSeZH2B43XwDHJ+KV69ughFFX
 8nwsYNlbRdaKm4RPJLdpTI+pEFgSpe12aYH5+CNPt4WJ4A4ihsss0M+G0KjqxaO7zi4q
 gtgmKqwMPNQh0/g8aJ2n8My+6tVdgqPaSZsAsZ9zc2kAERz1blZmj44frZUusAw/amm+
 XQV8GxUd6Pgf68ei+UnHscoLDDKJ9nTmyu7ISj7nMHkiQgOCTun12IqEP0xL3Ehw+zpl
 Ph1ZyxgEXSI2C8RrHSMW+4w1ZqMq9llHOSIdecSydq7cAGVBJGQl8q7YxNT/TJuR8RWf
 v4ew==
X-Gm-Message-State: APjAAAX7cOwM4cu9cp0aDuhrXcTG/l7GM/yXOBKi9JQv+T/tXgMPgZLQ
 o1LHi6EguuLOo815R7an7i4Hk+UGKgAsvzTCRWuA2B3kKjN7tJTqmbLKvH+uEvJK1DOUJ5c9Fct
 M+Tgu+C2jrXkDvS0BlH1pUtiRx+w=
X-Received: by 2002:a9d:8d2:: with SMTP id 76mr336453otf.17.1573539175442;
 Mon, 11 Nov 2019 22:12:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqxCTtm2WPSktuXP3R4uLWc2p8qhDftnyyeFTo8HsD4Ro6RXK72T8h/SCjoR8ax1suwL9BgcXn6L3BYC0yyLg/k=
X-Received: by 2002:a9d:8d2:: with SMTP id 76mr336439otf.17.1573539175053;
 Mon, 11 Nov 2019 22:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20191112035237.39839-1-yongxin.liu@windriver.com>
In-Reply-To: <20191112035237.39839-1-yongxin.liu@windriver.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 12 Nov 2019 14:12:44 +0800
Message-ID: <CAEemH2eJD5rLqi6bTZARrVW_963bi=SidaEzcEeWAYib8CkomA@mail.gmail.com>
To: Yongxin Liu <yongxin.liu@windriver.com>
X-MC-Unique: MeElLbYYMdWnsiY65k6W1w-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkswap01.sh: Add "udevadm trigger" before swap
 verification
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
Content-Type: multipart/mixed; boundary="===============1434842144=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1434842144==
Content-Type: multipart/alternative; boundary="00000000000091e19105972023f1"

--00000000000091e19105972023f1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 1:01 PM Yongxin Liu <yongxin.liu@windriver.com>
wrote:

> Fix: https://github.com/linux-test-project/ltp/issues/458
>
> Sometimes the swap device cannot show up in /dev/disk/by-uuid/
> or /dev/disk/by-lable/ due to the issue #458. When this issue
> happens, "blkid -c /dev/null" and "ls /dev/disk/by-uuid/" show
> different UUID of the device.
>
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
>
Acked-by: Li Wang <liwang@redhat.com>


> ---
>  testcases/commands/mkswap/mkswap01.sh | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/testcases/commands/mkswap/mkswap01.sh
> b/testcases/commands/mkswap/mkswap01.sh
> index 3a348c6e6..9437c4a4e 100755
> --- a/testcases/commands/mkswap/mkswap01.sh
> +++ b/testcases/commands/mkswap/mkswap01.sh
> @@ -129,6 +129,8 @@ mkswap_test()
>                 return
>         fi
>
> +       udevadm trigger --name-match=3D$TST_DEVICE
> +
>         if [ -n "$device" ]; then
>                 mkswap_verify "$mkswap_op" "$op_arg" "$device" "$size"
> "$dev_file"
>                 if [ $? -ne 0 ]; then
> --
> 2.14.4
>
>

--=20
Regards,
Li Wang

--00000000000091e19105972023f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 12, 2019 at 1:01 PM Yongxin Liu &lt;<a =
href=3D"mailto:yongxin.liu@windriver.com">yongxin.liu@windriver.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fix: <a =
href=3D"https://github.com/linux-test-project/ltp/issues/458" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/linux-test-project/ltp/issues/45=
8</a><br>
<br>
Sometimes the swap device cannot show up in /dev/disk/by-uuid/<br>
or /dev/disk/by-lable/ due to the issue #458. When this issue<br>
happens, &quot;blkid -c /dev/null&quot; and &quot;ls /dev/disk/by-uuid/&quo=
t; show<br>
different UUID of the device.<br>
<br>
Signed-off-by: Yongxin Liu &lt;<a href=3D"mailto:yongxin.liu@windriver.com"=
 target=3D"_blank">yongxin.liu@windriver.com</a>&gt;<br></blockquote><div><=
span class=3D"gmail_default" style=3D"font-size:small">Acked-by: Li Wang &l=
t;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></di=
v><div><span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0testcases/commands/mkswap/mkswap01.sh | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/testcases/commands/mkswap/mkswap01.sh b/testcases/commands/mks=
wap/mkswap01.sh<br>
index 3a348c6e6..9437c4a4e 100755<br>
--- a/testcases/commands/mkswap/mkswap01.sh<br>
+++ b/testcases/commands/mkswap/mkswap01.sh<br>
@@ -129,6 +129,8 @@ mkswap_test()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0udevadm trigger --name-match=3D$TST_DEVICE<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$device&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkswap_verify &quot=
;$mkswap_op&quot; &quot;$op_arg&quot; &quot;$device&quot; &quot;$size&quot;=
 &quot;$dev_file&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; th=
en<br>
-- <br>
2.14.4<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000091e19105972023f1--


--===============1434842144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1434842144==--

