Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61152EBDB5
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 07:14:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EEB613C249A
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 07:14:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C552D3C2419
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 07:14:11 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E849714017F5
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 07:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572588849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=enZRJ1L+jfUvrSNSJmjkWjmwRSJksyD16gwfchEn8aA=;
 b=Noot8FgmUAu+L/9/TmZsnqHK5t1efSchs6ad8VvlW8MO000/gtNsNpcHDx04N1zhXEThuJ
 YIyG2rG57in51of+7yvWoKw+M8Gy/4Fv21keIaAGIuJEx4vQvUmGxIHlz1Qn4b7OTtg6nw
 16803urfuhe+t+R9Z+Z43yFSmi0z9yk=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-pSkCt8uCP_6CYygGQjrVhg-1; Fri, 01 Nov 2019 02:14:07 -0400
Received: by mail-ot1-f69.google.com with SMTP id e104so5448929ote.2
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 23:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r+JJCnMZNtYG5SkpY25gNutVuPePWFqAtmxrYh/aoEA=;
 b=Ew6Rf/QHCHvAmx1ycBYgdMMkksDctneDQnitXszwfO7I/v0ji5DOY7E4cftlg3y+lz
 aZZJuJQcufYj6uaxPsIHj2xcyPvxPuSN01Rzy/beX0IPJSw09egZ78nTWqm1jBbaOzaA
 CXOa+7ynEGyETFt12ewMH5YYOsudvxL/U1jAiUm0Pe5AFuiJFYqiYw5sW1TsMPTRiu8U
 Pig3FJWlUnadYKUzAsq/EkhCp2DmXlDnVCWRJUtZr1gKMwQtvRwnUql188fw49R21UkJ
 yoaMWAcoCC9LqMtYH+0KV423hNeLKp/KegCW7F/9kDObrDufwpw5DIptEABOelOjLDxY
 XNeA==
X-Gm-Message-State: APjAAAUzt2/XVNOxy3TM1t6lD3f6SZgkA7KmgXsYExQz4nksU6IzjWPk
 E8VFUELa40er3cxUh4i388FfKv3Fb1T9pI/QolCac/7Tgh8cOQhhlUl0JuUWSduTxB6+2bDw4J0
 prz6l2HVsWHtFsI2y+fudQuRJAJI=
X-Received: by 2002:a05:6808:b15:: with SMTP id
 s21mr647837oij.138.1572588846529; 
 Thu, 31 Oct 2019 23:14:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxf8ocq6yGSMTfYXwrRvDa3RDpWnJ/PuHCFu2W2348gYzI4ykRWjyd0rnNocXEc2MFzXTPnmR2YNHokt38XJoQ=
X-Received: by 2002:a05:6808:b15:: with SMTP id
 s21mr647828oij.138.1572588846308; 
 Thu, 31 Oct 2019 23:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191031064451.14966-1-tesheng@andestech.com>
 <CAEemH2dOwoE2YMXn-+Ugb=-3=V5b-Q-X0KU+xDdRogWF-5ViWQ@mail.gmail.com>
In-Reply-To: <CAEemH2dOwoE2YMXn-+Ugb=-3=V5b-Q-X0KU+xDdRogWF-5ViWQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 1 Nov 2019 14:13:55 +0800
Message-ID: <CAEemH2cxrKbYF2k6__MQmpfsbWQ6Xez+xcFSwReP_wjxNi-gCw@mail.gmail.com>
To: Eric Lin <tesheng@andestech.com>
X-MC-Unique: pSkCt8uCP_6CYygGQjrVhg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugetlb: Initialize orig_shmmax and orig_shmmni
 value
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
Cc: alankao@andestech.com, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2028201245=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2028201245==
Content-Type: multipart/alternative; boundary="0000000000009002cc059642df61"

--0000000000009002cc059642df61
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2019 at 4:17 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Thu, Oct 31, 2019 at 2:45 PM Eric Lin <tesheng@andestech.com> wrote:
>
>> When doing save_nr_hugepages() in setup() and there
>> is no Huge page support in system, it will call
>> cleanup() and write wrong orig_shmmax and orig_shmmni
>> value back to file.
>>
>> To fix it, we initialize the orig_shmmax and
>> orig_shmmni to -1 and check it in cleanup().
>>
>> Signed-off-by: Eric Lin <tesheng@andestech.com>
>
> Reviewed-by: Li Wang <liwang@redhat.com>
>

Pushed.

--=20
Regards,
Li Wang

--0000000000009002cc059642df61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 31, 2019 at 4:17 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 31, 2019 at 2:45=
 PM Eric Lin &lt;<a href=3D"mailto:tesheng@andestech.com" target=3D"_blank"=
>tesheng@andestech.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">When doing save_nr_hugepages() in setup() and there<b=
r>
is no Huge page support in system, it will call<br>
cleanup() and write wrong orig_shmmax and orig_shmmni<br>
value back to file.<br>
<br>
To fix it, we initialize the orig_shmmax and<br>
orig_shmmni to -1 and check it in cleanup().<br>
<br>
Signed-off-by: Eric Lin &lt;<a href=3D"mailto:tesheng@andestech.com" target=
=3D"_blank">tesheng@andestech.com</a>&gt;=C2=A0</blockquote></div></div></b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div class=3D"gmail_quote"><div><span class=3D"gmail_default" style=3D"fo=
nt-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com=
" target=3D"_blank">liwang@redhat.com</a>&gt;</span></div></div></div></blo=
ckquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Pushed.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div><=
/div></div></div>

--0000000000009002cc059642df61--


--===============2028201245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2028201245==--

