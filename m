Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE2B7268
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 06:57:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AFBF3C20EC
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 06:57:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 823AF3C20AE
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 06:57:20 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4DC50600941
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 06:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1568869037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=smmG1BgqoIbdNmkCXeS4IOIGkQ5tmEHypPH8xxi7Jeo=;
 b=hnTsJBwIrh56GYPvaahCgMl8Hj1JTchUxW2uMRUhr8DUMwLR/bMX7Wl2STooFMAaJZMOh2
 I34k6qdpXp2PpvtgGoVle3xVKmzjQAPncRwy4IRT9VqZKrDI/V/t8sj1LlyVWC8NibcOxT
 IfhXovteJwClHYiil6fDYSwLvWVwgZo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-dbCgGb4pO3qZTqoMX16Img-1; Thu, 19 Sep 2019 00:57:14 -0400
Received: by mail-ot1-f69.google.com with SMTP id x20so1179916otk.0
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 21:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y+cpV8/PYvOvK3Ma/laJ1s6qN/13Jj4AhNECKjzzdwc=;
 b=kjKNj8gdjaMrLWzMxVhb3fEBw+9T9WGmSiDZzxU50oI1io6SjfiLsyWH+RU6D0o54f
 ukLSZJHuAhr5LiqUrAbgU4hELzlNu5BVYrc8kRALyEoaVSygLDcZip/m6Gbx1QERvol+
 uvKc/uVLzeFp2Iv4tp5YqRH9CPOg7AzZGhnsvVLiQhstzVh4Qf4FTztmKfbWKKutfxnG
 0TBR3wep1z9vnZT3vnqYBLBLfJOlxJk5Lnzg9aAhdL122qzDfYwL6q4CFXpyqPO6KfSI
 CFa6qncW81ZXIhdp8vTFkO1Zxz4EZOLiok67EzL+hTW4KD0Lx8ZpqpkhGeI2mxw+iApY
 6E9A==
X-Gm-Message-State: APjAAAXPU9tQim2bFhK33ahiJE+We1lhNUe2ag90gZ/2E7FCY2g9P6mv
 MtIZ2rbBr7ZNmtg3/FhHu7mHfptBngYeFqH7TnooZ0TAhXZcbQbjZvojCLDOEkHHtiVVXS3o55h
 CRNF43eGMtnmX2q6Ycg/tmORV59c=
X-Received: by 2002:a54:480d:: with SMTP id j13mr874196oij.96.1568869033880;
 Wed, 18 Sep 2019 21:57:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyuID/CWiuQibYBVWILEmJdpd5sWeMeB/I8utaJK8agEiyKjwiQOb6hFxexpKJA9ld3DFb0iW+dTY/EN7wpPfQ=
X-Received: by 2002:a54:480d:: with SMTP id j13mr874183oij.96.1568869033462;
 Wed, 18 Sep 2019 21:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <1568720356-29641-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1568720356-29641-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 19 Sep 2019 12:57:01 +0800
Message-ID: <CAEemH2fVgnVMxQ9r45awd_KhmpCzWoJSyWTTQ2QaS+doQ42xcQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-MC-Unique: dbCgGb4pO3qZTqoMX16Img-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] crypto/af_alg05: add comment for a regression
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
Content-Type: multipart/mixed; boundary="===============1357761593=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1357761593==
Content-Type: multipart/alternative; boundary="00000000000070723a0592e0c994"

--00000000000070723a0592e0c994
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 9:09 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/crypto/af_alg05.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/testcases/kernel/crypto/af_alg05.c
> b/testcases/kernel/crypto/af_alg05.c
> index 419c65eab..964adffcc 100644
> --- a/testcases/kernel/crypto/af_alg05.c
> +++ b/testcases/kernel/crypto/af_alg05.c
> @@ -10,6 +10,12 @@
>   * block size, and where the destination buffer starts exactly at a page
>   * boundary.  Based on the reproducer from the commit message.  Note tha=
t
> this
>   * issue only reproduces on certain architectures, such as arm and arm64=
.
> + *
> + * On some older kernel without commit 160544075f2 ("crypto: scatterwalk
> - Hide
> + * PageSlab call to optimise away flush_dcache_page") , it doesn't use
> + * ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macro. It can crash on all
> architectures.
> + * Without skcipher walk interface, it is also a regresstion test for
> commit
> + * 0868def3e410("crypto: blkcipher - fix crash flushing dcache in error
> path").
>

This is correct, thanks for debugging. Pushed~

--=20
Regards,
Li Wang

--00000000000070723a0592e0c994
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 18, 2019 at 9:09 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed=
-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=
=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/crypto/af_alg05.c | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/testcases/kernel/crypto/af_alg05.c b/testcases/kernel/crypto/a=
f_alg05.c<br>
index 419c65eab..964adffcc 100644<br>
--- a/testcases/kernel/crypto/af_alg05.c<br>
+++ b/testcases/kernel/crypto/af_alg05.c<br>
@@ -10,6 +10,12 @@<br>
=C2=A0 * block size, and where the destination buffer starts exactly at a p=
age<br>
=C2=A0 * boundary.=C2=A0 Based on the reproducer from the commit message.=
=C2=A0 Note that this<br>
=C2=A0 * issue only reproduces on certain architectures, such as arm and ar=
m64.<br>
+ *<br>
+ * On some older kernel without commit 160544075f2 (&quot;crypto: scatterw=
alk - Hide<br>
+ * PageSlab call to optimise away flush_dcache_page&quot;) , it doesn&#39;=
t use<br>
+ * ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macro. It can crash on all architectu=
res.<br>
+ * Without skcipher walk interface, it is also a regresstion test for comm=
it<br>
+ * 0868def3e410(&quot;crypto: blkcipher - fix crash flushing dcache in err=
or path&quot;).<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">This is correct, thanks for debugging. Push=
ed~</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></=
div></div></div>

--00000000000070723a0592e0c994--


--===============1357761593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1357761593==--

