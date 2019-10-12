Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DF6D4C35
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 04:47:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C33F3C22AA
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 04:47:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 6E5953C1833
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 04:47:08 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6D13F1401272
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 04:47:07 +0200 (CEST)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2D27D368DA
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 02:47:05 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id f80so5901245oig.8
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 19:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z6d8eICYiwesYUJzbV3UvjNR5WpXveGOrrzuNL6D6Vk=;
 b=VF+OusDPWtt2AakXlZl9CokEVY4oI2XW/F+3RuYPM1B/7LaDua7iZ6u8x3A7I1lOua
 Hahi8OON9dh2l0XYbsfsLlz9NC3eApuf4+Dd2SqRs20q3MRdU2VcliQvApNeVJPC6whc
 YpATtVe8VlurtCbINrm5ICCg+WuDm4qe0S0w33JOHg1YIguxhoR09PMWgqSwusAV3FsV
 MhU0AYgP0WmF8Ov55W7XNDnLgIFDtE1cyM4VENgocr+r6YLXj1X5C6pQg1WRQUQH1Bot
 qrkGXaGi5l1YmEs5YmRWgTTB2BWVQwldO6NHNnNvheRjWHZ2+2IsE0koTl7U68FevFYK
 uLog==
X-Gm-Message-State: APjAAAXQGWyXu4DCcZ8Ss9CUC/NfJuom7+NcWQIzF6KluV97//HzriDo
 iRoB/KmCn2/WzkYnYWa/5EdITnbO/gbIdDdRjYUYKY/N+MOeF3XHgZhwT/M7EvNmlltjZWhxoxX
 umf1zLm9Bq1Zd1fhKzvo7jVmc9ak=
X-Received: by 2002:aca:da41:: with SMTP id r62mr14531489oig.47.1570848424652; 
 Fri, 11 Oct 2019 19:47:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzG4gJwOlLQW+/o9i4WGz5DXeHkvj1luxZEYjxZXoxIGxxDT/tGKDWwrA507QM2du4cZIrh3JZDiSq0H704WdA=
X-Received: by 2002:aca:da41:: with SMTP id r62mr14531478oig.47.1570848424361; 
 Fri, 11 Oct 2019 19:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190911085536.25546-1-cfamullaconrad@suse.de>
 <20190911165225.2122-1-cfamullaconrad@suse.de>
 <20191011120201.GA26698@dell5510> <20191011125345.GE2591@rei>
In-Reply-To: <20191011125345.GE2591@rei>
From: Li Wang <liwang@redhat.com>
Date: Sat, 12 Oct 2019 10:46:52 +0800
Message-ID: <CAEemH2eL-y9LU+TyObw2_LqD_=S3R1VH350wRNoQFYF4Q8Bp7w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] tst_test.sh: Use LTP_TIMEOUT_MUL in
 TST_RETRY_FN()
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
Content-Type: multipart/mixed; boundary="===============0341154558=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0341154558==
Content-Type: multipart/alternative; boundary="00000000000054a0d00594ada681"

--00000000000054a0d00594ada681
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 11, 2019 at 8:53 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > I'm for merging this patchset, but I'd rather merge my "v5 shell:
> Introduce
> > TST_TIMEOUT variable" [2] [3] patchset first.
> > I can rebase this patchset before merge.
>
> Well, we still need to ceil the LTP_TIMEOUT_MUL in the shell version of
> the TST_RETRY_FN_EXP_BACKOFF. So I would say that your patch has to go
> first, then we need to export the part that ceils the timeout multiplier
> as a function and finally use it in the first patch of this patchset.
>

Agreed.

@Petr, I have no more comments, feel free to merge this with the changing
as we discussed.

-- 
Regards,
Li Wang

--00000000000054a0d00594ada681
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 11, 2019 at 8:53 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; I&#39;m for merging this patchset, but I&#39;d rather merge my &quot;v=
5 shell: Introduce<br>
&gt; TST_TIMEOUT variable&quot; [2] [3] patchset first.<br>
&gt; I can rebase this patchset before merge.<br>
<br>
Well, we still need to ceil the LTP_TIMEOUT_MUL in the shell version of<br>
the TST_RETRY_FN_EXP_BACKOFF. So I would say that your patch has to go<br>
first, then we need to export the part that ceils the timeout multiplier<br=
>
as a function and finally use it in the first patch of this patchset.<br></=
blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Agreed.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">@Petr, I ha=
ve no more comments, feel free to merge this with the changing as we discus=
sed.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div><=
/div></div>

--00000000000054a0d00594ada681--

--===============0341154558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0341154558==--
