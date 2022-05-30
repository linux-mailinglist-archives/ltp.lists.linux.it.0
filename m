Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B99E537423
	for <lists+linux-ltp@lfdr.de>; Mon, 30 May 2022 06:40:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D4EA3C20D0
	for <lists+linux-ltp@lfdr.de>; Mon, 30 May 2022 06:40:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 286383C0F5C
 for <ltp@lists.linux.it>; Mon, 30 May 2022 06:40:11 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8B9CD10002BC
 for <ltp@lists.linux.it>; Mon, 30 May 2022 06:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653885608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JuxZNuhhW/HG7FmmMjcOtGHhE1IV438ITzuSbT8d8nE=;
 b=StoLav2D6idQBO4mrdST9e3c06fp/OWdsJ65I4YL0k2aKU2vhZgjIj1ezU+a7xiyAVjqdP
 iIfc1yFO908xvBq+d3ju9RQW5v+EmIXJbxuPlVuHzjY3oo94rFjr6Vuo1tNdfJCMxZLyTx
 b8ynm7o7zwF3/vJlp+DMdBTskENX0yU=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-OkSJ78sVOEOuGnuTa4hrrQ-1; Mon, 30 May 2022 00:40:06 -0400
X-MC-Unique: OkSJ78sVOEOuGnuTa4hrrQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 140-20020a250b92000000b0065b6d834473so5639789ybl.6
 for <ltp@lists.linux.it>; Sun, 29 May 2022 21:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JuxZNuhhW/HG7FmmMjcOtGHhE1IV438ITzuSbT8d8nE=;
 b=M48SwGNqjELfbDrYezMW/yqWyecZ9Ut6Ydno/8ZWhl8TcnbqlZqMHCcTF8aAq1e+CA
 vVXNcXkkNS+pvRoUylkN6heTOMLoI1W1AAS3KWjbZT6c0572Kdzy6EhLrPKXGEIeXRPm
 v/hNXj4y/X1JqvppzFCpvJTUCC55ECXZlQCbUDaoHdK9BZS7wfXTWKKt2oBfXD7FX1vb
 5nbgoBAnV9JGKiaMsvC8rry413rzWIz4Lf4JpFTR9GfzhpaSYGjVP2pcxCxKL8v6u+8A
 13uVgizDomvLElEYOTcn0bzb5gnoEGlqjch0dL8rC5sb2AWsEl9Zv3NmWVcx5JtZCubB
 NZQw==
X-Gm-Message-State: AOAM531iLTTNCke5hzUF9+D4+Jp+pCLN2Dy9KbtfHyq1aRrKxTvcyVjx
 m3C8uGlFZsx8d/PxEN2qE4SvGQVMQFqrw39xzwCGV+VbfsOGkynLzO1Tnrar+XB9UkJBDkYQY5L
 fJ1xp3iQVsffsVzgRmaME5jiDqQw=
X-Received: by 2002:a25:d0d6:0:b0:65b:bb2a:b025 with SMTP id
 h205-20020a25d0d6000000b0065bbb2ab025mr12440397ybg.301.1653885606051; 
 Sun, 29 May 2022 21:40:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbIg+742mJWiHhLOGx88Z4s68IAfpuJePn84mavhx4fjzpxObrjjWJ90tu2YuluUkLvMnRPrVfeGsRquSuG+Q=
X-Received: by 2002:a25:d0d6:0:b0:65b:bb2a:b025 with SMTP id
 h205-20020a25d0d6000000b0065bbb2ab025mr12440387ybg.301.1653885605721; Sun, 29
 May 2022 21:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220527071522.4065-1-ycliang@andestech.com>
In-Reply-To: <20220527071522.4065-1-ycliang@andestech.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 May 2022 12:39:54 +0800
Message-ID: <CAEemH2fwZQeLg7q7x3-UQNnbofLUbNuKx=Mkb=cBTYzkBOJ=bw@mail.gmail.com>
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/times03.c: Fix typos
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
Content-Type: multipart/mixed; boundary="===============2098840929=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2098840929==
Content-Type: multipart/alternative; boundary="000000000000074ef505e03340c2"

--000000000000074ef505e03340c2
Content-Type: text/plain; charset="UTF-8"

Pushed, thanks.

-- 
Regards,
Li Wang

--000000000000074ef505e03340c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div><span class=3D"gmail_defau=
lt" style=3D"font-size:small">Pushed, thanks.</span>=C2=A0</div></div><div>=
<br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr=
"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000074ef505e03340c2--


--===============2098840929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2098840929==--

