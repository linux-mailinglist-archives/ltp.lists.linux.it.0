Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 721533493C7
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 15:11:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C3513C5F5A
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 15:11:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A0E9D3C27E7
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 15:11:30 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 15EA8200E05
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 15:11:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616681488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EXQtaG4ok35GVyWfzkGU36gJuXK7sl8D5c5akF91IHE=;
 b=aUZP2e6Y4Or0i7wlP8zKSpYb3jcR2J/OKcTkPcwgX7933q5C+sctydvxjqGL3uTrcXAIiX
 Vv6lszN7By34FH2GPQyuYytqkR7L5i1avcYC6N/kQc8Jqq7n5YkSB0Zyzw8H49eN98s75T
 Y6FAYXaeii2Yj4mEi1G+sGHyL3/pYp0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-dRcCck_1NL6Gw0DIYpYuAQ-1; Thu, 25 Mar 2021 10:11:22 -0400
X-MC-Unique: dRcCck_1NL6Gw0DIYpYuAQ-1
Received: by mail-yb1-f200.google.com with SMTP id o129so6202640ybg.23
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 07:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EXQtaG4ok35GVyWfzkGU36gJuXK7sl8D5c5akF91IHE=;
 b=phfCfZdn53cUr2RtzaITSEwFzDXNDcjdslbxAbox7X8NTQteLgHJ1dA2PmheeFVx+q
 XRAtq5v+lVpcV2AgsWGRo5VpIQ5DWfGdYM83njsEm+B79kb4nmjKN2DSF6vaD+LboRhw
 4RVdQlUxefIpxHg+pz4wGFjqkXMixqCRtFVTaV0oDyLXcPlkpIL1rTt6o2bQueycQNwo
 t3WP2IuK8/KdAxTOxv8AGELJGGr5YHaxRjqfOLciNAJfN0jBS1VeyV/oclx5sVMetvdJ
 jnEZ9GXf0BJGIWcFggS2Le0iZyiVqJ5ws4YuFI844l0pz/M/zT/18kP7tCIDpOXyhJTX
 F9NQ==
X-Gm-Message-State: AOAM532ZNL7QevWLExMFF2J2evgzOUnAI87BGRj0WUItqoeQUHt/YzyW
 GwoBgCcMyKelNtdYL66rSF3LQhx8/02HQqqtL4a0Ngy+xktzav7JCcONNWrwsflDlRwT3G9T41C
 PjdMWC2yZqqxUws6C1EHSh+lzHR0=
X-Received: by 2002:a25:bdc6:: with SMTP id g6mr12776758ybk.366.1616681482083; 
 Thu, 25 Mar 2021 07:11:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgODaVd5anqNSO/L+l98P1t6ejmsxxdkogVvf6uRNFuLgXkDn/5YvBA4ft0GS1k2WOSZZvquM1MwXa9ytBYpU=
X-Received: by 2002:a25:bdc6:: with SMTP id g6mr12776735ybk.366.1616681481899; 
 Thu, 25 Mar 2021 07:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <YFmUrVOyX4q+8Dy9@osiris>
 <20210323215819.4161164-1-hca@linux.ibm.com>
 <CAEemH2cSk=doHL51uD5Qu6uCRRTCgYd0EN0iij=X+538J53XsQ@mail.gmail.com>
 <YFyDARFZZUCG5LGc@osiris>
In-Reply-To: <YFyDARFZZUCG5LGc@osiris>
From: Li Wang <liwang@redhat.com>
Date: Thu, 25 Mar 2021 22:11:09 +0800
Message-ID: <CAEemH2cQxfjxm8jOCmESsX8aAvhHw=BqyEq24sgNiVc0iCPNDQ@mail.gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] s390 vdso fixes
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0346137587=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0346137587==
Content-Type: multipart/alternative; boundary="00000000000071a6ba05be5cfdc7"

--00000000000071a6ba05be5cfdc7
Content-Type: text/plain; charset="UTF-8"

Heiko Carstens <hca@linux.ibm.com> wrote:


> ...
> > > Heiko Carstens (3):
> > >   s390/vdso: fix tod clock steering
> > >   s390/vdso: fix arch_data access for __arch_get_hw_counter()
> > >   lib/vdso: remove struct arch_vdso_data from vdso data struct
> > >
> >
> > Thanks for the quick fix! I confirmed these patches work for me.
> > (tested with latest mainline kernel v5.12-rc4)
> >
> > Tested-by: Li Wang <liwang@redhat.com>
>
> Thanks a lot for confirming! However I decided to go with the simple
> variant:
>
> https://lore.kernel.org/linux-s390/YFnxr1ZlMIOIqjfq@osiris/T/#m26f94fd8ac048421a4a8870e7259a09f97840a3e
>
> May I add your Tested-by there as well?
>

Sure, I just reverted the 2/3 and 3/3, then apply the simple variant
scratch-patch. It also works well.

-- 
Regards,
Li Wang

--00000000000071a6ba05be5cfdc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Heiko Carstens &lt;<a href=3D"mailto:hca@linux.ibm.com" targe=
t=3D"_blank">hca@linux.ibm.com</a>&gt; wrote:<br></div></div><div class=3D"=
gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; &gt; Heiko Carstens (3):<br>
&gt; &gt;=C2=A0 =C2=A0s390/vdso: fix tod clock steering<br>
&gt; &gt;=C2=A0 =C2=A0s390/vdso: fix arch_data access for __arch_get_hw_cou=
nter()<br>
&gt; &gt;=C2=A0 =C2=A0lib/vdso: remove struct arch_vdso_data from vdso data=
 struct<br>
&gt; &gt;<br>
&gt; <br>
&gt; Thanks for the quick fix! I confirmed these patches work for me.<br>
&gt; (tested with latest mainline kernel v5.12-rc4)<br>
&gt; <br>
&gt; Tested-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"=
_blank">liwang@redhat.com</a>&gt;<br>
<br>
Thanks a lot for confirming! However I decided to go with the simple varian=
t:<br>
<a href=3D"https://lore.kernel.org/linux-s390/YFnxr1ZlMIOIqjfq@osiris/T/#m2=
6f94fd8ac048421a4a8870e7259a09f97840a3e" rel=3D"noreferrer" target=3D"_blan=
k">https://lore.kernel.org/linux-s390/YFnxr1ZlMIOIqjfq@osiris/T/#m26f94fd8a=
c048421a4a8870e7259a09f97840a3e</a><br>
<br>
May I add your Tested-by there as well?<br></blockquote><div><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Sure, I just reverted th=
e 2/3 and 3/3, then apply the simple variant scratch-patch. It also works w=
ell.</div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><di=
v>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000071a6ba05be5cfdc7--


--===============0346137587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0346137587==--

