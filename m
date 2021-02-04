Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7371730F16E
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 12:02:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C12EE3C734B
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 12:02:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2CAEC3C5E0C
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 12:02:31 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 9ED2C6006CD
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 12:02:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ksecZshpRcXjX4YxTfMJDAU7TgVfMnvvfBRYYFS3y8=;
 b=hjhuacCWcM7hgRcb88HZLJA46NLfYA7r3XLrjdAJwa/WToyg0HVuCafsTvHBhLcD4QFAu0
 iI8dY26PagBs6mgdmaEl4Q2VjF/kJu32LQEi5aYD5BiZ8LNZWu5/BC3udSYwBERo8IE8Vl
 f6zODIgn5eL6MIPJgUwLR1QuWELPBe4=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-755LqrNVMJiAzlrOEhxyxA-1; Thu, 04 Feb 2021 06:02:25 -0500
X-MC-Unique: 755LqrNVMJiAzlrOEhxyxA-1
Received: by mail-yb1-f198.google.com with SMTP id c13so2961941ybg.8
 for <ltp@lists.linux.it>; Thu, 04 Feb 2021 03:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ksecZshpRcXjX4YxTfMJDAU7TgVfMnvvfBRYYFS3y8=;
 b=MmRe+t1AcfE/WvwUlVvT4q6SJ/xH++iUIEdYyiiMXcRfVj5jw+1/oqseoDOLJTOxok
 MGYGxvMCc6Z1gIvyG6BvwApes3qIpAWqdEfYp7dVhupH4kMh80Z4c3sgsaF9bskx/gYS
 jzn4/i3dtiR8md2RVAo3nUu8RMoC9veRZsZd5cfhK2hrXAgt7neLe3AUsklGt9knoSDk
 ChVfOPMFcH7X5e9waVqn3xJC38x4rKAi/EWFJXiTpal5xUmn9iujZ/NlkHrvXPbeBBjF
 VzCdDNo5Wg+l+E6ni3Jp+aIER+wV4lHIo6Gpv3H3AARFTqorKBrCwIWAlwFq75jR8oRf
 SRAg==
X-Gm-Message-State: AOAM5308EOS52v5aJifWpDO5hSHV6d3/ocvR6aGCUJ446+fg7isipsHN
 rHi5uq3aU4cY7GGApTo2zjeklNoHWEC6XYjckLMAsSsJVqNdVO3HwOBTmEEa0Churi6OC8uMXgr
 hUCDwjV9/5VWhDQpKxLew6knUU7U=
X-Received: by 2002:a25:a4ea:: with SMTP id g97mr11459455ybi.286.1612436544908; 
 Thu, 04 Feb 2021 03:02:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw44puL8d2tIrK/sIAiqbSasySRN3cNKUZqk3f2XarkpI25M6X2tiJeTH+jUNU57xBiEwS9e1GcOidFr1P18q0=
X-Received: by 2002:a25:a4ea:: with SMTP id g97mr11459429ybi.286.1612436544701; 
 Thu, 04 Feb 2021 03:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20210204092114.8726-1-zhaogongyi@huawei.com>
In-Reply-To: <20210204092114.8726-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Feb 2021 19:02:11 +0800
Message-ID: <CAEemH2f_EXhBKDCgBVNh6qnEmcagyrOXMZAWLtazmba4ZPg7xw@mail.gmail.com>
To: zhao gongyi <zhaogongyi@huawei.com>
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
Subject: Re: [LTP] [PATCH] bugfix for lib/tst_capability.c
 sched_setaffinity/sched_setaffinity01.c timerfd/timerfd04.c
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
Content-Type: multipart/mixed; boundary="===============1800178985=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1800178985==
Content-Type: multipart/alternative; boundary="000000000000785ff905ba80a307"

--000000000000785ff905ba80a307
Content-Type: text/plain; charset="UTF-8"

Hi Gongyi,

On Thu, Feb 4, 2021 at 5:22 PM zhao gongyi <zhaogongyi@huawei.com> wrote:

> Use TERRNO because we're not using the TEST() macro.
>

I rewrote the subject and applied it. Thanks!

-- 
Regards,
Li Wang

--000000000000785ff905ba80a307
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Gongyi,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Feb 4, 2021 at 5:22 PM zhao gongyi &l=
t;<a href=3D"mailto:zhaogongyi@huawei.com" target=3D"_blank">zhaogongyi@hua=
wei.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Use TERRNO because we&#39;re not using the TEST() macro.<br></blockq=
uote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
I rewrote the subject and applied it. Thanks!</div></div><div><br></div>-- =
<br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--000000000000785ff905ba80a307--


--===============1800178985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1800178985==--

