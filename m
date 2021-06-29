Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C966F3B7072
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:11:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8170C3C6CB6
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:11:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 74B383C180B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:10:58 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C4ADC6009A4
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624961456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=glQhaRk9fclyWN8TmX1Xv93VPmsKWs0Wd+Kix+KTq0w=;
 b=PSozUgLSD+Ra4MMzxPkiE4Zun1WK7gKJZn6O3iuMxD/KGL7juETmfxac0KPMgEvC9Cy5gP
 u2wD7IhPBT8mdKXTP36ySBqEFGN+waTkzFD2U7m3cAn4h50WO3DWdkQTi+pKgDjPBhKT3/
 98vl6ZJtXYec5EtWNJGzhPmVIEN/kZw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-pfxHXO_wNm-K84F5A0pknQ-1; Tue, 29 Jun 2021 06:10:54 -0400
X-MC-Unique: pfxHXO_wNm-K84F5A0pknQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 q10-20020a056902150ab02905592911c932so1297533ybu.15
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 03:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=glQhaRk9fclyWN8TmX1Xv93VPmsKWs0Wd+Kix+KTq0w=;
 b=YIK/2t6QtFHesUCJ9FWIZCd+CCOugefZEqK0EA/7W0fcM0ryluQttV0KtMrpmbE1ro
 FKBTVX0rpvtOotwDNVrYdtF5O9B3+TTyRe6S8BRYM4mjSdaOEOV8iCa+yeAGrHOyBJEc
 bWOd3XlWtjFx978B5yCeL046dZZs1ArOfuqZwTygYwvQONOYZz5hhbdUX80tZ0ibl/Ev
 1bP2HBtba8JPJADKGwk2kNPNLIgQo+1sPSXwWG3HSV6+oQXAIXyJ6TosOWKxBSl6GEiF
 c8NDy33CDEf5fgccIQssVmN/KOoCvsoXMhwTCG45BJWdH7ujP2phIQ72qjGUdIIiCFGK
 r7gw==
X-Gm-Message-State: AOAM530FX7uC9Y0ytn/eZCQeLYzMgaUgO0g8vLbEfdlNBGxCsbkkATk7
 T/ZiQnI2p2o+fAJTi5x07fLUOjGTNTEpxwiX6ZO4ZnUVBTYvOwvkusFQGf1NZJSekwe9AKFawIy
 C3amRkZA0ZpQima8Bcms+LbWOlyM=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr37214427ybc.252.1624961454221; 
 Tue, 29 Jun 2021 03:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL8RZ72Oj4AtgRt2KV93wD2EKmFi3OLXpcSxZTC2zjqUPdHJmNIMWE2XcSng+AWq2XWrH1vFiGVwAmI028Lq4=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr37214411ybc.252.1624961454063; 
 Tue, 29 Jun 2021 03:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <1624958759-5562-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1624958759-5562-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 29 Jun 2021 18:10:41 +0800
Message-ID: <CAEemH2dHmSXkKtzNz9R+CnW3G86HPnWjHMZtiyOa90z0Qk_+aQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
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
Subject: Re: [LTP] [PATCH 1/2] include/tst_test_macro.h: Fix zero-length
 gnu_printf format string warning
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
Content-Type: multipart/mixed; boundary="===============1418726756=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1418726756==
Content-Type: multipart/alternative; boundary="0000000000003e59e405c5e4d2fb"

--0000000000003e59e405c5e4d2fb
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 29, 2021 at 5:25 PM Yang Xu <xuyang2018.jy@fujitsu.com> wrote:

> When build test_macro02.c, it reports the following warning.
>

Pushed.

-- 
Regards,
Li Wang

--0000000000003e59e405c5e4d2fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 29, 2021 at 5:25 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@fujitsu.com">xuyang2018.jy@fujitsu.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When build t=
est_macro02.c, it reports the following warning.<br></blockquote><div><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Pushed.</div></=
div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div d=
ir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000003e59e405c5e4d2fb--


--===============1418726756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1418726756==--

