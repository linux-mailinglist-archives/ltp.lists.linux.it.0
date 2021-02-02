Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C23F30BCC6
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 12:17:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC6C23C741C
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 12:17:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0772A3C2EF8
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 12:17:08 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8656F600BDF
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 12:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612264627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A5XVpqEgAtlwHCQ3WIOGcM0xTaFUfMlnoruSDsM8YaM=;
 b=SKLl7tYeu+upIbBp/1wwgFalD4EWlfi7Z5f7J/vLtE5zeZKWsmG2s/jZVsxpuMfsA4OHwU
 vWss9cLdVGnYI/HfiTIXnZqfiqrImzUD9EXoM7f6K3U0VmYeTD7YoHOEKqp5nG+LP55HcD
 SLw9Rcf82os/I3Li1YC8Q6ILNoZYhdw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-Url1I7eiOsy1Ugyo-XHY_Q-1; Tue, 02 Feb 2021 06:17:04 -0500
X-MC-Unique: Url1I7eiOsy1Ugyo-XHY_Q-1
Received: by mail-yb1-f198.google.com with SMTP id 203so23416120ybz.2
 for <ltp@lists.linux.it>; Tue, 02 Feb 2021 03:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A5XVpqEgAtlwHCQ3WIOGcM0xTaFUfMlnoruSDsM8YaM=;
 b=pgoziTfrtJK1w/LLigFKBEgE0eCPb/+yJiXYpgBN1bbDZPsxbDj0yFOAnJfSyAJhHj
 srDlDO9C+LUN3ZEZ2j9EVAgF2C3k6YzXVMIwhuYSu9twF/a8TEVns7KvogvPagTLGneA
 y6StcCMvBWeGTAS0BRzoCwoRjSBxn6C8E5kgdGryS/sKuPUSXz4ZgTC1t2Xoa7k1L3wJ
 gzYOPDjLR8TdjKMFu+f+Ip/6nU9z+BYNAKtOsyqrvhtZvmOJuCPzpTdBfRAxeItgvk/f
 wN3pk4FxKqeQmO0fvEw2PV25Nichxczf83TjeVVxZI5wSn+azI+wuZONZ5O5xa8htngY
 a2RA==
X-Gm-Message-State: AOAM533fZ3mjCPmKqwyUFwHwHn0CN+XcRdvu5U0puBhI7DZrV1HRvPOu
 rhuRM4UqEAp4zqrbnlcdWuEf0Kxf3vmrU7paFz88ZZ4QH46+yEgT8IPr0SN5hnicyup0UOToOwu
 pm72juwwNPW8QLu9oLuae3bvE2Y0=
X-Received: by 2002:a25:b281:: with SMTP id k1mr21709496ybj.110.1612264624120; 
 Tue, 02 Feb 2021 03:17:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNldzK6G3/jJoPcoZYy3GiqEAQMpUjmvnpjM4jr7b0eHFiHkecBM26KmQRqTyv8/JXWDc7wOn/rZ4RrRzSS1o=
X-Received: by 2002:a25:b281:: with SMTP id k1mr21709469ybj.110.1612264623844; 
 Tue, 02 Feb 2021 03:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-3-pvorel@suse.cz>
 <CAEemH2ffReVSE_210nyRZVZHOwoMMy-F4Cye08RwPa5bh7PZ0w@mail.gmail.com>
 <YBj8bMKfxqvQ6lYt@pevik>
In-Reply-To: <YBj8bMKfxqvQ6lYt@pevik>
From: Li Wang <liwang@redhat.com>
Date: Tue, 2 Feb 2021 19:16:52 +0800
Message-ID: <CAEemH2f5tJtgcZG8WaAU1qpKwU7yHDdjzGahhL814goL5sAv-g@mail.gmail.com>
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
Subject: Re: [LTP] [PATCH v2 2/6] zram01.sh: Generate test setup variables
 in setup
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
Content-Type: multipart/mixed; boundary="===============1615890550=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1615890550==
Content-Type: multipart/alternative; boundary="00000000000030485905ba589c94"

--00000000000030485905ba589c94
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

Petr Vorel <pvorel@suse.cz> wrote:

...
> > > +get_btrfs_size()
>
>
> > What about renaming at_least_1G_mem() or check_space_for_btrfs()?
> Good point. I'm slightly for check_space_for_btrfs().
>
> at_least_1G_mem() is also good, but for that I'd also move tst_res TINFO
> "not
> enough space for Btrfs" out of the function and put it into
> generate_vars(). But
> since it's used only for btrfs I slightly prefer check_space_for_btrfs().
> But no
> strong opinion about it.
>

Agree, thanks!

Btw I suddenly think that we could have a nicer name initialize_vars()
to replace generate_vars(), because we just use it once to initiate the
test variables in the setup phase.

Anyway, it's only my feelings and also depends on your preference too.


-- 
Regards,
Li Wang

--00000000000030485905ba589c94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.=
cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote:<br></div><div dir=3D"lt=
r" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</spa=
n><br>
&gt; &gt; +get_btrfs_size()<br>
<br>
<br>
&gt; What about renaming at_least_1G_mem() or check_space_for_btrfs()?<br>
Good point. I&#39;m slightly for check_space_for_btrfs().<br>
<br>
at_least_1G_mem() is also good, but for that I&#39;d also move tst_res TINF=
O &quot;not<br>
enough space for Btrfs&quot; out of the function and put it into generate_v=
ars(). But<br>
since it&#39;s used only for btrfs I slightly prefer check_space_for_btrfs(=
). But no<br>
strong opinion about it.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">Agree, thanks!</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Btw I suddenly think that=C2=A0we could have=
 a nicer name initialize_vars()</div><div class=3D"gmail_default" style=3D"=
font-size:small">to replace generate_vars(), because we just use it once to=
 initiate the</div><div class=3D"gmail_default" style=3D"font-size:small">t=
est variables in the setup phase.=C2=A0</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Anyway, it&#39;s only my feelings and also depends on your p=
reference too.</div><br></div></div><div><br></div>-- <br><div dir=3D"ltr">=
<div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div><=
/div>

--00000000000030485905ba589c94--


--===============1615890550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1615890550==--

