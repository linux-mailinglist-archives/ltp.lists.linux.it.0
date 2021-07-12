Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 273FB3C460C
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:28:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDED33C6741
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:28:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0A2AB3C1DD9
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:28:21 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A43956002B9
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:28:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626078498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MHt9R1upg7MQiG9e3K8rVDArrYO0cNBanD24HNJqPlc=;
 b=grnIWGNEARDeAviIF54cI/6Q2Bol1wqRrjclG5gAUq9nhPD5m5b29lx2o4rCM08NinMlRb
 xmUtrXqnJvlZfb5DBO/dDJC1s9VFfIcEaE3phCN5gXhdwfM0Iytg60cewoG1ChWTTof8sj
 zyRpAXGExdP4tAEEL9DK3MbUbE2B6w8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-TbDaPBSmM4meImRBEBqyOw-1; Mon, 12 Jul 2021 04:28:17 -0400
X-MC-Unique: TbDaPBSmM4meImRBEBqyOw-1
Received: by mail-yb1-f200.google.com with SMTP id
 q10-20020a056902150ab02905592911c932so21642123ybu.15
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 01:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHt9R1upg7MQiG9e3K8rVDArrYO0cNBanD24HNJqPlc=;
 b=H16GEBRpAZ3yDgrDCC5/aMc7I3MbGI5mlPGZ0yBIXy8UkMEm3/i63Qz74IcMvapFpk
 j8P5N6p4zBoGv+DUiPCM50Af7qCKhZaTI4lqrf2V4CCPVn/mGbkFM1wySDFhh0eXF+/6
 p8woQ/QjTGa5M5zIb5aocJLvt/OiXmZETaF6egahjMjmGhdEtg6nfiRfagaDO85hKUzs
 LaTvPDQnhQSIW6cLD/mUNy1dc94IYGJaTHhAieJJDMrEconJoR3D+rdntvD+KmeRSFn9
 2uQ/+4umzP1i4CNUAqiNKuP6kGv3fEjxthBmVr5SBuOfQe8h+Kx0Cy0SNJ4Gz6cI2XlR
 9V/w==
X-Gm-Message-State: AOAM530/3i+TpLbuRDVk5ObFLUK2F9kWNXC9I++IQL9pOeIbcFT15rkD
 O4DtHOW6t7yWCHr/SIYpfSq5MHUdGJRbOa/8JI2E1U2BtLvYOVZr5pnsfn0+oEAksAR/akwSafO
 tmYIwJXYD1YIXVek/T7PxYX/MhW8=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr26089875ybc.86.1626078496705; 
 Mon, 12 Jul 2021 01:28:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL8Pt4Qgo0mIZSv6pjqvpAnV/bIhEDad+ToRHOsIU0ganGYe3FfOwjIX5gpEOEWaxvQ2NVD81T+w1SkKGr0iE=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr26089845ybc.86.1626078496344; 
 Mon, 12 Jul 2021 01:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
In-Reply-To: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 12 Jul 2021 16:28:04 +0800
Message-ID: <CAEemH2ehOzddTbDqZBcbyZcnUy3899u_U81XGtckf1Gs_LJGMA@mail.gmail.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] shmget03: don't depend on existed shared
 resources
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
Content-Type: multipart/mixed; boundary="===============0233662893=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0233662893==
Content-Type: multipart/alternative; boundary="00000000000026e9cb05c6e8e77d"

--00000000000026e9cb05c6e8e77d
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 12, 2021 at 3:54 PM Alexey Kodanev <aleksei.kodanev@bell-sw.com>
wrote:

> It's unlikely, but still possible that some of them could be
> created/released during the test as well, so the patch only
> checks errno.
>
> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> ---
> v2: * Move the loop to the test run function and try to get
>       ENOSPC errno there.
>

I'm fine to go with this but move the loop to test run without any
limit will bring new fail if running with parameter '-i 2'.

We have to handle that situation (maybe add a judgment to skip
test for run more times) in case someone uses it like:

# ./shmget03 -i 2
tst_test.c:1344: TINFO: Timeout per run is 0h 05m 00s
shmget03.c:44: TPASS: Maximum number of segments reached (4096), used by
test 4096
shmget03.c:41: TFAIL: Failed to trigger ENOSPC error: EEXIST (17)

-- 
Regards,
Li Wang

--00000000000026e9cb05c6e8e77d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 12, 2021 at 3:54 PM Alexey Kodanev &lt;=
<a href=3D"mailto:aleksei.kodanev@bell-sw.com">aleksei.kodanev@bell-sw.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I=
t&#39;s unlikely, but still possible that some of them could be<br>
created/released during the test as well, so the patch only<br>
checks errno.<br>
<br>
Signed-off-by: Alexey Kodanev &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw=
.com" target=3D"_blank">aleksei.kodanev@bell-sw.com</a>&gt;<br>
---<br>
v2: * Move the loop to the test run function and try to get<br>
=C2=A0 =C2=A0 =C2=A0 ENOSPC errno there.<br></blockquote><div><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">I&#39;m fine to go with=
 this but move=C2=A0the loop to test run without any</div><div class=3D"gma=
il_default" style=3D"font-size:small">limit will bring new fail if running =
with parameter &#39;-i 2&#39;.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">We have to handle that situation (maybe add a judgment to skip</div><=
div class=3D"gmail_default" style=3D"font-size:small">test for run=C2=A0mor=
e times) in case someone uses it like:</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div># ./shmget03 -i 2<br>tst_test.c:1344: TIN=
FO: Timeout per run is 0h 05m 00s<br>shmget03.c:44: TPASS: Maximum number o=
f segments reached (4096), used by test 4096<br>shmget03.c:41: TFAIL: Faile=
d to trigger ENOSPC error: EEXIST (17)<br><div class=3D"gmail_default" styl=
e=3D"font-size:small"></div></div><div><br></div>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wan=
g<br></div></div></div></div>

--00000000000026e9cb05c6e8e77d--


--===============0233662893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0233662893==--

