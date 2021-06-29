Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D43B7071
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:10:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DD483C6CB6
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:10:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 53A223C180B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:10:40 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 84E9E600198
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624961438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fLMNHCgOSx7Q21M+ma9IbVyPPaTbp21fu4iLCFTADyk=;
 b=VQuQWUHqVyua1CQzyNY+cklKaJRMuJdtrsWdbkOMfo5r6L1PtI6qOg8YMRD8t7kgQ1iFq6
 AHi/NE0lfMpk/krdtA05U04gJdMCwRyq1yWGkgHqzwDZ0mtFHzCi8zM+jJIay1P4aAVUsC
 Go4kd0YqlTScmarKVLiQqRI65og5cQE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-6dRmKrdcP_yhFLQ47GIVjw-1; Tue, 29 Jun 2021 06:10:35 -0400
X-MC-Unique: 6dRmKrdcP_yhFLQ47GIVjw-1
Received: by mail-yb1-f197.google.com with SMTP id
 c13-20020a25880d0000b029055492c8987bso20244384ybl.19
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 03:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fLMNHCgOSx7Q21M+ma9IbVyPPaTbp21fu4iLCFTADyk=;
 b=DfB5/90f35FEZPy6D+Q1qv057te7X/rjQ0V7eehucBkZiDJD3CaSGL/6ObT4sJoNGK
 HWSu6L3RsY+nM+k/2QfwKKZXtWxU72wbOkeKGVuyP7y6mIFS/ltIBFwIsAJ3dhIjMfmN
 ygL+ICIqV6LMucxkxvwBaokVhrdZ17lVMOC6n6puNX7iL1ttjL5vTtjq2UOZcIrGIswA
 jTuELJHJZZ3kiYQTkV+qZwGTs6SPQg9hrCtIQ+LoeDWFtYKlEpyIIhSXDby81d5r0C88
 xBLGG8jK/ck2+8avQ7/KEHuA+KfArpDcjjFfouX97yqxPkBfesxt+jcJqe17IyMiGEGq
 GPkg==
X-Gm-Message-State: AOAM530jPGUVjIv7rHp/5IYftMcirLXSmZGUEInM6VxAXX3CYcEdI4oo
 XSklnjNNEtpYgvdqHzsHCz8wrXruaym9Us74OwJSMmmQm2Q22utGgffB3AiYgKfZHtdfPiUtfwV
 1HFrsoJagOXzUTFfS1GXiBIluZNA=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr36917134ybg.86.1624961435436; 
 Tue, 29 Jun 2021 03:10:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsz7iw6EaeI+CuQUSCC0DpPNhx+0R2WKAoh0LExJaqNCdCpOkdrdjWdwM7zbrSJqn9ixRnPJBKatdpRnKoGZs=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr36917102ybg.86.1624961435114; 
 Tue, 29 Jun 2021 03:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAEemH2eJLd5cSHZLUyXCYBhr643noDPT4RrMb8YBxrE_M3d1gA@mail.gmail.com>
 <1624930818-31474-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1624930818-31474-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 29 Jun 2021 18:10:22 +0800
Message-ID: <CAEemH2cR2tFtVMPQE=SQqPDOA1gPo3ONTxrr5N5FVs5fJzXhyQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
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
Subject: Re: [LTP] [PATCH v2] ipc/msgget03: Make sure we get ENOSPC error
 after creating MSGMNI message queues
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
Content-Type: multipart/mixed; boundary="===============1787040505=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1787040505==
Content-Type: multipart/alternative; boundary="0000000000001d345d05c5e4d1c7"

--0000000000001d345d05c5e4d1c7
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

Patch applied, thanks.

-- 
Regards,
Li Wang

--0000000000001d345d05c5e4d1c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Patc=
h applied, thanks.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--0000000000001d345d05c5e4d1c7--


--===============1787040505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1787040505==--

