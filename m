Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 590FD4B0E71
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Feb 2022 14:30:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03A883C9E87
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Feb 2022 14:30:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 402AF3C574A
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 14:30:32 +0100 (CET)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 60E7F6002AC
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 14:30:32 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso8496048pjt.4
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 05:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XhLiHiZDuDplMFDtJsnflwzcfOSpAEVobIqv2Grl6LU=;
 b=ic6UpIhh9f6laqbRFY3h5bpJHVYNHo4zn7AmodtEduq+r7T/VarbUamLJGOgYTgVPO
 4Uy9xisd1szkK6CsOtfOMQf2OH8fhlWCGohSrYbTArMl9twMOAn22KD4rx2Gj0ZLCZcw
 n2mKF8i5O/YjysjWzoPDLRBUQubu2dy+BYfBvw0fYCxUjUs8Rk3GURafPauGpW28VKu1
 WBTNbNmy88bZLwBQ/71w170Jn+Apyp5AnIc9puq7fQueQ1UX/xsRlagTiisHfuklBMgJ
 SGAGktr3XKRqPoc04TtKu7/Zqjm3oA1fgu0vbLVrEmyeeQKMXbUfuahkTLfX0oATzzIZ
 XaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XhLiHiZDuDplMFDtJsnflwzcfOSpAEVobIqv2Grl6LU=;
 b=3fs+30F7AzVC3HtoyL1gMyhd/cIsuY8wnyGQC+55LqM3eoyQnmI9+0wmV0M4rtHFC9
 J8re2W3lsmA4xWq/SMeXz1ypyivkcrMcbN+YKMfZoNt9BukSclnY642ek/WrlICUxIue
 3rQNXy87zPyYbg74t/D3nRt57CxzCaMnHKFYBnSqUL8KG3KxQjK5uIjPzucOSyAp60LV
 6krg6hTKMI3B7vP+85lp6rHflRHISs/MehLXS8Q1HoowDiIkUiZF1Wp6S80aMSnd0bwP
 0RsBTcC+SY/QmHDl6mLAx/knE1Agrrv0UBtPo99p9Lw3QpohbmvvmacaXcypjW9WSs+W
 EZhA==
X-Gm-Message-State: AOAM532PPlKwpgL4ZFz8GmE8cmOEzvOKiSZ840k0wg5W6vcB+DtCihbc
 ZIG63M4cRVdH5xVyHWPf/vh2U8nlLbEVBVb6M5w=
X-Google-Smtp-Source: ABdhPJzR91U9FLrXBXU7BTRUofnPttf7NF96Q3yo2JrcAOaKsr4RDI6pTRZwcdKDCv7YLgmFH43XS6DNe0u+J6Jgw1A=
X-Received: by 2002:a17:902:eb45:: with SMTP id
 i5mr7550989pli.75.1644499830871; 
 Thu, 10 Feb 2022 05:30:30 -0800 (PST)
MIME-Version: 1.0
References: <CAKWYkK03vnioG=XBmGOzAruwVo_XtZgn9k+dw8HPXyvTwfaVQQ@mail.gmail.com>
 <YgUK/1qWA0qQ304h@yuki> <77bcf013-4ab3-5eb0-8a2c-9f346a5b1a77@suse.cz>
In-Reply-To: <77bcf013-4ab3-5eb0-8a2c-9f346a5b1a77@suse.cz>
From: Kautuk Consul <kautuk.consul.80@gmail.com>
Date: Thu, 10 Feb 2022 19:00:20 +0530
Message-ID: <CAKWYkK2HwzFNASKA0rotrytAh5KvKkZgiLLc4D9Y0eE+n7x+pg@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Open Question about KVM test-cases.
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1640351315=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1640351315==
Content-Type: multipart/alternative; boundary="000000000000409ba005d7a9f461"

--000000000000409ba005d7a9f461
Content-Type: text/plain; charset="UTF-8"

Thanks Martin. Will look into it.

On Thu, 10 Feb 2022, 18:30 Martin Doucha, <mdoucha@suse.cz> wrote:

> On 10. 02. 22 13:54, Cyril Hrubis wrote:
> > Hi!
> > Currently there are no tests for KVM in LTP, however Martin Doucha is
> > working on some CVE reproducers and send a RFC while ago (added to CC).
>
> You can find the RFC patch below. I've rewritten a large chunk of the
> code in the mean time and the example CVE reproducer doesn't actually
> work (the setup is incomplete so it passes even when it shouldn't) but
> I'm getting close to something that actually works. You can expect the
> first finished version before the end of the month.
>
>
> https://patchwork.ozlabs.org/project/ltp/patch/20220106165435.16556-1-mdoucha@suse.cz/
>
> --
> Martin Doucha   mdoucha@suse.cz
> QA Engineer for Software Maintenance
> SUSE LINUX, s.r.o.
> CORSO IIa
> Krizikova 148/34
> 186 00 Prague 8
> Czech Republic
>

--000000000000409ba005d7a9f461
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks=C2=A0Martin. Will look into it.</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 10 Feb 2022=
, 18:30 Martin Doucha, &lt;<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.=
cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 10. 02. 22 13:=
54, Cyril Hrubis wrote:<br>
&gt; Hi!<br>
&gt; Currently there are no tests for KVM in LTP, however Martin Doucha is<=
br>
&gt; working on some CVE reproducers and send a RFC while ago (added to CC)=
.<br>
<br>
You can find the RFC patch below. I&#39;ve rewritten a large chunk of the<b=
r>
code in the mean time and the example CVE reproducer doesn&#39;t actually<b=
r>
work (the setup is incomplete so it passes even when it shouldn&#39;t) but<=
br>
I&#39;m getting close to something that actually works. You can expect the<=
br>
first finished version before the end of the month.<br>
<br>
<a href=3D"https://patchwork.ozlabs.org/project/ltp/patch/20220106165435.16=
556-1-mdoucha@suse.cz/" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://patchwork.ozlabs.org/project/ltp/patch/20220106165435.16556-1-mdoucha@=
suse.cz/</a><br>
<br>
-- <br>
Martin Doucha=C2=A0 =C2=A0<a href=3D"mailto:mdoucha@suse.cz" target=3D"_bla=
nk" rel=3D"noreferrer">mdoucha@suse.cz</a><br>
QA Engineer for Software Maintenance<br>
SUSE LINUX, s.r.o.<br>
CORSO IIa<br>
Krizikova 148/34<br>
186 00 Prague 8<br>
Czech Republic<br>
</blockquote></div>

--000000000000409ba005d7a9f461--

--===============1640351315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1640351315==--
