Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C0AFACE7
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 10:25:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B492A3C238E
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 10:25:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5FB673C1C91
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 10:25:26 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C7C30637CF6
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 10:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573637124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86eVmrm6raj8xQcLursavo6aoIqDLsm1Q6dVotsqxdQ=;
 b=E3LUpS3Uy616lxMhKaRVyOdefjP4AbxEwJnSTas5pG81aBzkW6ULBxZ+B6t6AzrlJhGKAR
 D2rJm21zdIJ07OE5fvlr7wxU7TW4DQxHy9pklQl9tnFCYTbmfWuZ6zPp/iMm9ZfoFUgHEK
 cxl6dcP6+mFinzgjUUjDizsOmRYrsA8=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-N_PmYlXYMNyM_afJwFydEw-1; Wed, 13 Nov 2019 04:25:22 -0500
Received: by mail-oi1-f199.google.com with SMTP id n30so711031oij.9
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 01:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MnykOac9N/IC4mQNqFCQKfaVwRjU3DvMHHVkkDuSgJ8=;
 b=YYhBJdUcA2zo5Tot6MUNmKWBfhi5ANY0n9ebJY+I7O91QrlVmz1PmWUu1oYih9JsOS
 lrsFG3bIkcYuNioWHpKImmegH4dz/xZqRH/P4epcy2CjPl176Gj4kAHgPg7z2NJDz3kw
 pFiBLvESj+iijecQW1+cDldXHt9hUp687cwNjaEB6VJ6JuTntR5R4k3MfiIpBtBf2Amv
 tbfo0reSQTlQ6ELBTxPScZMjAY796TIAa3SEIyT2D2t5dRlhassyoBctkSdEYT0G9M/6
 vV4+twaomYdBWRBLkjhSVznu+2uOzi0apOHGyRZRRaA/9XGau+/XnA7OUOMQrfNcyAyK
 F9jg==
X-Gm-Message-State: APjAAAVW24JgcTl15ui3KK/aL9MujN88Y4GC6ATep2NW2Vi4YJuXMb/F
 D8yji+7+RWT7T68+fyQa1vOtUWQhnspDbWhZ6ixMWsOfE24PAa4hEh/CKeIsFiPcD4+CD33sbWf
 IxWLSl01kbog8S41leb3kuOxt/a4=
X-Received: by 2002:a05:6830:17c3:: with SMTP id
 p3mr1838792ota.26.1573637121859; 
 Wed, 13 Nov 2019 01:25:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqzwye+Lyrh92SMS3SOEjvCiduunteY7bo6wZTEgRJgl1mYlxM8SdaLs7ndnnqYQ6k5uOm32xLHsE6W5CH7wbFo=
X-Received: by 2002:a05:6830:17c3:: with SMTP id
 p3mr1838771ota.26.1573637121492; 
 Wed, 13 Nov 2019 01:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20191112035237.39839-1-yongxin.liu@windriver.com>
 <CAEemH2eJD5rLqi6bTZARrVW_963bi=SidaEzcEeWAYib8CkomA@mail.gmail.com>
In-Reply-To: <CAEemH2eJD5rLqi6bTZARrVW_963bi=SidaEzcEeWAYib8CkomA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 13 Nov 2019 17:25:10 +0800
Message-ID: <CAEemH2eCgmbZXxj_TZEUFMC79TtPt+1Rs=8FjUJWoEd=5P59cw@mail.gmail.com>
To: Yongxin Liu <yongxin.liu@windriver.com>
X-MC-Unique: N_PmYlXYMNyM_afJwFydEw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkswap01.sh: Add "udevadm trigger" before swap
 verification
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
Content-Type: multipart/mixed; boundary="===============1084627723=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1084627723==
Content-Type: multipart/alternative; boundary="000000000000a1e12a059736f1d0"

--000000000000a1e12a059736f1d0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Merged, thanks!

--=20
Regards,
Li Wang

--000000000000a1e12a059736f1d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Merged, thanks!</div></div><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr"><br></div></div>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<=
br></div></div></div></div>

--000000000000a1e12a059736f1d0--


--===============1084627723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1084627723==--

