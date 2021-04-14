Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7135EE58
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 09:29:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7639D3C7104
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 09:29:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E42C23C1B4D
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 09:29:35 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CACEA14010D6
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 09:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618385373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yJx2ambwg/rIBNLEeda+AR66p++9M1e7mnWKz5wtNOU=;
 b=I6OW9EVT1WPgd+081BO4QGu1xMUKx6yU6h99nQsQL4BuNWhEdW6vMLMCLDwU68w0kSpm8t
 FIklWILAUqpCsvMOG74XX16yKoaPBwvXhZsOHpBkAFc3ambpRcvqdvr643B5OB4YHa0y5K
 HHiA77o/U+yPJ07/2RKkN0TqtiNczyc=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-5TzZZGEjP3iOshd_LCIyAg-1; Wed, 14 Apr 2021 03:29:31 -0400
X-MC-Unique: 5TzZZGEjP3iOshd_LCIyAg-1
Received: by mail-yb1-f199.google.com with SMTP id i6so19039027ybk.2
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 00:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJx2ambwg/rIBNLEeda+AR66p++9M1e7mnWKz5wtNOU=;
 b=FjdvxaiCipXzjpqHuew9yw5pyZ00TmWhp3hnV1lACOaHqUsjqHwWAf0pQPvnDY7dSG
 V8kUQVjUZu44Jq5K+ujaJAT8CSjX2Negn/IDJ+DuTD9Yr4MlBMIMGyKxYFGOpGX75Ur0
 tEdIXi2t0DgGIRSujHuf65/W74WGrKRKc0TuuOipKgc8UsJIRMKUv6/wk0sd9EEcBgas
 PO5SSfG2voStsGUDA6wO+Q/gqyvkGFy7e0M34phKdcmgK9CA3JnwXcPy8VU6IRVjx++b
 QXjCc8R7E4WeN0rDRgMwzmoqWVlQcGMsZLqSbwDCV8atSrkr08icQ68GBNiiojE11N9A
 gd8g==
X-Gm-Message-State: AOAM5301UTxibfKYXHQ3aPlLY6wNNyzjYheb/urZTJ434sEPrsctnTU9
 K6+BDUwCdxp1I91enclZA3EZLeb7+T/F76zpbnBYV23tyiFfaQQWV3mpIbjNjF64rGAcaPeFZGD
 4g5ez/BoctOLX1y8R66fjJD6XR+0=
X-Received: by 2002:a5b:787:: with SMTP id b7mr51231804ybq.243.1618385370421; 
 Wed, 14 Apr 2021 00:29:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Dv/hWy3fOiv2tkRmpz158IcnoUofrmxCbupIDZKN8RDCeKibiSbRQW/uFpoNE3VR4UmrTCAelqZZOZfommk=
X-Received: by 2002:a5b:787:: with SMTP id b7mr51231791ybq.243.1618385370292; 
 Wed, 14 Apr 2021 00:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <1617781808-82555-1-git-send-email-wangxin410@huawei.com>
In-Reply-To: <1617781808-82555-1-git-send-email-wangxin410@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 14 Apr 2021 15:29:19 +0800
Message-ID: <CAEemH2cYAagZj9O9j8wKDwECHmARLoCtWwVkpBnZOVg283rCoA@mail.gmail.com>
To: Wang Xin <wangxin410@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuset: Fix bug for type of variable
 c in checkopt
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
Content-Type: multipart/mixed; boundary="===============0280846534=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0280846534==
Content-Type: multipart/alternative; boundary="0000000000001b3bef05bfe9b5f7"

--0000000000001b3bef05bfe9b5f7
Content-Type: text/plain; charset="UTF-8"

Patch applied, thanks for fix this issue.

-- 
Regards,
Li Wang

--0000000000001b3bef05bfe9b5f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr"><div class=3D"gmail_default" style=3D"font-size:small">=
Patch applied, thanks for fix this issue.</div></div></div><div><br></div>-=
- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Rega=
rds,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000001b3bef05bfe9b5f7--


--===============0280846534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0280846534==--

