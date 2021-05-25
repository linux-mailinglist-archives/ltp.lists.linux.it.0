Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32C38FCD8
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 10:31:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1BB33C2B74
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 10:31:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A31D3C0233
 for <ltp@lists.linux.it>; Tue, 25 May 2021 10:31:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 61FFB1000AE8
 for <ltp@lists.linux.it>; Tue, 25 May 2021 10:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621931497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S9+sB4bU8u40WRVCp5M+aec6vECsugi3AMAsvSeI+hY=;
 b=gRpUMtn3zMv2XoIBYK05wvtRzsNZJg+bN8LjWtFCR3ja8KMKwyPHMe/vu5da4i+XFj39k4
 HHqrX2Y/5O/FRGpuw+IFqQDr6xpvZZLFGMiXvBm9Od/m3xkaIbinqpqCKNp2Z+pUCGCCpe
 EcytJoBRMHNEGFTs4scujwg3MCj5K3A=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555--Ko9CuQjPBa3ihWX5sJueg-1; Tue, 25 May 2021 04:31:33 -0400
X-MC-Unique: -Ko9CuQjPBa3ihWX5sJueg-1
Received: by mail-yb1-f197.google.com with SMTP id
 d4-20020a25b5c40000b02904f8e3c8c6c9so41080412ybg.14
 for <ltp@lists.linux.it>; Tue, 25 May 2021 01:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=weIcKS37XhXZ/MZrn2+jnyWNqMM8pRrB3NDGhY2afJQ=;
 b=n0dp5FB6NOYchy2hLlybGzXimB8K6sZ4rJ7fjIZFzp8QiZOeVcq5uISQZaTiha5oAP
 78HS2ypKRDUFYO//ftE4kDgTd0Ve/lD3f615MEiiEEcm1uTuXDEc/0WtNVJ4glwSNV2d
 vfwFah8jPPThmFpAMMdOL64jKWEAp5nzqf3e6HjQr3kLhiJY9P3MedtMcMlWtD6e9gMa
 EJNIU909IZw7Wa8J6U3XCF2lFvbAmY+M9k2rQVL+3Wz2VoxTHBzUWRhSuYBCvMKTJ1Zw
 DDoB+3PSZUqZfzj1YSXwcXeTrywl8thTznZ1sDpbrmeleeNj5+ml24S/Nz1gVb33z6MX
 agkQ==
X-Gm-Message-State: AOAM531ifHYFQLwWetx3geKIvbxgeYPTL8FROMuJiQNDueTreOlaSdjT
 9EYf1uBZklksh5JMmQG8x8wT75TD+PhsjgH75zT8o79w/0XY1ElJ7gobqrsz4dYfh3h2Dkx1i9s
 JagWKsGS5ErJgzFSGjTqVwVyGa04=
X-Received: by 2002:a25:1189:: with SMTP id 131mr41549276ybr.286.1621931492534; 
 Tue, 25 May 2021 01:31:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDEgapzYB2n8ju2okpMCOt+E/cqqmfHsOHSxXTLKto+NXTFGTjR2IbbJ+Wpsdhl1aHvLtDDyqgxyAVpsx9K0g=
X-Received: by 2002:a25:1189:: with SMTP id 131mr41549238ybr.286.1621931492292; 
 Tue, 25 May 2021 01:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <cki.53EAC953CF.BF3ZY3WPMQ@redhat.com>
In-Reply-To: <cki.53EAC953CF.BF3ZY3WPMQ@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Tue, 25 May 2021 16:31:20 +0800
Message-ID: <CAEemH2cYy7chvW+s09_1G+-ahiPvREdacdQmL15LBNbK92VOPw@mail.gmail.com>
To: CKI Project <cki-project@redhat.com>, LTP List <ltp@lists.linux.it>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] 
	=?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E13?=
	=?utf-8?q?=2E0-rc3_=28arm-next=2C_c4681547=29?=
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>,
 Bruno Goncalves <bgoncalv@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Memory Management <mm-qe@redhat.com>, skt-results-master@redhat.com,
 Yi Zhang <yizhan@redhat.com>, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0380546775=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0380546775==
Content-Type: multipart/alternative; boundary="00000000000072d3eb05c3235a64"

--00000000000072d3eb05c3235a64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 12:58 AM CKI Project <cki-project@redhat.com> wrote=
:

>
> Hello,
>
> We ran automated tests on a recent commit from this kernel tree:
>
>        Kernel repo:
> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>             Commit: c4681547bcce - Linux 5.13-rc3
>
> The results of these automated tests are provided below.
>
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: OK
>              Tests: FAILED
>
> All kernel binaries, config files, and logs are available for download
> here:
>
>
> https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html?pre=
fix=3Ddatawarehouse-public/2021/05/24/308428205
>
> One or more kernel tests failed:
>
>     aarch64:
>      =E2=9D=8C LTP
>

    ------------- 8< -------------
    81 tst_test.c:899: TINFO: Trying FUSE...
    82 tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s

    83 statx04.c:44: TPASS: sys_statx(AT_FDCWD, mntpoint/test_dir1, 0, 0,
&buf)
    84 statx04.c:53: TFAIL: STATX_ATTR_COMPRESSED flag is not set
    85 statx04.c:58: TFAIL: STATX_ATTR_APPEND flag is not set
    86 statx04.c:63: TFAIL: STATX_ATTR_IMMUTABLE flag is not set
    87 statx04.c:68: TFAIL: STATX_ATTR_NODUMP flag is not set

    88 statx04.c:77: TPASS: sys_statx(AT_FDCWD, mntpoint/test_dir2, 0, 0,
&buf)
    89 statx04.c:86: TPASS: STATX_ATTR_COMPRESSED flag is not set
    90 statx04.c:91: TPASS: STATX_ATTR_APPEND flag is not set
    91 statx04.c:96: TPASS: STATX_ATTR_IMMUTABLE flag is not set
    92 statx04.c:101: TPASS: STATX_ATTR_NODUMP flag is not set
    ---------------------------------

This failure is likely the 'STATX_ATTR_*' flags unsupported with the FUSE
issue.
We may need to fix it in the test.

Btw, I found there is a patch helping check the flag before using it. But I
don't
know why we didn't merge it at that moment.
https://lists.linux.it/pipermail/ltp/2019-October/014123.html

--=20
Regards,
Li Wang

--00000000000072d3eb05c3235a64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, May 25, 2021 at 12:58 AM CKI Project &lt;<a=
 href=3D"mailto:cki-project@redhat.com" target=3D"_blank">cki-project@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Hello,<br>
<br>
We ran automated tests on a recent commit from this kernel tree:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel repo: <a href=3D"https://git.kernel.org/p=
ub/scm/linux/kernel/git/arm64/linux.git" rel=3D"noreferrer" target=3D"_blan=
k">https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Commit: c4681547bcce - Linux 5.13=
-rc3<br>
<br>
The results of these automated tests are provided below.<br>
<br>
=C2=A0 =C2=A0 Overall result: FAILED (see details below)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Merge: OK<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Compile: OK<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Tests: FAILED<br>
<br>
All kernel binaries, config files, and logs are available for download here=
:<br>
<br>
=C2=A0 <a href=3D"https://arr-cki-prod-datawarehouse-public.s3.amazonaws.co=
m/index.html?prefix=3Ddatawarehouse-public/2021/05/24/308428205" rel=3D"nor=
eferrer" target=3D"_blank">https://arr-cki-prod-datawarehouse-public.s3.ama=
zonaws.com/index.html?prefix=3Ddatawarehouse-public/2021/05/24/308428205</a=
><br>
<br>
One or more kernel tests failed:<br>
<br>
=C2=A0 =C2=A0 aarch64:<br>
=C2=A0 =C2=A0 =C2=A0=E2=9D=8C LTP<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 -----------=
-- 8&lt; -------------</div></div><div><div class=3D"gmail_default">=C2=A0 =
=C2=A0 81 tst_test.c:899: TINFO: Trying FUSE...<br>=C2=A0 =C2=A0 82=09tst_t=
est.c:1311: TINFO: Timeout per run is 0h 05m 00s</div><div class=3D"gmail_d=
efault"><br></div><div class=3D"gmail_default">=C2=A0 =C2=A0 83=09statx04.c=
:44: TPASS: sys_statx(AT_FDCWD, mntpoint/test_dir1, 0, 0, &amp;buf)</div><d=
iv class=3D"gmail_default">=C2=A0 =C2=A0 84=09statx04.c:53: TFAIL: STATX_AT=
TR_COMPRESSED flag is not set<br>=C2=A0 =C2=A0 85=09statx04.c:58: TFAIL: ST=
ATX_ATTR_APPEND flag is not set<br>=C2=A0 =C2=A0 86=09statx04.c:63: TFAIL: =
STATX_ATTR_IMMUTABLE flag is not set<br>=C2=A0 =C2=A0 87=09statx04.c:68: TF=
AIL: STATX_ATTR_NODUMP flag is not set</div><div class=3D"gmail_default"><b=
r>=C2=A0 =C2=A0 88=09statx04.c:77: TPASS: sys_statx(AT_FDCWD, mntpoint/test=
_dir2, 0, 0, &amp;buf)<br>=C2=A0 =C2=A0 89=09statx04.c:86: TPASS: STATX_ATT=
R_COMPRESSED flag is not set<br>=C2=A0 =C2=A0 90=09statx04.c:91: TPASS: STA=
TX_ATTR_APPEND flag is not set<br>=C2=A0 =C2=A0 91=09statx04.c:96: TPASS: S=
TATX_ATTR_IMMUTABLE flag is not set<br>=C2=A0 =C2=A0 92 statx04.c:101: TPAS=
S: STATX_ATTR_NODUMP flag is not set<br></div><div class=3D"gmail_default" =
style=3D"font-size:small">=C2=A0 =C2=A0 ---------------------------------</=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">T=
his failure is likely the &#39;STATX_ATTR_*&#39;=C2=A0flags unsupported wit=
h the FUSE issue.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">We may need to fix it in the test.</div></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Btw, I found there is a patch helping check the=C2=A0f=
lag before using it. But I don&#39;t</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">know why we didn&#39;t merge it at that moment.</div>=
</div><div class=3D"gmail_default" style=3D"font-size:small"><a href=3D"htt=
ps://lists.linux.it/pipermail/ltp/2019-October/014123.html" target=3D"_blan=
k">https://lists.linux.it/pipermail/ltp/2019-October/014123.html</a></div><=
div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr=
">Regards,<br>Li Wang<br></div></div></div></div></div>

--00000000000072d3eb05c3235a64--


--===============0380546775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0380546775==--

