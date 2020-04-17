Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B09D1ADCD8
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 14:04:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB5BA3C2ACF
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 14:04:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 953433C2AB4
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 14:04:02 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 1637C1400BF2
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 14:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587125040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yVZ/S0Y6tUqD38k/Z3gELHDfh5lemcW0mhmNyjVK/VA=;
 b=foucAuDTKPDS++ngLeDeg+BG83mdXvhsRYAkIWruJfVXKnQEA5FVOSflNNOr/3lEK6XaPI
 TPjYgIYJXq40gsE7D/lRXpesHg7GGyEbVY0nJJBO4oKKh4dUJ5BPruFpuV7mGAJlXXKM1q
 keNe4dXbYqI6PFyn5vgQ1YSA1V/MJpU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-mBzo1girM5iC0rLSB8-DCQ-1; Fri, 17 Apr 2020 08:03:58 -0400
X-MC-Unique: mBzo1girM5iC0rLSB8-DCQ-1
Received: by mail-lj1-f200.google.com with SMTP id e6so248316ljj.5
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 05:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=58w+zwsIt7Mjmx3E+QBjigqE7lO4KyaRDdgLiGOWVD4=;
 b=KbrRrPkqdohOCv2AGTO4e0HPXKTZCGI53/R1cIIasKo6JayPUSy2IV6rpJMssABgPG
 6YxJU3K6gG8ckUB9bvCrTOZS83/+K/X6L6cNls/VlE2MQB3IDMsFzKfXieSWdDn0B4zs
 ZhBmzRqqZXY3nMckhDM+m38s8Va8L5cCLSIrQbB8dik/jSguMBICTQi0Y4ktx315k/Kq
 PY27Oe+to0osgLpfzD213znEHVv/F/wGnf7aRMiJAihst0M76AVqebrd4+qWTQwif3x8
 WaPjHYyPi3HKNEPKt1Z67iZ8EhGnwrGLUKUIr3WzwrLO/PJvKkttgChWp3y1eJGZ7/My
 izSA==
X-Gm-Message-State: AGi0PuaG5Fy4jTUWSzanaSnl7opUAxgtA5f1jH6Dp1caVXTezrBncwyR
 N0SXncyGLRJ69WgNumDPvzgHv9CAvZwdzHvfgrSSSjA31q5v4eF9VsYVtow9/aVKfKeAYWEqdxL
 9NIPFAVlLYr2IVT9nQJ5/xFQE4C4=
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr1812065ljj.120.1587125037168; 
 Fri, 17 Apr 2020 05:03:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypIIRYui0s5e5UQK06p72sC9Og/rNpZyqH9SwhYxwuMw+UCLWoBqAtUB75rswzY1fayvqOcBhaJsYoY9t8Ejq+k=
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr1812055ljj.120.1587125036964; 
 Fri, 17 Apr 2020 05:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200409211255.1357-1-laniel_francis@privacyrequired.com>
 <7c9e27de-aaff-98ea-4e00-2c242f7a0cc3@cn.fujitsu.com>
 <f8f3aea3-5371-a8b5-09dd-1200d9dc6d72@cn.fujitsu.com>
 <CAEemH2dzt4Hi7HDyO4Spn_i3naJbhQ5GwpZVCk3BgkdaL5uNWg@mail.gmail.com>
 <c4118b86-b364-1355-3bf4-602a9ae0c5bc@cn.fujitsu.com>
In-Reply-To: <c4118b86-b364-1355-3bf4-602a9ae0c5bc@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 17 Apr 2020 20:03:45 +0800
Message-ID: <CAEemH2d59S0StA6q-r2w4xYrdqDpHxu9zqzJH5uiEk4H4eeVJw@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Add new test for pipe2 with/without O_NONBLOCK mode
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
Content-Type: multipart/mixed; boundary="===============1826659067=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1826659067==
Content-Type: multipart/alternative; boundary="0000000000000afc0905a37b58a8"

--0000000000000afc0905a37b58a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu, Laniel,

Patchset changed as the following and pushed:

  * [1/2] move safe_pipe2() to tst_safe_macro.c
  * [1/2] remove cleanup_fn callback from function
  * [1/2] replace tst_brk() by tst_brk_()
  * [1/2] add flag in the print message
  * [2/2] rename to pipe2_04.c
  * [2/2] remove useless status variable
  * [2/2] code indent cleanup

@Laniel, remember to use '-s' in the git-commit command next time, then it
will help add the Signed-off-by: automatically.

--=20
Regards,
Li Wang

--0000000000000afc0905a37b58a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu, Laniel,</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Patchset changed as the following and pushed:</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">=C2=A0 * [1/2] move safe_pipe2() to tst_safe_macro=
.c</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 * [1/=
2] remove cleanup_fn callback from function</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">=C2=A0 * [1/2] replace tst_brk() by=C2=A0tst_b=
rk_()</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 * =
[1/2] add flag in the print message</div><div class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 * [2/2] rename to pipe2_04.c</div><div class=3D=
"gmail_default" style=3D"font-size:small">=C2=A0 * [2/2] remove useless sta=
tus variable</div><div class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 * [2/2] code indent cleanup</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">@Laniel, remember to use &#39;-s&#39; in the git-commit command =
next time, then it will help add the Signed-off-by: automatically.<br></div=
></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br=
></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000000afc0905a37b58a8--


--===============1826659067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1826659067==--

