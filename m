Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C02ED30EC96
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 07:42:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C2123C711F
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 07:42:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id AA5643C4F48
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 07:42:27 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 3D9A1600BE6
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 07:42:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612420945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ogs+BMtQEPzajzZ5Swrb/UKWA8CNDvJmM+1C9fdc2PA=;
 b=WosMOpq9jikb42rLuhZa1/xLQBpLV50WpMJVuDAGo0HdOPX0724G3w/E7LDnkJuOvteUPg
 rGL6WdFTQCV8Hm+uuJN+4cRWxdF2nosJjMPJm8EIhQnUbPBaSdoyLWxaqT4KUN9y8VIh4O
 WIbAkfttE4uVDdzfo+Wz9yLU3kALEMg=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-W3NfsEa9PEmTYfZlyV3ESg-1; Thu, 04 Feb 2021 01:42:22 -0500
X-MC-Unique: W3NfsEa9PEmTYfZlyV3ESg-1
Received: by mail-yb1-f198.google.com with SMTP id c13so2451001ybg.8
 for <ltp@lists.linux.it>; Wed, 03 Feb 2021 22:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ogs+BMtQEPzajzZ5Swrb/UKWA8CNDvJmM+1C9fdc2PA=;
 b=NXdIomRUNPOkZCPPJtJA597gKESaEM8CjCkjpOf0tP7x0iPUh5fLRKuZKQuUV9eYcx
 FVhESTaQZRHtVSBTZRaglE5GlocUGvlT5+W65qd/Sl2cFMXYGB8lT195PvKaXNmWP90P
 G/8vF97EipXQIgDkPjzHBrjzme0mnAtzzGyKL4cfdSI8BQeMpVZocj4X820MiilE5Dv9
 JcvE92awVbto2aORhX2ejGObtLeFTrHXJxe/ogSTl1CKM2yl347xwGc04kQbrdwuF1+n
 QjYhjjN/KzAf9Bu8tAprg48jIt1zjMkktOtymlzbBBeDdFZq9RgwOH+zFDSCvEGyZi7b
 mVwA==
X-Gm-Message-State: AOAM533Fb0f9YAez6f4EG1YZ7tob4IPdLtF1lVP51VzXlfX/HMG5EKwT
 Vw0tGU8tykKWho1yF8MmQLPGhP+hgtdS012NFPiOG1pkDiTUZDkvgoFGD7/lpQMJtqgFVAuRCTH
 WCY9DljuA6A5I7WgGb+YUR6eFJmI=
X-Received: by 2002:a25:aa03:: with SMTP id s3mr10390644ybi.243.1612420941427; 
 Wed, 03 Feb 2021 22:42:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfyQsdikIJQnvvLbB+Yl0h8uR2QVLnGOL+zmKdCj6Sy7eyqHxzgJ5KvUJR5Z3l36G4xjw5iIyvolXcOA/GDvw=
X-Received: by 2002:a25:aa03:: with SMTP id s3mr10390633ybi.243.1612420941283; 
 Wed, 03 Feb 2021 22:42:21 -0800 (PST)
MIME-Version: 1.0
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Feb 2021 14:42:09 +0800
Message-ID: <CAEemH2f++GH=b29S_Y3CV8MPtunFnZdz=fTEWoXpKe0sACXXYA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
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
Subject: Re: [LTP] [PATCH v1 1/3] syscalls/mallinfo01: Add a basic test for
 mallinfo
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
Content-Type: multipart/mixed; boundary="===============0731348543=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0731348543==
Content-Type: multipart/alternative; boundary="0000000000006f1a9c05ba7d0105"

--0000000000006f1a9c05ba7d0105
Content-Type: text/plain; charset="UTF-8"

Hi Xu,


> +static void
> +print_mallinfo(const char *msg, struct mallinfo *m)
>

What about moving this print_mallinfo() into a mallinfo_common.h file
to avoid the duplicated code in each test?

-- 
Regards,
Li Wang

--0000000000006f1a9c05ba7d0105
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><div class=3D"gmail_quote"><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
+static void<br>
+print_mallinfo(const char *msg, struct mallinfo *m)<br></blockquote><div><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">What about =
moving this print_mallinfo() into a mallinfo_common.h file</div><div class=
=3D"gmail_default" style=3D"font-size:small">to avoid the duplicated code i=
n each test?</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div=
></div></div></div>

--0000000000006f1a9c05ba7d0105--


--===============0731348543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0731348543==--

