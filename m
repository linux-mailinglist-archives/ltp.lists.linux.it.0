Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6BE21046B
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Jul 2020 09:04:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31ABE3C56A5
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Jul 2020 09:04:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 55ABA3C2481
 for <ltp@lists.linux.it>; Wed,  1 Jul 2020 09:04:31 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A7D4D1401273
 for <ltp@lists.linux.it>; Wed,  1 Jul 2020 09:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593587068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zzj+PqMiW3eqNnvWm18/D+ijGz2mm4XSxHvJSwr9NsM=;
 b=D01uq/nkVf6n5pOYB9wtS3YcaU6EHDVJAZED/RQ+PrgUDx11Bg3aVX36X2Wu2dHwh/Xyhu
 pUxcpUsyB5dOTBqKc+3orUEuY/5OqvxYiYiEf2B/yecIpuuhoC2j9rH4rLsrCSukkZ2obF
 WZDQpptr7dp0w9DW0fYd1ttNa0/Bl/4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-6a2VnVKeN6i4ND13wlEP1w-1; Wed, 01 Jul 2020 03:04:25 -0400
X-MC-Unique: 6a2VnVKeN6i4ND13wlEP1w-1
Received: by mail-lf1-f72.google.com with SMTP id u24so12858398lfl.23
 for <ltp@lists.linux.it>; Wed, 01 Jul 2020 00:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzj+PqMiW3eqNnvWm18/D+ijGz2mm4XSxHvJSwr9NsM=;
 b=LfJTuLFt05WRo1WvSFSo4n/yob7M1Hmn4eVhZKk0kblfHRRBznHQeOodn9r3xxeON8
 M8hOcvgrEjsKMopyCmF2crF/0FqxiPdW4hBRVoBs7sJHW3LlJy2ZP/YZJtWRkxtukjFD
 j+shsqRO2lCNWk3b5YHo0J4Gswpjd+G63RvXxPbIMfzRyxxEBTIT6SQzpO0lkXWNojZz
 LhLA7d8GBNO3LX//zFEbglh5K6Gl7Ei7ZANdOXmqeXKyoUPgV/D5UbLdG8s3SMQCyQu5
 2dgh+NsQPgZjRu5GkAv+mH/foleuKGRLXujW53NyE+dZHQdZnx2Eu+Y0DktS5kiPvV+3
 rurQ==
X-Gm-Message-State: AOAM533vqOe1nHFuG8I823VRA87wMmvZwfXA81Q28x1ssM6Ez5l8hPrv
 rVF7TLbvFguS2Bw2brICr63D+k3yFlDwFCwQ3aIH19e7m+8b0hVDFEfUC+v0iAhb5WtjQbA7RyM
 XXn19c9PYzBg632QhqKon7+ImBvg=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr13371866ljc.100.1593587063683; 
 Wed, 01 Jul 2020 00:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXnTbYrZytpltkTBxcuBJAKNEQWmLvhM5NXZZ1WoeO/vnzhfyeX2CcmbVbVS4ocjoAY+byMpxSu6CjRTgAZbs=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr13371851ljc.100.1593587063378; 
 Wed, 01 Jul 2020 00:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <BMXPR01MB2344F43177589233AA67FF27EE6F0@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB2344F43177589233AA67FF27EE6F0@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
From: Li Wang <liwang@redhat.com>
Date: Wed, 1 Jul 2020 15:04:11 +0800
Message-ID: <CAEemH2df0KiCNmBqJqTHaBrL5rpO7Q4q4+4snAREvpzUAPGAzw@mail.gmail.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Memcg testcase failure
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0001809687=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0001809687==
Content-Type: multipart/alternative; boundary="000000000000d4ebf705a95be674"

--000000000000d4ebf705a95be674
Content-Type: text/plain; charset="UTF-8"

Hi Pankaj,

It has been a known issue there for quite some time, I will take a close
look recently, if I can figure out the problem will let you know. Thanks!
https://github.com/linux-test-project/ltp/issues/326

-- 
Regards,
Li Wang

--000000000000d4ebf705a95be674
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Pankaj,</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">It has been a known issue there for quite=C2=A0some time, I will take =
a close look recently, if I can figure out the problem will=C2=A0let you kn=
ow. Thanks!</div><div class=3D"gmail_default" style=3D"font-size:small"><a =
href=3D"https://github.com/linux-test-project/ltp/issues/326">https://githu=
b.com/linux-test-project/ltp/issues/326</a><br></div></div><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></div></div>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br><=
/div><div>Li Wang<br></div></div></div></div>

--000000000000d4ebf705a95be674--


--===============0001809687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0001809687==--

