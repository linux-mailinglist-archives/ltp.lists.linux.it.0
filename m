Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B101731BA
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 08:25:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A9DF3C6AD7
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 08:25:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B31773C2377
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 08:25:13 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 792E36018AC
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 08:25:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582874710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3kq1gQDgTcpT0oXeTywaCLK3Wswy8WCHEihIe+7y8Rs=;
 b=ODKHkWRW3XOlyX674BARHfkHbTdi1ExgYQUONAqGvY7b6C3xzqXKmgD0J+FbqdGGFJUjaM
 oYpkN5jINCzJHfPj2WuNW4BaKOEd9yavvCVbcLpadO2r02uHScbGND0HBBPYGdH9+aZ6xK
 2JJSbzgwyYPjUvBnbgz4YJfm2CIit5k=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-NJ_e8PC_OEGViAYfG6MKPQ-1; Fri, 28 Feb 2020 02:25:08 -0500
X-MC-Unique: NJ_e8PC_OEGViAYfG6MKPQ-1
Received: by mail-ot1-f72.google.com with SMTP id 39so1276245otb.8
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 23:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=naXzjcWhwK4NqLKwmc0BUQBiO4mKroWltmXucJZzFcs=;
 b=A1CP6/BIBQ1Et/gTT4p+mejFZb7zo/MBMce/dwbhvoxaocP71n+iAAOwkNUTIEWHMA
 GoIiIiRf8GaRtrdK1OeAWR+acS2pzByU3Twei15+dMAQMbrmb8sCkdoN3KkmjNKPSSz6
 fMO+dlfmO3RKnDFtW8iWS9UyFx8EEmLDJDfDelBaNrWjS9icOOxMbPSR6Pkj/QYftb9A
 g+62KBGENMnuji2rIHInNvZZG8XCPiusxjfslllZeU0PrZLJYkaody7YURLzl157fPg+
 K0ToCPlFlCgDIckYJvyL77ZchZMKAyJ+6QBI9XX1Bd6Qy6AWPi7sLbHgHzw5FtKGhxEE
 Ygdg==
X-Gm-Message-State: APjAAAWF4MAdY910m6Jbc9WZ6UI7lKaMAVqal5QdOBfnAKHk+9ZqHLFK
 9ziW0VwnalEVzNfG7WIZKfnxOUVOq7TGBQ/43yjeQTyDAwZvsPxtRk83MTtYf3dmBUUmRw9LlFc
 H03xsiku6cag7nAuZ4MIDyOVQ9Rk=
X-Received: by 2002:aca:4b0f:: with SMTP id y15mr2043893oia.153.1582874706989; 
 Thu, 27 Feb 2020 23:25:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1fnfcC+yavrF6mbRrLdJUQhLgwiZQVf/teMSB8z0jkybhRyQqdjqO7Dov983skBhqEXDyZWQIFpnVqpmEjG8=
X-Received: by 2002:aca:4b0f:: with SMTP id y15mr2043882oia.153.1582874706670; 
 Thu, 27 Feb 2020 23:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20200227163922.317-1-pvorel@suse.cz>
 <20200227163922.317-4-pvorel@suse.cz>
In-Reply-To: <20200227163922.317-4-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 28 Feb 2020 15:24:55 +0800
Message-ID: <CAEemH2ddNJTjzvPgHvtwVTM0CeFYH2_wy7SeK90ZPDMvME9K5g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] doc: Update style guide to new API
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
Content-Type: multipart/mixed; boundary="===============1016261051=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1016261051==
Content-Type: multipart/alternative; boundary="0000000000009d8f9a059f9dbc0a"

--0000000000009d8f9a059f9dbc0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 12:39 AM Petr Vorel <pvorel@suse.cz> wrote:

> Document still needs more update, but at least don't use legacy API
> examples.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Do we want to keep this document?
>

I agree to remove this old document.

Wouldn't it be better to have this info in Test-Writing-Guidelines (to
> have a single document)?
>

Yes, and there are too much-duplicated contents in this, maybe we can
extract something useful to library-api-writing-guidelines.txt
and test-writing-guidelines.txt then delete it?



>
> Kind regards,
> Petr
>

--=20
Regards,
Li Wang

--0000000000009d8f9a059f9dbc0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Feb 28, 2020 at 12:39 AM Petr Vorel &lt;<a =
href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Document still needs more upda=
te, but at least don&#39;t use legacy API<br>
examples.<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
Do we want to keep this document?<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">I agree to remove this ol=
d document.</div></div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Wouldn&#39;t it be better to have this info in Test-Writing-Guidelines (to<=
br>
have a single document)?<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">Yes, and there are too much-duplic=
ated=C2=A0contents in this, maybe we can extract something useful to=C2=A0l=
ibrary-api-writing-guidelines.txt and=C2=A0test-writing-guidelines.txt then=
 delete it?</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Kind regards,<br>
Petr<br></blockquote></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--0000000000009d8f9a059f9dbc0a--


--===============1016261051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1016261051==--

