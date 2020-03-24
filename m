Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F1E190E5F
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 14:08:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F0793C4D51
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 14:08:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 278CB3C29B2
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 14:08:23 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 36AD01401644
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 14:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585055301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qGWcb5pTwsJIjQZnjj0r3W6LQ31tZnXAr8qvvQkMGqw=;
 b=eZlFAo1AmRtZyxqENyIP6I1FlLffJZsXF5fhX2guwh0YJbfDlEolOWiLblDrcOw5ZuQ6wf
 Kiu1Wt4GAHNhwnGjh2UJQ7GEx2SdCUNuYsvO37hQ0br6cDzgbLf66tbvkTgTuyYZRf5vSi
 iHoJs2nlfjxaPAb4UgFNCisQVW5Fd3Y=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-OC_-G5kEO9iLQ__ozCzsuQ-1; Tue, 24 Mar 2020 09:08:18 -0400
X-MC-Unique: OC_-G5kEO9iLQ__ozCzsuQ-1
Received: by mail-oi1-f198.google.com with SMTP id 8so13009947oiq.2
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 06:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xqQjYi4nv6JIOAmkp6f2TsufBm4TSuZ7JwHDztBUcyE=;
 b=X6aMDPcwcRtm8HW0jQPwykiHnZJPuLCtEa4/hc/ye3+4SmOrrzgOKVoO2PbfvPN8mD
 VqYqgfe7z2uI6Ev8PnPTb0APNXXX3Y1GDPYAHBZAMfS2nuBQlh5kLZIOLXtkcomGtuGt
 zuDGL3rSb0vx0Yy5zQTTNzDkigUfruaxYuZRwnyxRVfFpLB4j0GmjDz7dl/hB/hxcANh
 XQrRxhH7b7vJQbKYdZuTr65+I1/kNdsaWAE2nVe8HKakISFnNf8wkrts09GLGFCyDsYI
 GWzNoO+tXwCT0Pf0WPgz3uqbKjoxYVXN3tvJmWPc+Kx8qMHKNoIr/Aq8Sdz/ro/S7p8W
 /PWw==
X-Gm-Message-State: ANhLgQ1DO1MQQnCgsZUHcExwUkee/eIiDWYBqcPGmJek1v5sM98JQlrX
 FTUrAEev2szbo3zRWtiyxVXuaKbV7zg/T4tUfj+6zwgyNZvfb9/sWEdOSS0S15bdVrnYWk6Uzi3
 W6pitl1UHGG1iDEKjh6/2zOcBhC0=
X-Received: by 2002:a05:6820:221:: with SMTP id
 j1mr1926397oob.12.1585055297721; 
 Tue, 24 Mar 2020 06:08:17 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vubaS7O2Zej7JkR9G7l4kQDm8JswaWDzyfvZfQps7j+AdbotCCO0TTu0wwtaFUnDUjXlfFPvAWKVoOZUEg8tYI=
X-Received: by 2002:a05:6820:221:: with SMTP id
 j1mr1926385oob.12.1585055297275; 
 Tue, 24 Mar 2020 06:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200323224933.2613658-1-petr.vorel@gmail.com>
 <20200323230305.GA2696136@x230> <20200324065343.GA24724@dell5510>
In-Reply-To: <20200324065343.GA24724@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Tue, 24 Mar 2020 21:08:05 +0800
Message-ID: <CAEemH2e_aN-MAKhUyfug5e8tXYbR-qb3Twv+s3n=KOr-YydCRQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] accept4: Use tst_variant
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
Content-Type: multipart/mixed; boundary="===============0109728044=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0109728044==
Content-Type: multipart/alternative; boundary="000000000000f1a9c805a19971bb"

--000000000000f1a9c805a19971bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 2:54 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> > > I guess __NR_socketcall is for x86 and other old architectures,
> > > but we still want to use it, right?
>
> > Maybe I should have kept just 2 variants (libc implementation and only
> one
> > syscall implementation) and chose the correct syscall implementation wi=
th
> > #ifdef SYS_ACCEPT4
>
> > Or is there arch which supports both syscall variants?
> OK, I can answer myself: ppc64le is example of arch which support both
> __NR_accept4 and __NR_socketcall SYS_ACCEPT4.
>

That's right, I just verified it on my ppc64le(rhel8) platform, so we can
keep the 3 variants test.

For your patchset:
Reviewed-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--000000000000f1a9c805a19971bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Mar 24, 2020 at 2:54 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; &gt; I guess __NR_socketcall is for x86 and other old architectures,<b=
r>
&gt; &gt; but we still want to use it, right?<br>
<br>
&gt; Maybe I should have kept just 2 variants (libc implementation and only=
 one<br>
&gt; syscall implementation) and chose the correct syscall implementation w=
ith<br>
&gt; #ifdef SYS_ACCEPT4<br>
<br>
&gt; Or is there arch which supports both syscall variants?<br>
OK, I can answer myself: ppc64le is example of arch which support both<br>
__NR_accept4 and __NR_socketcall SYS_ACCEPT4.<br></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">That&#39;s ri=
ght, I just verified it on my ppc64le(rhel8) platform, so we can keep the 3=
 variants test.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">For your =
patchset:=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"=
>Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redha=
t.com</a>&gt;</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--000000000000f1a9c805a19971bb--


--===============0109728044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0109728044==--

