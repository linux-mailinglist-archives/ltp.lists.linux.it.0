Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CBE3FC4B3
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:21:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAD023C2ABC
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:21:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DB25E3C2435
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:21:53 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6D5C21400DF4
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630401710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2VGVkVBL0gvqGccMrANxENOYs0CwycIrQDScJ8BI2sg=;
 b=UyEP2GXds4x1mb9Y/Yq0mNrUxKxKOU4RMC24j8rmFJFge9D5Vr4lw/lgotxmAKSKewRhLC
 njq89FIUBpADmikj0Uiq1l9fXBTSg2klXrYbHCBZAkdmMUWloQlg2ljRkhN7NerkKs/gTJ
 FTZ+G9U7ZN3D+hodfdHPLaJYxV7ASKM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-NQNi8G_CMUeB1cBeAt_7uA-1; Tue, 31 Aug 2021 05:21:47 -0400
X-MC-Unique: NQNi8G_CMUeB1cBeAt_7uA-1
Received: by mail-yb1-f198.google.com with SMTP id
 h143-20020a25d095000000b0059c2e43cd3eso5321869ybg.12
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 02:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2VGVkVBL0gvqGccMrANxENOYs0CwycIrQDScJ8BI2sg=;
 b=tMj2Fvrt0ixU8ITqiHmfyj8/0TNIXt17FFjJUjd05AHUsdN4bUkwRwQDlUmjoLyFLf
 wAqtxhaPd1v88lFRk777zXxTwFUwuVWgtv4VFPDcoj3RQuS2yE3kQdwdTOGv2i+pQHY+
 jUQdr/fSlvbVIo4t4jQ1lb1uRNEHAGrb2HK0xG2dxehBoBCyCQPeix9nFegtzojKOVV2
 ClGzauCwuSr1DVt5o3XL5ujRmLAfZrQSemd4xzRucM2XlCdZCafHKHp9irzIc+KrwqoW
 ivzcG2euTejC6Sgr2JpqS574VtaxFynJQEJifM5lnNkJ3rGbtSIQKtFdSvTH9p0WHLN+
 lW/g==
X-Gm-Message-State: AOAM533S81rU/F7hUZWawScAxuef2AO5VxWcMXVuSOkVxINbT2CKCowO
 qc40JLxmrpJrED92ZOub5I2yxjwpRf42nktJ7cmIrwJOuyHhVVR8vChKZ7c1wTzmzJVvZGVgv6V
 4a+vZfzYqMl+0vpVZy8KZoFYFl1E=
X-Received: by 2002:a25:e013:: with SMTP id x19mr29937536ybg.366.1630401706577; 
 Tue, 31 Aug 2021 02:21:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz99fMqPppnhpwgoJoQH92n9Qw+xfsNfb/6Eum8CwOT8nsb474EG6Tp1OwXZD4GIPjiFLdbSTwr1zpwQ/HlS9E=
X-Received: by 2002:a25:e013:: with SMTP id x19mr29937527ybg.366.1630401706429; 
 Tue, 31 Aug 2021 02:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210831061355.15533-1-pvorel@suse.cz>
In-Reply-To: <20210831061355.15533-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 31 Aug 2021 17:21:30 +0800
Message-ID: <CAEemH2fA0uTAfMP37+vqrz-ZgzP9EzDYC6bXRfSLKswYNU94+A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/1] scripts: Remove detect_distro.sh,
 git2changelog.sh
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
Content-Type: multipart/mixed; boundary="===============0588778363=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0588778363==
Content-Type: multipart/alternative; boundary="0000000000008d9e0b05cad77a65"

--0000000000008d9e0b05cad77a65
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000008d9e0b05cad77a65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@re=
dhat.com</a>&gt;</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br><=
/div></div></div></div>

--0000000000008d9e0b05cad77a65--


--===============0588778363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0588778363==--

