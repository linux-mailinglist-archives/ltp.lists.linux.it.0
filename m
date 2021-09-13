Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA37408475
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 08:04:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BB523C86AF
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 08:04:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7591E3C1DAB
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 08:04:46 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 57E4E1A008A1
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 08:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631513083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/acKZOTkKdsjAj48/9sYas3WLzngK1VA3N8O4FaWE6E=;
 b=i72otOSusQobpQEc0pxMwkQtKfucRRVqLw7I1RxMTiWkWiOVDTbHSe3TPRU3MuwoKraYCT
 ZCqy8TP2aXrze/WXciBLowcFoHpMdrztvdXK828CQwcDSNBsGObc5YWAIFyU9DI8lM4AsU
 s7v/o/hZ4JfNWpTvYHcxidsKkFoxlTg=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-KFSbZVGiNKa7fe2q6UWOrQ-1; Mon, 13 Sep 2021 02:04:41 -0400
X-MC-Unique: KFSbZVGiNKa7fe2q6UWOrQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 q17-20020a25b591000000b005a07d27bbdaso11676974ybj.3
 for <ltp@lists.linux.it>; Sun, 12 Sep 2021 23:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/acKZOTkKdsjAj48/9sYas3WLzngK1VA3N8O4FaWE6E=;
 b=KgxWhMom2dbHfmzFxRP5TzC2tLIloIoyOt6se3PMZwmbi8zytK/bztUUIqMMqRdaan
 6/rPUvKIS0QYLeCpiVL9DY91UNtfN3vlcCUNkDPJA4VnmD/rOgCWeYyrxbKUTmpg90zP
 6vUuErxlbmpwWRmQDDN4IZrOAdHaUXq8ws5tfZAu3CkivkwVZEHhuBdn3ZZO6ufOvWsM
 +OfcFwOxsEvujPgd8//u0BexFdE7x4JfHKnG+oFyqk6vTVhGcSfwmlMW9O9l/UQCaIhT
 dnUiXz6fnQ/OM91TvhtKbmktFtQoBuJaHZNk6rUcwWMaZVKZHrTFMfmjMOKf6le3C0lr
 ibUw==
X-Gm-Message-State: AOAM5304R1YLQwRdvT3FlVIeF4LXxdyUFqzai4JW9x8IO0OqSS5IPzxS
 +qw09spQz8LSvCvdwzLfkUOwbarvWCdVpPRimHKaMAbYzhJgi8q5wTueP+Ioi/hpthQY38iPk75
 Kk923eOxcUa0FzdpxbQ3ah03g2cc=
X-Received: by 2002:a25:7c44:: with SMTP id x65mr11930065ybc.186.1631513081221; 
 Sun, 12 Sep 2021 23:04:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtsWwRfbdaJS511DchmQo02vjOeDq+zjbFEmDxkWeyfktZ6BIy3MEBvruhPBVZ6m9ky2prXv6nnenUaMzWEG8=
X-Received: by 2002:a25:7c44:: with SMTP id x65mr11930041ybc.186.1631513080966; 
 Sun, 12 Sep 2021 23:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210910130820.21141-1-pvorel@suse.cz>
In-Reply-To: <20210910130820.21141-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 13 Sep 2021 14:04:29 +0800
Message-ID: <CAEemH2evPtStSndYb0viwt-+x+g4dB3FER366_KEjcRUn7pWYg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH v2 0/7] Cleanup sched/process.c
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
Content-Type: multipart/mixed; boundary="===============0564263764=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0564263764==
Content-Type: multipart/alternative; boundary="000000000000a34d7805cbda3d64"

--000000000000a34d7805cbda3d64
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

The patchset clean-up looks good.
Reviewed-by: Li Wang <liwang@redhat.com>

But I just wondering, is there a run test file to perform this test case?
I greped the runtest/* but find no file currently includes this:(.

-- 
Regards,
Li Wang

--000000000000a34d7805cbda3d64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Th=
e patchset clean-up looks good.</div><div class=3D"gmail_default" style=3D"=
font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.c=
om">liwang@redhat.com</a>&gt;<br></div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">But=C2=A0I just wondering, is there=C2=A0a run test file to perf=
orm this test case?</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">I greped the runtest/* but find no file currently=C2=A0includes this:(=
.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></di=
v></div>

--000000000000a34d7805cbda3d64--


--===============0564263764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0564263764==--

