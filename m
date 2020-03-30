Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 239DC197B62
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 13:57:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3AE4E3C314E
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 13:57:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9F14C3C2209
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 13:57:24 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 154BC600046
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 13:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585569442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=28aUC7KmD0WcSMPLSzl6UIpzJbd/fSpIvV2wF610L2c=;
 b=YhXHtWlq/VnoqLGN16kKvu8ZD5MC6MbIkA4bRBKz3IM/NSa1lz/LR1YcHrVmwJ/qfyBfJF
 tj4WT6GwGHubciUadADTywqmN52fZM///PNfqyAnXSuQufm+td/gU+X4eqfdQiKKbb8rYk
 0QYc9Ddgaf4UWvNLsLfeq0SrpDTneis=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-N-9tNJtjM3yEW7OJgQH97A-1; Mon, 30 Mar 2020 07:57:19 -0400
X-MC-Unique: N-9tNJtjM3yEW7OJgQH97A-1
Received: by mail-lf1-f70.google.com with SMTP id q22so7436036lfj.23
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 04:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=33aAbyriFZy5ISxYl9vyW9ErJrt0zZMJP3YW4PhHwf4=;
 b=W0dlt/pcZ5xg6L+u1wnxw3EoxLBIWzwBZdWA/kwbYYCdqbZRmdFjicpHUTLOXPa/qI
 uZ5iizcibVU8gyjWmhGvCgmgSE/qXX8ZbGGBz27v7N4cJjB8kdwxwM4ERvTNtPOgo3s5
 jyiY9is6klgQ86+JN8XuuxbL/8m3vAsIR5CgWLfftiXr4uiv+sUUJ3+W48DiUsssJ3yt
 uW8pQ979S8v2bpzrv/cVDUyhCwX24AcH6QtWtohB1BKKMljMF6pkXyWQ9meMnMPiZNRD
 pUVldpckvl7xasgmoihgKA0ubwMp7WXCFSH6rPKo8JLCKXr5WSQQGBl2mRAF3OMUIcB4
 8jUg==
X-Gm-Message-State: AGi0PubRB3UGHEox2fceUvGvUoFhNLrEjKLpn4KM9lAoSXoffk3aLyv/
 KaAG50wq0M7ozjWwanZKOxFqEBkM5hUcT6YIhSUFNVxAQMTfdXm+kPDljy36CUvPC99vPQmQrft
 VV4Zigv0zBQixUB3WpeqkwxmiH/4=
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr6776630ljc.217.1585569438423; 
 Mon, 30 Mar 2020 04:57:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypJhwv+LU4dxcTF6hYeDsD/p8QwvGD3180CZZSTw74eU8ZBqTSL79ct9MAzMrApRaCV/sgEhWWiMe2sAyJC2MNQ=
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr6776623ljc.217.1585569438141; 
 Mon, 30 Mar 2020 04:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200327213924.18816-1-pvorel@suse.cz>
 <20200327213924.18816-3-pvorel@suse.cz>
 <20200330113111.GD9845@yuki.lan> <20200330114838.GB23915@dell5510>
In-Reply-To: <20200330114838.GB23915@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Mar 2020 19:57:06 +0800
Message-ID: <CAEemH2c6UKHipLfc0XXH-QaAx3pVeuqnR+HoUW6hasN8mLmghw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/6] Use .needs_cmds
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
Content-Type: multipart/mixed; boundary="===============0030259587=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0030259587==
Content-Type: multipart/alternative; boundary="00000000000020a35e05a211272a"

--00000000000020a35e05a211272a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2020 at 7:48 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> > Hi!
> > Looks good, acked.
> thanks a lot for review.
>
> Merged these two patches.
>

Thanks Petr, there is still a tiny place need fix.
Hope you can help to correct the description in the next round patch
merging.

+       /* NULL terminated array of required binaries */
+       const char *const *needs_cmds;

--=20
Regards,
Li Wang

--00000000000020a35e05a211272a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 30, 2020 at 7:48 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; Hi!<br>
&gt; Looks good, acked.<br>
thanks a lot for review.<br>
<br>
Merged these two patches.<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">Thanks Petr, there is still a tin=
y place need fix.=C2=A0</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Hope you can help to correct the description in the next round pat=
ch merging.</div><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">+ =C2=A0 =C2=A0 =C2=A0 /* NULL terminated array of required binaries=
 */</div>+ =C2=A0 =C2=A0 =C2=A0 const char *const *needs_cmds;</div><div><b=
r></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><di=
v>Li Wang<br></div></div></div></div>

--00000000000020a35e05a211272a--


--===============0030259587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0030259587==--

