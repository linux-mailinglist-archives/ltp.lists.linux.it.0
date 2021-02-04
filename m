Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E230EC4E
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 07:08:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C9A03C5DF8
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 07:08:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B94663C4F48
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 07:08:46 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 86C36200BD1
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 07:08:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612418924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Z5OlYDCEwswS1C4LArqT2ABQ3blNVSQFi11YTj2C2g=;
 b=YBIvY8C4L7lDhtdO13kO5cYvLE10+vG54oO+JaAQZ92j7xPyrR4VIC3lkoOep1Gm5DnWd0
 7GRm+NIIa+nJ8WTzh4iTPJh/ZHnsHo3ew6f7NLr/B+irGGY8l/YQQ5dgk02b98ZbJAnMH3
 qwT/mgP+wR9HCcA3t4wMwwHxQtWteh0=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-ViSR6_TtNVan5uopKfy3tg-1; Thu, 04 Feb 2021 01:08:41 -0500
X-MC-Unique: ViSR6_TtNVan5uopKfy3tg-1
Received: by mail-yb1-f197.google.com with SMTP id v17so2400866ybq.9
 for <ltp@lists.linux.it>; Wed, 03 Feb 2021 22:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Z5OlYDCEwswS1C4LArqT2ABQ3blNVSQFi11YTj2C2g=;
 b=Xif1ifkZnnGULxDTkApQvBjJhMXkSaD/mogkJT3VX4PnghHrVy7ae+ElvkKh7j3hPP
 RV63L4oo7/4KRVNAS9Gh2aiGB+Vf5JfE6QNZYWG4XwPtj8xKT7dQ2BSkTsRSB9SagqE5
 /uDe0ZOprRAS8p5yQvx0SPua0XiRCo/XnJcB/T9H9qhR9B0Z9KKjxwabErK5QCGmIRtL
 H10zsXD1QhZh+zvr2MIIxvKN83VIDsGJvqPvLp6MR93k56/qwgFekrQvNw6r0O3KH1/2
 PsoXhItOpfm+Q6fxTHwuGrm5g0AG5gIjIArqdNsUM8xB2UTMgs9xjh7no3C1c+AmQCQl
 zQzA==
X-Gm-Message-State: AOAM533J6GMYJX6bTibkjMHx3NTshkdcIcMY1kgLxXItoIsyob/KmZRM
 NkEtPyYX70SEbxQMg8EvEvnYoDzPLJ7D061gUjR89FKdoW9MtFtMNko4fwx7R9ZJhwsc8IrTC6j
 Ye/JQYhc6/GF0s3RU0mB+m0b5ygA=
X-Received: by 2002:a25:b992:: with SMTP id r18mr10145737ybg.86.1612418921206; 
 Wed, 03 Feb 2021 22:08:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYDC6iqBgfyO5bwcrhmFp8o9s+AAo+8CaNLE4D5Z4fQ6gavBSjegwUlKfgD3Vqu314uSuwsz71Et4CwDA3yuM=
X-Received: by 2002:a25:b992:: with SMTP id r18mr10145711ybg.86.1612418920904; 
 Wed, 03 Feb 2021 22:08:40 -0800 (PST)
MIME-Version: 1.0
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1611654925-8994-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <YBLaQvt2g3z8Xy1A@yuki.lan> <601A713F.7020301@cn.fujitsu.com>
In-Reply-To: <601A713F.7020301@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Feb 2021 14:08:29 +0800
Message-ID: <CAEemH2efATKDx6T-j=GZKm6N4XZ3qTR22ZwzLPi5pBHkFkMEJQ@mail.gmail.com>
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
Subject: Re: [LTP] [PATCH v1 2/3] syscalls/mallinfo02: Add a basic test to
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
Content-Type: multipart/mixed; boundary="===============0262296483=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0262296483==
Content-Type: multipart/alternative; boundary="00000000000002924305ba7c8931"

--00000000000002924305ba7c8931
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

...
>
> So I use this code "MAX(info.fordblks, 131072)" to get the right value
> to trigger mmap.
>

My 2 cents:

From what I understand, once we request memory larger than the upper
limit DEFAULT_MMAP_THRESHOLD_MAX, Glibc will always make use
of mmap() because it will be out of any value it can adjust in dynamical.
So that we don't be bothered with this issue anymore.

Or:

Invoking mallopt(M_MMAP_THRESHOLD, ...) function in front of the
SAFE_MALLOC helps to fix the threshold. In such a case, the dynamic
adjustment of the mmap threshold will be disabled.

-- 
Regards,
Li Wang

--00000000000002924305ba7c8931
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fu=
jitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><div dir=3D=
"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</sp=
an><br>
<br>
So I use this code &quot;MAX(info.fordblks, 131072)&quot; to get the right =
value <br>
to trigger mmap.<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">My 2 cents:</div></div><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">From what I underst=
and, once we request memory larger than the upper</div><div class=3D"gmail_=
default" style=3D"font-size:small">limit DEFAULT_MMAP_THRESHOLD_MAX, Glibc =
will always make use</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">of mmap() because it will be out of any value it can adjust in dynami=
cal.</div><div class=3D"gmail_default" style=3D"font-size:small">So that we=
 don&#39;t be bothered with this issue anymore.</div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Or:</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">Invoking mallopt(M_MMAP_THRESHOLD, ..=
.) function in front of the</div><div class=3D"gmail_default" style=3D"font=
-size:small">SAFE_MALLOC helps to fix the threshold. In such a case, the dy=
namic</div><div class=3D"gmail_default" style=3D"font-size:small">adjustmen=
t of the mmap threshold will be disabled.=C2=A0</div></div></div><div><br><=
/div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><di=
v>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000002924305ba7c8931--


--===============0262296483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0262296483==--

