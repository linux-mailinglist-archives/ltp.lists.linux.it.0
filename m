Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB97173208
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 08:47:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D0B03C6AC4
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 08:47:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 711563C1CFB
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 08:47:40 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E8F5114060CD
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 08:47:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582876058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yp6NsYeDwMiG5LSZwIBAMtD7+64vB4A2eugrrytfpE0=;
 b=Qyxt+eaT0k4qxceMH1s5ld+NWuyMr7FgovpLgBnO2VLrr3NVZmJmSob8johzkRWayIo/LO
 EHAoqHXhSbQPD5Jx9teDo3MzAt/qu5LmLtsRViu+IGiXXGXVxikggwh1wBS/ehbCn9QjFB
 e+QmvVrhm/lMl3TxQMU3w8j9aGLnFcE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-gXb1341OM5CpOu8QB0L5BA-1; Fri, 28 Feb 2020 02:47:33 -0500
X-MC-Unique: gXb1341OM5CpOu8QB0L5BA-1
Received: by mail-oi1-f200.google.com with SMTP id h3so1102238oib.5
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 23:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vp3AtjV95h+A9f5bAP+uwYHhXZulnnbHMDe9O/yVSHs=;
 b=YK46nwYcRKnC6ZGXVjYX8OLTB2WRxqC06KCh6+l00zJlSIaj/YYbEMFNANOcBj4D5f
 TKBv2ZHF3vxhpaG0Y3OuhfhjNg92uLnNJv1OO/H/cFMOBjIcRgngyHviQV3rG4/m4EhS
 HXVqbtFuapTEiRjYzxU5JmGa5j+SK6lNRq6Pk/7kWD6ZBhTyAYoR5fD7nHvadOSEIAOq
 miR2XhUWfKzGXwdW0KN2j33T0vsw9ZenmlBleO4nLUYEki+nlxsQGsG7R8RGzKJMNwNu
 MlBf2m7602ss++R+dAllfHl9nY3dpj1cCKV9EPk3BVdHKNo3qqxDgXZS1cQ9y4WRfoUN
 IKtg==
X-Gm-Message-State: APjAAAVDcLK2wAnrC4mDWqQ7Fb7b8tLBPo8xN+bLaEToMxqWmLiplozJ
 re2nuZil+WLVeOL7QV/YINA5IvJjrgDh43O7QxiYTURQti1RWBkDcJBA9MEqjatDIqDR4DUKI7D
 ILDvZNYYZtPevQBM5p7bw6BKEVvk=
X-Received: by 2002:a9d:395:: with SMTP id f21mr2287706otf.67.1582876052037;
 Thu, 27 Feb 2020 23:47:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqwh9+FnszJ6eYe31knDtXp6eFzUrlPqiR558UsSTenvU+/2xcR+GIIVRYcV1G4EoY6YVOWZOJ0pRGpViR6gy0Q=
X-Received: by 2002:a9d:395:: with SMTP id f21mr2287700otf.67.1582876051833;
 Thu, 27 Feb 2020 23:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20200227163922.317-1-pvorel@suse.cz>
In-Reply-To: <20200227163922.317-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 28 Feb 2020 15:47:20 +0800
Message-ID: <CAEemH2fQ_oc8iEaKQV9pJgbfeOoq3yT7hqcGCmWK2JwMeRkzCQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] Avoid using tst_res(TBROK)
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
Content-Type: multipart/mixed; boundary="===============1954229120=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1954229120==
Content-Type: multipart/alternative; boundary="000000000000cb1998059f9e0c0f"

--000000000000cb1998059f9e0c0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

This patch looks good.

But something wrong in patch applying, you probably need to do git rebase:)=
.
    error: patch failed:
testcases/kernel/syscalls/gettimeofday/gettimeofday02.c:48
    error: testcases/kernel/syscalls/gettimeofday/gettimeofday02.c: patch
does not apply

--=20
Regards,
Li Wang

--000000000000cb1998059f9e0c0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">This patch looks good.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>But something wrong in patch applying, you probably need to do git rebase:=
).</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=
=A0 error: patch failed: testcases/kernel/syscalls/gettimeofday/gettimeofda=
y02.c:48<br>=C2=A0 =C2=A0 error: testcases/kernel/syscalls/gettimeofday/get=
timeofday02.c: patch does not apply<br></div></div><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr"><br></div></div>-- <br><div dir=3D=
"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div><=
/div></div>

--000000000000cb1998059f9e0c0f--


--===============1954229120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1954229120==--

