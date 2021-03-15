Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ABA33AAB8
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 06:24:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 161283C4E39
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 06:24:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BAEB73C25EB
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 06:24:07 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 45EC410009F9
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 06:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615785844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pxUr+AxPokQAQ3eQ435UoEjiP85NxzakrFiIGcFYiUY=;
 b=jG4ZAJ8TRDVYDcKI2E24vDONCX+J5hw9JI5Xx2vPkDZvKAPO3JS8DhzuwZGuNE2rJDjdrz
 8sIip7r6SCSIfTLDjG0LcNa1hkKmdLbLa4MIQvQ5voxXYwEG1CbV3PoK9wt2h7cSLrfpOv
 f1A8uFqo5y5odORYRtcnR8YaJ5yYqjc=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-PeVyTqW6OBS_oTR-H8_vjw-1; Mon, 15 Mar 2021 01:24:01 -0400
X-MC-Unique: PeVyTqW6OBS_oTR-H8_vjw-1
Received: by mail-yb1-f199.google.com with SMTP id y7so36840199ybh.20
 for <ltp@lists.linux.it>; Sun, 14 Mar 2021 22:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pxUr+AxPokQAQ3eQ435UoEjiP85NxzakrFiIGcFYiUY=;
 b=A77qWu2hc6j6YB49nOmDNR1StXAnVqi4aPkfvCfStzAO3qsI/2koSKutEe4ErsaVNr
 OdERZSvexS6cerP8nFjlpBXz3NZxfkDFbG2+8bcBh3g/BSpFafB7dR7AqOoMgvrv74ur
 QqQIks2+ulbhnPbYPHFNsGOAy4n8QloaQKZTF0cCiYFRdl39EJwNQt3+NT2Nfyl67rhs
 h/K+kFxPIbSQB/7FPEwvKtaSgSdKw43WA3QkMhjvL8VY/8pRGWG9fFXcAcekcQHr90Pk
 We318ve5I1jExgTIYKfEZur3FSN7CqFB4GwosMIB1QOREO1SNarRc2HArKgb+poW2a7P
 mMgQ==
X-Gm-Message-State: AOAM532R698RKIPE5EMH9I+Wo7fdUE81wmlRJH7ZPMkZ8hoFIxYPcvsA
 aW7CWYqapFGTe12ZqLkIOcR6aH9tZ6ygEBG2b8mGF4NeLOZNtNYebmnyQedtIt51ECTUr+9mxfI
 yf1khzYqcPjxn83p/E1weXK/k5nM=
X-Received: by 2002:a25:1485:: with SMTP id 127mr36733888ybu.243.1615785840441; 
 Sun, 14 Mar 2021 22:24:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvcfEzDZhd54Q+QHLvCfJ6f7yUNeL6GqrtL8m9Ir4VkoQKY2SIU3ssIYIa/LdM6O8YrLwaUMGfJKOT+YGwotU=
X-Received: by 2002:a25:1485:: with SMTP id 127mr36733875ybu.243.1615785840295; 
 Sun, 14 Mar 2021 22:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210312173201.27708-1-pvorel@suse.cz>
In-Reply-To: <20210312173201.27708-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 15 Mar 2021 13:23:48 +0800
Message-ID: <CAEemH2fLdFSFt99Lgn=4o4=MMNvd_0UNMaObSF=E13Jv+358LQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH 0/3] shell test timeout handling
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0690894532=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0690894532==
Content-Type: multipart/alternative; boundary="0000000000000b5bb705bd8c750a"

--0000000000000b5bb705bd8c750a
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 13, 2021 at 1:32 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> changes before previous attempt [1]
> * _tst_kill_test() (Cyril)
> * added test timeout03.sh
> * update trap message (Joerg)
>
> NOTE: we have no way to print summary from _tst_do_exit if cleanup get
> stuck, but IMHO there is no simple way how to solve it (we'd have to use
> mapped memory to increment counter also in shell API as Cyril suggested)
>
> [1]
> https://patchwork.ozlabs.org/project/ltp/patch/20210301220222.22705-7-pvorel@suse.cz/
>
> Petr Vorel (3):
>   tst_test.sh: Run cleanup also after test timeout
>   test: Adding timeout03.sh for testing _tst_kill_test()
>   zram: Increase timeout according to used devices
>

Nice work!

For series:
Reviewed-by: Li Wang <liwang@redhat.com>


-- 
Regards,
Li Wang

--0000000000000b5bb705bd8c750a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Mar 13, 2021 at 1:32 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
changes before previous attempt [1]<br>
* _tst_kill_test() (Cyril)<br>
* added test timeout03.sh<br>
* update trap message (Joerg)<br>
<br>
NOTE: we have no way to print summary from _tst_do_exit if cleanup get<br>
stuck, but IMHO there is no simple way how to solve it (we&#39;d have to us=
e<br>
mapped memory to increment counter also in shell API as Cyril suggested)<br=
>
<br>
[1] <a href=3D"https://patchwork.ozlabs.org/project/ltp/patch/2021030122022=
2.22705-7-pvorel@suse.cz/" rel=3D"noreferrer" target=3D"_blank">https://pat=
chwork.ozlabs.org/project/ltp/patch/20210301220222.22705-7-pvorel@suse.cz/<=
/a><br>
<br>
Petr Vorel (3):<br>
=C2=A0 tst_test.sh: Run cleanup also after test timeout<br>
=C2=A0 test: Adding timeout03.sh for testing _tst_kill_test()<br>
=C2=A0 zram: Increase timeout according to used devices<br></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Nic=
e work!</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_quote"><div class=3D"gmail_default">For series:</div=
><div class=3D"gmail_default">Reviewed-by: Li Wang &lt;<a href=3D"mailto:li=
wang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt;</div></div><fo=
nt color=3D"#888888"><div><br></div></font></div></div><div><br></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,=
<br></div><div>Li Wang<br></div></div></div></div>

--0000000000000b5bb705bd8c750a--


--===============0690894532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0690894532==--

