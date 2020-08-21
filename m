Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 400FF24D691
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 15:50:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCB2F3C2F89
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 15:50:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 16E8A3C2F6E
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 15:49:56 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 64225600937
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 15:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598017795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D7OCXt4JMJIC4GI3ulhfoTnFLncaM7pEEPtTcJjvsFU=;
 b=XS6K10ohgxb74bi39zJGz6WlLT4N53FabT4tjbQf0E8n0xT0tioawPRJeDoqNymsqpbR+n
 MYg6jttDfiFOsuT67UdjpudpAwMNP/m/4f0OXcLEK5xadmGbzwjszpj+tykCxqOJui1EVA
 uia43sGeMwjfs0cjpJz7qz97gkJQxQs=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-KTVxCHxgM0aTOiQyUlPSuw-1; Fri, 21 Aug 2020 09:49:50 -0400
X-MC-Unique: KTVxCHxgM0aTOiQyUlPSuw-1
Received: by mail-yb1-f198.google.com with SMTP id e196so2210997ybh.6
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 06:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D7OCXt4JMJIC4GI3ulhfoTnFLncaM7pEEPtTcJjvsFU=;
 b=ABqwHL1tdn1Msz54Xiig+l4a5uz3jDRgD+9Wrxl5Wwfxm5DDfkuAwkjPTTB6ZpctWV
 goRyCoVYs6qhHzsy35Db/CW3b7wC/YqV4gYxCRQCCK3MIXOmP9KoDoPO6b1EQDdKtYlV
 2aw1Di3Qa/fTj+0mvlSlSWAMNdV+Szt1J9lWnSlIqYWA4aE3nXrLQq22TrjrO4jIEGDV
 o22Ln02Ad40OhTHrUHhc6nF9COl3bz1JMI2O4Ugf+H/1YygbW1rvxW+Lz4RVJYP9VLDw
 QSPCNDffn16TwLJ9VOG4pDV7LLLlGO7JzwXflp8B4LbbKOw9xKOQNJBMus/6nYkzRbgX
 6uQQ==
X-Gm-Message-State: AOAM533z7Ue1KnDSygY/WV67UBIdf6yEiQ2r4r0kyZO+46x5sodLiVJk
 RqOjPNj8wM1CYY0s1U1VdhJS1P7LnWreib1t5AaDkeFyS36f0TKdOd4asEDGItk6HnuHY6hlrsN
 8QBrVnbB3DwFiWSsJeYgWUCLiSJE=
X-Received: by 2002:a25:ca50:: with SMTP id a77mr3918651ybg.286.1598017789958; 
 Fri, 21 Aug 2020 06:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyotlpE0R+niFvVpXnvxrRlVqZbLiitHwHzeZl+8ePnVse3hNBcGGKXOLsavpi0vamRWHtfJ5uyXBdQ9eJoc3s=
X-Received: by 2002:a25:ca50:: with SMTP id a77mr3918620ybg.286.1598017789627; 
 Fri, 21 Aug 2020 06:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <1598003231-25276-1-git-send-email-zhufy.jy@cn.fujitsu.com>
In-Reply-To: <1598003231-25276-1-git-send-email-zhufy.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 21 Aug 2020 21:49:37 +0800
Message-ID: <CAEemH2dESaZopDEYVm4-qjch9hqdHzQdAH+2ebAJwu-sCT+gTA@mail.gmail.com>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [v2 1/3] syscalls/kill03,
 04: Cleanup && Convert to new library
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
Content-Type: multipart/mixed; boundary="===============0203011025=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0203011025==
Content-Type: multipart/alternative; boundary="000000000000b2285905ad638264"

--000000000000b2285905ad638264
Content-Type: text/plain; charset="UTF-8"

Hi Feiyu,

I made some minor tweaks on code indent and pushed all patches.

-- 
Regards,
Li Wang

--000000000000b2285905ad638264
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Feiyu,</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I=
 made some minor=C2=A0<span class=3D"gmail-il">tweaks</span>=C2=A0on code i=
ndent and pushed all patches.</div></div><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div=
>Li Wang<br></div></div></div></div>

--000000000000b2285905ad638264--


--===============0203011025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0203011025==--

