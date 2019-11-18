Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C5FFE9F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 07:39:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3F633C23E2
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 07:39:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9DFE93C17C7
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 07:39:13 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id DEBCC60240A
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 07:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574059151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2GSuXFWwuHXorB1pTKOXj/DeAgfacxSOAWb+u3d6uW8=;
 b=JYZy3Zl13rGD1EtT3x47gFn32gMme3cO5SJCYNRGznDt4WQ8ihmHi1NAebH70wIpFrmJLc
 wzKjVpAP73jdeDJzt2pb5ULKGvAis+d99RtV58GkltSZEN7NBo6GAwyqpSvl5J6oDeoKE2
 RyowC6vud+E4L+a5GzrOa8VdqU6Vi2w=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-g-dI9uPePhyPAow3V4W2Rw-1; Mon, 18 Nov 2019 01:39:08 -0500
Received: by mail-oi1-f197.google.com with SMTP id k145so8269244oih.12
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 22:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=waMH2r9UB2J1NgtSJHA+y8FnVdJH7WSH6+vWjxfA1FA=;
 b=ChqqPF/fdVK2WEMUNZaYEHuSKHsDdGvcJ6+CyIEElSbfbhZvursLWGHxM7IBS934cZ
 HrFeoQ6E73f5ONzR6oHgrsdKAztr7pBdhHhJrVRhISOCpZVcfPwS6T7MdShYsW1jylk7
 BkUvAKbVR2g3RvbMtns7KPWZK9knXML+j1EryU/S1uShp34yg4eJX2tWWGRk7ZwSehFr
 Z1eYJKpASPN0DV564c3JCO73TwsBJH4b3AuLRSm5clXGPtZZd8cAV0rKSlz+wfIajxW5
 cOnmgQ+X3EW/b3+1y4YNOypdko9e/sG/SBKxN3Z4u3wimsEQvkf6yiYkqwFV/l66rN+h
 bOLA==
X-Gm-Message-State: APjAAAV3JcVEpjdHih+i3fcYc1t4b5vUCzlYK8FRm+IaqunegEkSdCfM
 dpfe56kdgm5pk260m2Q41lmDUS9mB9phOBGsrd0IA+onZPiJ5g316bHbSEu18BiX2S9emSZPppl
 I6g7lXimTuXDaTZfhXwABLoi+ywk=
X-Received: by 2002:a9d:4c85:: with SMTP id m5mr6313459otf.118.1574059147517; 
 Sun, 17 Nov 2019 22:39:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqzlEyrqVXUrJkHB1Ohbebu6oajNG6zGoH3RytWwX+OhLXWRjR9vPgjse9cyzmAnzQ8UydWsQErv4bVKDBiwHl0=
X-Received: by 2002:a9d:4c85:: with SMTP id m5mr6313442otf.118.1574059147177; 
 Sun, 17 Nov 2019 22:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20191113104149.42407-1-lkml@jv-coder.de>
 <CAEemH2eP-ibqs=Mc-aMYUxj7CJ-u9CUZnkD8=Ro_2td9StPVZQ@mail.gmail.com>
 <e506bf38-f1d9-6f9e-e4cd-6edf24f74cd9@jv-coder.de>
 <CAEemH2dWkKyx38HFNKDk6Lt1KiDYry9WVDx9Xzg7fVAkp3kOww@mail.gmail.com>
 <1c4d8fb5-58e4-5483-26c7-7ab38b5fbd9c@jv-coder.de>
 <CAEemH2dPwqX1FtNvF7=hxbAfVMz7i_u+TpUBaU1mqKhY-G0Vig@mail.gmail.com>
 <20191118061634.GA21536@x230>
In-Reply-To: <20191118061634.GA21536@x230>
From: Li Wang <liwang@redhat.com>
Date: Mon, 18 Nov 2019 14:38:55 +0800
Message-ID: <CAEemH2etxKzetDR+NW7+5WR=h=S6KAr_SSr+E-g_XRtUNyfmQg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: g-dI9uPePhyPAow3V4W2Rw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] configure.ac: Fix --with* options
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0912830408=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0912830408==
Content-Type: multipart/alternative; boundary="00000000000052d0d10597993476"

--00000000000052d0d10597993476
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 2:16 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> > Well, I just saw adding new #TODO here and hoping to solve this
> together, a
> > simple way I was thinking is:
>
> > +AS_IF([test "x$with_bash" !=3D xyes || test "x$with_python" !=3D xyes]=
,
> > +  [with_realtime_testsuite=3Dno]
> > +)
>
> > Of course, It's fine to fix that in a separate patch!
>
> I'm for merging this. I just wonder if it's not better to remove
> $with_bash and
> $with_python (as part of this patch), if they're not working.
>

Me too. I think we could fix that in one patch. But as Joerg mentioned they
will be working on the #TODO. So maybe it doesn't matter to do right now or
later.

>
> BTW better, than fixing bash/shell would be to actually rewrote tests
> which are
> using python and bash to C or posix shell.
> https://github.com/linux-test-project/ltp/issues/547
>
> Kind regards,
> Petr
>
>

--=20
Regards,
Li Wang

--00000000000052d0d10597993476
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Nov 18, 2019 at 2:16 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br>
<br>
&gt; Well, I just saw adding new #TODO here and hoping to solve this togeth=
er, a<br>
&gt; simple way I was thinking is:<br>
<br>
&gt; +AS_IF([test &quot;x$with_bash&quot; !=3D xyes || test &quot;x$with_py=
thon&quot; !=3D xyes],<br>
&gt; +=C2=A0 [with_realtime_testsuite=3Dno]<br>
&gt; +)<br>
<br>
&gt; Of course, It&#39;s fine to fix that in a separate patch!<br>
<br>
I&#39;m for merging this. I just wonder if it&#39;s not better to remove $w=
ith_bash and<br>
$with_python (as part of this patch), if they&#39;re not working.<br></bloc=
kquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Me too. I think we could fix that in one patch. But as Joerg mentioned th=
ey will be working on the #TODO. So maybe it doesn&#39;t matter=C2=A0to do =
right now or later.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
BTW better, than fixing bash/shell would be to actually rewrote tests which=
 are<br>
using python and bash to C or posix shell.<br>
<a href=3D"https://github.com/linux-test-project/ltp/issues/547" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/linux-test-project/ltp/issues=
/547</a><br>
<br>
Kind regards,<br>
Petr<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000052d0d10597993476--


--===============0912830408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0912830408==--

