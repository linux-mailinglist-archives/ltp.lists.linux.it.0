Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC1F34C144
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 03:50:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1DE03C6122
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 03:50:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1FB603C1A2B
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 03:50:17 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 282B41A0079E
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 03:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616982614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AkCTkE0VywOirX6KeaUm6XrRN6zDnaApumfHzLAafXw=;
 b=Ergo5d/5nnQEulQi9ckshUhm+ahiCjIK30qC/9ihm+DmjqdfNT77F2hood5piw9nCxyoCo
 yHlbrwvc9PMBbfRX1ERdBkYwl9hwpHlsF9rIbEKWS4kFLVd4b5qNzyQVKliEWoMTT3RNQv
 RO6W7YSX1IUpgahvrMML9DkwVJ1yJNc=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-YzUg-kTGO720jyGsoRNr1Q-1; Sun, 28 Mar 2021 21:50:11 -0400
X-MC-Unique: YzUg-kTGO720jyGsoRNr1Q-1
Received: by mail-yb1-f200.google.com with SMTP id n13so17653411ybp.14
 for <ltp@lists.linux.it>; Sun, 28 Mar 2021 18:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AkCTkE0VywOirX6KeaUm6XrRN6zDnaApumfHzLAafXw=;
 b=J78wzAGEu51lPxc38WdwQ2mwhn2gFp/gTwQycYn9dHuAJDCrTo4JfS8rMoDs1ze+1f
 sRbGP/9dWKUYwzR4KLeWsvVdJ642+ESodcZAZUDxsPdn5k23MZCBnwAiAhVIKhtDkfqz
 MPIEzIeuvFJBp7ca4IqD26gTIdbZoAPT0XxVVL0AM00iE7vQowQ3IWPRLFWmmcZQC/rV
 zwlEgTMKumUkqlJ4RBZyCzpjqfGAHte6ZhfHAzl2h4dNsULS8JM1bSwTM8ZTrUvp6XEt
 AXjoJ/jOqwmmQ+MgR/GCiveDfqU7Ntif+pI8F0885xavsDlInS2vv1L1ouHNQOWecnw5
 5Gjw==
X-Gm-Message-State: AOAM531QktmMe0sFcwozGG92xlKBatyIcuXLyvoM1KT930z7QGGCS73d
 eS+VL8b6e5xnvPoutNsLufWPHB3BKGGCpvlbTRQ4D5Bp5nff+P8agMs6egOh8qqnCY2gJVuEcH8
 vmuAby8926keLQw1Jjk1pgQhOKKk=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr35617855ybg.97.1616982610967; 
 Sun, 28 Mar 2021 18:50:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSKWXVq9M0Pixx5sqIMMmNlAqLmvQGglun/sBmxj9UPWADZivRvFzvS8eo8j8eSyh7samWVBaSQO/mhVD1NKw=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr35617834ybg.97.1616982610640; 
 Sun, 28 Mar 2021 18:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210327102344.1620-1-zhaogongyi@huawei.com>
In-Reply-To: <20210327102344.1620-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 29 Mar 2021 09:49:58 +0800
Message-ID: <CAEemH2dDzuXU=YPGVPM8cAuwq5VEHMDtdPimksRsv1AMmE7L_A@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
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
Subject: Re: [LTP] [PATCH] syscalls/shmctl: Using TERRNO to macth errno
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
Content-Type: multipart/mixed; boundary="===============1226473001=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1226473001==
Content-Type: multipart/alternative; boundary="0000000000001d96e305bea31ad8"

--0000000000001d96e305bea31ad8
Content-Type: text/plain; charset="UTF-8"

Hi Gongyi,

On Sat, Mar 27, 2021 at 6:24 PM Zhao Gongyi <zhaogongyi@huawei.com> wrote:

> When "shmid == -1", we need print the errno with TERRNO. It must have no
> error in
> TEST, otherwise it has return early.
>

Right, but it is mostly caused by copy&past.

And, I guess you are working on fix the TERRNO/TTERRNO issues currently,
so it would be great to combine them together in one patch, other than
sending
it one by one separately.

Anyway, I help push this. Thanks!

-- 
Regards,
Li Wang

--0000000000001d96e305bea31ad8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Gongyi,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Mar 27, 2021 at 6:24 PM Zhao Gongyi &=
lt;<a href=3D"mailto:zhaogongyi@huawei.com">zhaogongyi@huawei.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When &quot=
;shmid =3D=3D -1&quot;, we need print the errno with TERRNO. It must have n=
o error in<br>
TEST, otherwise it has return early.<br></blockquote><div><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Right, but it is mostly cau=
sed by copy&amp;past.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">And=
, I guess you are working on fix the TERRNO/TTERRNO=C2=A0issues currently,<=
/div><div class=3D"gmail_default" style=3D"font-size:small">so it would be =
great to combine them together in one patch, other than sending</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">it one by one separately.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Anyway, I help push this.=
 Thanks!</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></d=
iv></div></div>

--0000000000001d96e305bea31ad8--


--===============1226473001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1226473001==--

