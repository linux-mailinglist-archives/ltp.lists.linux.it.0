Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4559B348CDC
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 10:29:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EB193C78A4
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 10:29:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4F2DD3C2953
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 10:29:42 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 7D36260073A
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 10:29:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616664580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/MzFLd/Hi5kp/7dOKGetpZObAts0V2cxIzqxXmVx1zY=;
 b=RcKiIhCmoo7LuKKdTGWSBfq/L/JSOCZ5/+oYvOXneiJpMgFTzMx8GTvOBfZ5bsf5F4NzdP
 LtloRrMpFHgVFR4pnLkeZVqSblGOg5FpjSRZ/x25Sa9gQ0e/Xdwqm7QRTDiaKaZnGRJmw/
 wFeT1e2xMVgoR0XDqmYIi7C5qFlDd5E=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-DQEq3oFgNEaBZwJ4nWaXrA-1; Thu, 25 Mar 2021 05:29:37 -0400
X-MC-Unique: DQEq3oFgNEaBZwJ4nWaXrA-1
Received: by mail-yb1-f200.google.com with SMTP id u128so5569354ybf.12
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 02:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/MzFLd/Hi5kp/7dOKGetpZObAts0V2cxIzqxXmVx1zY=;
 b=IcFJWFP082RC4MAej03XDhJdxbAXz+pxcyEmF76rArIN2qqQfYWZb1jbfpUrGGH+S6
 g75S8Ore4Vj1vWXvUmbO3MP4OF5VeUWIe3ZMiztuwMJthJSv0U3v2xBb3FYhSOy2D9pq
 VMlFvyZl71foIFofE4KgdvXtkBs9P05CsGprZOkqHDXW4gOTIzyQflhqgQvp2ZojhqJj
 n9PvjlaGDSOdwGxfjaE2myVunayzyG+odITI7G8OiYrdIFU+ud796RmEBzJKrPdIG6qT
 3iXK84O0VEZJ2HR3e5RvKZKXnsjAQxTSsMoOYV3P0Rgu4e/ea6df8jwzn9kJbxHc2e5T
 Bwww==
X-Gm-Message-State: AOAM533bkZ2GeL60DBvfxmEgdnKrzkx9DRI2VcDLMpGw+DZXMGWJT+Xv
 KmxRNUG4Hz4G011T/ncjHdd4svMZ6H02wkg/OoPf58FkjCTtZleFV27dIH4hnKnwX4Vdp2VYPYV
 elz0BdZ0NeeZZtmssY+ZfXvXO14Q=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr11141093ybg.97.1616664576743; 
 Thu, 25 Mar 2021 02:29:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl1x64QeqgWshbOqQxbUb4y/BNHsAZDQDF3jUihVwZrI66YFk1RjjWYntm2v0jnsAqfAoCQUxzrxtMbGBd6Gg=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr11141075ybg.97.1616664576577; 
 Thu, 25 Mar 2021 02:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210325090118.143355-1-xieziyao@huawei.com>
In-Reply-To: <20210325090118.143355-1-xieziyao@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 25 Mar 2021 17:29:25 +0800
Message-ID: <CAEemH2fEVw0uo=GqQPuqEcG=WMU8=h3hknKMrW7G8ushPeKPDw@mail.gmail.com>
To: Xie Ziyao <xieziyao@huawei.com>
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
Subject: Re: [LTP] [PATCH] syscalls/capset: modify incorrect use of TTERRNO
 for capset/capset01.c
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
Content-Type: multipart/mixed; boundary="===============0414979568=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0414979568==
Content-Type: multipart/alternative; boundary="000000000000cee9d305be590d7a"

--000000000000cee9d305be590d7a
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 25, 2021 at 5:01 PM Xie Ziyao <xieziyao@huawei.com> wrote:

> Use TEST() to check the return value of the tst_syscall.
>
> Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
>

Pushed, thanks for the fix!

-- 
Regards,
Li Wang

--000000000000cee9d305be590d7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Mar 25, 2021 at 5:01 PM Xie Ziyao &lt;<a hr=
ef=3D"mailto:xieziyao@huawei.com">xieziyao@huawei.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Use TEST() to check th=
e return value of the tst_syscall.<br>
<br>
Signed-off-by: Xie Ziyao &lt;<a href=3D"mailto:xieziyao@huawei.com" target=
=3D"_blank">xieziyao@huawei.com</a>&gt;<br></blockquote><div><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Pushed, thanks for the f=
ix!</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div>

--000000000000cee9d305be590d7a--


--===============0414979568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0414979568==--

