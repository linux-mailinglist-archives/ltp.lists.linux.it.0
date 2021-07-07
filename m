Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEBA3BF7C7
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 11:49:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF3ED3C89A8
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 11:49:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 10B913C4DBA
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 21:22:35 +0200 (CEST)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 775CF60070F
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 21:22:34 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id o5so5079293ejy.7
 for <ltp@lists.linux.it>; Wed, 07 Jul 2021 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gkFqaoFay5HbrfXNT39183Jo26dqXtIM3IPBCOS7j1g=;
 b=YxOQmr++2jWkice+ry8BJtKems5UrZyiYei2hceKqot1voa2txKuixs0C0wBxedIdw
 E485oGpQxmoMqSNNCXo2JItYIeZYK2iPPmYKPT/lhShh+XiWqE33MfRT9kQol0LvoJPr
 vETIN9CE5UaPzxWzcARi9rIuffBm21AbaEDUAU7pJWWu1DrB0xv4oiu2SDoLFd5EEw6v
 KNFFF1gdJxtM/GEG6aalMszDfPyyc26Gw1CesK0xCFX1yisNyaxevOiVWhlUe2zhWhyK
 BUKU7123fz8SUpDcQmItISpJwgry1RgFDftOCXFFQ+H5pfq/+MmOpfY5vV05CjxVHQZV
 HEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gkFqaoFay5HbrfXNT39183Jo26dqXtIM3IPBCOS7j1g=;
 b=I7ebj2nN9+ksz7mkNELUGnHsKNST/mGRIhfXALDu06EEe/dT66QEMT1sXQp/dgmZX9
 KTlg3X3qyU9jCcDDGYgXhX8k4GFdVI1fBAE5NdTn1mQxXNyPZZrJ5inFxXqsfGTj6bHR
 OxJ8ElR10L1hbalsnEIjOufbDMRKtA+/shtUPID5sniV58U+fged4FxHnd+lOPMl8u8n
 q/h6d/tsDEY/z52C7TMBhDBTE77/JlpovpWWfxPzuDISWOHF4YdHHNpqsWjakic1fFrF
 LjrslCWQi0heMpXYVlcHT3sMxd5jkLl15fEg+2tc7hN6cBgbrRBwDj5yOyAU0batU2j2
 jtiA==
X-Gm-Message-State: AOAM532zjJAosmXZtBJddLSav7ecLiGDRa8tWwsNtObZm+zwL4ltrLew
 9tqynT0lrDFostaHdhrnJ2sg/CB2SItoCr+SRUAW9IBesf//
X-Google-Smtp-Source: ABdhPJwXeVqFB0jXtquMHYhQKk5LCVnC4CPJ5za2BgB0tgTEoogSJq6PaPlCCgDkkaR+osNSRXtXZhJGVNTgyMjyIKw=
X-Received: by 2002:a17:907:9807:: with SMTP id
 ji7mr24215856ejc.35.1625685753543; 
 Wed, 07 Jul 2021 12:22:33 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 7 Jul 2021 15:22:22 -0400
Message-ID: <CAPd9Lg-feW5KF=BDUzfGnqZPYs4S4ypBemb3b=qgG2z-9YsCiw@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 08 Jul 2021 11:49:17 +0200
Subject: [LTP] Existing kexec tests
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
From: David Hu via ltp <ltp@lists.linux.it>
Reply-To: David Hu <xuehaohu@google.com>
Content-Type: multipart/mixed; boundary="===============1603911696=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1603911696==
Content-Type: multipart/alternative; boundary="000000000000dc3f4505c68d7562"

--000000000000dc3f4505c68d7562
Content-Type: text/plain; charset="UTF-8"

Hello !

I am looking existing tests that cover kexec (kexec_load and
kexec_file_load across LTS versions , platforms, etc)

wondering if there are existing tests already ?

thanks

--------
David

This email may be confidential or privileged. If you received this
communication by mistake, please don't forward it to anyone else, please
erase all copies and attachments, and please let me know that it went to
the wrong person. Thank you.

--000000000000dc3f4505c68d7562
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello !<div><br></div><div>I am looking existing tests tha=
t cover kexec (kexec_load and kexec_file_load across LTS versions , platfor=
ms, etc)</div><div><br></div><div>wondering if there are existing tests alr=
eady ?</div><div><br></div><div>thanks</div><div><br clear=3D"all"><div><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>--=
------<br></div><div>David</div><div><br></div><div dir=3D"ltr"><table cell=
spacing=3D"0" cellpadding=3D"0" style=3D"font-family:Times"><tbody></tbody>=
</table><span style=3D"color:rgb(102,102,102);font-family:arial,helvetica,s=
ans-serif;font-size:x-small">This email may be confidential or privileged. =
If you received this communication by mistake, please don&#39;t forward it =
to anyone else, please erase all copies and attachments, and please let me =
know that it went to the wrong person. Thank you.</span><br></div></div></d=
iv></div></div></div></div></div></div>

--000000000000dc3f4505c68d7562--

--===============1603911696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1603911696==--
