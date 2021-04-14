Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F95E35F118
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 11:55:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DF803C70F5
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 11:55:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 83AE13C1B4C
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 11:55:06 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AEF401A00A3C
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 11:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618394104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6QDzK7Sjgdh3nS0Um5bm/85MViFyU1QyHfKHKDUTnMQ=;
 b=OMD8yygWMLV0c108DBuCgRnSd73ktlRBQeHL6HF7YTbCIHJs20Gm5WEVB/YMaLlLhmpgu/
 jxKd5/eINffCDUtv/pU1Dr2KgedRwhjRdpumtH3IFVy15zqjzZrTLCOC0RumLy4C3uOlQj
 EVSJxc1L+MQjxvuQFyabDzHeimKCP+k=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-mztmzG3EP22TOMDVHv49yg-1; Wed, 14 Apr 2021 05:55:00 -0400
X-MC-Unique: mztmzG3EP22TOMDVHv49yg-1
Received: by mail-yb1-f199.google.com with SMTP id t9so8883460ybd.11
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 02:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6QDzK7Sjgdh3nS0Um5bm/85MViFyU1QyHfKHKDUTnMQ=;
 b=UdFRDlZGpW6ztSRMjBgHAAD7MjTqsvjHWlwbIoZDrsvEFGtK7gotRETTnBspK2sxhh
 W4Wtk6ScVw3z+Sdf5kU6HESC8HWlNF0iPPteIG/nBaSJralABzeYVszrwAIRNCOI2AOg
 7JGLCPWfXlNQGSEDaQj3SZ6vhSGFbZ0ziGGGbeMxI0KWsHTZDbOCZ2qAnMWLLXKiKrt7
 qOp40lsF0iHAACJM8cYHIPsJJHYaIkxAi69YTv/UygGV0hUiKLtbYg2WnwC8mVwaQzD4
 CdFuA9RtnEkjhDYtPorKZ6gOGfFUMRymOrZbc2LB2fgc6Mcv/YKNAObEEeIGE6IsLZd2
 mtBg==
X-Gm-Message-State: AOAM533x30A/qfDDyPa9PWPss/xp9SQkSIFLliawTEHA1A0t+tbpzRdV
 WCRi+caA3ADwztxmCkQ821daZbsr/D7GoHP63zJ6DiG6q4ZwcuJKytGKZlzeF1dVyD+l/WXCDOe
 Mi6ug9SBFbGy5cIExLcTKMFoVK34=
X-Received: by 2002:a25:4b43:: with SMTP id y64mr33923524yba.366.1618394099571; 
 Wed, 14 Apr 2021 02:54:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLUc8mlliG2oAxmywitizNF0IGH0HyvA38OoRKTJmHOeO7f5gytN7pwjPNFqlVvm7t2rYZKy91T//ACj+b3KA=
X-Received: by 2002:a25:4b43:: with SMTP id y64mr33923514yba.366.1618394099455; 
 Wed, 14 Apr 2021 02:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210414093710.6365-1-zhaogongyi@huawei.com>
In-Reply-To: <20210414093710.6365-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 14 Apr 2021 17:54:48 +0800
Message-ID: <CAEemH2fE_ctXXNaTONanyX8EgooiPH2E2bdC+vWCK0rYX2_u8A@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>, Wang Xin <wangxin410@huawei.com>
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
Subject: Re: [LTP] [PATCH] openposix/conformance/interfaces: Correct typos
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
Content-Type: multipart/mixed; boundary="===============0266292078=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0266292078==
Content-Type: multipart/alternative; boundary="00000000000067b09105bfebbd13"

--00000000000067b09105bfebbd13
Content-Type: text/plain; charset="UTF-8"

Hi Gongyi,

This patch works well, pushed.

-- 
Regards,
Li Wang

--00000000000067b09105bfebbd13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Gongyi,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
This patch works well, pushed.</div></div><div><br></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><di=
v>Li Wang<br></div></div></div></div>

--00000000000067b09105bfebbd13--


--===============0266292078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0266292078==--

