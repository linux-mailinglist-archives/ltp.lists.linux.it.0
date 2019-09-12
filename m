Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE3B06DD
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 04:51:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F21743C2085
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 04:51:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 23F9B3C0507
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 04:51:38 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 922B86023D6
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 04:51:36 +0200 (CEST)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 148EE2CE953
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 02:51:34 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id i19so7478447otc.16
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 19:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CZ/fyZCQg+G0MJu1Ns9ItGf4InCr4RchnRxgrwOnlmE=;
 b=CtYCQ89MUdb11onGj+xZP2ev/vLZ0ovEbYPeYTSHTFuwx4850y/4FT4Foe802M7NaT
 k78zSS7aLPImexb6uDzvrPUqHm/8ahGdHuN2/T16Qo20E8wvMDYpPyy5D2BJ/xdJs15q
 EfdRdS1LNNHCz15ewLrnrEn3nECGyaQIjCIaQB26FbdokDuVvtTfdMT3RsKKVdVmVSzB
 3A+gxW/47zZU7vRplpShfzKljoeFZ7Q7KfrnJlIEWryKtTeTiuBq5wBKoMKdxGOTcfni
 baVkoL899uKQCZ8LDrX+uvdGGsFZsp/ELSqltCG5+fQsZtnXnnU2/pakEZ7AcdrWAUNg
 t6Zw==
X-Gm-Message-State: APjAAAXgGKp1ig4y0fViUMuaO0P1N+B3XJen2Lv5lu0CNE5MdnJQRTWc
 EGjjXiE88SEHd4EoPV/pnYENfPvOCDcQr8BcUaJch96UTRONkkrWe5efJgL5NuWPaMl2PF1nBPy
 3chIbgPcfGX9LPh6rse3NGDcC6g0=
X-Received: by 2002:aca:d846:: with SMTP id p67mr4029669oig.144.1568256693518; 
 Wed, 11 Sep 2019 19:51:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/ud7rWjIkPS5j5KGlyO0Vmv1AbxN8kia+uCx5hLzP+h9u1cWCKhZ6bVdVN4YHf0ULPnw26SMzx3wS2pvgybk=
X-Received: by 2002:aca:d846:: with SMTP id p67mr4029656oig.144.1568256693152; 
 Wed, 11 Sep 2019 19:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <1567576823-10080-1-git-send-email-shuang.qiu@oracle.com>
 <CAEemH2fiJkau0A3yQH+nHVPXMwtTzyV3_weTQRniZFR+EJqN_g@mail.gmail.com>
 <20190911111900.GA19244@rei.lan>
In-Reply-To: <20190911111900.GA19244@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 12 Sep 2019 10:51:21 +0800
Message-ID: <CAEemH2eMYmquWXAHXUuPQ1Li2DSfvHpV01O4GMQFZ0Z0s=8+hw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise09:Change PAGES size to the value more
 than 32
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
Content-Type: multipart/mixed; boundary="===============0358060247=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0358060247==
Content-Type: multipart/alternative; boundary="0000000000001ccf1c05925237bf"

--0000000000001ccf1c05925237bf
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 11, 2019 at 7:19 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > I'm not sure why 64 pages is a proper value? Can you explain more?
>
> I've just talked to Michal Hocko and the conclusion is that we should
> allocate several megabytes to avoid depending kernel implementation
> details, which would mean allocating thousands of pages.
>

Sounds reasonable. Allocating thousands of pages must trigger the MADV_FREE
page reclaiming.

@shuang.qiu, Hi Shuang, would you mind to rewrite the patch, or should I do
that?

-- 
Regards,
Li Wang

--0000000000001ccf1c05925237bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 11, 2019 at 7:19 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; I&#39;m not sure why 64 pages is a proper value? Can you explain more?=
<br>
<br>
I&#39;ve just talked to Michal Hocko and the conclusion is that we should<b=
r>
allocate several megabytes to avoid depending kernel implementation<br>
details, which would mean allocating thousands of pages.<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default">Sounds reasonable. Allocatin=
g thousands of pages must trigger the=C2=A0MADV_FREE page reclaiming.</div>=
</div><div><br></div></div><div class=3D"gmail_default" style=3D"font-size:=
small">@shuang.qiu, Hi Shuang, would you mind to rewrite the patch, or shou=
ld I do that?</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"m_906340=
6343708931987gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br></div></div></div></div>

--0000000000001ccf1c05925237bf--

--===============0358060247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0358060247==--
