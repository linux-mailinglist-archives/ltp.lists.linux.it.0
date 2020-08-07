Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DA823E766
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 08:42:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E339A3C31E8
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 08:42:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 72D3A3C2622
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 08:42:10 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 7D5E56018A3
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 08:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596782527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aiwfzSEsJ+9Gr0ftPx8YHSy7K6aLSXzMYy7DLGv5WRc=;
 b=ANxdliRCxWnDpYW2K3+P28trgey0F5/8dD4mclbL6lv5mn2FkMmcq4lM1xrZyVK0kzZg7o
 FgNpBjBa6dArdJFHFvKkdBvUVR8FuGyQrlyPg5be943vd980fDCx6/mnPdotEBwZqnKTVr
 AIBiB/qoWa2Tvb1lUXEi2zZ4umEcyNE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-FjaVXf-7OYCRdicpRkvrZA-1; Fri, 07 Aug 2020 02:42:05 -0400
X-MC-Unique: FjaVXf-7OYCRdicpRkvrZA-1
Received: by mail-yb1-f197.google.com with SMTP id n21so1541896ybf.18
 for <ltp@lists.linux.it>; Thu, 06 Aug 2020 23:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aiwfzSEsJ+9Gr0ftPx8YHSy7K6aLSXzMYy7DLGv5WRc=;
 b=C8c3niNfOY+tRN+5QMRAIHaoTDKgpXulxZzuqssSa41XBaHNAHKd2+tuoJwcYKoKQW
 IZwKfBbfjLZbI1OExmEca1GOOAqkAVIcOdminbLRmwYjYCtO+6ynglX1ztsJqtCNKliQ
 XKm+QLS3ZNonpV57LIja0tqcj+XDqblONk2c/tnUuMN/CuLTPcOgkbJ9Y4kIfa9telK3
 TYhEAi88j1rO6I7YWUu2RbmR01lJDScFvf6/qNbfxkJPfr8NmtXxNme12AHiianonEkT
 yadLWjsSI1y9EmxDmGcKEMlwL9hGgPv9wwDxzny34lBEKxo9OV2f/x5kX91DSrKcdXkA
 M2og==
X-Gm-Message-State: AOAM532U3NI601euFe6zcA8zVhZXgDBS1kUfgVqGGALbBN6GUs+Z18i1
 ipLtk81oH3929ZliqKJh0mvPAWA9zIxXgG9tjZ4cfQv0px+/dS9Dvibi2YYZ0ayW5Cp609e4SVH
 dKTX5UAu4kerzRwnCqitrhrzdEQI=
X-Received: by 2002:a25:414:: with SMTP id 20mr18012522ybe.97.1596782524597;
 Thu, 06 Aug 2020 23:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEJI99rH32anwV1bRTJcm1GyPCHlwrsKo8DYjASeKu+PzUOETvi7VuYcyPeIRvJkxqkPgQdf+TH8mQQnEXltM=
X-Received: by 2002:a25:414:: with SMTP id 20mr18012506ybe.97.1596782524356;
 Thu, 06 Aug 2020 23:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200806162356.16920-1-mdoucha@suse.cz>
In-Reply-To: <20200806162356.16920-1-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 7 Aug 2020 14:41:52 +0800
Message-ID: <CAEemH2c0xkd8HwQ9NP8BdL3309wgbk-q+giWbdJfQoJdHBHCyg@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Drop the mem01 test
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
Cc: Michal Hocko <mhocko@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0835329215=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0835329215==
Content-Type: multipart/alternative; boundary="00000000000025f02d05ac43e7a5"

--00000000000025f02d05ac43e7a5
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 7, 2020 at 12:24 AM Martin Doucha <mdoucha@suse.cz> wrote:

> The mem01 test often fails on PPC systems mainly because it doesn't take
> into
> account page sizes larger than 4KB. Test scenario review revealed that it's
> not particularly useful because it doesn't have any more specific goal than
> filling large amount of memory and the hardcoded allocation limits are too
> low for modern and future systems. The useful part of this test mostly
> overlaps with coverage by existing OOM tests.
>

Agree, we also use some other memory eater or stress tools
do the same testing, this mem01 test way looks not very necessary and older.

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--00000000000025f02d05ac43e7a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 7, 2020 at 12:24 AM Martin Doucha &lt;<=
a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">The mem01 test often fails=
 on PPC systems mainly because it doesn&#39;t take into<br>
account page sizes larger than 4KB. Test scenario review revealed that it&#=
39;s<br>
not particularly useful because it doesn&#39;t have any more specific goal =
than<br>
filling large amount of memory and the hardcoded allocation limits are too<=
br>
low for modern and future systems. The useful part of this test mostly<br>
overlaps with coverage by existing OOM tests.<br></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">Agree, we als=
o use some other memory eater or stress tools do=C2=A0the=C2=A0same=C2=A0te=
sting, this mem01 test way looks not very necessary and older.</div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">Reviewed-by:=
 Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;=
</div></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div=
></div></div>

--00000000000025f02d05ac43e7a5--


--===============0835329215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0835329215==--

