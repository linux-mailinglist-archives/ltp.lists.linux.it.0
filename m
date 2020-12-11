Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5792D7422
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 11:46:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CFF73C61AE
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 11:46:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 937A73C2A82
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 11:46:13 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id EB5C71400183
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 11:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607683571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n3gA0kTxfO+Xdd3oGo6q/wGlbZKaMYoZDLwxSitmWVo=;
 b=VPQNagFRxLs98KIb3ob0unmPqIf9i7ePNn7yG8GdKiG8+YOXCcAorUDnWgqZ0AKrUdDoTF
 IuqgT+kPtcOCQ7zwfbn0aYRY+yfccsCrdw1IXn+34xuHhmNtI08S+DKfjADuU+ofFUg/Bk
 41hjlf5+LCIKby6yGNruKe41Vo/QpKA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-t4TJDsaOOEi16UJUPhxqXg-1; Fri, 11 Dec 2020 05:46:09 -0500
X-MC-Unique: t4TJDsaOOEi16UJUPhxqXg-1
Received: by mail-yb1-f198.google.com with SMTP id e68so965273yba.7
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 02:46:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n3gA0kTxfO+Xdd3oGo6q/wGlbZKaMYoZDLwxSitmWVo=;
 b=jk/1QlYs61AnC19Jchs5TFHC8efV+YDmjf1OVsudjx3zhgITi4bfnEf39Afiwz0HKD
 2cwvw/UDgXVqfA2BFMqfWtp9rhdhhqKSeq7uKyhyEc44rIL9erUKQ3jZ1chuW2+HGNk7
 vqCe777kOXzZbfbP3WA5cCsZpa7gQEakwVAfmAG0nKi7ZOG6oVQ8mVLhU38Aq4cx4OCb
 qDqS9rhvdM23MtnI3KEnn7xD+wM9BI9XW7UGHPZbEFrA7yOmzVfVK0/wQtvseG3jn99B
 Jc2qClF2QOOsSlJ2LAyJGBmZ5OgLY7a9lsMz172BF62p6ld208LqMkYaCECv2YDvdDaX
 YiCA==
X-Gm-Message-State: AOAM531hpmpjMfNTcHSmflnFzNQlZH242Em3R7h7eGI/KFM7JcLFbfls
 +0fSqDGi6u9SDK5y6yHjO2UYd/UPlFYO4GmZzI1vi0Dd2DV1TnBq94gnLEa8mZ8/7qluG9Youyy
 eN9lkGK1GfLq+gvoO/1IR7PYaILA=
X-Received: by 2002:a25:6008:: with SMTP id u8mr12304887ybb.286.1607683568573; 
 Fri, 11 Dec 2020 02:46:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycaxFdWiLLt7j/4LBstG7Z3Zk7a9sTJMYx13cnRYebvkELS+ebc85S9Vck6XEdOF4FgLGZmiri98B7YMqUjUc=
X-Received: by 2002:a25:6008:: with SMTP id u8mr12304867ybb.286.1607683568325; 
 Fri, 11 Dec 2020 02:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20201210141548.10982-1-chrubis@suse.cz>
In-Reply-To: <20201210141548.10982-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 11 Dec 2020 18:45:56 +0800
Message-ID: <CAEemH2epbXuk-npooQWxHW3THOX-3k-_9PpREqNO5hLZ9=__hA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 00/10] Introduce TST_EXP_MACROS
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
Content-Type: multipart/mixed; boundary="===============1149759930=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1149759930==
Content-Type: multipart/alternative; boundary="000000000000006de805b62e0017"

--000000000000006de805b62e0017
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 10:15 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> This patchset adds TST_EXP_MACROS() implementation.
>
> These macros are intended to simplify and unify syscall unit tests.
>
> This patchset converts a few testcases to use TST_EXP_MACROS() it's
> intenteded to serve as an example since there is a lot of testcases that
> could use them as well.
>
> Also the documentation for these macros is ommited at this point, I will
> add it in a case that we agree to include them in the test library.
>
>
> Changes in v2:
>
> - renamed the macros so that it's more clear that they do
> - added documentation to test-writing-guidelines
> - minor fixed in the converted testcases
>

One more point, we might have to handle the unsupported syscall
issue in TST_EXP_*. Otherwise, we can NOT make use of these
macros in tests like madvise01.c. But, I agree to merge patchset
as V2, and solve that in follow-up changes.

For the series:
Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000006de805b62e0017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Dec 10, 2020 at 10:15 PM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This pat=
chset adds TST_EXP_MACROS() implementation.<br>
<br>
These macros are intended to simplify and unify syscall unit tests.<br>
<br>
This patchset converts a few testcases to use TST_EXP_MACROS() it&#39;s<br>
intenteded to serve as an example since there is a lot of testcases that<br=
>
could use them as well.<br>
<br>
Also the documentation for these macros is ommited at this point, I will<br=
>
add it in a case that we agree to include them in the test library.<br>
<br>
<br>
Changes in v2:<br>
<br>
- renamed the macros so that it&#39;s more clear that they do<br>
- added documentation to test-writing-guidelines<br>
- minor fixed in the converted testcases<br></blockquote><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">One more point, we=
 might have to handle the unsupported syscall</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">issue in TST_EXP_*. Otherwise, we can NOT ma=
ke use of these</div><div class=3D"gmail_default" style=3D"font-size:small"=
>macros in tests like madvise01.c. But, I agree to merge patchset</div><div=
 class=3D"gmail_default" style=3D"font-size:small">as V2, and solve that in=
 follow-up changes.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small"><div =
class=3D"gmail_default">For the series:</div><div class=3D"gmail_default">A=
cked-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank"=
>liwang@redhat.com</a>&gt;</div><div class=3D"gmail_default"><br></div></di=
v></div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></d=
iv><div>Li Wang<br></div></div></div></div>

--000000000000006de805b62e0017--


--===============1149759930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1149759930==--

