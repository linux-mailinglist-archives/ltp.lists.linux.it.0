Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2E2153F0A
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2020 08:01:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EB123C257F
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2020 08:01:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8174A3C1115
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 08:01:26 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 5FEDE1A017AA
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 08:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580972483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wF4UOkoiHRwHljGkhkT21xZ1Na+l62vYej/Of1yuFnM=;
 b=PmiararXUz7yq+ml1CylIKfH5bFxy9rG95lxnqNibi71f2JRXB2LW/4OEucdl33Z9UARy2
 4fmp9+wveTX50dLcNxC9Sw6s77hno56Ns0aeJJCqZk3JQXA4US154DwZTvPzj7O1TnjJzO
 tEdBg6px2VxIz4hlnEWzMCdJRf8g510=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-Qe7Z6GveOGmUIC9_NQupAw-1; Thu, 06 Feb 2020 02:01:20 -0500
Received: by mail-oi1-f200.google.com with SMTP id d9so2388390oij.4
 for <ltp@lists.linux.it>; Wed, 05 Feb 2020 23:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cf7Wv8cL+J1HEOTNx4sC9tOAZON8q2Dr6zWA2wo2KiQ=;
 b=rHICaZKzQ7o06gfWgCwfUxzV+cCBZ6sY1F4Un6pSBm/r6FTvcsBeP99onqWcZ6gLrg
 McilRDytfqqpHewamipcKuDSXyQzOu3kO49cuXCkPQWaOhT6o7ZaK3WLFzWWMY9cuW10
 kcQXITTRpLwaahlPfLHC3jzS1PJ3YAsf/Nx2dxYlkqWHZXP/5+duW5e6zwuy6wKSsC73
 DRbDMG0+2maUGBVPmvGN4d9LQGydBfTmvyatNp7w3woWfpMvMvEDAEmYjHPgxj9k9ljL
 zvf9E/Rn1IqcHQa8FL6x67zCLTYB7tAompsvhAQQ2PKPByGkOtvIjHUOiOMbvNQ9kMwG
 2xFA==
X-Gm-Message-State: APjAAAWPUFesc/CQ5pk5ukFUasz9xaHDDhtNbj1/rM1y9Lqf6oK8oenG
 5rtHGLVdUhxjA08IOQO2yYzwx4PWS/Nae7nPQD4+djoYgHAXkT8SCOQP8U5xykjmEJ1OB+CKK3A
 tPiOPyJjMLof9/1czwo9avbmHN+4=
X-Received: by 2002:aca:afd8:: with SMTP id y207mr5723422oie.96.1580972480114; 
 Wed, 05 Feb 2020 23:01:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkvjmoLNbnRUYRFgv2qWGFIpUPb/iaqGE3SIMIjcVcOXZrG3Z2UaPISdIa5bejorbz2+wYC9LI0Exzp7cGGmA=
X-Received: by 2002:aca:afd8:: with SMTP id y207mr5723406oie.96.1580972479767; 
 Wed, 05 Feb 2020 23:01:19 -0800 (PST)
MIME-Version: 1.0
References: <7843cc36a04deb034e9479a139f535e5fa5f3135.1580894017.git.jstancek@redhat.com>
 <CAEemH2fnu9nZiGDfa5LTTMA0a_-PJ35fjjLdZ2vXYNGRJqHfVA@mail.gmail.com>
 <1751041821.5968536.1580913131753.JavaMail.zimbra@redhat.com>
In-Reply-To: <1751041821.5968536.1580913131753.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 6 Feb 2020 15:01:08 +0800
Message-ID: <CAEemH2eycvuJkqvTj=8R=aRqRGxhb=n3BzpeAaaCk8M4oJELsg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: Qe7Z6GveOGmUIC9_NQupAw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getrandom02: lower bufsize if low on
 entropy
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
Content-Type: multipart/mixed; boundary="===============0983267893=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0983267893==
Content-Type: multipart/alternative; boundary="0000000000000e8660059de2d76f"

--0000000000000e8660059de2d76f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2020 at 10:32 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > >
> > > @@ -37,11 +39,17 @@ static int check_content(unsigned char *buf, int
> nb)
> > >  static void verify_getrandom(unsigned int n)
> > >  {
> > >         unsigned char buf[256];
> > > +       int bufsize =3D 64, entropy_avail;
> > >
> >
> > I'm not sure why here initialize bufsize as 64? can you explain more?
>
> That would be the default, unless we know we have enough entropy.
>
> I picked 64 as it matches 'random_read_wakeup_bits'. Assuming we can get
> 1bit/s entropy, then potentially worst case of waiting 4x for 64bit,
> it should still fit within default 300 seconds.
>

That sounds reasonable. Thanks for the analysis.

Reviewed-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--0000000000000e8660059de2d76f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Feb 5, 2020 at 10:32 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
<br>
----- Original Message -----<br>
&gt; &gt;<br>
&gt; &gt; @@ -37,11 +39,17 @@ static int check_content(unsigned char *buf, =
int nb)<br>
&gt; &gt;=C2=A0 static void verify_getrandom(unsigned int n)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char buf[256];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int bufsize =3D 64, entropy_avail;<br=
>
&gt; &gt;<br>
&gt; <br>
&gt; I&#39;m not sure why here initialize bufsize as 64? can you explain mo=
re?<br>
<br>
That would be the default, unless we know we have enough entropy.<br>
<br>
I picked 64 as it matches &#39;random_read_wakeup_bits&#39;. Assuming we ca=
n get<br>
1bit/s entropy, then potentially worst case of waiting 4x for 64bit,<br>
it should still fit within default 300 seconds.<br></blockquote><div><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">That sounds reas=
onable. Thanks for the analysis.</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" targe=
t=3D"_blank">liwang@redhat.com</a>&gt;<br></div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr"><div di=
r=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000000e8660059de2d76f--


--===============0983267893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0983267893==--

