Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37D30928D
	for <lists+linux-ltp@lfdr.de>; Sat, 30 Jan 2021 09:26:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F54F3C2F69
	for <lists+linux-ltp@lfdr.de>; Sat, 30 Jan 2021 09:26:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5CFFD3C2964
 for <ltp@lists.linux.it>; Sat, 30 Jan 2021 09:26:43 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 541BB600786
 for <ltp@lists.linux.it>; Sat, 30 Jan 2021 09:26:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611995200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LtUZC3e3r9RQwFu3OgIAy1yQU//qEmC+1N3kiesbIfs=;
 b=dnMb4vDfwbr8ExFKmp5sHzHQ4MRGtx7WW5TWzUq7JeKpBRPUtehUiHsWfsWinueIQbh4Vo
 35+H8sL3Zcc95wMD0yQqCtzD53J9A7LPBq5pg0r0CalctqZLB7VkvyUI3iQ+qilgM4SXhJ
 3/c7WxQ2LwMXy38m2aIoJNDMRhhHD3I=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-flZdbwa2PtO7v0ubCKKccA-1; Sat, 30 Jan 2021 03:26:38 -0500
X-MC-Unique: flZdbwa2PtO7v0ubCKKccA-1
Received: by mail-yb1-f200.google.com with SMTP id h192so239379ybg.23
 for <ltp@lists.linux.it>; Sat, 30 Jan 2021 00:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LtUZC3e3r9RQwFu3OgIAy1yQU//qEmC+1N3kiesbIfs=;
 b=ifJcqqNgEIeJiyao47F16m1Ey6ex7gTO+k+Sf9xU5vJyzNxJMbuB1mGnFb1XEagGYi
 wQswHFRgFW4AB8QUUSPhVZNZna9U2Uv6ONEyMhL2TYmUWoWdonDd8wBCHqg4XhEtprDV
 xJc5sYgYzY2tRoQv5ikDeBvZGvVYRyaQDvZsvmI/P4U+KgpyZiVwgM0h99yV4uwtUaSV
 1UCqKEpHu4NkRICZOP/olaJvw6HqeqfMCr+qjxxMoZ2cDTwT+AUP6anFYMvikbbfJevL
 JEIGHHyItc5vv6C1wAOvG11X63Df9KVuKVIb2SLWQuafWUJV7agfNgpz2SJyA1Va3h8y
 KYaA==
X-Gm-Message-State: AOAM533UlXmvxKwFfqCOdtFF6uJf+45BSe/PkEl7mP2CpeA6IQxfR261
 cFwNMwJSeZ9FgfJGWjjHCz2xSm77viTJtyrt5+i9v4U+3HNfBB6hWWzn0BthzRqGQj84N+MAHrZ
 RmlYVlJYZd6T2krO4Yj00D4/64sw=
X-Received: by 2002:a25:1241:: with SMTP id 62mr11972934ybs.366.1611995197454; 
 Sat, 30 Jan 2021 00:26:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5SfA38uS5Yk1L68cMvX4qeHtAPYvgkKKzEREI14d0EG6cn30rN9LP3Pcbqnn+S9UU5YqEAU+sic3gLQyhTC0=
X-Received: by 2002:a25:1241:: with SMTP id 62mr11972914ybs.366.1611995197117; 
 Sat, 30 Jan 2021 00:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-7-pvorel@suse.cz>
 <YBRroFhaxdqCLv2i@pevik> <YBRs9sySYXT6Bwlk@pevik>
In-Reply-To: <YBRs9sySYXT6Bwlk@pevik>
From: Li Wang <liwang@redhat.com>
Date: Sat, 30 Jan 2021 16:26:25 +0800
Message-ID: <CAEemH2foqS4=kTPJ50f2OZmnGU7wn4Kth0Onet-a6EX1J45-Bw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 6/6] zram: Increase timeout according to used
 devices
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
Content-Type: multipart/mixed; boundary="===============1436248490=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1436248490==
Content-Type: multipart/alternative; boundary="0000000000001ab60d05ba19e11f"

--0000000000001ab60d05ba19e11f
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 30, 2021 at 4:16 AM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi,
>
> > > +   TST_TIMEOUT=$((dev_num*200))
> > Actually on heavy loaded machine this is not enough due BTRFS.
> > I can add something like dev_num*600 or even -1 (then previous commit
> would not
> > be needed, but IMHO still useful).
>

I personally think -1 is better.



> And bad thing is that it breaks other zram tests, because the timer
> probably
> does not allow to run the cleanup:
>
> _tst_setup_timer()
> {
> ...
>         sleep $sec && tst_res TBROK "test killed, timeout! If you are
> running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9
> -$pid &
>
> I'm not sure if shell allow us to do it better. Maybe sent different
> signal than
> SIGKILL and define 'trap _tst_do_exit' for that signal?


Sounds practicable. I guess sending SIGINT could make more sense, since
sometimes we use CTRL+C stop test in debugging by manual, test should
do cleanup work for that behavior too.

-- 
Regards,
Li Wang

--0000000000001ab60d05ba19e11f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Jan 30, 2021 at 4:16 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Hi,<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0TST_TIMEOUT=3D$((dev_num*200))<br>
&gt; Actually on heavy loaded machine this is not enough due BTRFS.<br>
&gt; I can add something like dev_num*600 or even -1 (then previous commit =
would not<br>
&gt; be needed, but IMHO still useful).<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">I personally think =
-1 is better.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
And bad thing is that it breaks other zram tests, because the timer probabl=
y<br>
does not allow to run the cleanup:<br>
<br>
_tst_setup_timer()<br>
{<br>
...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep $sec &amp;&amp; tst_res TBROK &quot;test =
killed, timeout! If you are running on slow machine, try exporting LTP_TIME=
OUT_MUL &gt; 1&quot; &amp;&amp; kill -9 -$pid &amp;<br>
<br>
I&#39;m not sure if shell allow us to do it better. Maybe sent different si=
gnal than<br>
SIGKILL and define &#39;trap _tst_do_exit&#39; for that signal?</blockquote=
><div><br></div><div class=3D"gmail_default" style=3D"">Sounds practicable.=
=C2=A0I guess sending SIGINT could make more sense, since</div><div class=
=3D"gmail_default" style=3D"">sometimes we use CTRL+C stop test in debuggin=
g by manual, test should</div><div class=3D"gmail_default" style=3D"">do cl=
eanup work for that behavior too.</div></div><div><br></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--0000000000001ab60d05ba19e11f--


--===============1436248490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1436248490==--

