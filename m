Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC213B8DA3
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 08:12:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 432643C91C3
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 08:12:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F32733C7595
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 08:12:12 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 10F16600F21
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 08:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625119930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ujOyhyocoHWNhQuRvCwKHi8uNtqOEhB8unm6VRzJlwQ=;
 b=Tiy+MR6ezCIZLHXbTJDmKd5KWhrrHq5UKO8kvhWcJdnZxbnMo0QIJ8vaXmSPgMFKfPTPex
 fRHCK2mPtmvjEZSMuzSz6Oqt5fiiImHz/qE4fpD+SuXOZf6xquuWK2h4etgRZTn4oFnRLe
 hwSfKkrIQoXPakjD1/33ucRGAKqkC40=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-NB3UNclPO2m3CKY6sveH8A-1; Thu, 01 Jul 2021 02:12:08 -0400
X-MC-Unique: NB3UNclPO2m3CKY6sveH8A-1
Received: by mail-yb1-f198.google.com with SMTP id
 k32-20020a25b2a00000b0290557cf3415f8so7426955ybj.1
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 23:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ujOyhyocoHWNhQuRvCwKHi8uNtqOEhB8unm6VRzJlwQ=;
 b=uWsooCXrj7Br2EAqVASDUZvAHBkv1NOI/NnTgx3xAp49JJurx77QH7/MzjAVCwZOfu
 W4t57O/Ei6jaB6CHxSeu3PG3SeG2wAAeGo4gWEj/cS6gwIWRQlet0Qyho/L/u0ianjlh
 IOQi0ouduovdUbkjC5Bl8/o+U9IZ0dENK0WdEg+8vWSqqiOjpvnRgnAM0mGm6lo76Vpn
 GFRsXI1FzhaxXRwYksmOyuu/hfP/1706tT8xRwR8FNQiyn09GbwDM2rYhwnUfHQ99nkj
 wePixm+c86eEjovjGVo0Wqc7/DL3i5T3AndnENoyogmm2cX8bjWvRIaE6ULzuJBqkG5Z
 IUuw==
X-Gm-Message-State: AOAM531zIw1OtB0CbjdLGlcE8vREdA/IFOG/P+6aTAeLGsaUuOQf11wg
 lFwkQ3BcLaFkgAzQvLKxvd/UmeZHQgfXrRwDELmykQakQBNp9eZm8ZUkbF43113xL4E07stHrLw
 MFjCkSUoghC8AdGKC2Emg9nJ0WCI=
X-Received: by 2002:a25:1455:: with SMTP id 82mr50564907ybu.403.1625119928092; 
 Wed, 30 Jun 2021 23:12:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ0FZ8szkMAJPmYt1Pm9PSo8DCaHF+Yt4fG0Jqv13bi8ENIDge0Vb7p+tNRgLnSwDk1vAKRWlNiLN0lWd+u4w=
X-Received: by 2002:a25:1455:: with SMTP id 82mr50564892ybu.403.1625119927937; 
 Wed, 30 Jun 2021 23:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210701050314.1005067-1-petr.vorel@gmail.com>
 <60DD58CE.5070800@fujitsu.com>
In-Reply-To: <60DD58CE.5070800@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 1 Jul 2021 14:11:56 +0800
Message-ID: <CAEemH2d+sxyTC1tB-=Qo5OSg3pcFRsJ83dsiexUUM1D6e8XG8g@mail.gmail.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
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
Subject: Re: [LTP] [PATCH 0/2] API tests cleanup
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2085463033=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2085463033==
Content-Type: multipart/alternative; boundary="00000000000005be9a05c609b862"

--00000000000005be9a05c609b862
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 1, 2021 at 1:55 PM xuyang2018.jy@fujitsu.com <
xuyang2018.jy@fujitsu.com> wrote:

> Hi Petr
>
> Why only rename these two tests?
>

I guess Petr is recently working on investigating the tst_fuzzy_sync01 fail
(I haven't got a chance to look into that issue) and do this by the
opportunity.

Anyway, the rename looks good at this point:).
Acked-by: Li Wang <liwang@redhat.com>


>
> ps:IMO, test01-test21 also can ben rename to a meaningful name.
>

+1, someone will be appreciated if they complete that in separate patches.

-- 
Regards,
Li Wang

--00000000000005be9a05c609b862
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 1, 2021 at 1:55 PM <a href=3D"mailto:xu=
yang2018.jy@fujitsu.com" target=3D"_blank">xuyang2018.jy@fujitsu.com</a> &l=
t;<a href=3D"mailto:xuyang2018.jy@fujitsu.com" target=3D"_blank">xuyang2018=
.jy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Petr<br>
<br>
Why only rename these two tests?<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">I guess Petr is recently w=
orking on investigating the tst_fuzzy_sync01 fail</div><div class=3D"gmail_=
default" style=3D"font-size:small">(I haven&#39;t got a chance to look into=
 that issue) and do this=C2=A0by the opportunity.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Anyway, the rename looks good at this=C2=A0point:)=
.</div></div><div><div class=3D"gmail_default" style=3D"font-size:small">Ac=
ked-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">=
liwang@redhat.com</a>&gt;</div></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
ps:IMO, test01-test21 also can ben rename to a meaningful name.<br></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">+1, someone will be appreciated=C2=A0if they complete that in separate=
 patches.</div></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000005be9a05c609b862--


--===============2085463033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2085463033==--

