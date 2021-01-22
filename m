Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6CE2FFCEB
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 07:41:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDD8C3C5399
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 07:41:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 379EE3C302B
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 07:40:58 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5EE00200342
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 07:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611297656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/2YEPIjPVx4YTk+sxKEfePWj09OHolylegrYg/ns+Es=;
 b=MNjsM5WdTBe4NZbjL86n+HZkHdNFwVE8swusI9wQUo/d35laIMx/USXZGa8zgHO0T7UKXz
 8jQsqzDNseO4CBwYDHTcVF33yteqQZHMMm0GrrYuz3T8kDX3kpCrcIRtUleb7StfHObhxx
 lOruGh+JGwGogqWVcQtu6BtjGVME834=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-wAP2cF5OMOmVocOoVsjcSA-1; Fri, 22 Jan 2021 01:40:53 -0500
X-MC-Unique: wAP2cF5OMOmVocOoVsjcSA-1
Received: by mail-yb1-f197.google.com with SMTP id 127so4624948ybn.5
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 22:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/2YEPIjPVx4YTk+sxKEfePWj09OHolylegrYg/ns+Es=;
 b=lNkmhyydOMtLwxwAr67q/xrSPKTkGE1AVPd/1GDb6y8Tny46rGUn+NJOzMFnJ3Gtks
 jtvUbjOXJqC4xLq3I2Zq/21FjArEvbgrE0s9oXEj2wuLhVe554eioJiOIzj3Q7fBgZLq
 JUgq/DjdDySBLcxo35oyF7rpSXtDyNWy/10ewaAhbQrCBMx2a4cvgLJInQp5dfd60MPw
 JTRHXq9NaWT290v182jXaJEkVHl+IjgiPItQBjooJRtWHlI6cUNk+TGNCQrmjD1T3eEe
 N1avXRfaOuEPaIRQCv+w4eavDWkUe0EElQx2FmvsGtb3/cJ2CfUebofcyeeg/5UNCJmH
 h57A==
X-Gm-Message-State: AOAM532E0JH4DWhF497WaUddlkxFEhmw9N+yqVXZknYrwwJ75N4tc0+B
 KZBjxlL7zhif/0PfAG11ElmOt0+0KSy51d+cRDWYXCbO5PXgdA8mmXgJQyMgdp639rltbz3wXxo
 AHJ3DWRLEoX20528abGks5/JIcMU=
X-Received: by 2002:a25:1241:: with SMTP id 62mr4807985ybs.366.1611297653016; 
 Thu, 21 Jan 2021 22:40:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzh1rD9h6v5YGJfx2fDABFCT9/PKR5B5cgyI6iTtVH1vrcHZE/YMBFkrrRlHKvthqIGnkgAtoZJBFgrukAGhBU=
X-Received: by 2002:a25:1241:: with SMTP id 62mr4807959ybs.366.1611297652679; 
 Thu, 21 Jan 2021 22:40:52 -0800 (PST)
MIME-Version: 1.0
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
 <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
 <87zh14rrxm.fsf@oc8242746057.ibm.com> <YAgmPjaf8iRn20x2@pevik>
 <CAEemH2cseOGtSem9vhChygLNeYz6E0bVEu+u-UH8agLBoHJo4Q@mail.gmail.com>
In-Reply-To: <CAEemH2cseOGtSem9vhChygLNeYz6E0bVEu+u-UH8agLBoHJo4Q@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 22 Jan 2021 14:40:40 +0800
Message-ID: <CAEemH2e=ySuT+JEoDkF0e0TYeooeZbT0mu4D+47NLjwvsPecnA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] swapping01: make test more robust
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
Content-Type: multipart/mixed; boundary="===============0203082690=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0203082690==
Content-Type: multipart/alternative; boundary="000000000000373c4305b977786a"

--000000000000373c4305b977786a
Content-Type: text/plain; charset="UTF-8"

Hi Alex, Petr,

I'm going to apply Alex's patch after a round of testing[1].
Because giving more time waiting for swap memory to
settle is no harm to test, at least help to get rid of failures
observed on LPAR so far.

But I still think the swapping01 not very precise to some degree.
We probably need to rewrite it someday but currently, I have no better idea.

[1] Running a stress-ng to eat some available memory in the
background, then swapping01 easily hit the heavy-swap issue.
This could be proved that it influenced by deamon allocate/free
memory during testing.

# stress-ng to eat memory after starting swapping01

# ./swapping01 -i 5
tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s
swapping01.c:107: TINFO: available physical memory: 4660 MB
swapping01.c:109: TINFO: try to allocate: 6058 MB
swapping01.c:112: TINFO: memory allocated: 6058 MB
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6021120,
swap_free_now = 4738304, swap_consum(swap_free_init - swap_free_now) =
1282816
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6021120,
swap_free_now = 4746496, swap_consum(swap_free_init - swap_free_now) =
1274624
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6021120,
swap_free_now = 4616640, swap_consum(swap_free_init - swap_free_now) =
1404480
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6021120,
swap_free_now = 4191936, swap_consum(swap_free_init - swap_free_now) =
1829184
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6021120,
swap_free_now = 3339776, swap_consum(swap_free_init - swap_free_now) =
2681344
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6021120,
swap_free_now = 3070336, swap_consum(swap_free_init - swap_free_now) =
2950784
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6021120,
swap_free_now = 2763136, swap_consum(swap_free_init - swap_free_now) =
3257984
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6021120,
swap_free_now = 2377280, swap_consum(swap_free_init - swap_free_now) =
3643840
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6021120,
swap_free_now = 1876544, swap_consum(swap_free_init - swap_free_now) =
4144576
swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init = 6021120,
swap_free_now = 1274432, swap_consum(swap_free_init - swap_free_now) =
4746688
swapping01.c:150: TFAIL: heavy swapping detected: 5075 MB swapped.

-- 
Regards,
Li Wang

--000000000000373c4305b977786a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Alex, Petr,</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">I&#39;m going to apply Alex&#39;s patch after a round of testing[1].</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Because giving mo=
re time waiting for swap memory to</div><div class=3D"gmail_default" style=
=3D"font-size:small">settle is no harm to test, at least help to get rid of=
 failures</div><div class=3D"gmail_default" style=3D"font-size:small">obser=
ved on LPAR so far.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">But I=
 still think the swapping01 not very=C2=A0precise to some degree.</div><div=
 class=3D"gmail_default" style=3D"font-size:small">We probably need to rewr=
ite it someday but currently, I have no better idea.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">[1] Running a stress-ng to eat some available m=
emory in the</div><div class=3D"gmail_default" style=3D"font-size:small">ba=
ckground, then swapping01 easily hit=C2=A0the heavy-swap issue.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">This could be proved that =
it influenced=C2=A0by deamon=C2=A0allocate/free</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">memory during testing.</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"># stress-ng to eat memory after starting swa=
pping01</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small"># ./swapping01 -i=
 5<br>tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s<br>swapping01.c=
:107: TINFO: available physical memory: 4660 MB<br>swapping01.c:109: TINFO:=
 try to allocate: 6058 MB<br>swapping01.c:112: TINFO: memory allocated: 605=
8 MB<br>swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init =3D 6021120, sw=
ap_free_now =3D 4738304, swap_consum(swap_free_init - swap_free_now) =3D 12=
82816<br>swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init =3D 6021120, s=
wap_free_now =3D 4746496, swap_consum(swap_free_init - swap_free_now) =3D 1=
274624<br>swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init =3D 6021120, =
swap_free_now =3D 4616640, swap_consum(swap_free_init - swap_free_now) =3D =
1404480<br>swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init =3D 6021120,=
 swap_free_now =3D 4191936, swap_consum(swap_free_init - swap_free_now) =3D=
 1829184<br>swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init =3D 6021120=
, swap_free_now =3D 3339776, swap_consum(swap_free_init - swap_free_now) =
=3D 2681344<br>swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init =3D 6021=
120, swap_free_now =3D 3070336, swap_consum(swap_free_init - swap_free_now)=
 =3D 2950784<br>swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init =3D 602=
1120, swap_free_now =3D 2763136, swap_consum(swap_free_init - swap_free_now=
) =3D 3257984<br>swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init =3D 60=
21120, swap_free_now =3D 2377280, swap_consum(swap_free_init - swap_free_no=
w) =3D 3643840<br>swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init =3D 6=
021120, swap_free_now =3D 1876544, swap_consum(swap_free_init - swap_free_n=
ow) =3D 4144576<br>swapping01.c:135: TINFO: DEBUG-INFO: swap_free_init =3D =
6021120, swap_free_now =3D 1274432, swap_consum(swap_free_init - swap_free_=
now) =3D 4746688<br>swapping01.c:150: TFAIL: heavy swapping detected: 5075 =
MB swapped.<br></div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br>=
</div><div>Li Wang<br></div></div></div></div>

--000000000000373c4305b977786a--


--===============0203082690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0203082690==--

