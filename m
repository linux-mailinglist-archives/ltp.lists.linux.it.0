Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A91ADB98
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 12:51:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 075343C2ACC
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 12:51:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 267953C00C0
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 12:51:17 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 61E90200D59
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 12:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587120674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8UJHXOjFC5Ccy33s6pf/dkYW2qYjkCJGWIlNsZ2rAxE=;
 b=RSFc2MuZqKXQqCjGClQw5yuIHQUmkUT5D7zCtyDBwufx8+Lbv1Olf4XD5GMCyLMhnDzWDP
 jYH+f9cMfTh6cXNnrMSFerJq1riLyxtOX86Q2FTcT1LNuDnr5IlWtdd41sQV8XONZz6jsJ
 h7pWbke2D2h3bS1Vt120AP/UEWnOG14=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-itDjqbAgOreZWdLyNwqSbA-1; Fri, 17 Apr 2020 06:51:12 -0400
X-MC-Unique: itDjqbAgOreZWdLyNwqSbA-1
Received: by mail-lf1-f70.google.com with SMTP id g5so676394lfh.9
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 03:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXmaX27ZUtTXTDsqfA45fcp5FYf6ZckH7nM7H/luTm8=;
 b=YC8ZqqrmmGP4JM/hiqM9x2U7hgnyncUutwsutGSkt7vjJL5DsoCZyo95aAg8SfmYWI
 nsOE8BPI9zmbiWAmLVMZPIYpAhEWoFILZ9mMo0tK2KI2Wcsr4f50Zf17Gukel/kfa1KX
 WveNA0XVQybfzYdKUOyw0MZ4+mUCnliqflxax5kcW0oUWyUsDLGfItZ7hx0a6bC4Ykyu
 41kYdWbR3oRgPGMg2Q8sjHAqizphFz2F1617oE+WIrzsS0kbYL/TFLJwe/Gwk2B+XaKq
 gogIc+KHE++xNM+LqByIBXU0+KYeZtfiojCZd2DgE6KjXDGNnbD4hjGT7MiF/UTyttsp
 KXfA==
X-Gm-Message-State: AGi0PuZ2L8arF0sVqtICDAQes8s02FF5QQQXn74OGupZUVCE/PoXVXix
 hxhNM5XJuv/lH6q1Ks1bPrGNQn3m9yfp2tBfKHqPngUmPlxbg1dEMxfKPwGnDPJZDJ/y/uHjvx0
 klwGXPqHjT3//1sxroC/C/UhdgXo=
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr1717831ljc.217.1587120670549; 
 Fri, 17 Apr 2020 03:51:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypLnJ+JSQEeL0I21AOH80T2Aq6jrAmsn9kBWtFV5804Hc7WHL6CkTUbrv5TB1ttNq0vNWh2HyCgm5LTPxYZZ9oM=
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr1717826ljc.217.1587120670363; 
 Fri, 17 Apr 2020 03:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2fUpkmU86d3M8LAL13x-vsC96ce8QdyjGacqy9m4_bD4g@mail.gmail.com>
 <e6dc08b9-bcce-51af-e64d-00b02fc459a3@cn.fujitsu.com>
 <CAEemH2eMVJE0=LwgRVihjTXCm_LYqTHSb4ehPKWzXV_Siou0uA@mail.gmail.com>
In-Reply-To: <CAEemH2eMVJE0=LwgRVihjTXCm_LYqTHSb4ehPKWzXV_Siou0uA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 17 Apr 2020 18:50:58 +0800
Message-ID: <CAEemH2eVn8BHXaR5bJMjRZy1xOnbNAEMxX2QR2DK=wOAts800w@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Content-Type: multipart/mixed; boundary="===============0267252887=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0267252887==
Content-Type: multipart/alternative; boundary="000000000000c5eb1e05a37a5323"

--000000000000c5eb1e05a37a5323
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 6:13 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Fri, Apr 17, 2020 at 5:56 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> wrote:
>
>> Hi Li
>>
>> > Hi Xu,
>> >
>> > I feel confused that is this test duplicated with the one Lanie's
>> > patch2/2? why using the same test name?
>> My pipe2_03.c is to test O_DIRECT flag, Lanie's patch is to test
>> O_NONBLOCK flag as my perivous email said, see[1].
>>
>> I don't think it is a problem(I need to generate patch-set, so named
>> pipe2_03.c is better).
>>
>
> But that will cause git patch confiliction becasue same file name, isn't
> it?
> I'm going to apply Lanie's two patches(modified on the git.v3), and once
> it done, your patch will broken on git confiliction.
>
>
One feasible way is that I help to rename  Lanie's pipe2_03.c to pipe2_04.c
and apply the patches first, then you do rebase your codes on the
latest commit. Is that OK for you?

--=20
Regards,
Li Wang

--000000000000c5eb1e05a37a5323
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 17, 2020 at 6:13 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 17, 2020 at 5:56=
 PM Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_=
blank">xuyang2018.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi Li<br>
<br>
&gt; Hi Xu,<br>
&gt; <br>
&gt; I feel confused that is this test duplicated with the one Lanie&#39;s =
<br>
&gt; patch2/2? why using the same test name?<br>
My pipe2_03.c is to test O_DIRECT flag, Lanie&#39;s patch is to test <br>
O_NONBLOCK flag as my perivous email said, see[1].<br>
<br>
I don&#39;t think it is a problem(I need to generate patch-set, so named <b=
r>
pipe2_03.c is better).<br></blockquote><div><br></div><div><div style=3D"fo=
nt-size:small">But that will cause git patch confiliction=C2=A0becasue=C2=
=A0same file name, isn&#39;t it?</div></div><div style=3D"font-size:small">=
I&#39;m going to apply Lanie&#39;s two patches(modified on the git.v3), and=
 once it done, your patch will broken on git confiliction.</div></div><div>=
<br></div></div></blockquote><div><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">One feasible way is that I help to rename =C2=A0Lan=
ie&#39;s  pipe2_03.c to pipe2_04.c and apply the patches=C2=A0first, then y=
ou do rebase your codes on the latest=C2=A0commit. Is that OK for you?</div=
></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><di=
v dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></di=
v>

--000000000000c5eb1e05a37a5323--


--===============0267252887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0267252887==--

