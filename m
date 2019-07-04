Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBAD5F2C4
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 08:23:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F14C23C1DA4
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 08:23:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 62BC23C1D4C
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 08:23:38 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AE1231A01553
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 08:23:37 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id 8so754005uaz.11
 for <ltp@lists.linux.it>; Wed, 03 Jul 2019 23:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oN5t0MX0rY3sHREMYIjoGuFMmkomq0OxBENL0ekHY7s=;
 b=Yne0N3azl/NjaTuXca2Rq1vMwtJY0KfymjJJeV/WYXAoSVOjXbszRH4B/EHgK8qJK8
 b0ZFIbQHwg+Y1mQ4X0+6jqbMrRpm+HmmIZM+skvSXFKBN3kIAss5TobFqmIFBbREuoI0
 zc6LJxT9uBaNmzW/TQVHlQTayWkd97NOZenAic7jEQhn1k7XdhjMBt8AQibbW2ULizfh
 rWbtSCbADZA4PbuikWHHTNkYTy1WqlpQJmyxGBTYO2LI/H9Bn5euD00wKJ+ZVx6neaSi
 VWAPcxy46VKLZd6B01LAA+HRGtVlbuH+t69bW/WijasgGJCRnk8gNya+XCiu34BpjPZ+
 S3Gg==
X-Gm-Message-State: APjAAAWQHF6T/BFphArublTSyQKXuPgF8LFXxO1je/LYvdSsnCSSlzyJ
 ERejnZQG0jIfyQODtSO18sVBKxjAtaA91XBnqXIG7w==
X-Google-Smtp-Source: APXvYqzjFbyv07aCnOybSshFLXV8ot5Ye9LThzOGznGfEWNdmlUqNhwqAio2cXFT677j0Y9NZqduwDbt9qAc7YGrGdI=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr20269183uaq.106.1562221416645; 
 Wed, 03 Jul 2019 23:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190607095213.13372-1-liwang@redhat.com>
 <20190703131005.GA1712@rei>
 <CAEemH2fGUABOfz=Yq6xONgmHwjaiU6n_q=9EXyZz2EUedpuK8Q@mail.gmail.com>
In-Reply-To: <CAEemH2fGUABOfz=Yq6xONgmHwjaiU6n_q=9EXyZz2EUedpuK8Q@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Jul 2019 14:23:25 +0800
Message-ID: <CAEemH2eMA78=5eNwJnZPJ1kw1GZnimSyBsQ+e_wrAu3E+JOoPg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0859101998=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0859101998==
Content-Type: multipart/alternative; boundary="00000000000099a068058cd504e5"

--00000000000099a068058cd504e5
Content-Type: text/plain; charset="UTF-8"

> iteration, the mmap() will be failed with ENOMEM(since we only have 1 huge
> page in /proc/.../nr_hugepages).
>

Sentence correction:
    It is not "only have 1 huge page in nr_hugepages", I mixed this test
with another case, sorry about that.

But the justification is the same, we don't have enough memory for the
parent does mmap(..., MAP_HUGETLB) in a new loop.

-- 
Regards,
Li Wang

--00000000000099a068058cd504e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><div></div><div><div style=3D"font-size:small">iteration, the mmap=
() will be failed with ENOMEM(since we only have 1 huge page in /proc/.../n=
r_hugepages).</div></div></div></div></blockquote><div>=C2=A0</div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">Sentence correction:</d=
iv></div></div><div class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0 =C2=A0 It is not &quot;only have 1 huge page in nr_hugepages&quot;, I m=
ixed this test with another case, sorry about that.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">But the justification is the same, we don&#39;t =
have enough memory for the parent does mmap(..., MAP_HUGETLB) in a new loop=
.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><di=
v dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></di=
v>

--00000000000099a068058cd504e5--

--===============0859101998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0859101998==--
