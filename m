Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC335FFE9
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 04:19:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B2923C7185
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 04:19:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ABBFA3C23BC
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 04:19:41 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9EBD760087B
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 04:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618453179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OLAKBWKF260gUWUi68hefPUZHuemSYMS7lNseNu7C9Q=;
 b=cLF4JDZ8TL3Cf1YzBfiN1s/yO/uI6h6Xn003Wjoq2DHLQN5KEV0pkGEZyKlpYPV+8zVCzv
 ixHq5OR/KUuCz0krBY/iZmR79f8h4IbcbYSbjHI5ck3+0cMRS5PN7hl1WoFfK8ulTTqad6
 eJeJG9rVTRZBYHWlIj22OLunUKBdNG8=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-2w90taLzPnetkOdau8CSKw-1; Wed, 14 Apr 2021 22:19:33 -0400
X-MC-Unique: 2w90taLzPnetkOdau8CSKw-1
Received: by mail-yb1-f199.google.com with SMTP id h69so1234921ybg.10
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 19:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OLAKBWKF260gUWUi68hefPUZHuemSYMS7lNseNu7C9Q=;
 b=JcdsD0/M+PV3VEoCfHWOsIo69Re3/pSgc+fEVRW6cJ6DGNP6EYR5eqajft7HJs0CUL
 BFvZqT9mJlZmJv6cPI3UxwGpoMZyrhG4xNK3dwIZ0uDKCPou1RdUcznTqGAOmkNKNbEW
 CiEuWxYuI4+085mpL7wXSAf5hcLhYqXomldizWza1McycXErhvLeAUtybL3M+/xsv8CN
 6lL4jaKahzSuru/cSw+mA4aLRwWl0o0wig8HJ2hrypkAAqxs7U6G0WcwSwtXn+sUoNS0
 hu7QmAeABLW63Ye4IlfUxDAAjmVVVsagqOZ5c81CE/cH6srt+heIQ4WyUhmcjuDY9eRu
 Wn4A==
X-Gm-Message-State: AOAM530pmM6MAlKkIcnmKSRKW7CHv0mHdFQUHUdxxsrd6/aakXp+uWR6
 wL6BRlBB82f2+IU/JpmrCfQEbIfVn5LdoAoRdiuN2TXmm1Cc6OYV5XL/Tkb6eC5FcCETSvZfptw
 cH4w7d6nX85CXfK8xYNi25EW8/hk=
X-Received: by 2002:a25:af05:: with SMTP id a5mr1413651ybh.86.1618453172653;
 Wed, 14 Apr 2021 19:19:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqdYMBepNYeqHMP5YoTtXFugXK79M6tb9O1ItsdUCRuubPLxs3UgAGJ/0uZpaAM5lGCpU8Fj6TfdNmT2jLLRA=
X-Received: by 2002:a25:af05:: with SMTP id a5mr1413629ybh.86.1618453172360;
 Wed, 14 Apr 2021 19:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <1617765607-78263-1-git-send-email-wangxin410@huawei.com>
 <CAEemH2ctSMR5OF=0TQX1eNmTE7PcdEdMbjoYXc3RxiBsyfzcuw@mail.gmail.com>
 <91a235700b494bdf9a9a7dd1901aa947@huawei.com>
 <CAEemH2dU2r8gFS5r3os7UwXFUEmmPqR9CnAizXbP_FHP+Evd+A@mail.gmail.com>
 <1e332d4428ea42aeb59e1173b654ce30@huawei.com>
 <CAEemH2ePd0td_fiK9MF66Mu9_XOzi7pa2pZLQj2t1qGwu0LxcQ@mail.gmail.com>
 <41393f626c104a208ebe81b439c3b2f5@huawei.com>
In-Reply-To: <41393f626c104a208ebe81b439c3b2f5@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 15 Apr 2021 10:19:21 +0800
Message-ID: <CAEemH2dd3neNYoP23YSdD5Zo5cwjNYb5Dv1Tix2HDNwuFDOOzA@mail.gmail.com>
To: "wangxin (CQ)" <wangxin410@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] openposix/conformance/interfaces: Correct typos
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
Content-Type: multipart/mixed; boundary="===============0446917756=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0446917756==
Content-Type: multipart/alternative; boundary="0000000000006cb73b05bff97e9c"

--0000000000006cb73b05bff97e9c
Content-Type: text/plain; charset="UTF-8"

Hi Xin,


Hi  Wang,
>
>
>
> I'm sorry. When I submitted the patch yesterday, I put a low-level error.
>
> I don't think it will happen again.
>
> Thank you for pointing out my mistake.
>
> Thank you again. Best wishes for you.
>

Never mind. I'm glad to merge if you can format a new one.
(To be on the safe side, plz do checkpatch.pl before sending next time:)

-- 
Regards,
Li Wang

--0000000000006cb73b05bff97e9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xin,</div></div><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr"><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_7374525400935456772WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi=C2=A0 Wang,<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#39;m sorry. When I submitted=
 the patch yesterday, I put a low-level error.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I don&#39;t think it will happe=
n again. <u></u>
<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you for pointing out my m=
istake. <u></u>
<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you again. Best wishes fo=
r you.</span></p></div></div></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">Never mind. I&#39;m glad to merge=
 if you can format a new one.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">(To be on the safe side, plz do <a href=3D"http://checkpatch=
.pl">checkpatch.pl</a> before sending next time:)</div></div></div><div><br=
></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><=
div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000006cb73b05bff97e9c--


--===============0446917756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0446917756==--

