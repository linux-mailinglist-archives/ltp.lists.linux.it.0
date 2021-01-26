Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D684F3036FA
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 08:03:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C8D83C304F
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 08:03:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8B9193C042D
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 08:03:00 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A26B620004E
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 08:02:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611644577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6W+mlq8XZTsmQKWIBMEDZMUfKnWPFDC7gMdOGXuavmU=;
 b=L0v3zQfS0KbaA012TuRnTZXxLiWzlFx8U4fPhsOyKBaV41GQ3KWvDoNabNZsrNfWLoQSFM
 2W7MLcsqRZe7Q5zS6etaK2B0iCXWLWXwMbr/Vt/rZkCYcBO2+eRt0hrQsQubNRuJQsr7Ey
 xHjkDP58JIucckbH9mEqKIaKl91CvdQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-lPOMGol8PkWdSngcDtJKXA-1; Tue, 26 Jan 2021 02:02:55 -0500
X-MC-Unique: lPOMGol8PkWdSngcDtJKXA-1
Received: by mail-yb1-f197.google.com with SMTP id u14so16875536ybu.9
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 23:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6W+mlq8XZTsmQKWIBMEDZMUfKnWPFDC7gMdOGXuavmU=;
 b=taCXIUBZzfF3fZstPIpgtqqfCbQBvkzKW5ZXQvnOSUeocjot4jRjwSQ+2wsOKPzico
 kCh0vmrmueF18ylc6RmwavpDH0UPyL7ifh09TldSbrZYVNUdKsuGBrfpKeUvy6kg0dAK
 C5/loEPZYwPY4Wg1OIxt5AmfYNFLhCHDDmG9LW1SgvHLhAsRe+Llh5xz6jFPcTbQMSwk
 FxqHukVPLN2gWULOQypDNy6eTxOiEDce+8XxhxJgKAzkhenILViSE/VICSC8G9YCfP+N
 9qBm0vrd4E12pOJLNzeaGpSEa/6BhxL/hdgojkR7ZkJlcIz7Ob153CptwT45jpRsY79w
 XLZg==
X-Gm-Message-State: AOAM5338Ubj1h1fmj11MMvWxjHqblmq2gbqTX9Ngex0+t8KSXx9iLAcN
 ZgIIp8WtpKWJbL1Mz40Nnns2NeaW6hixjz0NgvOeQl6UVamfxnWm7DKkg1jvdygIzhATrDC55gy
 JmJxJ8i32pxdc1vYNMXGCwfWNU2M=
X-Received: by 2002:a25:254e:: with SMTP id l75mr6334062ybl.110.1611644574527; 
 Mon, 25 Jan 2021 23:02:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxddfwZKRKE7KzdxaLmqVuoahbHWGi3xvoFqsTdj8SdVS2sjo3th9Cisg9OebyGyzFvEmxGAjDAinHMvxVonSI=
X-Received: by 2002:a25:254e:: with SMTP id l75mr6334048ybl.110.1611644574317; 
 Mon, 25 Jan 2021 23:02:54 -0800 (PST)
MIME-Version: 1.0
References: <1611625298-2425-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1611625298-2425-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 26 Jan 2021 15:02:42 +0800
Message-ID: <CAEemH2cHD43cw0nRNHDYF3R5sr0PQYAhtPHz+oxbDMSqsyEJ+g@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
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
Subject: Re: [LTP] [PATCH] syscalls/msync: Assgin value for page_sz
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
Content-Type: multipart/mixed; boundary="===============0107955098=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0107955098==
Content-Type: multipart/alternative; boundary="0000000000005b61fc05b9c83e9a"

--0000000000005b61fc05b9c83e9a
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 26, 2021 at 9:42 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Since the previous patch, it removes useless getpagesize()
> check because this function never fail. But it also remove
> the page_size assignment and it lead case fail as below:
>
> msync02     1  TBROK  :  msync02.c:133: mmap failed: errno=EINVAL(22):
> Invalid argument
> msync02     2  TBROK  :  msync02.c:133: Remaining cases broken
> msync02     3  TBROK  :  msync02.c:147: munmap failed: errno=EINVAL(22):
> Invalid argument
>
> Fix this and also fix compiler warning by using size_t data type instead
> of int.
>

Pushed, thanks for the fix.


-- 
Regards,
Li Wang

--0000000000005b61fc05b9c83e9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jan 26, 2021 at 9:42 AM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since =
the previous patch, it removes useless getpagesize()<br>
check because this function never fail. But it also remove<br>
the page_size assignment and it lead case fail as below:<br>
<br>
msync02=C2=A0 =C2=A0 =C2=A01=C2=A0 TBROK=C2=A0 :=C2=A0 msync02.c:133: mmap =
failed: errno=3DEINVAL(22): Invalid argument<br>
msync02=C2=A0 =C2=A0 =C2=A02=C2=A0 TBROK=C2=A0 :=C2=A0 msync02.c:133: Remai=
ning cases broken<br>
msync02=C2=A0 =C2=A0 =C2=A03=C2=A0 TBROK=C2=A0 :=C2=A0 msync02.c:147: munma=
p failed: errno=3DEINVAL(22): Invalid argument<br>
<br>
Fix this and also fix compiler warning by using size_t data type instead of=
 int.<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Pushed, thanks for the fix.</div><br></div><div>=C2=
=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000005b61fc05b9c83e9a--


--===============0107955098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0107955098==--

