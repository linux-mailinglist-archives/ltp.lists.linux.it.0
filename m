Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB5F2B3D06
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 07:21:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 588513C2E53
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 07:21:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 47FEA3C25C9
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 07:21:27 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 73C786008A3
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 07:21:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605507684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hsHzkLP61Tx9oHf0JzznfWc+30NnuVLEjdjyKKpsYqY=;
 b=Gj0bSmQ6mOxMmf1nP/ifN1s0LPhD84K6dX3kWQ9ahaMB8j1LK/gztH70U/XXu3pRIBO6Nq
 vHPmPclxzTUUHAxUlslwTHlrPyaNzGsktFbdmy79K4E3lydu2JFlm/UL2nSfTNbKAwr3QQ
 o0U/PayRoSx/yq4pFC7FUOu6nhEm+wE=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-HcUB7zXGNIybj-bZiNOyPw-1; Mon, 16 Nov 2020 01:21:20 -0500
X-MC-Unique: HcUB7zXGNIybj-bZiNOyPw-1
Received: by mail-yb1-f198.google.com with SMTP id h9so19447274ybj.10
 for <ltp@lists.linux.it>; Sun, 15 Nov 2020 22:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hsHzkLP61Tx9oHf0JzznfWc+30NnuVLEjdjyKKpsYqY=;
 b=drR/cYtmj6bhmNGjvT4UZ9taeRokE+gb6LOfJ/ZAWSOD8ZS8RN9d9RSaWnpSlFTWMb
 3OToDPCtFn1VDgDSZ6eljZfMnnlHlhuG11wCy7I5UYk4tllhILtZnJqvBil6IG1P8fCL
 jagJcnVNwGZEmQTiU1StMjy3RN1lsZuzCOUKHuxzLEp2QYDtJRXjtNJ2BKeV8lskpVpQ
 KCyupobFYhgQBt3CbpHWjXYdBNGOGi6k3QHBW3gX3Mo1mPl48d0yQSwJ/x6ln10RN5dQ
 pUQQDRJm+nhVUDh5kwWl3OVG3H8er7KNxceL3XcQCTYsL2CAU4KpbDoPymoE8sIwa/j+
 T7Ew==
X-Gm-Message-State: AOAM532yFORCMhfuKhuU5avXD/hbTN195FMGFu5JfVLRM0jX/FsvFrQh
 XJUoDyfzRx68vs5Q97Uc8lEivfSxWx4uhXlOgddxdi566HQAjSEIotqtGkT9SuFAAqiKXeCu/n0
 vp0afmPkzKx9jPxyNkQhxIswkIXs=
X-Received: by 2002:a25:c504:: with SMTP id v4mr16930101ybe.252.1605507679685; 
 Sun, 15 Nov 2020 22:21:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxl10Hi0SP6tAoFi6uZiAWaOqEY4o7m859CSTehPRv4oinUBEe44b85DF9ll3WnOr9I0YDGf+dxXuz89EzZxM=
X-Received: by 2002:a25:c504:: with SMTP id v4mr16930083ybe.252.1605507679388; 
 Sun, 15 Nov 2020 22:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20201103191327.11081-1-pvorel@suse.cz>
 <20201112131139.GA4962@pevik> <20201113170652.GA29443@pevik>
In-Reply-To: <20201113170652.GA29443@pevik>
From: Li Wang <liwang@redhat.com>
Date: Mon, 16 Nov 2020 14:21:07 +0800
Message-ID: <CAEemH2f0UntruTFqPZDxbU=zLsQdFLmKFqtseVhTWWqq175EZg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 00/11] Test metadata extraction
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
Cc: automated-testing@yoctoproject.org, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1163887039=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1163887039==
Content-Type: multipart/alternative; boundary="000000000000ea28ff05b43362e7"

--000000000000ea28ff05b43362e7
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Sat, Nov 14, 2020 at 1:07 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> ...
> > Anybody against pushing whole patchset [1] with fix below for third
> commit
> > ("docparse: Add test documentation parser").
>
> Going to merge whole patchset with diff below
> (https://github.com/pevik/ltp/commits/test-metadata-extraction.v2.fixes).
>
> Can I add you Reviewed-by: tag to whole patchset or a subset?
>

For the whole patchset:
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000ea28ff05b43362e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Nov 14, 2020 at 1:07 AM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
...<br>
&gt; Anybody against pushing whole patchset [1] with fix below for third co=
mmit<br>
&gt; (&quot;docparse: Add test documentation parser&quot;).<br>
<br>
Going to merge whole patchset with diff below<br>
(<a href=3D"https://github.com/pevik/ltp/commits/test-metadata-extraction.v=
2.fixes" rel=3D"noreferrer" target=3D"_blank">https://github.com/pevik/ltp/=
commits/test-metadata-extraction.v2.fixes</a>).<br>
<br>
Can I add you Reviewed-by: tag to whole patchset or a subset?<br></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">For the whole patchset:</div><div class=3D"gmail_default" style=3D"font-=
size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">l=
iwang@redhat.com</a>&gt;</div></div><div><br></div></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><di=
v>Li Wang<br></div></div></div></div>

--000000000000ea28ff05b43362e7--


--===============1163887039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1163887039==--

