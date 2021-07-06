Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0833BD70F
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 14:49:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40E4C3C8084
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 14:49:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0C1FE3C00A6
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 14:49:31 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2F106200B86
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 14:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625575769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8jRdc0WklstvXtmOTmUGCCqDUW4X1Wy14QIZHcx5xaQ=;
 b=QCp6MTDKPQL/TTzc7euJxH4urljAXAkxB1G99TLJIrLRYYtdFpBEfUUw+QQMgPEFZQ4tnz
 L5pvQDXJy2oPg8WEjDgPjsYxE+E7ZCPLG0EBgppDEDt2rj0L+HfUZN/wHmKQIPRV5BhK0d
 Ct9DEdBK8Cof/1/Zcnw+L/IcraruATA=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-yWYInlydO1Gw3E6xwWLphA-1; Tue, 06 Jul 2021 08:49:27 -0400
X-MC-Unique: yWYInlydO1Gw3E6xwWLphA-1
Received: by mail-yb1-f197.google.com with SMTP id
 132-20020a25158a0000b029055791ebe1e6so27377475ybv.20
 for <ltp@lists.linux.it>; Tue, 06 Jul 2021 05:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8jRdc0WklstvXtmOTmUGCCqDUW4X1Wy14QIZHcx5xaQ=;
 b=JN1u8W6bBVlcMyOM/cPbwv99StHIk6jD4zLd9GQLcGi1GO1pofwyuTFFP2X/IpagPi
 z+ckUHcTx7+8jwHAJfVbTkjUMe2sXk8TKvYCazIfHBiRe+I/QUWVW425NlI005/Irc0J
 yNdknpTlJQb3r9D0uX7oXaJ4nhE8TYtTsFD2nHVvRWagVzO3ENa8hE+scPCInHoGyhUT
 cHaO1TJ5LbdE44hjz0nF9HaKmX90o7Vnv8TRpz41nIuTAgSfri3SUh0rsa3CWoW0MEI8
 lqRtVsN7YqREBHHDUvTW0a4t7fEmhXADgwHN6H9UftSdeTkl8xP9fIzCjF+lo1+3ONwh
 yfxQ==
X-Gm-Message-State: AOAM533jX4rcn/rsWhatvFQWoy4LmxZm7lhpEVjwUfZymG0l/R34pbwA
 pEIAr2Oaa+fxR3CbXuXXwJqXIpKKlMZjkvA+Z9ebSlgndpSJo94bKhsv2c1XA406RsRFcPBbjeO
 jta8hKQAJFLnrwiZSQflIMBXPnOs=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr23798313ybc.252.1625575766980; 
 Tue, 06 Jul 2021 05:49:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNfV0/2jWV8ZbEaXM8j5204FwKvkz+Cfmz9k2vfDxMRllvfwHK4Thi0ZXodIFhzoIuTF0FVOp1eCDL63g5ou4=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr23798293ybc.252.1625575766783; 
 Tue, 06 Jul 2021 05:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
In-Reply-To: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 6 Jul 2021 20:49:15 +0800
Message-ID: <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
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
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: LTP List <ltp@lists.linux.it>, Huanian Li <huanli@redhat.com>
Content-Type: multipart/mixed; boundary="===============0723840987=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0723840987==
Content-Type: multipart/alternative; boundary="000000000000228d9505c673da60"

--000000000000228d9505c673da60
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Tue, Jul 6, 2021 at 6:59 PM Alexey Kodanev <aleksei.kodanev@bell-sw.com>
wrote:

> It's unlikely, but still possible that some of them could be
> created during the test as well, so the patch only checks
> errno.
>

Thanks for fixing this, seems the msgget03 has this problem as well.
https://github.com/linux-test-project/ltp/issues/842


> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
>
 Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000228d9505c673da60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Alexey,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jul 6, 2021 at 6:59 PM Alexey Kodanev=
 &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw.com">aleksei.kodanev@bell-sw=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">It&#39;s unlikely, but still possible that some of them could be<br>
created during the test as well, so the patch only checks<br>
errno.<br></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"">Thanks for fixing this, seems the msgget03 has this problem as well=
.</div><div class=3D"gmail_default" style=3D""><a href=3D"https://github.co=
m/linux-test-project/ltp/issues/842">https://github.com/linux-test-project/=
ltp/issues/842</a><br></div></div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Signed-off-by: Alexey Kodanev &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw=
.com" target=3D"_blank">aleksei.kodanev@bell-sw.com</a>&gt;<br></blockquote=
><div><span class=3D"gmail_default" style=3D"font-size:small">=C2=A0Reviewe=
d-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a=
>&gt;</span></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div=
></div></div></div>

--000000000000228d9505c673da60--


--===============0723840987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0723840987==--

