Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F32B5F68
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 10:46:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03B9D3C20C4
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 10:46:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6BD7D3C20AD
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 10:46:18 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A29AE6021D1
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 10:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1568796376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=REDvWv2BnzJB5GA5AfXGYMBgStGGMYsIddEJUFoN158=;
 b=HXFvK7EYB6NHiDJLxg8NKTpve85kRs4YkgP5m2PL4S7A7gNxHB9GkVyQt1kaIzNNGvq1M/
 EgsYY3/7YVTLbq4ictPnGK6G3pOnMyyoFNP5pU/gW0l/ePoAVRH11Z8RAcbLf+OuySmgCn
 XSlr15Uikc41XqqsGEaLHCPT2OAW6/E=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-bpy_ZEYrNpe7fo3DzzQblg-1; Wed, 18 Sep 2019 04:46:13 -0400
Received: by mail-ot1-f71.google.com with SMTP id c2so3256281otn.8
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 01:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGkfE8OYOwMHUYJRIMNEu8saCY/HPZbOsiEQ6lKv/Fw=;
 b=DDeHTC0hMTCT23Sn2qFJVj1UlCsF4Oc+lv91eFD9H7r05SaQ28ym/+bgneQjwZB6WP
 YH3zkPHyurzyXVg2gbUlvR01fLqIAcDT5EoZ+IgDOjFjxUttg8f12oOBL1DaboFTQc8o
 TlAL/uokp2VNPAAchMRtVA38kYpxf5i5xJ59YsooS2JMjGLvKryDtwN4EH8PlCc6/0Us
 ENb2jVK8Cr5dDuWDR9VCsNlLgW6O3IOFJ7h3UsKxEbHhkQCJg0cl6uinJI9UStaQTgvQ
 f6EsuuOTcqvmKFkeEnVVysTj6OQYyG5w+XmUN1O5yB1p9fsIfIjLVw3z1+iEH+y0vGnI
 8ipw==
X-Gm-Message-State: APjAAAVGfzQGRQJ1NwgRexU4lxc9yiC6GmCpIGm07qvFvTlj7nqDsb1F
 EIUXm9cxcFtvtP0mmWK1cmIL48sssVyIRjDHjvBWLZ6uBXrb0UbnvGMhN66HTd3L5R4fnzplrk2
 MEUNEdURXucymQWaCoq3on+B2Z3w=
X-Received: by 2002:a9d:2043:: with SMTP id n61mr2242174ota.17.1568796372611; 
 Wed, 18 Sep 2019 01:46:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxPavmFrGo5y5JMGIQo8GaT/lLozgXw63Y4UY3Wovy8DTjkuXq+Jvph7u/7t/EEOz/+hsF9b3X/bobBaXXoGbQ=
X-Received: by 2002:a9d:2043:: with SMTP id n61mr2242163ota.17.1568796372405; 
 Wed, 18 Sep 2019 01:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190913125823.17314-1-pvorel@suse.cz>
 <20190913125823.17314-3-pvorel@suse.cz>
 <CAEemH2f4oeSvN-p7xSzjo2ZFvndxjX2sQ+M9f6fYV_bN2ewn=A@mail.gmail.com>
 <20190917165520.GA30320@x230>
 <CAEemH2cHYS6jd4DCzJsy-vKLqShcFO6fU_-Rk=zxu=yD=7YLVg@mail.gmail.com>
 <20190918082421.GA11711@x230>
In-Reply-To: <20190918082421.GA11711@x230>
From: Li Wang <liwang@redhat.com>
Date: Wed, 18 Sep 2019 16:46:01 +0800
Message-ID: <CAEemH2duVbDqZ3UG3aHi4rQPFr-g-yxy3q-Jfw8p+2KV9ta=Tw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: bpy_ZEYrNpe7fo3DzzQblg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] shell: Introduce TST_TIMEOUT variable
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
Content-Type: multipart/mixed; boundary="===============0091915576=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0091915576==
Content-Type: multipart/alternative; boundary="00000000000080b4830592cfdedc"

--00000000000080b4830592cfdedc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Wed, Sep 18, 2019 at 4:24 PM Petr Vorel <pvorel@suse.cz> wrote:

> ...
>
> > So, maybe that could be as a reason to disable float support for
> > $LTP_TIMEOUT_MUL?
>
> Maybe I'm missing something, therefore explaining the intent of the code.
> (int was handled in if tst_is_int "$LTP_TIMEOUT_MUL"; then):
>
I'm not blaming the int/float judgment, there is no problem. My concern is:

If the $LTP_TIMEOUT_MUL is float and awk command is missing, how things
will be going?

It will break at:
    tst_test_cmds awk
right?

Given that break on float number handling, why not declare only support
integer for $LTP_TIMEOUT_MUL?

I hope I explained clearly this time, haha ;-)

--=20
Regards,
Li Wang

--00000000000080b4830592cfdedc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 18, 2019 at 4:24 PM Petr Vorel=
 &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_d=
efault" style=3D"font-size:small">...</span><br>
<br>
&gt; So, maybe that could be as a reason to disable float support for<br>
&gt; $LTP_TIMEOUT_MUL?<br>
<br>
Maybe I&#39;m missing something, therefore explaining the intent of the cod=
e.<br>
(int was handled in if tst_is_int &quot;$LTP_TIMEOUT_MUL&quot;; then):<br><=
/blockquote><div></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">I&#39;m not blaming the int/float judgment, there is no problem. My=
 concern is:</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">If the $LTP_=
TIMEOUT_MUL is float and awk command is missing, how things will be going?=
=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">It will break at:<=
/div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 t=
st_test_cmds awk</div><div class=3D"gmail_default" style=3D"font-size:small=
">right?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Given that break=
 on float number handling, why not declare only support integer for $LTP_TI=
MEOUT_MUL?</div></div><div><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">I hope I explained clearly this time, haha ;-)</div><div><=
br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000080b4830592cfdedc--


--===============0091915576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0091915576==--

