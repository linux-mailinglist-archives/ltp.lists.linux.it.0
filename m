Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DB31A2D97
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 04:28:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1D813C2D29
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 04:28:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6E12A3C2D1E
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 04:28:24 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 702026006F5
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 04:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586399301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BGDbpvXnsBYuYA9aWcUlG8f8jocM1/C1rpixzIWzBwg=;
 b=gCh8ArTosa9xyevPi4M/PekLXJpEpG6gXyXpWf8Y2WYWb5egWrZAQIUABS6LGqSWVoc75z
 LnWX70kcxP+w8CU5V9mRH6Z+4GbWsTTtNMyMTQwyFPU8OkH0H6zCzlgnPhG39/Riaf6Y+6
 lAw4J6aoPyLBCDChu5D5BsnS8Plkatg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-SR40MxIXMo2aJdNKhwYRhQ-1; Wed, 08 Apr 2020 22:27:43 -0400
X-MC-Unique: SR40MxIXMo2aJdNKhwYRhQ-1
Received: by mail-lf1-f70.google.com with SMTP id 66so1775729lfa.7
 for <ltp@lists.linux.it>; Wed, 08 Apr 2020 19:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJPyevVhvhwwSZk4cmx8U+GThNTfkCky/W+AufjqrxU=;
 b=Fmm/4MfqxWVz7xyYU27GQZUg21tqAbdyePvhT3Nhrucfvyc0APSpwR2sg0yZ7oBAhA
 1cfcVVnv7BoH2KGGTWlMcIu/QyYi63/0sD3Pw89cTUiYAckE5IgcQw83V9P5ZCo41YEz
 sO4pqRFYk36NoivOtbcTKuGeLHc9Uk1+k9g98S2Wrkh2BU9nX9ZN9cpdVGBoLljBawLh
 zMTGAzrPv0r7tempxKjA6egxUEyyOi8kP42ZssvvNi5/NUFMm9Q8h3TrrFWas7ZFgW6l
 ch3kBzn77toPS63wW4msqYsiZiv1EjlD1MhIwBYAmitpJT4xwK6cep8b6XOqCnAX4cQX
 hO5w==
X-Gm-Message-State: AGi0PuYAMB5cT84gurkKo4XTpPnkdW+DM/MJdO8TC30iKL8Iy+89xpgp
 m9FEkUU7YdfqVHIPekh3a+A2qhSvBP1ScRSr+rJPs0fTob5YfYUycuGVG8u+Bch2spfABinpxns
 nxhTCH3a3TnPN29BN+7hI6zUxppM=
X-Received: by 2002:a19:691d:: with SMTP id e29mr6217292lfc.83.1586399262528; 
 Wed, 08 Apr 2020 19:27:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ9hXqIyeZQimNXjuabPoRagSUznoPP7d6x083FoTVv6Tr/8HV54piVgsDTt5U6jnZMw2L6h19exLhjL/uCgDU=
X-Received: by 2002:a19:691d:: with SMTP id e29mr6217283lfc.83.1586399262311; 
 Wed, 08 Apr 2020 19:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200406132932.12951-1-liwang@redhat.com>
 <c95f2855-1e16-69c9-1eea-d88c66caffe1@cn.fujitsu.com>
In-Reply-To: <c95f2855-1e16-69c9-1eea-d88c66caffe1@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 Apr 2020 10:27:30 +0800
Message-ID: <CAEemH2eH6M7frm-FA3ENvcSVf6sh9zSC0YywO-Qh_iFeo2-FBg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugetlb: move nr_opt to tst_hugepage.h
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
Content-Type: multipart/mixed; boundary="===============0078699465=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0078699465==
Content-Type: multipart/alternative; boundary="000000000000809f1605a2d25c85"

--000000000000809f1605a2d25c85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2020 at 10:31 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Hi Li
>
> Looks good to me,
> Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>

Pushed. Thanks for the review.
--=20
Regards,
Li Wang

--000000000000809f1605a2d25c85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Apr 7, 2020 at 10:31 AM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li<=
br>
<br>
Looks good to me,<br>
Reviewed-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" ta=
rget=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br></blockquote><div><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Pushed. Tha=
nks for the review.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000809f1605a2d25c85--


--===============0078699465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0078699465==--

