Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 371C51ADA43
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 11:44:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A13E3C2AFF
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 11:44:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C74E13C0358
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 11:44:24 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 2DC8660126D
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 11:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587116662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Mg4PCMcbj9J8VjRa1069IexBojouNyJkl4hb8PZrLc=;
 b=TkATZYz/0aiGTLLYR0ZdNYTVDQVGOt+rDHPaklTDyqqzl2mpIwzkOmegm3KPjbDeKacdLW
 Nmn+oQVlwReYxtZ11bDVc0dYHv18CM2TGTFTyEXfSN6W6OqDSq1F+Eb1XV186L3yAzMRJU
 Q9FWMPHXenn4z+ybqMLUgjFLzHTLjW8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-AW8IupUjM-2iqIOxNpPaWA-1; Fri, 17 Apr 2020 05:44:20 -0400
X-MC-Unique: AW8IupUjM-2iqIOxNpPaWA-1
Received: by mail-lf1-f69.google.com with SMTP id h12so609481lfk.22
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 02:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W9sxGTcXLPpIJ1PhsN/+Di4IqwOQkLDagY7m6EhYG2I=;
 b=YP6HYCJ80GOsXn3KbuoSn5hncpUQ32umP57ljtqMB3q5vv3u29SF6Xkd28BvFjtqhE
 ty2/DMrTBbHHYCuwb1wmOFaoun4vM49qOvQtVjBHitqQ7s0iTEz7TIdadm3Qxyq/Ea7h
 jZAeNhBa8geooORcSd2g0QqxMOrXO44WgvtH6UPTD3/bGzHjWZK+lB0IzrPYJ6Uv5+yL
 i4rHe3zLTrsAIQvN3aHZYNSKdXDRQYBgnFDmVFXch0/F3s0NzioFhfIN+Se+pRaJ14cz
 xKjKPE2wWE8IAVvPzzKyNTX+3T51SWArZuMIJiR1I9qDtcRX0XKCUHVtg+2wgf9vnMEt
 XliQ==
X-Gm-Message-State: AGi0PuZNA3s05G3k0OsMSGgHguwAnrO58nhhF/3xm6xbOr9LFZephFjK
 iY5Tcq0e5x6HeqSVNAttGsR3dOv3t9GGGt5Bnmm9xkH1kylpV9FHIXTcAe5d30iy8hm7zSqRcf0
 tQoQFe/GUztbWDf1cqOVG3AesMiY=
X-Received: by 2002:a2e:9ac9:: with SMTP id p9mr1577980ljj.222.1587116658538; 
 Fri, 17 Apr 2020 02:44:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypJevS/D0owf8bz7R3t3Szd4pS8kYq6k3Z6KqHBzE4Ioe/XHlY/mLoXIy23kOdxAtKBx7SMe2TS8GPAeOFY5/30=
X-Received: by 2002:a2e:9ac9:: with SMTP id p9mr1577975ljj.222.1587116658351; 
 Fri, 17 Apr 2020 02:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 17 Apr 2020 17:44:07 +0800
Message-ID: <CAEemH2fUpkmU86d3M8LAL13x-vsC96ce8QdyjGacqy9m4_bD4g@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Content-Type: multipart/mixed; boundary="===============1323968222=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1323968222==
Content-Type: multipart/alternative; boundary="000000000000a3792f05a37964d1"

--000000000000a3792f05a37964d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

I feel confused that is this test duplicated with the one Lanie's patch2/2?
why using the same test name?

--=20
Regards,
Li Wang

--000000000000a3792f05a37964d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I fe=
el confused that is this test duplicated with the one Lanie&#39;s patch2/2?=
 why using the same test name?</div></div><div><br></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><di=
v>Li Wang<br></div></div></div></div>

--000000000000a3792f05a37964d1--


--===============1323968222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1323968222==--

