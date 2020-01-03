Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352B12F4E9
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 08:24:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21E953C2460
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 08:24:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0E0733C23A4
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 08:24:40 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 35293600C9A
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 08:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578036278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7IBEfEv9tFRS/ab5zkppPN+ez2jO3MrxmeXOMQA3eww=;
 b=XQasOBCDeb7rREQWlHX3rPSARLN2QfJS1KdutKj1Z32mvM8MnFtEkixEa6Lfb1G31dv/TQ
 8eAnAjcOvVieXP+kdcgOTPalcjT8eVyq3j2K6lAbBmsVws1Ud2bOJJ7/0ugwwiovAosPua
 7vE1aBgDHb60xB7MJRpKmc22/wPC0Qo=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-6yX0d_RgPZegyHNlhrHHXQ-1; Fri, 03 Jan 2020 02:24:32 -0500
Received: by mail-oi1-f200.google.com with SMTP id k11so17466031oih.23
 for <ltp@lists.linux.it>; Thu, 02 Jan 2020 23:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLgeDg3FXlkj+l6BZnZGcCDEbayDUfZ7ndur5FlWTN4=;
 b=JHBf/BtGg0sBXCgF02B9zPSdr4E8Fjh1CRzaAuNFg39I52WqzehtrNGkmrDw5bEjlf
 TraMwuFb+W0BCB3mD8dbHY+EHRxR4/mRT0IQUm0oEqGMcIzBaii+OStXftGBqyJs6z2b
 uz4wxOoqpLzQRJCX8LLp1Xh0UU5ph02Zmkyn5slMNsZqsWM6NqtzCML19z0a+MB02P54
 KvZNb9xT3mVomnQCUydO8FOTqbGseNOXianNZVoBV8b1RtaKl0km2rsr4mInnNbuNPsh
 QHS//1Vchi1+1gC5vZOhG2RurPUwE5sKzKjcqF6jOmOrTnC2SVqx2m6mLMbP2g+Pzig8
 Uslg==
X-Gm-Message-State: APjAAAXQsu0GkLU0JGsDxi8P5aOghLcVEg/UWrBqFhjgIOGTqu1/muDn
 dwHaQ3OaA1qNil/ucGJsyP9oOVpOcLx8W/PZ63S7oLpMJukr51N1QnflF3R8w4dOvTDrt/zjLBL
 G5yL8XJIMhYyh79+wXSmlj36CAIQ=
X-Received: by 2002:a05:6830:1cd3:: with SMTP id
 p19mr92540859otg.118.1578036271632; 
 Thu, 02 Jan 2020 23:24:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxC7xNaRIFkk9kTd8ci1wcOlhen/4cSMEt5i4oJlM97zp4Dv4MVCVUNnxIJnzdz1dgqCb2r/6xWrKxHb15Ndc4=
X-Received: by 2002:a05:6830:1cd3:: with SMTP id
 p19mr92540839otg.118.1578036271292; 
 Thu, 02 Jan 2020 23:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20200102015236.7400-1-liwang@redhat.com>
 <20200102125759.GE32710@rei.lan>
In-Reply-To: <20200102125759.GE32710@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 3 Jan 2020 15:24:20 +0800
Message-ID: <CAEemH2fdY_pPjNCEFmcd_zsye4HAciPuhF+Fiyde9WmBci=+Lg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: 6yX0d_RgPZegyHNlhrHHXQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH COMMITTED] tst_device: do sync() before reading
 test block device stat file
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
Content-Type: multipart/mixed; boundary="===============1477520540=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1477520540==
Content-Type: multipart/alternative; boundary="00000000000064c7ce059b3733dd"

--00000000000064c7ce059b3733dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

On Thu, Jan 2, 2020 at 8:58 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > To avoid FS deferred IO metadata/cache interferes test result, so we
> > do sync simply before the tst_dev_bytes_written invocation.
>
> Can we do fsync() on the fd instead of full sync()? That should be
> slightly faster.
>

Probably you miss the previous discussed [1], we use sync() here because we
do want to make sure all FS metadata/cache being written back before the
testing since there is no obtainable file descriptor 'fd' for the ext4
deferred IO (e.g. initialize the journal and inode tables).

If I was wrong here, feel free to correct me.

[1] http://lists.linux.it/pipermail/ltp/2019-December/014792.html

--=20
Regards,
Li Wang

--00000000000064c7ce059b3733dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Cyril,</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 2, 2020 at 8:58 PM Cyril Hrub=
is &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi!<br>
&gt; To avoid FS deferred IO metadata/cache interferes test result, so we<b=
r>
&gt; do sync simply before the tst_dev_bytes_written invocation.<br>
<br>
Can we do fsync() on the fd instead of full sync()? That should be<br>
slightly faster.<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Probably you miss the previous discussed [=
1], we use sync() here because we do want to make sure all FS metadata/cach=
e being written back before the testing since there is no obtainable=C2=A0f=
ile descriptor &#39;fd&#39; for the ext4 deferred=C2=A0IO (e.g. initialize =
the journal and inode tables).</div></div></div><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">If I was wrong here, feel f=
ree to correct me.</div></div><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">[1] <a href=3D"http://lists.linux.it/pipermai=
l/ltp/2019-December/014792.html">http://lists.linux.it/pipermail/ltp/2019-D=
ecember/014792.html</a></div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"=
ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000064c7ce059b3733dd--


--===============1477520540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1477520540==--

