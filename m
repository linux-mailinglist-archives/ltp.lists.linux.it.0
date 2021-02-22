Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2533210DA
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 07:33:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD7673C4E9A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 07:33:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 467CC3C1D2B
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 07:33:00 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 32CB360080A
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 07:32:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613975577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PAzTrZBJrhOtquc1Rg3ZINiYoI9hLpQ7yQLQf+heAa0=;
 b=a676agbOVVX9lLaomkb0FDacPYt2fzxn9Zfe/fhCH5GfBT5KnXunr0RlWwQ3GEPFb0I19B
 2yv4AzXM8URa3FBvFFKgEfp9RDfTCwdYg9QGVhkpA2HpyhwkHkxvwYHq2NdOwcjO+VmSKx
 beC/9Xq9TpEeghU7eGVrImsQ/HVDjLE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-PM4v7hypNLWPN_gO963X_g-1; Mon, 22 Feb 2021 01:32:54 -0500
X-MC-Unique: PM4v7hypNLWPN_gO963X_g-1
Received: by mail-yb1-f200.google.com with SMTP id 6so15615372ybq.7
 for <ltp@lists.linux.it>; Sun, 21 Feb 2021 22:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PAzTrZBJrhOtquc1Rg3ZINiYoI9hLpQ7yQLQf+heAa0=;
 b=XwcjVzAl5y6BbdnaF0tHIb1zuUbMLsyAi8QmrXzPlMKDZUYZi5Bk46o86aL6Meo73/
 Lu3uaIrWpsvLzVnIkaM4ac1XfGIDmgZDgaXqaeUHom/gxTq1zMCq1GsyAEtvV1RLhWbi
 A+MfEr81L7xKMkJi16jf/akVBa8l3cybamKtLBMqtWac1BpcC1UpoBc6gPuxalRC3Xbh
 /szvUE/GXC5p1XMRUn4ejP01a0rsUKg4wa2ZV1ra9Ln7STMZ/GfLIbZd9m0W8zf4StvO
 22GeDiEGsh2VE7bKOze8Oy4ZTBgmjn9lryCXaCu5VjvEbsyO5jODg4mmuSjSV1QKXcJj
 b5Pw==
X-Gm-Message-State: AOAM532nN/FnYt+6bM+hYRiuX6AelfMTctp143GcyV9HHJCiiR89M0nU
 MOsH2bkCEYEuebTb6qprL7TwxOwxZW1jjqdPc/8SnRjVYhyegDcm8yubfH2Y8ZDACcFI7g03QCl
 THL4XaeqxoUEBn3/+XhgeXUI7z5E=
X-Received: by 2002:a25:5ac2:: with SMTP id
 o185mr32666388ybb.252.1613975574146; 
 Sun, 21 Feb 2021 22:32:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdwK+dQRJn9wg5fwliyfakHmadeB8etBYoB8wwbU4MoNPm0/W2AuYQUE79iymME3cLCUFMpsGMNgKMcWQk5YA=
X-Received: by 2002:a25:5ac2:: with SMTP id
 o185mr32666373ybb.252.1613975573961; 
 Sun, 21 Feb 2021 22:32:53 -0800 (PST)
MIME-Version: 1.0
References: <YCFZB1/VMSsfxyPA@yuki.lan>
 <1613627572-5213-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1613627572-5213-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1613627572-5213-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 22 Feb 2021 14:32:42 +0800
Message-ID: <CAEemH2crZjLK1MtzkEYyxCU0-Pbqp8G5MR4CU7UEG4VQr-ksVQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
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
Subject: Re: [LTP] [PATCH v3 3/4] syscalls/mallinfo02: Add a basic test to
 check use mmap or sbrk
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
Content-Type: multipart/mixed; boundary="===============0554135838=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0554135838==
Content-Type: multipart/alternative; boundary="000000000000c3334705bbe6f874"

--000000000000c3334705bbe6f874
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

For patch 1/4 ~ 3/4, looks good to me.
Reviewed-by: Li Wang <liwang@redhat.com>

For 4/4, I slightly think it does not make much sense to test, because
it just verifies the info.hblkhd integer overflow at unsuggested usage.
Anyway, that's only my thoughts, maybe a one-sided view:).

-- 
Regards,
Li Wang

--000000000000c3334705bbe6f874
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">For =
patch 1/4 ~ 3/4, looks good to me.</div><div class=3D"gmail_default" style=
=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redh=
at.com" target=3D"_blank">liwang@redhat.com</a>&gt;<br></div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">For 4/4, I slightly think it does not make m=
uch sense to test, because</div><div class=3D"gmail_default" style=3D"font-=
size:small">it just verifies the info.hblkhd integer=C2=A0overflow at unsug=
gested usage.=C2=A0=C2=A0</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Anyway, that&#39;s only my thoughts, maybe a=C2=A0one-sided view=
:).</div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div=
>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000c3334705bbe6f874--


--===============0554135838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0554135838==--

