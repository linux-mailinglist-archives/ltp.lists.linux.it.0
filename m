Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 603583B574A
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 04:43:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B18423C8DC1
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 04:43:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB01E3C2530
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 04:43:07 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E5A461A0042C
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 04:43:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624848184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DabmhqkMEYT+fAPW5RuWiZU6ap9pqwZrB9iyjrUmbYc=;
 b=R+iTRbBRZXeN/BcEA9m+CJwe/fFBJ9uckQEjNslBBlDw4yetp+EP0YQr/70v5EVIkJsPqK
 cwuXVtb1u7DaWzQD1fXjHsCfeBZp3b4odyu/Yi37nWxmafQWADnpZ/t6H+7LrQqLUWvwU7
 Hc0QVsVBV5z9CidZoiOc5TZdiR9pdz4=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-wmEdzoDmOZKSRfM2wJN4zw-1; Sun, 27 Jun 2021 22:43:01 -0400
X-MC-Unique: wmEdzoDmOZKSRfM2wJN4zw-1
Received: by mail-yb1-f199.google.com with SMTP id
 j7-20020a258b870000b029052360b1e3e2so14293436ybl.8
 for <ltp@lists.linux.it>; Sun, 27 Jun 2021 19:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DabmhqkMEYT+fAPW5RuWiZU6ap9pqwZrB9iyjrUmbYc=;
 b=RdY9gw/Xf+1c9Yg+nQtYvxrZL99iC3fRSA22yIrwBtlEs0OCYZaRreH68IQMhA/kIk
 TE3F+tiabVweItb15hnK9qix7M9YBt5sT5CKZkTOsuACqxfvYWFbhO5y9q1y37Nua5gV
 sWCiZGwnMXeK9YUefgJ+ie5CH58zGtC/qUXle8CNRKAv1fC9DW4L2DQFu2d+jP8SPBln
 cXeK89fu2KQxapKZt9pl1SdnZsbbiT+OOnOHMzuepGGRjdi1anl2a4VosoJPfYK/fXgs
 DdGXVBROykzYbfizGaKAR+iH/sPgdWWpJRwyzz35JX6hhA21ya8r2EurJUsFF9J9Lkke
 WTug==
X-Gm-Message-State: AOAM5304TKhqn02SQ3XD3aAUIAWFMABZIebeeiFzmNadII3/l+HUrgra
 ko7p2T6IMQyAFdUjYizK09R7oGQQoPHcivT7sawG+lwVbPpR0CQF6jo4WcA1qixadEqmeEx2yDV
 h3EkLU7ccymTkhY4dNG5BT7nNOYc=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr27892336ybc.252.1624848181414; 
 Sun, 27 Jun 2021 19:43:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg0xkjuB1Z3y9P4BcCkLVGzWL9a+hvaF8k9dQRjrlutmxHRMNEcoa261RB1X6cHAZzICdkytiGOg08yNKMJ5E=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr27892306ybc.252.1624848181060; 
 Sun, 27 Jun 2021 19:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210628011538.10060-1-gouhao@uniontech.com>
In-Reply-To: <20210628011538.10060-1-gouhao@uniontech.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 28 Jun 2021 10:42:48 +0800
Message-ID: <CAEemH2f9Fo1rDo9dXWwYuUy2a8p6aF0L=wX1ciDGi2onZd032A@mail.gmail.com>
To: Gou Hao <gouhao@uniontech.com>
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
Subject: Re: [LTP] [PATCH] fix cpuhotplug04 check last cpu error
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
Cc: weidong@uniontech.com, LTP List <ltp@lists.linux.it>,
 jiaofenfang@uniontech.com
Content-Type: multipart/mixed; boundary="===============1899353793=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1899353793==
Content-Type: multipart/alternative; boundary="000000000000a57b7505c5ca7251"

--000000000000a57b7505c5ca7251
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hao,

On Mon, Jun 28, 2021 at 9:16 AM Gou Hao <gouhao@uniontech.com> wrote:

> From: gouhao <gouhao@uniontech.com>
>
>

> Cpuhotplug04 uses get_hotplug_cpus when traversing,
> get_hotplug_cpus will filter out cpu without online files,
> and $cpus_num will be used to determine the last cpu num=E3=80=82



>
> If some cpu do not have an online file,
> it will lead to an error in the judgment of the last cpu.
>

I'm wondering what kind of CPU does not have the online file, and which
kernel version is being used? Is that test machine an x86 or MIPS?

--=20
Regards,
Li Wang

--000000000000a57b7505c5ca7251
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Hao,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jun 28, 2021 at 9:16 AM Gou Hao &lt;<a h=
ref=3D"mailto:gouhao@uniontech.com">gouhao@uniontech.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: gouhao &lt;<a=
 href=3D"mailto:gouhao@uniontech.com" target=3D"_blank">gouhao@uniontech.co=
m</a>&gt;<br>
<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Cpuhotplug04 uses get_hotplug_cpus when traversing, <br>
get_hotplug_cpus will filter out cpu without online files, <br>
and $cpus_num will be used to determine the last cpu num=E3=80=82</blockquo=
te><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
If some cpu do not have an online file, <br>
it will lead to an error in the judgment of the last cpu.<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I=
&#39;m wondering=C2=A0what kind of CPU does not have the online file, and w=
hich</div><div class=3D"gmail_default" style=3D"font-size:small">kernel ver=
sion is being used? Is that test machine an x86 or MIPS?</div></div></div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000a57b7505c5ca7251--


--===============1899353793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1899353793==--

