Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 818C92AD01C
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 07:57:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AD153C2F53
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 07:57:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 744183C26D6
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 07:57:28 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 0EA8F1400B9A
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 07:57:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604991445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v7MP/bWlFuhyKORWuZnMEVTUv0zcmmzEXWqbQH5Pkk4=;
 b=Bnh+jDGeFb4n5xf6+xVMBe9+pwcFtLSIlwD//WihK93RCnEE9i6/t0MnqyF9xhuEr2rTCD
 PzKE4cam0MwQ0XYHaIvuHIwKaLf7G9OZERFN+rMjm1JhCOJLEs2dNOHiaPQ1vVEXStHDpk
 Q6Ai2YUBX2I1QEH246vlLcll34eUiaA=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-Z20XdmW4P_WDcJwry38BFA-1; Tue, 10 Nov 2020 01:57:20 -0500
X-MC-Unique: Z20XdmW4P_WDcJwry38BFA-1
Received: by mail-yb1-f200.google.com with SMTP id n186so8421717ybg.17
 for <ltp@lists.linux.it>; Mon, 09 Nov 2020 22:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7MP/bWlFuhyKORWuZnMEVTUv0zcmmzEXWqbQH5Pkk4=;
 b=eOUV1uk+ZWeMavvNC/a9QbAQDKxbO51nu/Uzl8f9sbnocm3qiRgpUGj13JEq9Fyxb9
 PCsK956de3RHJxbgrJktpG5Bo63gzcJVf2MzIlXzDHV/14yHWETJWRXQYJTHAchE2klV
 9mQSjh4Xhs/orHXRNivBaCFJjOriq20Ib7Um8YJMMuyynul6neXTILwsABggU8CqXYXk
 HkP1wPp1wZue105kQjdwEwOoSc6hWpe3TlnXp3uX910N0Y48ig8TgFoM6RJs73J3j8KV
 FFEDnkENe4b4oD1sw0UrcYD9s/gpkeAF+sD8U08pfyZbJ8xN4+ubrd0WsTLcK8/Kzucm
 IGXQ==
X-Gm-Message-State: AOAM532nwnSBiYEm49EbBdn9rm2KPq3cy/kS+NNGeJjwww7tHYg79hIX
 a7we3OxDJ+GOEzUfuhIndbOEa3hZYgfiRz2sWoatW/1NodM4l14OflBBRUqw0PpFPjl5LOHyXBV
 857NLyOiTfYrHGaXzrEKko58CSlg=
X-Received: by 2002:a25:7243:: with SMTP id n64mr24143655ybc.86.1604991440230; 
 Mon, 09 Nov 2020 22:57:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbCCpcukHF/YtdrgrSlV4aSlXWjgMmaovQDLndzSRsEAiZx6G5Vf/KU+xWtYyC65x0v4dBTa1us3Ff+jE+TF4=
X-Received: by 2002:a25:7243:: with SMTP id n64mr24143634ybc.86.1604991440031; 
 Mon, 09 Nov 2020 22:57:20 -0800 (PST)
MIME-Version: 1.0
References: <1604317338-22774-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1604317338-22774-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 10 Nov 2020 14:57:07 +0800
Message-ID: <CAEemH2fr0RLmhKnp-1rFaj+QSWjRdNZtt479WrFDi6MxagXDOg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
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
Subject: Re: [LTP] [PATCH 1/2] syscalls/ptrace03: Clean up and converted
 into new api
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
Content-Type: multipart/mixed; boundary="===============1485952246=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1485952246==
Content-Type: multipart/alternative; boundary="000000000000a6a86305b3bb309b"

--000000000000a6a86305b3bb309b
Content-Type: text/plain; charset="UTF-8"

Thanks for the cleanup work, pushed.

-- 
Regards,
Li Wang

--000000000000a6a86305b3bb309b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Thanks for the cleanup work, pushed.</div></div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>R=
egards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000a6a86305b3bb309b--


--===============1485952246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1485952246==--

