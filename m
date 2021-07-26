Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E925E3D54FB
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:14:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B4E23C9228
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:14:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 77BC63C1C02
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:14:13 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4D00E200332
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627287250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AY6OXDibfppzIYkuyIXFBvX5I2kBjeoo2QcTRA0DC+8=;
 b=Yajh81/oSAhwikt8rul6E/uf2tA5LW/NFTX7XMzWoGfV2R2t87fA7zbXY7JRCOKPIyWXGO
 r6pcNnIFTVZOqVJWoJ+mKot8Ck6c66TRRcmbvLqs5z+jyqFFjgKOTrhLG6cCrAaCEn4Pzt
 TLoms0mnANZVdL2kd3H6RAsYOn6MsQw=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-e9zvo8ZvMh--wjUzhLCBRQ-1; Mon, 26 Jul 2021 04:14:08 -0400
X-MC-Unique: e9zvo8ZvMh--wjUzhLCBRQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 e145-20020a2550970000b029056eb288352cso9540991ybb.2
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 01:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AY6OXDibfppzIYkuyIXFBvX5I2kBjeoo2QcTRA0DC+8=;
 b=DF28HfFOnFwj/+ocjS9kHO4BQfTraZEOdFt1sugrKqySCpFUgc2UIGelc2fVU5MP2i
 JyXHkRuaAW48dHdke8DDuvJAuZq8LSdCOW9fXADhi1LP+rrNQv5Gi3mcfCt6idDrEaLp
 tVZq5OfjqjaHifHJdxzPwaRMt4DmNjGcgZ1jiymhBMQfg6AF4RWp4x2XW2MwQv4E/hYi
 vJnJ9Piw4i8ESBobL4iJFLAAWuHwAqwyIzAYpINc9/lYt31T29GHKoAe3D6QgwDJKF6/
 Q3pvjd/20Aedesfc6fQqAF6IR0+cpVNsm1ZXCp+h/vPGvdEyUOKMahSsv9nn2uk+4CQT
 eQ0w==
X-Gm-Message-State: AOAM533HOKQ8gsjNcxC1WdZcDiFKcHsUydj1Yz8PvPAceX9DdWxP21S1
 AOPR7VRyALsDYHdYDYpq2HXEhsniyE8fbYojmceH122wjdf0z2P/AnEugTF/7uxiTS82teWBvZv
 vF4uz3igvWFGZGvU6uSWzMjrVzyc=
X-Received: by 2002:a25:d14e:: with SMTP id i75mr1889047ybg.243.1627287248199; 
 Mon, 26 Jul 2021 01:14:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJDBel64xRWSJLQ9haFN/sFU/JS0JBYWaAa6eaB/L6ck6FhO2GQ3ApNn8i1OiWcaJzDOM/RUrBC4E+POP8+uU=
X-Received: by 2002:a25:d14e:: with SMTP id i75mr1889032ybg.243.1627287247970; 
 Mon, 26 Jul 2021 01:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210726075540.11814-1-zhanglianjie@uniontech.com>
In-Reply-To: <20210726075540.11814-1-zhanglianjie@uniontech.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 26 Jul 2021 16:13:56 +0800
Message-ID: <CAEemH2dmqb8EzS0mCuGEhV7_YbPN0dSfENTkDcuKx24404452A@mail.gmail.com>
To: zhanglianjie <zhanglianjie@uniontech.com>
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
Subject: Re: [LTP] [PATCH] [2/2] syscalls/memcpy01: Convert to new API
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
Content-Type: multipart/mixed; boundary="===============1126602798=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1126602798==
Content-Type: multipart/alternative; boundary="0000000000005cfee205c8025666"

--0000000000005cfee205c8025666
Content-Type: text/plain; charset="UTF-8"

Hi Lianjie,

I made some modifications and applied the patches.

  * add SPDX-License-Identifier
  * add static statement in front of functions
  * comments combination & cleanup
  * remove unused TCID keywords
  * code indent issues

-- 
Regards,
Li Wang

--0000000000005cfee205c8025666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Lianjie,</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>I made some modifications and applied the patches.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">=C2=A0 * add SPDX-License-Identifier</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">=C2=A0 * add static statem=
ent in front of functions</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">=C2=A0 * comments combination &amp; cleanup</div><div class=3D"g=
mail_default" style=3D"font-size:small">=C2=A0 * remove unused TCID keyword=
s</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 * code=
 indent issues</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></d=
iv></div></div></div>

--0000000000005cfee205c8025666--


--===============1126602798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1126602798==--

