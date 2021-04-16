Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49F361A71
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 09:22:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 686243C6F7C
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 09:22:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A47953C1AA5
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 09:22:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 05C941001286
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 09:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618557757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZsM0Y83gSgE6MoWovG3PmBzip0xVD7AcA56gy69Bb9s=;
 b=EXDi5ElOxwlHcT+Tk36q0oL5s4ZQJ9F1XXhDayihm7VxHbj6mXsSJRgQN1IQJYvIjpiuz1
 X4GeI/OwDiab1yCqsrg0+9brYJ26C/JkCc33yBjjcPBF51CVzSJIXbU+mLvyqMFX002TJW
 r1jtaexTC6XgDXN/kE4bsFI40AFwYjU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-SAT9InmvOZq751vuOOrLFA-1; Fri, 16 Apr 2021 03:22:35 -0400
X-MC-Unique: SAT9InmvOZq751vuOOrLFA-1
Received: by mail-yb1-f200.google.com with SMTP id f7so5206705ybp.3
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 00:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZsM0Y83gSgE6MoWovG3PmBzip0xVD7AcA56gy69Bb9s=;
 b=sz+KmGNOBMoePt4JSISaIzdtoK7u5XKp2z1mlwUar2Z1sR5CdA3erB1I9aMxAROeH/
 teUUYilXxk+wZks/NrAbbW/xfSrej6dMbORb8eNGkwp4Uxf9sj8ad8NM+Wta0OrJm5OT
 l6e3YSVFvd4F2P5smml0zMqIcUEj7b+8umwDbYGD1U2pkTh3ZEHyc6RFmfZ1/Zj1JJCg
 JSIYPy+1Oyd5Kkh/xTQePHFO/bfo4C4PHNS9HIPX6tXKCw0qd5MGg45HxnX6NUYqjvsT
 cnmuddu8JncftknrAppg5PMuSTD6AZTWZYk8o1VAfH76p4rZCUrcsZ+QkZcK5LmlNDI2
 D3PA==
X-Gm-Message-State: AOAM532LOJ+hM3dX4buhweq9jEujV0TRHa4Ukgwia+6Eii4TAhtPn/f4
 Mkmpvx+eHRKtWZaEc/RZ7vDXIuTUFwpwlk2KeYFeSCdg9oQkVNwwqhSysM6kl7mdL1eTk+Uw9ma
 r4tbUsxACLH5LnDmonzOr51nKm/w=
X-Received: by 2002:a05:6902:70e:: with SMTP id
 k14mr10703971ybt.286.1618557754546; 
 Fri, 16 Apr 2021 00:22:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyfurkB9juZGb7KZ4Q8d8fhuF73dNls6mcom7OMWzw7ktNbzhe9w90XRBO+W9RztiwC16iIVy2CcyEpn7TImY=
X-Received: by 2002:a05:6902:70e:: with SMTP id
 k14mr10703955ybt.286.1618557754369; 
 Fri, 16 Apr 2021 00:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-5-rpalethorpe@suse.com>
In-Reply-To: <20210412145506.26894-5-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Apr 2021 15:22:22 +0800
Message-ID: <CAEemH2c5i_zj-cm7bZrRAZBkA2gqdR7CtzBoxJWTZxCObMK7Vg@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/7] Add new CGroups API library tests
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
Content-Type: multipart/mixed; boundary="===============0163209768=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0163209768==
Content-Type: multipart/alternative; boundary="000000000000ff766f05c011d701"

--000000000000ff766f05c011d701
Content-Type: text/plain; charset="UTF-8"

>  lib/newlib_tests/.gitignore     |  2 +
>  lib/newlib_tests/test21.c       | 45 ++++++++---------
>  lib/newlib_tests/tst_cgroup01.c | 51 +++++++++++++++++++
>  lib/newlib_tests/tst_cgroup02.c | 90 +++++++++++++++++++++++++++++++++
>

Since test21 is covered by tst_cgroup02, I'd suggest deleting test21.c
directly.

-- 
Regards,
Li Wang

--000000000000ff766f05c011d701
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div class=3D"gmai=
l_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
=C2=A0lib/newlib_tests/.gitignore=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0lib/newlib_tests/test21.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 45 ++++++++----=
-----<br>
=C2=A0lib/newlib_tests/tst_cgroup01.c | 51 +++++++++++++++++++<br>
=C2=A0lib/newlib_tests/tst_cgroup02.c | 90 ++++++++++++++++++++++++++++++++=
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">Since test21 is covered by tst_cgroup02, I&#39;d suggest =
deleting test21.c directly.</div></div></div><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div>=
<div>Li Wang<br></div></div></div></div>

--000000000000ff766f05c011d701--


--===============0163209768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0163209768==--

