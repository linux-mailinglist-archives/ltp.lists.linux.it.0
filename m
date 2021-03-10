Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A922333C52
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:13:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 005D93C6A2B
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:13:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 6E9DD3C4B4F
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:13:26 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 7993A140052D
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615378403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cf7ZDoCIjMwOXyMJQBti2NbC+QorEmvJiTj0ag2jsm8=;
 b=MApmBJWrsrXccoE+G8Czv45gIsMeKXquOVNVwH8iFdEeLndYZOFq1ChyyQyQZqYY1HKcw3
 UCiAHcwlYF/95yCjdYGmX7QUwdQUbLoZv9Ki09IGpHQCNMpHwlDwUNAvLmB6tI9GT2ljJJ
 JoT3wfzC2mfqERurv3CYYrQM+8kO0sE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-OxzNTMUKNYqv2PynX0DgNQ-1; Wed, 10 Mar 2021 07:13:19 -0500
X-MC-Unique: OxzNTMUKNYqv2PynX0DgNQ-1
Received: by mail-yb1-f200.google.com with SMTP id y7so20966467ybh.20
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 04:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cf7ZDoCIjMwOXyMJQBti2NbC+QorEmvJiTj0ag2jsm8=;
 b=eW16AT3C5jibulxLgd8ziROZa3RvKU4cVuwESjNvH55Rq/iSn2PDctNtUzFIBGohXS
 weyi3v+KVobO+4AWoRr8Z/6XWcfu26Kx9KArUooamCvTmQin+dyXDM6iRP+IPuwPg4Oy
 IwhgIog5ry3EiEqmndqplM8bdOwBElyWhub7dxHPUqeVicaOdVSEHgXIjP5WhAb09EBj
 URJldxPt0+E8lfGv2oKbr/IGi82DfD1ipoTu5ESRFeEDDOZpFYPk8j8NNCH+YmEmlKBB
 5Rrw/o90GhBQFd8sR18+FkdBtlTHUcOQGTnLmXHkgTrY5MyeBJ2K7m22XPC5SnwzmzHF
 QZMg==
X-Gm-Message-State: AOAM531YMzb6NEI0FKRrQXzPZlRpW9jzZqaUjUpvHCddeb/RR/J0FbYv
 jKmVbFjLZyzItrOCwoIcbs4BSkTWhBnn9mj7rXJ1KDt9K0imNUruP/ZZCxnSmLs4cVAipWzyQ0F
 m/RyliCHoQnbJpnMut1uj+PiCxBg=
X-Received: by 2002:a25:1485:: with SMTP id 127mr3812338ybu.243.1615378399416; 
 Wed, 10 Mar 2021 04:13:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMsx1xJXoHUZsuvCbwVEQijmhiOKn5X26Tv7z0XCcebBOhrK9hSw3x+44TKl8xJMu+93Xi5+s/Qlv3u5XEHio=
X-Received: by 2002:a25:1485:: with SMTP id 127mr3812323ybu.243.1615378399240; 
 Wed, 10 Mar 2021 04:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20210309080028.16284-1-liwang@redhat.com>
 <20210309094525.4ggmppfpvavsvjzl@vireshk-i7>
 <YEdhgvXg/mYkppz6@pevik> <20210309115623.ze5c7li7vuf65gvg@vireshk-i7>
 <CAEemH2esvVfy0YeCL2nXgj441XeBY7F+Y8MVEJ31nKRNPvjC+g@mail.gmail.com>
 <20210310084304.d6b626clzj5rafvh@vireshk-i7> <YEibPvXnSpGceN/e@pevik>
In-Reply-To: <YEibPvXnSpGceN/e@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 10 Mar 2021 20:12:32 +0800
Message-ID: <CAEemH2c0LQPc1dY=ErruKHOGU3OXeKXQgh3VMaYveZN+qVnCKA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCh v2] clock_gettime04: print more info to help
 debugging
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0388595380=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0388595380==
Content-Type: multipart/alternative; boundary="000000000000aa373205bd2d972d"

--000000000000aa373205bd2d972d
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

Petr Vorel <pvorel@suse.cz> wrote:

...
>
> > I think it would be worth keeping it simple then and just print all
> > variants only once from setup(). Leave the special case of REALTIME
> > clock.
> +1.
>
> From a long term, I'd like some easy solution when printing would be
> handled in
> the library. Some time ago I posted a patch which turned .test_variants
> from int
> into array of string description [1]. Cyril didn't see much value at it and
>

I look back at patch[1], IMHO, splitting the test variant struct is not a
good idea.
I'd rather go print variants[i].desc in the library directly but not split
it to make
struct here and there :).


> didn't like that it introduced more ifdefs (together with Viresh).
> But now we have docparse, could we reconsider this approach? Maybe we
> could keep
> .test_variants and introduce .test_variants_desc for tests which are
> simple enough.
> Or, maybe there is a cleaner solution for clock_adjtime0* tests which I
> don't
> see.
>

Maybe there is.  We can have more time to thinking/discussing this.

So, would you mind if I merge this V2 patch first?

(Since we're encountering a sporadical(we can't reproduce it manually)
failure. Hope this can print more useful info to locate the issue.)


>
> Kind regards,
> Petr
>
> [1]
> https://patchwork.ozlabs.org/project/ltp/patch/20200519120725.25750-1-pvorel@suse.cz/
>
>

-- 
Regards,
Li Wang

--000000000000aa373205bd2d972d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.=
cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote:<br></div><div dir=3D"lt=
r" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</spa=
n><br>
<br>
&gt; I think it would be worth keeping it simple then and just print all<br=
>
&gt; variants only once from setup(). Leave the special case of REALTIME<br=
>
&gt; clock.<br>
+1.<br>
<br>
From a long term, I&#39;d like some easy solution when printing would be ha=
ndled in<br>
the library. Some time ago I posted a patch which turned .test_variants fro=
m int<br>
into array of string description [1]. Cyril didn&#39;t see much value at it=
 and<br></blockquote><div><br></div>I look back at patch[1], <span class=3D=
"gmail_default" style=3D"font-size:small"></span>IMHO, <span class=3D"gmail=
_default" style=3D"font-size:small"></span>splitting the test variant<span =
class=3D"gmail_default" style=3D"font-size:small"> struct=C2=A0</span>is no=
t a good idea.</div><div class=3D"gmail_quote"><span class=3D"gmail_default=
" style=3D"font-size:small">I&#39;d rather go print=C2=A0variants[i].desc i=
n the library directly but not split it to make</span></div><div class=3D"g=
mail_quote"><span class=3D"gmail_default" style=3D"font-size:small">struct =
here and there :).</span></div><div class=3D"gmail_quote"><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
didn&#39;t like that it introduced more ifdefs (together with Viresh).<br>
But now we have docparse, could we reconsider this approach? Maybe we could=
 keep<br>
.test_variants and introduce .test_variants_desc for tests which are simple=
 enough.<br>
Or, maybe there is a cleaner solution for clock_adjtime0* tests which I don=
&#39;t<br>
see.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Maybe there is.=C2=A0 We can have more time to thinkin=
g/discussing this.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">So, wo=
uld you mind if I merge this V2 patch first?=C2=A0</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">(Since we&#39;re encountering a sporadical(we can=
&#39;t reproduce it manually)</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">failure. Hope this can print more useful info to locate the =
issue.)</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0<=
br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Kind regards,<br>
Petr<br>
<br>
[1] <a href=3D"https://patchwork.ozlabs.org/project/ltp/patch/2020051912072=
5.25750-1-pvorel@suse.cz/" rel=3D"noreferrer" target=3D"_blank">https://pat=
chwork.ozlabs.org/project/ltp/patch/20200519120725.25750-1-pvorel@suse.cz/<=
/a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000aa373205bd2d972d--


--===============0388595380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0388595380==--

