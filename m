Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8D325B86C
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 03:50:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 246333C6324
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 03:50:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E8F633C2DAF
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 03:50:38 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B1D4D100049E
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 03:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599097836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hoT2DR5s1ymXHkBtNYXkN9U/sFr7Ez5Ybdgyhk8Vg9Y=;
 b=UFIQU+2OrLlAdh9nvGAcPoNYjrTYLLw5Jl7wPtzltsRTkzwn/WF/6pJQPRnMfOqxA4ryiY
 21GNCwgPcCGDFyJKqq1dO9UotsIStOeLAG51hmudjkgznfM1HqMK/jZFVGi/Plz0t738CZ
 Pzb8g4GYTfzOZ5MbV1XrJL3rxmTQH3I=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-TGxUu_hfPb2AdteVdQmm0Q-1; Wed, 02 Sep 2020 21:50:31 -0400
X-MC-Unique: TGxUu_hfPb2AdteVdQmm0Q-1
Received: by mail-yb1-f199.google.com with SMTP id v77so1318830ybi.2
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 18:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hoT2DR5s1ymXHkBtNYXkN9U/sFr7Ez5Ybdgyhk8Vg9Y=;
 b=Dup0UxBAxo6tQxdQCx+Glvvvz2aphXYz2heDH6cDVQmZowkxitfw+wuvEGym0rJC9U
 xoAQ+pF+coby+CUOaOMvBDuATxSC5z7ESjy5tLS0HN/MdxAgIzi59Uv6W1Ylq5pKzgzA
 tI0nvwSoCUea9mslVceJIGdNd+cObR8OR8a0vojkw6a7cad3evo8eAo/YDZvKOXyauBU
 KdEsg3Vdk+/RBDchFf+0U2bM8qrkrdUd/2ELLQdA98reKa4ZFcixP/ZVe1A4DHFuuw+Y
 kuTMJg9aT+usqQ9i2tGUtWWtfXG29ODcRjSmRTTvlXif+8RpUy5paWZluNwrnf0CmcDK
 jFZw==
X-Gm-Message-State: AOAM532eSQGASCRkfRC3Pw2OFVAOwgkGyJhjXH0lwl71bmoWmR+e2Ohe
 x2q/Ola5ffvjyxLA2xwY0/g0Em+eUifiEVPrs5m4sxyrgC7tfOljBiraglifChwc6nNvfS1+3zc
 xD4yPfmuJUMljejsfzgZM7UZgWzo=
X-Received: by 2002:a25:2d59:: with SMTP id s25mr897611ybe.86.1599097831354;
 Wed, 02 Sep 2020 18:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOrmXJJbV6cz7Rk3KLDycwdnliXuIJ5u5x/l4ktQvjYL0b6F2PWBb2i8kY099h7PPFQejQM8TnEJWnbjRh7EM=
X-Received: by 2002:a25:2d59:: with SMTP id s25mr897596ybe.86.1599097831140;
 Wed, 02 Sep 2020 18:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <9ba8ffe0a93eb8d6c722ce22e9042f146f83bec9.1599058700.git.viresh.kumar@linaro.org>
 <1838266947675784d1792cfa5a540db926b52c36.1599058700.git.viresh.kumar@linaro.org>
In-Reply-To: <1838266947675784d1792cfa5a540db926b52c36.1599058700.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Thu, 3 Sep 2020 09:50:19 +0800
Message-ID: <CAEemH2eXSnTwivK=QDASHgbk7kjSXgVecpq4dwTO5UgHRjQTzw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V11 2/2] syscalls/semtimedop: Add failure test for
 invalid timeout pointer
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1353689945=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1353689945==
Content-Type: multipart/alternative; boundary="0000000000002fcdd405ae5efabd"

--0000000000002fcdd405ae5efabd
Content-Type: text/plain; charset="UTF-8"

Viresh Kumar <viresh.kumar@linaro.org> wrote:

This adds test for invalid timeout pointer.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>

For the series:
Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000002fcdd405ae5efabd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" t=
arget=3D"_blank">viresh.kumar@linaro.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div></div><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This adds te=
st for invalid timeout pointer.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br></blockquote><div><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">For the series=
:</div><div class=3D"gmail_default" style=3D"font-size:small">Acked-by: Li =
Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redh=
at.com</a>&gt;</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small"></div></di=
v>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li W=
ang<br></div></div></div></div>

--0000000000002fcdd405ae5efabd--


--===============1353689945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1353689945==--

