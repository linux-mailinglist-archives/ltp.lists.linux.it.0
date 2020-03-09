Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291317D930
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 07:04:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 464493C60F7
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 07:04:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9D0723C60EC
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 07:04:21 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 8661C200B2A
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 07:04:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583733858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+KRLzSnJR9ah+gcn8DiJHe012nIVj2a4QX8SKS/ikBM=;
 b=QrtgQBUShNR+hmpY4+lZrWMg9QZVpqMXkk18/dg86HH5UIJZkghSuSmd9vam9XK10lRZ0H
 jlU5Lr6NVNAubzbU5w/GbW/RyWtby4QLpxCOkXlvuAgHdO48qWe1sK9zYk0TNjTfkY+JRn
 iwPqcM9SEBxCNdYQ6hnX5sma1/5RTKM=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-LKVsjaxfMfWnnQ-vGmTeaA-1; Mon, 09 Mar 2020 02:04:16 -0400
X-MC-Unique: LKVsjaxfMfWnnQ-vGmTeaA-1
Received: by mail-ot1-f71.google.com with SMTP id j2so6005542otk.14
 for <ltp@lists.linux.it>; Sun, 08 Mar 2020 23:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=doO3mUxhVBwU5i8uBiTyZSuCAIgOUXEdWRtvmnicnyw=;
 b=G1li5Bi5F0AuamF3NpTTMgTUND/QVioqiU7RJO0ZryYutZGGnK/fCDo1IpXGMI+axf
 VxM3sT2Uae6+lcmrM9+9SsMtumeTYPhktjnR2e799dn/MziKJr75iHPgsaZmXWdLg/eX
 H8gXz9yIuyVJanRfPrBpxv6KSkbw+XJzfSZAJGbqVEo26WF/fX97u1Y6m5JZYoAXBgeq
 qc6v1z+eiyWzgflmEjH5oX0AYQtBCCDaVtQRFOgN38tRXbjL9eREdtVsnGtt9HoUjugA
 0/3gTImj9j986nti/aTBGIuPY1P1sN8i3TLsgdXMoIwhiywVOSvawyA8LM7pjNb/tvVE
 uJiw==
X-Gm-Message-State: ANhLgQ33cnJ/w38yUKIQQ5WlUou+Be4RtiTthPbLGySxIq2CV/GrCEi7
 tuP0hedDLo1T37pNFIIErbrUFgk+Z2IgYsONuvoJWbMrDLmyPvqzLYbQtAyMSO6GVFbdHeyZYa2
 N8qmO1q4Y3oE2Imxsy7QLgjs2a38=
X-Received: by 2002:a05:6830:1213:: with SMTP id
 r19mr3859080otp.17.1583733855205; 
 Sun, 08 Mar 2020 23:04:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuWuKSRXR+DzIEVm2YcYZzb2tOQOBGVo+qPm/bc8Lwl6GL5U9+KxWdteWjGgy4lFgot3B0XDwwpQYHtDA8OXrg=
X-Received: by 2002:a05:6830:1213:: with SMTP id
 r19mr3859057otp.17.1583733854873; 
 Sun, 08 Mar 2020 23:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200306071221.GA13530@dell5510>
 <1583490720-10003-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ce95Uyi1cZumF4drQ7NtehVwWyhcTM5L7cEjcb7he+oA@mail.gmail.com>
 <1d808289-aa4b-a47d-55cd-81908aaa532c@cn.fujitsu.com>
 <20200309045621.GA3631484@x230>
In-Reply-To: <20200309045621.GA3631484@x230>
From: Li Wang <liwang@redhat.com>
Date: Mon, 9 Mar 2020 14:04:03 +0800
Message-ID: <CAEemH2e+hb1xAan-osBFVj7NDoe_G_DBod-wQWM+xZjEw23vng@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] hugeshmctl01: Small refactor and remove
 stat_time
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
Content-Type: multipart/mixed; boundary="===============0319287301=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0319287301==
Content-Type: multipart/alternative; boundary="000000000000d6c10e05a065c536"

--000000000000d6c10e05a065c536
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2020 at 12:56 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li, Xu,
>
> > > Thanks for the quick work on refactoring. I'd suggest using the new
> > > '.request_hugepages'  in the testcase, would mind having a try?
> +1
>
> > OK. But I think we can merge this patch( it has a new line before
> func_stat,
> > remove ..) firstly and then I will use this library api in next patch f=
or
> > all related  hugepage cases.
>

That would be great!

> Yes, I also think this should be separated, thus merged this fix.
>

Thanks Petr for helping merge that.

--=20
Regards,
Li Wang

--000000000000d6c10e05a065c536
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 9, 2020 at 12:56 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Li, Xu,<br>
<br>
&gt; &gt; Thanks for the quick work on refactoring. I&#39;d suggest using t=
he new<br>
&gt; &gt; &#39;.request_hugepages&#39;=C2=A0 in the testcase, would mind ha=
ving a try?<br>
+1<br>
<br>
&gt; OK. But I think we can merge this patch( it has a new line before func=
_stat,<br>
&gt; remove ..) firstly and then I will use this library api in next patch =
for<br>
&gt; all related=C2=A0 hugepage cases.<br></blockquote><div><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">That would be great!</div=
><div class=3D"gmail_default" style=3D"font-size:small"></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
Yes, I also think this should be separated, thus merged this fix.<br></bloc=
kquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Thanks Petr for helping merge that.</div></div><div><br></div>-- <br><div=
 dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></=
div><div>Li Wang<br></div></div></div></div>

--000000000000d6c10e05a065c536--


--===============0319287301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0319287301==--

