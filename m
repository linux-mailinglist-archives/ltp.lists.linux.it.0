Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D77012E187
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 02:46:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E44F03C23F6
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 02:46:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 93CA53C23B0
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 02:45:58 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9DAF214011AF
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 02:45:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577929554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0HiYzRu6ixkG286ev7zgcm2fQsmLtFaAOx7y0ASIew=;
 b=DIGAuYeioOyq+yKye3R5KvikAn9Q2nN/wXUa5TF24vuU5RccbT9ub9hxymBjSbSAyqO0hO
 eZCmeAwjyu3C2WV/bTl+XVPtnUN+YH2jwFHMwXAI3fZlwIlFzYrKgiQJ1r9P3xejLJPcbv
 puekN/sOrxPdhWtp1P3Jm6yqlj0lBoE=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-i42jl4gOM9SHdestVgWw5Q-1; Wed, 01 Jan 2020 20:45:51 -0500
Received: by mail-oi1-f199.google.com with SMTP id k11so16102659oih.23
 for <ltp@lists.linux.it>; Wed, 01 Jan 2020 17:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jwmrvg/z5v8mxTeGIylUb6K2RatIm7dl2faoKJMWG4c=;
 b=tYcqLrKk5Eexn6ceaB5buvoNkD1eKEfanMqZhwUE4U+NYPP026yHcYVghH34RlSOHv
 16CZ6tJM8yLe/OEnVEQIOkkBOdzO/vu2fWEQzI9lovlIn/fleY0+13Kc39Tb8QIq4bGB
 GQ/dZqALgvPAwIJmrzJjU0vBNkoolFpzUQkegtjlpsPqH+cEChu7bQNHjRdjBSn735MY
 Z5PBTPZX7/VzopTh4esc4FZl9q/GSTR2/2yP9/d2DnwCsrLcvpZ7Xb6jMaNwNqaWqvw2
 PvoK0BiR6uN84eMkBV/0034McZaIVuiMCOMbJTQPqkBLvZfDCjEys4LQ7zktQOre8nBX
 0RKg==
X-Gm-Message-State: APjAAAWXBk/S9+bODBohcw/Q5EYnu0y2itVzoJk+EwBXVisU69CMMXoC
 IkDVK4JVNghF+txo8Tz5UcrnsyscRDA5IjyJGRi/CkHakHDZeSNLedTCxvhZPcN7Qrs0lHdcMOt
 51XnHfhowk7k5R9wJOUHcO3Ug/jY=
X-Received: by 2002:a05:6830:1cd3:: with SMTP id
 p19mr85087759otg.118.1577929550748; 
 Wed, 01 Jan 2020 17:45:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNfzkljdYWakGaKbLv/deUPiqMRUlm4oJJxgAvwlXY+qJpBC3KfHhHDGYP+l5uy0N/2ZKC+IiOPmy9qP3MDFI=
X-Received: by 2002:a05:6830:1cd3:: with SMTP id
 p19mr85087739otg.118.1577929550415; 
 Wed, 01 Jan 2020 17:45:50 -0800 (PST)
MIME-Version: 1.0
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
 <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
 <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
 <CAEemH2eXvZB9uCuZFsc2uMAt5k2F_gfgXCqch58juMsJn4Gr4w@mail.gmail.com>
 <CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com>
 <CAFA6WYMC=vh9xevacVwLCTVTn=KB0TjFUug5=ZVXkSu11io17g@mail.gmail.com>
In-Reply-To: <CAFA6WYMC=vh9xevacVwLCTVTn=KB0TjFUug5=ZVXkSu11io17g@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 2 Jan 2020 09:45:39 +0800
Message-ID: <CAEemH2eiCL_rnxjCB+kssUq4J9fmqMZeeMPG50KXZ8yxK+D4yQ@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-MC-Unique: i42jl4gOM9SHdestVgWw5Q-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
Cc: LTP List <ltp@lists.linux.it>, Caspar Zhang <caspar@linux.alibaba.com>
Content-Type: multipart/mixed; boundary="===============1789684518=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1789684518==
Content-Type: multipart/alternative; boundary="000000000000556b23059b1e5aba"

--000000000000556b23059b1e5aba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2019 at 1:31 PM Sumit Garg <sumit.garg@linaro.org> wrote:

> ...
>
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
>

Pushed.

--=20
Regards,
Li Wang

--000000000000556b23059b1e5aba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Dec 31, 2019 at 1:31 PM Sumit Garg &lt;<a h=
ref=3D"mailto:sumit.garg@linaro.org">sumit.garg@linaro.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gm=
ail_default" style=3D"font-size:small">...</span><br>
<br>
Reviewed-by: Sumit Garg &lt;<a href=3D"mailto:sumit.garg@linaro.org" target=
=3D"_blank">sumit.garg@linaro.org</a>&gt;<br>
</blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Pushed.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--000000000000556b23059b1e5aba--


--===============1789684518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1789684518==--

