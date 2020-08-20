Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3240024AF23
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 08:16:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C41813C2F9F
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 08:16:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 459EE3C0515
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 08:16:24 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 35C1D1A0066B
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 08:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597904182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rf4xHKcrlQLpcdr5HWlcT6kMoLSqnvqxpXt1N8fr5QM=;
 b=ball6DkFlizEwzRBqZ4rhF34fUepPTx5V0O+rghYfy+ZkmOLmodY5zIXhOsxI3A3Cjf02d
 GRfn9miOadIhZBKsY1iQRxPb/QN7v8OSN9cMC+iMg9XM0Cm0UWNlyKgfIh+Fm2s8LyAThc
 +8bbfNitsgHWDcg40KREg01YlLxTe4E=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-xABpntj8ORSWU4lE1efNNA-1; Thu, 20 Aug 2020 02:16:20 -0400
X-MC-Unique: xABpntj8ORSWU4lE1efNNA-1
Received: by mail-yb1-f197.google.com with SMTP id x6so1196761ybp.10
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 23:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rf4xHKcrlQLpcdr5HWlcT6kMoLSqnvqxpXt1N8fr5QM=;
 b=ZPfoE6/hqm5ytDTm4jnm2SdjiEMGJAUlokyXOWelFpcpDiQlgDJwqAx6VnL/KLJ7Q8
 HRPxkv1QuTUi4N0kLbqwBSERBr2XlgqhX8ZGqNaZddDsJ+GZyjxJNPJVEMyZXgG4lvp+
 RIgValflaI/B/6fLsrSFLNmItp/2lWLv3p6tusjdfZW5OVJMC+Iv0X3AwPHkaFmKmhFH
 wulewg4rHNo5EbzjwioTZUZ//8Tjjfe77EJb5MyyGPGdktQ7bK0oX33c1QBvzlVcPhUW
 CXw1Li1f8Va7GEcxyTgfNAR6fV7ZkUGOfukwjaxyHKfuGIZtw1rLLLlfYY+C+VD/NTu2
 gTmg==
X-Gm-Message-State: AOAM531HkJQ6NA4W0zFFR07fALoiXkYzFazuA7nxflhf7aPG9JK60+nu
 w5w7bKBJeqLz0ExNimBoAK6aPdhQel1jiaRMnQvoonDPzZmOE8zsglcygBeg3XuVyL0GK/vPD+D
 LNtlo/3mILvy9UxKoJqOfcu242kI=
X-Received: by 2002:a25:ca41:: with SMTP id a62mr2910350ybg.252.1597904179621; 
 Wed, 19 Aug 2020 23:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZx/Q0dZ6jq9AM69GuZLe9Zcz6CzD9U6L2jSQF5Hb3HtSoRwzchaHbRD41HB6ZWgESvZY1s0MXWhFbMEU2VtQ=
X-Received: by 2002:a25:ca41:: with SMTP id a62mr2910334ybg.252.1597904179388; 
 Wed, 19 Aug 2020 23:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200820015211.u7xdye5ggbe34fsp@xzhoux.usersys.redhat.com>
In-Reply-To: <20200820015211.u7xdye5ggbe34fsp@xzhoux.usersys.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Aug 2020 14:16:07 +0800
Message-ID: <CAEemH2faf5g0JUdBFNvqrNRHB5orbTvHnrwHCm5enF7tt7N=YA@mail.gmail.com>
To: Murphy Zhou <jencce.kernel@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setxattr03: TCONF if failed to set immutable flag
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
Content-Type: multipart/mixed; boundary="===============1503157155=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1503157155==
Content-Type: multipart/alternative; boundary="000000000000ff7c7105ad490e59"

--000000000000ff7c7105ad490e59
Content-Type: text/plain; charset="UTF-8"

Hi Murphy,

On Thu, Aug 20, 2020 at 9:52 AM Murphy Zhou <jencce.kernel@gmail.com> wrote:

> Instead of TBROK, probably the underlying filesystem not support this flag.
>

Which filesystem do you mean here? What kind of error it was given?
Maybe we should confirm the errno is EINVAL or ENOTSUP before TCONF.

-- 
Regards,
Li Wang

--000000000000ff7c7105ad490e59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Murphy,</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 20, 2020 at 9:52 AM Murphy Z=
hou &lt;<a href=3D"mailto:jencce.kernel@gmail.com">jencce.kernel@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I=
nstead of TBROK, probably the underlying filesystem not support this flag.<=
br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Which filesystem do you mean=C2=A0here?=C2=A0<span class=3D=
"gmail_default">What</span>=C2=A0kind of error it was given?=C2=A0</div>May=
be we should confirm the errno is EINVAL or ENOTSUP before TCONF.</div><div=
>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div d=
ir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000ff7c7105ad490e59--


--===============1503157155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1503157155==--

