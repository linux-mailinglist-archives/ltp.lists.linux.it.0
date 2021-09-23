Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C1415A89
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 11:04:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E96023C8F63
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 11:04:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 772263C79CA
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 11:04:56 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F33D2200DF4
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 11:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632387894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eLYCKeHk1y9YOPpowRQkCuAN2eJ+aGlMXb5oxarNgpY=;
 b=DkaEEeVqbBl92h/VICtQMcWzSbROhIV92wtMQsdnHDJZqGFYZk0ppdpTuziwaHakbkPxLx
 t1gTTzPcVemrkbkRKI6VoH24+O2w8HknxmZPLSmKW71VDWbvsRuI3PDFt10Lp0i2DEyTMu
 lfq6tAEe6LOeHSvNhmus+LoWvAyX5vo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-eDjuIHQmPnOXDJxi8FlQ6g-1; Thu, 23 Sep 2021 05:04:53 -0400
X-MC-Unique: eDjuIHQmPnOXDJxi8FlQ6g-1
Received: by mail-qt1-f197.google.com with SMTP id
 z16-20020ac86b90000000b0029eec160182so16372631qts.9
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 02:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eLYCKeHk1y9YOPpowRQkCuAN2eJ+aGlMXb5oxarNgpY=;
 b=tJtukbfZ8453/I7j4nYV+y7NlaO8+s3O5qIiZj14UaZzTFAR4KZoXuFUbU/Rwrjuut
 98ljiI7Ejo1ulZAr362Kdxgzdf2f5mVKF2Oe0tD8xE0PRK1iN3juqDsuRhbaFWJt1ArY
 mPS+KfqjfUK+dBLYAZHnaZKsdZ1JJ2yl9PXZmKCABImBg5OhdFc0yFN+dOtcGuzsGfi0
 ckcT4yL3yXjLKOOzVOmlMAhVHostrjEsm/xzeSoslBf5Bvg7uzbVPSoMMjP7l1XEGKhW
 pXjtwv2lZakyYkD03z5fOdATbWZ5gAB+wsyXLOZN621YbrTQytGNeyGwrS/WNUHTOKbC
 Vfxg==
X-Gm-Message-State: AOAM5323Y7m+Lxgy7gx4LD7HptxGdDH8g8noqzvxIk1J7jApbRM4k9Yk
 uFlqJ/nUHcow8ocNdFT76SYMnm7ULLBr66S+9RC4lbvbQto1T2uHqj2GeVD+vbJY+xs8snhZASW
 pceaoJzIoXs8WfE/lpxmVVbadaQs=
X-Received: by 2002:a25:3f47:: with SMTP id m68mr4481551yba.316.1632387892665; 
 Thu, 23 Sep 2021 02:04:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1S8uci5olnfjRC4I9gZcnNzF/qYWdnarnzFs4BTy34e6FBygsSs8F4vPWbq+YzzlvADUvdivLWXMfa1vqbe8=
X-Received: by 2002:a25:3f47:: with SMTP id m68mr4481513yba.316.1632387892346; 
 Thu, 23 Sep 2021 02:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <8b4c1fad2914aee00c8a160d1f9e482574b8e5ae.1632242721.git.jstancek@redhat.com>
 <3190c9a0b45411eb9d6024267c264825c9faa32e.1632386756.git.jstancek@redhat.com>
In-Reply-To: <3190c9a0b45411eb9d6024267c264825c9faa32e.1632386756.git.jstancek@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Thu, 23 Sep 2021 17:04:40 +0800
Message-ID: <CAEemH2dPXLDYGktVcuszqhBFk7UENd908vTSj4Vo=L3LqjZAYA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
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
Subject: Re: [LTP] [PATCH v2] hugeshmat04: try to find unmapped range for
 test
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
Content-Type: multipart/mixed; boundary="===============0212654530=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0212654530==
Content-Type: multipart/alternative; boundary="0000000000007598b205cca5ec78"

--0000000000007598b205cca5ec78
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 4:50 PM Jan Stancek <jstancek@redhat.com> wrote:

> The test intermittently fails on ppc64le, when heap
> happens to overlap with segment that the test is trying
> to attach at 1GB boundary.
>
> Try to find unmapped range. In my testing, address above 1GB appears
> to be needed for reproducer to work. Also add kernel commit that fixed
> it to metadata.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000007598b205cca5ec78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 4:50 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">The test intermitten=
tly fails on ppc64le, when heap<br>
happens to overlap with segment that the test is trying<br>
to attach at 1GB boundary.<br>
<br>
Try to find unmapped range. In my testing, address above 1GB appears<br>
to be needed for reproducer to work. Also add kernel commit that fixed<br>
it to metadata.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br></blockquote><div><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &l=
t;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div></div=
><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr">Regards,<br>Li Wang<br></div></div></div></d=
iv></div>

--0000000000007598b205cca5ec78--


--===============0212654530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0212654530==--

