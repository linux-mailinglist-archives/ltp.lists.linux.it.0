Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4C12C27E0
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 14:32:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 079993C4E5B
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 14:32:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C460A3C2D3F
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 14:32:54 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 493EB1A00CB0
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 14:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606224772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VHmz0npFcBTIZE61e+kJeh5NyWG5QbtRXNSPs1kt5s0=;
 b=Rimi2NhrGHvvM/83WlysE6pQru9YyeV3ynlAXlHt6xLYxlFsV0oIoO+6pxjkmYkWb9KHGD
 D5qQP37CycSry4HJpRtTzdV23blpmavakIi2ujfg31+DE/BRrTjGfLnXVTjw76K+grrC/v
 KheeGHbBCvwDweJVOS1d9AGRLtzkvAk=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-GUFG1NA6P8aLGUJ_fnPkgw-1; Tue, 24 Nov 2020 08:32:49 -0500
X-MC-Unique: GUFG1NA6P8aLGUJ_fnPkgw-1
Received: by mail-yb1-f197.google.com with SMTP id z83so18827935ybz.2
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 05:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VHmz0npFcBTIZE61e+kJeh5NyWG5QbtRXNSPs1kt5s0=;
 b=oPwSQElzwCsT/Mfi2aqmOBnzKHVHnI4hKr0atW/VZu5Y2CJHgQ+zi9Is3ZBXOA1LjS
 9zqeGDVi6z/bX49O+sgKh783xE+kEeig6Uloi7gb5J3nwOm8UX+SVDd+5AiQAt7UMr1W
 H5U7qA2aSsnP3lYEpWkFKLOvySjBRiHn27jwSjDPRuEEtbSo+ZMKpAUZgQ91dtxNS0dc
 uV3l3phW3NuDLUH08Fhth/0pjqhAARU1KE2Hcb1NRoG5Yn9c0waGCbj48khbbhm11dMC
 jI2mryCQmIXlCGyUoEVpjdfRiubnkCXh0kVOjJdhJS/AJWPB7e869kDEYNd3Th/IxVsp
 QaGg==
X-Gm-Message-State: AOAM530ArqPpvdvLr5Ab2RPCteZ/WVH6KbImJY66+It6WN08WYx1OqHd
 sPnfoYIWChCwQXJrG6gcINc+VGYz/sP3Y9AtnyXb2iBncjZcRSKvDS+DUu44/3oxSJM8Cww3AlK
 Y6Upxh7u8OjkG22/JO2BJG5C7vgg=
X-Received: by 2002:a25:c7c6:: with SMTP id w189mr5497501ybe.403.1606224768928; 
 Tue, 24 Nov 2020 05:32:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOcV2nbFfriDc2xt0TSfNSmHSwLi7LniGcvc0DTiLADhnj/dvdrb8VWBtHKhygbWbiEc72GuDd5gGiVPkXM0Y=
X-Received: by 2002:a25:c7c6:: with SMTP id w189mr5497491ybe.403.1606224768782; 
 Tue, 24 Nov 2020 05:32:48 -0800 (PST)
MIME-Version: 1.0
References: <20201124130425.4264-1-chrubis@suse.cz>
In-Reply-To: <20201124130425.4264-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 24 Nov 2020 21:32:36 +0800
Message-ID: <CAEemH2d2E0evCwsAQkFFJcKn4Bw4J9yp+i1LtWetJWxXO2WB7Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH 2/2] syscalls: quotactl04,
 statx05: Fix TWARN on missing mkfs
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
Content-Type: multipart/mixed; boundary="===============0519913202=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0519913202==
Content-Type: multipart/alternative; boundary="000000000000c5ea0405b4da58e1"

--000000000000c5ea0405b4da58e1
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 9:03 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> When mkfs.ext4 was missing we would get TWARN because the setup will fail
> to
> parse the mkfs version followed by TCONF from the library function that
> attempts format the device.
>
> Fix this by requiring the mkfs.ext4 in the tst_test structure which will
> exit
> the test before we attempt to parse the mkfs version.
>

Merged, thanks~

-- 
Regards,
Li Wang

--000000000000c5ea0405b4da58e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 9:03 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">When mkfs.ext4 was missing =
we would get TWARN because the setup will fail to<br>
parse the mkfs version followed by TCONF from the library function that<br>
attempts format the device.<br>
<br>
Fix this by requiring the mkfs.ext4 in the tst_test structure which will ex=
it<br>
the test before we attempt to parse the mkfs version.<br></blockquote><div>=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">Merged, th=
anks~</div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div>=
</div></div>

--000000000000c5ea0405b4da58e1--


--===============0519913202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0519913202==--

