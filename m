Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9A7309243
	for <lists+linux-ltp@lfdr.de>; Sat, 30 Jan 2021 06:38:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFB803C7712
	for <lists+linux-ltp@lfdr.de>; Sat, 30 Jan 2021 06:38:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A5C403C00C7
 for <ltp@lists.linux.it>; Sat, 30 Jan 2021 06:38:05 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A66881A011CF
 for <ltp@lists.linux.it>; Sat, 30 Jan 2021 06:38:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611985083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LDYnpw/GUnEqZkFJn6Je03yvXykeqKEj+FH3MU8V5q8=;
 b=R4XnOhBzlGs0iMCiWXvnGR5qYxB5sYIcy6+TKm3HKwfOIliPow13arXLLWLICGQBEckhy3
 S84qDY7COJJGFvWubbr0cUI5ni4M9lf3lhyM7UvEipmx8rAyPuqHSCs9MFgzhMXEyFg6vZ
 bMA7mieM4+kBLT2Csp7BxKunAntWk1s=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38--veQvgAJOAO8ajNyYmNkLA-1; Sat, 30 Jan 2021 00:37:59 -0500
X-MC-Unique: -veQvgAJOAO8ajNyYmNkLA-1
Received: by mail-yb1-f199.google.com with SMTP id c13so12644481ybg.8
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 21:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LDYnpw/GUnEqZkFJn6Je03yvXykeqKEj+FH3MU8V5q8=;
 b=p768CgVtU9ZdtlAX2HP0+g7p9LwVgmf5iPFLvw54M170UmQjcqvZAaPcwJ1+yHPy5S
 JYfcmyBKzbDBWtAT8GXrVTG4Xb4XtM2ep3S9eG+lTdsBiSumfqvyzH8638SmJzfvtPPF
 5pnTDksqjnFruzXDJIu5Ivy3s6Ee+xsbNntSexx7Ie45CO8Y55gz0KkuGDyGYyLQhVh3
 rvn792y6i3JPhuteFeXXaNrC+wjvq3n/iLwspnEzQj59iOFeSGSvBsErCsnnBBj3JXlm
 +g/BTrz/9uVVc4DGPyyWEalFm6EumgrmoOLA2ZmpzYiZ0Nkvj/RdiWaI4cLUdyvPxDDh
 pg/A==
X-Gm-Message-State: AOAM533oC2hRnzdK1cWynQK/nH8wPLEQM7BF0ibV16m261OblGHi9eeS
 PFC0+aiPL2VNg9Vi6wzBZMuDuol1btXKokKtNDDFJuqcj6ePj9x7WHW+U6NA+KnXpFXwnXhcBM+
 fnZ+lY52md2/xGk8+Jev+o/rYq3E=
X-Received: by 2002:a25:a4ea:: with SMTP id g97mr11094087ybi.286.1611985079197; 
 Fri, 29 Jan 2021 21:37:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNFD9f46ebKLDDY0LQMT2/ZrhtthYnCtCvzrDVLXDxXxumlNLATM2w49/dt21fKRD9pgPzDU6C2qI5e3d5uIQ=
X-Received: by 2002:a25:a4ea:: with SMTP id g97mr11094078ybi.286.1611985078990; 
 Fri, 29 Jan 2021 21:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-3-pvorel@suse.cz>
In-Reply-To: <20210129194144.31299-3-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sat, 30 Jan 2021 13:37:47 +0800
Message-ID: <CAEemH2ffReVSE_210nyRZVZHOwoMMy-F4Cye08RwPa5bh7PZ0w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/6] zram01.sh: Generate test setup variables
 in setup
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
Content-Type: multipart/mixed; boundary="===============0898138787=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0898138787==
Content-Type: multipart/alternative; boundary="00000000000004622505ba178623"

--00000000000004622505ba178623
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

Petr Vorel <pvorel@suse.cz> wrote:

> ...
>
> diff --git a/testcases/kernel/device-drivers/zram/zram01.sh
> b/testcases/kernel/device-drivers/zram/zram01.sh
> index a795ff89f..c5d4a3e51 100755
> --- a/testcases/kernel/device-drivers/zram/zram01.sh
> +++ b/testcases/kernel/device-drivers/zram/zram01.sh
> @@ -8,23 +8,25 @@
>
>  TST_CNT=7
>  TST_TESTFUNC="do_test"
> -TST_NEEDS_CMDS="awk bc dd"
> +TST_NEEDS_CMDS="awk bc dd grep"
>  . zram_lib.sh
> +TST_SETUP="setup"
>
> -# List of parameters for zram devices.
> -# For each number the test creates own zram device.
> -zram_max_streams="2 3 5 8"
> -
> -FS_SIZE="402653184"
> -FS_TYPE="btrfs"
> +get_btrfs_size()
>

What about renaming at_least_1G_mem() or check_space_for_btrfs()?


-- 
Regards,
Li Wang

--00000000000004622505ba178623
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@sus=
e.cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
<br>
diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/ker=
nel/device-drivers/zram/zram01.sh<br>
index a795ff89f..c5d4a3e51 100755<br>
--- a/testcases/kernel/device-drivers/zram/zram01.sh<br>
+++ b/testcases/kernel/device-drivers/zram/zram01.sh<br>
@@ -8,23 +8,25 @@<br>
<br>
=C2=A0TST_CNT=3D7<br>
=C2=A0TST_TESTFUNC=3D&quot;do_test&quot;<br>
-TST_NEEDS_CMDS=3D&quot;awk bc dd&quot;<br>
+TST_NEEDS_CMDS=3D&quot;awk bc dd grep&quot;<br>
=C2=A0. zram_lib.sh<br>
+TST_SETUP=3D&quot;setup&quot;<br>
<br>
-# List of parameters for zram devices.<br>
-# For each number the test creates own zram device.<br>
-zram_max_streams=3D&quot;2 3 5 8&quot;<br>
-<br>
-FS_SIZE=3D&quot;402653184&quot;<br>
-FS_TYPE=3D&quot;btrfs&quot;<br>
+get_btrfs_size()<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">What about renaming at_least_1G_mem() or=
=C2=A0check_space_for_btrfs()?</div></div></div><br clear=3D"all"><div><br>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000004622505ba178623--


--===============0898138787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0898138787==--

