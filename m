Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7D5188057
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 12:09:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DAF03C55CE
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 12:09:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 035B13C050E
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 12:09:29 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 066121A0115C
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 12:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584443363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ou6es2A+OuZTmrHLeirEux1Vw8ZZ65KLweiU5TZ3Wk=;
 b=EWAH4ewD4dWPyBHBAXUqbHZHABHHYHxHNcoC2lrulYXJ5wCsHs2b7oC3NE+5v1QEcC81iV
 iy0wah1tLjNK1Wanq0xhjPdgi31JyuY8iSi1MKfN+6rwgjmHIxshAwtEEELwWO8o7FVL1A
 ytDJYkXebaGunAs8I9eKF10xypEN6vw=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-WBvJpwYxMT-KBvJ7WzDu-w-1; Tue, 17 Mar 2020 07:09:21 -0400
X-MC-Unique: WBvJpwYxMT-KBvJ7WzDu-w-1
Received: by mail-oi1-f198.google.com with SMTP id f71so831579oib.18
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 04:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g3c4v9AZ13salI20iDtxaFHWh9ovhL6Oseb4qdZDGKI=;
 b=hgmxRyslwLZg+mtNydEqnqsXXuRXtr0Z6nN+YyD73ZZ4K6Fn+VN8qQ2vtoudeLdWX4
 I7wUTq9+ClupAfZ1kbXpbiUoFeZrqCkvpc4nr1Ttzvv72eQIu94aA6IWxzumtvYsBNQ9
 UkqkmCuPsQoZ7YJDoueziLAj1uZXTaqjVUxphLzKlVoaxdvT2aQNyKBP+cYI0zbuOdvt
 HoHeIkiRa2cVbe/+kz153fc8FHamdCHXj5SdAsdth3KS7ywiX/Himgv5W9d1+DVBMpij
 AQsO6JPQy0wFpKtreyS2hkDpJOjAyemNU7iCLCKJ+ivH0MrU2iRJDSjVzhBmnjxk9IIp
 mIXg==
X-Gm-Message-State: ANhLgQ0qv/CQSwRNMAmpdETPkQwPisf6o45u5oLjfkuxZyseYdHPGrRb
 iW5WN2cqocs/8+Ldm/zPmBQOP86Luzd/R+58r/vnKVtdV5zbRK/YoDceLcbrv6JJx7kc/ayq/bj
 KRAvmcXUBX7kmCC4S/AoygRrJ2Rk=
X-Received: by 2002:a9d:4b98:: with SMTP id k24mr3087505otf.26.1584443360162; 
 Tue, 17 Mar 2020 04:09:20 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuTl5FH4pQ6GyFFfI2VEEdti6QtxWfuHn1VUp7IrYAqaSjY07aNO7I4lCJ/JoOR3wbAFWTdtU2E+8SqhDtlVmU=
X-Received: by 2002:a9d:4b98:: with SMTP id k24mr3087486otf.26.1584443359853; 
 Tue, 17 Mar 2020 04:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <1584430400-47359-1-git-send-email-zou_wei@huawei.com>
 <CAEemH2f5sMfOX5XjEOr8cmLRwu+YzMziEwRFPAegG+FAURi90A@mail.gmail.com>
 <20200317182704.GB10442@yuki.lan>
In-Reply-To: <20200317182704.GB10442@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 17 Mar 2020 19:09:08 +0800
Message-ID: <CAEemH2eHDQJdWwZNDPT+RqdrTNdr9HWX7i2vOEaZwB1LRoN5Xg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite: Enable the testsuite
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
Cc: Zou Wei <zou_wei@huawei.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0799791852=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0799791852==
Content-Type: multipart/alternative; boundary="000000000000a1903e05a10af77b"

--000000000000a1903e05a10af77b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2020 at 6:43 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > Do we really need to enable the open_posix_testsuite explicitly? By
> > default, LTP uses "--with-open-posix-testsuite" as the configure
> parameter
> > to enabling it, is that work for you?
>
> Even if we wanted to enable openposix by default, which may be a good
> idea, we should change the default in configure.ac instead with:
>

Yes, your method looks better. But I'd suggest giving more time on bug
fixing before enabling open_posix_testsuit explicitly, other than
publishing that with many build issues. Seems Zou and Xu are working on
this part recently, that would be appreciated if more patches work out.

--=20
Regards,
Li Wang

--000000000000a1903e05a10af77b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Mar 17, 2020 at 6:43 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; Do we really need to enable the open_posix_testsuite explicitly? By<br=
>
&gt; default, LTP uses &quot;--with-open-posix-testsuite&quot; as the confi=
gure parameter<br>
&gt; to enabling it, is that work for you?<br>
<br>
Even if we wanted to enable openposix by default, which may be a good<br>
idea, we should change the default in <a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a> instead with:<br></block=
quote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Yes, your method looks better. But I&#39;d suggest giving more time on bug=
 fixing before enabling open_posix_testsuit explicitly, other than publishi=
ng that with many build issues. Seems Zou and Xu are working on this part r=
ecently, that would be appreciated if more patches work out.=C2=A0</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div></div>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<b=
r></div><div>Li Wang<br></div></div></div></div>

--000000000000a1903e05a10af77b--


--===============0799791852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0799791852==--

