Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C3B12E30C
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 07:31:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB72E3C246B
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 07:31:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7442C3C2270
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 07:31:39 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 48897201266
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 07:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577946696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SeIx53dMVmAl8tjRAHQKtzI1siyRxklea6Lb77s04Mk=;
 b=PLWkgxMD1LFAVBVEsPs6xf0Am1/HnxUyOekdtAV6XvSzSvlhfS4YPhzqScLUeUi/6Mytxu
 pgHsnzZJjpVGioIgFBe3hygvggY49Tm4tQdw1cS+ERfG7opFTh9yNKeXcHPbO/Ch6eVCKr
 ut5LXKnjdjjPT8KOles5N7sUzkNB7OA=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-xxzpfkUUMLmC4G6CK--UIQ-1; Thu, 02 Jan 2020 01:31:34 -0500
Received: by mail-oi1-f199.google.com with SMTP id n130so10344278oib.5
 for <ltp@lists.linux.it>; Wed, 01 Jan 2020 22:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mkJTnQnW7hy3o8LK0Kvq3J6ktP0DAFeSjyyhuZcufyY=;
 b=Gbiba/rfUf8ioTEJK54VXGL8D/Klpc3U2r8UkoVADYsYvqORQV86PMLH3kSOIDe1Ke
 SidXP6Pu4XjQ+c9IdS+glY9ncrIoW/wVfm5pezqdNIn4j+fxT2e96ENs0zZLLyGohVMk
 tqzUGsuJXHEDAuhV/1n4SYV2uh5dLmKWVIRmQ9EVGhZhb2LdYOmetNMHxh6umElyOJ6R
 FnuNvpDqlGNByWTJulR8ruGWYrHg/xNVFbIH/Bcb7vT+HHvWy+lk4diI+D6vY80sMfXb
 Yd0kn9KtDFE0ru+1wdsMfSx6EYPwD92qHAAjzSJpu/apEy/19bIJsEQD8osJU+HjoLsG
 Uw0g==
X-Gm-Message-State: APjAAAVUp7F+jDYg3k0rzfbSvf7kG4hM6kxOQcnKMNwjLdA+SBatkXIm
 HNBZjNXP/CnMizv4o2aQUFfgPYDftFxwKiINuHzONK4dh6MDGtwLdlDIGrjURlWToWR1eJVfsgK
 WloY4QUlCuhrD/thf/gQnVJngoRk=
X-Received: by 2002:a9d:7:: with SMTP id 7mr85423474ota.26.1577946693469;
 Wed, 01 Jan 2020 22:31:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqznFfWsNq4aPlMMeknh/PQma6v4pl6eWgHirgIM0jJ8eOzG8RWZ3R0FjfG37sHB2qVl6t0rhPWNOZD9U5Z+SA8=
X-Received: by 2002:a9d:7:: with SMTP id 7mr85423455ota.26.1577946693215; Wed,
 01 Jan 2020 22:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20200102015236.7400-1-liwang@redhat.com>
 <b2b1b91e-4813-a281-6f56-0924d21bb103@cn.fujitsu.com>
In-Reply-To: <b2b1b91e-4813-a281-6f56-0924d21bb103@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 2 Jan 2020 14:31:22 +0800
Message-ID: <CAEemH2cPJnbNeLRNmHPoGDjh5y_i6YicYPOyM7Vu+AM9t09Kyg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-MC-Unique: xxzpfkUUMLmC4G6CK--UIQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH COMMITTED] tst_device: do sync() before reading
 test block device stat file
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
Content-Type: multipart/mixed; boundary="===============1172446263=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1172446263==
Content-Type: multipart/alternative; boundary="0000000000001fca1b059b22588b"

--0000000000001fca1b059b22588b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2020 at 10:10 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

>
>
> Hi Li
> > To avoid FS deferred IO metadata/cache interferes test result, so we
> > do sync simply before the tst_dev_bytes_written invocation.
> >
> Looks good, acked. Also, I think we can mention it in
> doc/test-writing-guidelines.txt when using this api.
>

Ok, I will append one line as:
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1072,7 +1072,9 @@ unsigned long tst_dev_bytes_written(const char *dev);
 --------------------------------------------------------------------------=
-----

 This function reads test block device stat file (/sys/block/<device>/stat)
and
-returns the bytes written since the last invocation of this function.
+returns the bytes written since the last invocation of this function. To
avoid
+FS deferred IO metadata/cache interferes the test result, we suggest doing
sync()
+before the tst_dev_bytes_written first invocation.

--=20
Regards,
Li Wang

--0000000000001fca1b059b22588b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jan 2, 2020 at 10:10 AM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Hi Li<br>
&gt; To avoid FS deferred IO metadata/cache interferes test result, so we<b=
r>
&gt; do sync simply before the tst_dev_bytes_written invocation.<br>
&gt; <br>
Looks good, acked. Also, I think we can mention it in <br>
doc/test-writing-guidelines.txt when using this api.<br></blockquote><div><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Ok, I will =
append one line as:</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"></div><div class=3D"gmail_default" style=3D"font-size:small">--- a/doc=
/test-writing-guidelines.txt<br>+++ b/doc/test-writing-guidelines.txt<br>@@=
 -1072,7 +1072,9 @@ unsigned long tst_dev_bytes_written(const char *dev);<b=
r>=C2=A0-------------------------------------------------------------------=
------------<br>=C2=A0<br>=C2=A0This function reads test block device stat =
file (/sys/block/&lt;device&gt;/stat) and<br>-returns the bytes written sin=
ce the last invocation of this function.<br>+returns the bytes written sinc=
e the last invocation of this function. To avoid<br>+FS deferred IO metadat=
a/cache interferes the test result, we suggest doing sync()<br>+before the =
tst_dev_bytes_written first invocation.<br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--0000000000001fca1b059b22588b--


--===============1172446263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1172446263==--

