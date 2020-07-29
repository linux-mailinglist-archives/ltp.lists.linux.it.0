Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C4858231AFF
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 10:16:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 877B33C2658
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 10:16:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 621353C2624
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 10:16:57 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A14DE601649
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 10:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596010615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rv0DSVli+QWGXbRFE6sLIcagLpfcENcGTkz+YJS70W0=;
 b=BRcItP1b0yVd14kZUcUQtWUjhhrNgNpO0uJmWHZTjo3K49SjBFjXPAVLcHb7fHpQVrF/LV
 QL7bQV8YvS2QcIWUEL7uydk74lW954Ti44XJL9O0rRgUWb79jUbVaj2PFhklybbVa9Yj9A
 vKQJwB4PsWRjRcVAybRo7DinYflGru8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-5cv2-NyEMVuKRem5NfPGsQ-1; Wed, 29 Jul 2020 04:16:52 -0400
X-MC-Unique: 5cv2-NyEMVuKRem5NfPGsQ-1
Received: by mail-lf1-f72.google.com with SMTP id k1so6543553lfm.4
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 01:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rv0DSVli+QWGXbRFE6sLIcagLpfcENcGTkz+YJS70W0=;
 b=lqCD5KAS/pPpTd50uySEkgwqmwRfK1jjhyY8R88Fi4sDEaFts5U9iMcGG9hDVtOwCP
 tQz4X8KykyYO9mD/DByIAOc5EWjuvrB4KpuP3ir3Dj22Oz7Zzgk4jy2jeuaAd61O8xZ3
 PgmVhjdRdAPhGYZkesNuvPW0s8g3Dybh5YUoZwvtBseF9Dc5fd57eCeueMfYz1nkoL9y
 durSAqVJ0OOk12PY14CO8v6lT8zn2hEQJTNos2r21cKAmm6PkEGES+nAyyk+OuehyEEM
 Ix5wTMDPMbfac2Vz2l11wFgmevC2AwvkCvwMPTrBjfzX+byatS8hTFRmN8fg6+XoCsaE
 1jLQ==
X-Gm-Message-State: AOAM5300ds7vmrXUlDddPro4839/mEkQK3s3cnW4s9Zd4GJV2lH8GnmD
 Zp/TWcOr2HCI0Odd8+dcMUuUizI9eySHYJZ6wQYcRmH3Fc1tyT+3uZJbSSN+vYjIRQtRI9tLZnj
 sMGhjB6P/VfcmPgRtgcwGk00hzBM=
X-Received: by 2002:ac2:43ca:: with SMTP id u10mr12763283lfl.147.1596010610863; 
 Wed, 29 Jul 2020 01:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi4hDThacsLCBuWXY4JHgy6BdS45PfUKZrnUvod9M9jZB6B7FESJyZlQ83yFgIaP+vLGtkylfb6dlFvxNeTb0=
X-Received: by 2002:ac2:43ca:: with SMTP id u10mr12763277lfl.147.1596010610619; 
 Wed, 29 Jul 2020 01:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <1595911224-12470-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595911224-12470-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eFrsa0rNfjcKrdQpUkV6YvbQR10tbzy4F5jXVQOrra7w@mail.gmail.com>
 <9916b020-27b6-bc12-919b-9046dc7dcee5@cn.fujitsu.com>
In-Reply-To: <9916b020-27b6-bc12-919b-9046dc7dcee5@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 29 Jul 2020 16:16:38 +0800
Message-ID: <CAEemH2ckxPDkncT9m2nyv0-tvJ70SKogun7EfzAN912sc5662A@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/2] libs/libltpnewipc: Add libmsgctl.c into
 new ipc library
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
Content-Type: multipart/mixed; boundary="===============1172806409=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1172806409==
Content-Type: multipart/alternative; boundary="0000000000008113b605ab902d4b"

--0000000000008113b605ab902d4b
Content-Type: text/plain; charset="UTF-8"

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> ...
> > It's fine to maintain only a single System V IPC library in LTP.
> > BTW, do you have a plan to remove the old libmsgctl.c after merging this?
> Yes. I have a plan[1] to  remove this old libmsgctl when I clean up
> msgstress case(I am doing it).
>

Great, thank you!


> Also, I plan to remove get_max_msgqueues()  function in old libipc.c
> because we can directly use SAFE_FILE_SCANF("/proc/sys/kernel/msgmni",
> "%d", &nr_msgqs) in test case.
>

+1

Or, maybe if you'd like to do more in next, the libipc.c also could be
merged into libnewipc.c since they have some overlaps too. Anyway, it
depends on your thoughts :).

-- 
Regards,
Li Wang

--0000000000008113b605ab902d4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.=
com">xuyang2018.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span class=3D"gmail_default" style=3D"fon=
t-size:small">...</span><br>
&gt; It&#39;s fine to maintain only a single System V IPC library in LTP.<b=
r>
&gt; BTW, do you have a plan to remove the old libmsgctl.c after merging th=
is?<br>
Yes. I have a plan[1] to=C2=A0 remove this old libmsgctl when I clean up <b=
r>
msgstress case(I am doing it).<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Great, thank you!</div></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Also, I plan to remove get_max_msgqueues()=C2=A0 function in old libipc.c <=
br>
because we can directly use SAFE_FILE_SCANF(&quot;/proc/sys/kernel/msgmni&q=
uot;, <br>
&quot;%d&quot;, &amp;nr_msgqs) in test case.<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">+1</div></div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Or, maybe if you&#39;d li=
ke to do more in next, the libipc.c also could be merged into libnewipc.c s=
ince they have some overlaps too. Anyway, it depends on your thoughts :).</=
div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div><=
/div></div>

--0000000000008113b605ab902d4b--


--===============1172806409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1172806409==--

