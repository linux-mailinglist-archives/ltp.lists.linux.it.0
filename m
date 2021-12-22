Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D18BB47D108
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 12:32:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFFED3C9258
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 12:32:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 50F693C092C
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 12:32:54 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0B4DD1A00A2A
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 12:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640172772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S4nA4XWT/Ei7fpHtSJjO3enca+1wSAz2KKbvxYpR3VY=;
 b=YqOYPGF2m7rzRPahvevVOZi+5TZPHtqCh2ij4Z0TMDZnNdl4MEsZZHPXoJ8nok1eclwwTU
 CB3A2bU2P21qR4guHB2SHbghQEg5eWPdOZ41sbCtbBHzAbeSyPKowItbAvrVmXWcA5UveP
 8uflgzcT05EhZYFhdnSQlIWxOudIS0w=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-N7NIp1zkMdSQ1v3BLnrLrA-1; Wed, 22 Dec 2021 06:32:51 -0500
X-MC-Unique: N7NIp1zkMdSQ1v3BLnrLrA-1
Received: by mail-yb1-f198.google.com with SMTP id
 y125-20020a25dc83000000b005c2326bf744so3361519ybe.21
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 03:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S4nA4XWT/Ei7fpHtSJjO3enca+1wSAz2KKbvxYpR3VY=;
 b=zDYFe5j0YXQPW57o24L0t3oe5Vu53br2/zM2NyJ8IqOLz/oJZvNoc76lA/PmK/bgqI
 wJxAvQu4Lqhh86W+nXZ7J+itIk1fUk38esOizK/lXiz3o/NEpL4Nf+untBcBh26sLKi5
 Q5kd5ZEADWpCAlSyoRV15HC9mabDKVm7+/GeV1RS3/gRrdG8aNLaHd51O73sO9nDzbwP
 Fql7eeVPYDZflQ9R1r5ZXHIx4c2WnyGuuZit3prcIHuQ13gP8HJ0F75TsYUU+1fDNeYN
 KdVkcWX1lubSUiU+uSYrPaj6zPLTqbrPKvPVHDfpkLn4v9Lmh7JZE23Szp8ys/TIcQnR
 A+Ew==
X-Gm-Message-State: AOAM533YZonbCUHCEeL+reuhZAyfyPCeQZ1gCSS7rFxEUweJIa/iSP44
 PVjGOgi4puzV4dsQY4fd2IwRlzLvNBIqp2R/MPJSn7Rpj9Dv7t/PASfJZ50ulITNRpIWq30NCgV
 8tpbdIVSs9Ou1yEGNTmXM27kmc5A=
X-Received: by 2002:a25:aa86:: with SMTP id t6mr3934153ybi.728.1640172770436; 
 Wed, 22 Dec 2021 03:32:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEpd3CiRvTVYDPMF4PrSlvathwk3E5XimYoEXQTq+QMHoNnQitqais1PeC35vMKKaQsxv8pOvmW9IzYvKHOpw=
X-Received: by 2002:a25:aa86:: with SMTP id t6mr3934130ybi.728.1640172770222; 
 Wed, 22 Dec 2021 03:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20211221193500.31950-1-pvorel@suse.cz>
 <61C28CB8.3050209@fujitsu.com>
 <CAEemH2cqTErtNZka8X3L3AgOhy-a2x8fqy1k-QKJWiXc7wA2fA@mail.gmail.com>
 <61C2C02A.90104@fujitsu.com> <YcLeaPJmSvmUJwJO@pevik>
 <61C2E3DB.9070004@fujitsu.com>
 <CAEemH2dpLJ9N57TpMhW3wMkd-V0cZMPWyH_sXn6KjXoWJWUC4g@mail.gmail.com>
 <YcL5XG6azJuGTys7@yuki> <YcL82UGphHruor3+@pevik> <YcMArVLw7UbLT/wi@yuki>
 <YcMCao3J5PIPaTWe@pevik>
 <CAEemH2dMxEfDwxJ_LO+DK=J+Tkfuxg1F0+5UEoM4oK47A_ZxyA@mail.gmail.com>
In-Reply-To: <CAEemH2dMxEfDwxJ_LO+DK=J+Tkfuxg1F0+5UEoM4oK47A_ZxyA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 22 Dec 2021 19:32:37 +0800
Message-ID: <CAEemH2dgTFvHMA_fRtQfxptxB4E5XG_NVPMsfu1XqwqrwbGtJg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib: Skip tst_{disable,
 enable}_oom_protection() for non-root
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: multipart/mixed; boundary="===============0271893992=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0271893992==
Content-Type: multipart/alternative; boundary="00000000000057022105d3ba7ba8"

--00000000000057022105d3ba7ba8
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 22, 2021 at 7:29 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Wed, Dec 22, 2021 at 6:48 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> > > I've sent v2, which checks CAP_SYS_ADMIN and CAP_SYS_RESOURCE,
>> > > but feel free just to bring simpler solution.
>>
>> > I still think that the most acurate test would be just writing to the
>> > file and checking the result.
>> OK. Anybody taking this (so that not more people working on it)?
>
>
> I'm considering using both of the two methods.
>

Or now just go with Petr's patch to get rid of the fails before
Christmas vacation:).

-- 
Regards,
Li Wang

--00000000000057022105d3ba7ba8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Dec 22, 2021 at 7:29 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 22, 2021 at 6:48=
 PM Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvor=
el@suse.cz</a>&gt; wrote:</div><div dir=3D"ltr" class=3D"gmail_attr"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; I&#39;ve sent v2, which checks CAP_SYS_ADMIN and CAP_SYS_RESOURCE=
,<br>
&gt; &gt; but feel free just to bring simpler solution.<br>
<br>
&gt; I still think that the most acurate test would be just writing to the<=
br>
&gt; file and checking the result.<br>
OK. Anybody taking this (so that not more people working on it)?</blockquot=
e><div><br></div><div><div style=3D"font-size:small">I&#39;m considering us=
ing both of the two methods.</div></div></div></div></blockquote><div><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Or now just go =
with Petr&#39;s patch to get rid of the fails before Christmas=C2=A0vacatio=
n:).</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div><=
/div></div>

--00000000000057022105d3ba7ba8--


--===============0271893992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0271893992==--

