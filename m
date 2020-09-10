Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5B2639EA
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 04:13:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 320443C2D13
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 04:13:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 030D93C224B
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 04:13:49 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 710FF1A006BE
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 04:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599704027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8AdsU5rYJy8eYWseZ4B4KtR4oCJHG7sXkdlnt/D3wvI=;
 b=bJ8HBOVtciv5MT9Ew9c3y6LNvPGqFh9DkYQLc6chOfj2/OOIMDQMiLZqaMjWMOFUxQuzyb
 0KS/GkhDFm7GlRhWhhsy3jr4a0ly9ynRmeJo9ND/6mdUKHmCzt9nipQY3omoeWF14zP7/v
 CsXLxwXp+0LGNqjX4W0NuFCeRAMB5L0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-l8VqtgAvMTGfhfaDbBI1uQ-1; Wed, 09 Sep 2020 22:13:42 -0400
X-MC-Unique: l8VqtgAvMTGfhfaDbBI1uQ-1
Received: by mail-yb1-f200.google.com with SMTP id j20so4004894ybt.10
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 19:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8AdsU5rYJy8eYWseZ4B4KtR4oCJHG7sXkdlnt/D3wvI=;
 b=EsykCFXauwinY+R+aiu9mkFxuMSHiZ67Lw+z15GfJbJSJHyRZvrqAiYmayE2Adpk9n
 cCVP+GiNKtkKht98tTxTPcu5eqXUpq0L/NXJeQgyg5EakXG4l0GQ9s/4XT1TKAUBLoSF
 T8ZbSvyzr2Q0Ck1DbPhM3loe60vGHNlXSRF+OrWMbMNGck/An2jFpdkRbObj8k66okPi
 ZtcWfL/id783Qa6km8ju4mHu2GrLv8WfKzLruD/DPYLrIj0tdxuD9YMmTq4R/oWinFMz
 XgZ9s/Xu2z55FXuyJ2wFZSwunAMUR5H3HSRmsdpkZVc+6a62/6XiyinwOodvQAQ+hmw7
 ee8A==
X-Gm-Message-State: AOAM533K1AhFGuUdNH0D7fwctzWHcUtKaX37QwMalWy2pdfQ5SP4Ttoi
 SNshygkR5dsnGc4ewVmnL6yQxXav7v6sIRPd+1xoevOHt6rLGLFVKArr0ADiinJIT11JYxdoehw
 tq+iQyX4uLtDpFQfNMUqPBg2o2IM=
X-Received: by 2002:a25:d14b:: with SMTP id i72mr9958431ybg.286.1599704022096; 
 Wed, 09 Sep 2020 19:13:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpv0JUHeN+d782xfxtP69S2sGPucaL8bg+wOQlS0/gFnBLjsi76RaBTR+sW5wgQHA2j3MZTctP9LoH1NjXpeY=
X-Received: by 2002:a25:d14b:: with SMTP id i72mr9958414ybg.286.1599704021879; 
 Wed, 09 Sep 2020 19:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200909125753.7724-1-liwang@redhat.com>
 <1322097859.11602601.1599656780160.JavaMail.zimbra@redhat.com>
In-Reply-To: <1322097859.11602601.1599656780160.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 10 Sep 2020 10:13:30 +0800
Message-ID: <CAEemH2ftPnsdaeQeD0Uib-XMVJ9+a_S_MPyEY7iGHGse60oT3g@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [Patch v2] ioctl: take use of TST_RETRY_FN* macro
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
Content-Type: multipart/mixed; boundary="===============1326319271=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1326319271==
Content-Type: multipart/alternative; boundary="000000000000f8641d05aeec1d96"

--000000000000f8641d05aeec1d96
Content-Type: text/plain; charset="UTF-8"

Acked-by: Jan Stancek <jstancek@redhat.com>
>

Pushed, thanks for the review.

-- 
Regards,
Li Wang

--000000000000f8641d05aeec1d96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"=
_blank">jstancek@redhat.com</a>&gt;<br></blockquote><div><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Pushed, thanks for the revie=
w.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--000000000000f8641d05aeec1d96--


--===============1326319271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1326319271==--

