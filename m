Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B461ADAC6
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 12:13:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71FCE3C2AD0
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 12:13:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D51F63C2ABA
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 12:13:23 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 10AC21400538
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 12:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587118401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4wafhnWg0c7uv9A7KvNIBtw936N7wlJEU2b2rFDgon0=;
 b=cEEckzNZu/HcV0DgYpDfZCI6WR/aCabZENIxzPNF/6hR+hfj0EkEYrzpU4ZvikHobA137A
 xwWzXCz2AWfpGQ1JcfgWnAJFFmK1aOysAZtHJNiInEnLAQ2xzH2s3UlNyXee3M2xUVQUsp
 GsdM/LeBlH86CP0lMOsJFntb6hUOtQI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-NqZYmT9hPZWlweXO6R7pnw-1; Fri, 17 Apr 2020 06:13:19 -0400
X-MC-Unique: NqZYmT9hPZWlweXO6R7pnw-1
Received: by mail-lf1-f72.google.com with SMTP id b22so636692lfa.18
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 03:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kDUo0CSic/J8VMbEw7nylYhg9YTRH0K8Mn6E6Zw7idc=;
 b=b17GJbpZUXdGqYHtuXKbZZ1j6c+dcfSUFCsIIXA4tOniSUvcFCI9j3GMJXe8RXVSKu
 vhQ2L8LTqzJpppk+NGeAH1wxeg92FuXmwTW70O0ol9aSyHDt4HlH3jEMevh45SCWxiUF
 H8SckQDXMqVHf3JNZBa0V0QYp8PL8AoGE2F5akmeldtjOVDPASXE9G3JoWegiWBfteC/
 7VAgP82szgIg8Wh1M6elRhXnnuFaJCq1qW33DDNPrgNLuE15PBsBtAKieHQdiETpexop
 khD4nh41Js0hu9N2RGKjyxBbXX5L3ajCosfhXJ584wyh2SKodnhW+cRtp11K2BxNkg0u
 qgNw==
X-Gm-Message-State: AGi0PuYQKXYOW8MQ+T9hez6D+QvkCBgQOnuLRc2HPU3wkPM/k53H1gWy
 yu8a9TNInnWQ1ZS74fekHaY9nUw8iPeswh6T/NXBIgizrpOwxqMKqJyg0COQTeTZSuIV9yNLSPh
 ptIgd3AOD+ssUM46DgjQSpVJQ+/k=
X-Received: by 2002:ac2:4853:: with SMTP id 19mr1557211lfy.171.1587118397654; 
 Fri, 17 Apr 2020 03:13:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypLTKPlnyUzVXma4MXZv40r2VduCiZ4QptTwE44h1MPk6yibsvYaDcD8OYU5rDClMGW/sxSv9Mge3WfBsY0Su/E=
X-Received: by 2002:ac2:4853:: with SMTP id 19mr1557196lfy.171.1587118397486; 
 Fri, 17 Apr 2020 03:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2fUpkmU86d3M8LAL13x-vsC96ce8QdyjGacqy9m4_bD4g@mail.gmail.com>
 <e6dc08b9-bcce-51af-e64d-00b02fc459a3@cn.fujitsu.com>
In-Reply-To: <e6dc08b9-bcce-51af-e64d-00b02fc459a3@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 17 Apr 2020 18:13:06 +0800
Message-ID: <CAEemH2eMVJE0=LwgRVihjTXCm_LYqTHSb4ehPKWzXV_Siou0uA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1612777819=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1612777819==
Content-Type: multipart/alternative; boundary="0000000000004c8eff05a379cc2a"

--0000000000004c8eff05a379cc2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 5:56 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Hi Li
>
> > Hi Xu,
> >
> > I feel confused that is this test duplicated with the one Lanie's
> > patch2/2? why using the same test name?
> My pipe2_03.c is to test O_DIRECT flag, Lanie's patch is to test
> O_NONBLOCK flag as my perivous email said, see[1].
>
> I don't think it is a problem(I need to generate patch-set, so named
> pipe2_03.c is better).
>

But that will cause git patch confiliction becasue same file name, isn't it=
?
I'm going to apply Lanie's two patches(modified on the git.v3), and once it
done, your patch will broken on git confiliction.


--=20
Regards,
Li Wang

--0000000000004c8eff05a379cc2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 17, 2020 at 5:56 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li<=
br>
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
pipe2_03.c is better).<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">But that will cause git patch confil=
iction=C2=A0becasue=C2=A0same file name, isn&#39;t it?</div></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">I&#39;m going to apply Lanie&=
#39;s two patches(modified on the git.v3), and once it done, your patch wil=
l broken on git confiliction.</div></div><div><br></div><div><br></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000004c8eff05a379cc2a--


--===============1612777819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1612777819==--

