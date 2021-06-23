Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 184A83B1A35
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 14:33:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEA4C3C6FD8
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 14:33:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AC233C2020
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 14:33:01 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A56376008A8
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 14:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624451579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cR7pE6+97moilaig1T1ACgwpire37kXTgocItttxCdU=;
 b=hsuarUM3nGjuZOa0Dp6ZoHbvIyjb6iA0WCrhAqvu9gX8ckg1ZuvL7OqYPHvrkd4bDC1FJ9
 ce9+EQoBQDSUcgexDrjGsfxXCQCzGfQuJgH1fEqMFB1FSVKdR1NJcHrLKg8qggcFdQZAB0
 2JJe4kKlcT7caS0cv8A3Rs31mcZCNeY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-j9vQEas6PcedNa7IRtIM6g-1; Wed, 23 Jun 2021 08:32:55 -0400
X-MC-Unique: j9vQEas6PcedNa7IRtIM6g-1
Received: by mail-qt1-f197.google.com with SMTP id
 a12-20020ac8108c0000b029023c90fba3dcso2578076qtj.7
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 05:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cR7pE6+97moilaig1T1ACgwpire37kXTgocItttxCdU=;
 b=HSe/VP03eVkZPowu4RoamsCVSsp1LxkJZqdhTawCUguMStrQ9YE9cEKyvhvfm+Mfqi
 GJot/Xz8InR38XXfVG8IoESSbTS/wjVbKgSW6LKTdkZQNrvM5dZgKBjSRFhitAWRgXMN
 NXHOr/A/DGgbbz4rVhRi+ERnnzQpenAEbmm7nXvpux8UNsjfDlZNWijwQpWAI6GqRqvO
 /HCLhWjlIX+mOcuA9vgnfZ30V8O956K0a7q9vuQM8h69zdCopVmumghq5qE+mQkLtgD/
 KIdwqFWDCR3J5yGcJKmIaOiyI8os4OqSqmPyu2LbhAr1aUv3S7x7F72eR555ym/sxmb1
 qBTg==
X-Gm-Message-State: AOAM5333MmrNf0T9hwUrliEvBo6s5BYmULKqvLaqKV3eernWqu7BX0tZ
 GkHsFEHxMlz61IMXR6iXHncDMDuYokgjjPAk7jP0/dey1LGU4E8Vwou6m/vPXmkG5qmgwYBlmRQ
 WKHtb+ZohsZV9JC8DYChNEPVQM/E=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr11487320ybc.252.1624451574944; 
 Wed, 23 Jun 2021 05:32:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ4896yEEN5J68Ls4VG4jSy2X3DLCPLMm97ddvBIaGtjljfVXwoxYReyGGhOFCYLzGolXerVrhv9E8kEy9QSI=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr11487303ybc.252.1624451574745; 
 Wed, 23 Jun 2021 05:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210623062456.430406-1-liwang@redhat.com>
 <87sg1850qg.fsf@suse.de>
In-Reply-To: <87sg1850qg.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Jun 2021 20:32:43 +0800
Message-ID: <CAEemH2fhhWj1AnN=0ChFCRSJvbPFge4LSVXK_+MVmSXx0H+Jsg@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
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
Subject: Re: [LTP] [PATCH v3 1/3] mem: child alloc memory should larger than
 memory.max + memory.swap.max if lite==1
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
Content-Type: multipart/mixed; boundary="===============1734522490=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1734522490==
Content-Type: multipart/alternative; boundary="00000000000011619805c56e1bbd"

--00000000000011619805c56e1bbd
Content-Type: text/plain; charset="UTF-8"

Patchset pushed, thanks!

-- 
Regards,
Li Wang

--00000000000011619805c56e1bbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Patchset pushed, thanks!</di=
v></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></d=
iv>

--00000000000011619805c56e1bbd--


--===============1734522490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1734522490==--

