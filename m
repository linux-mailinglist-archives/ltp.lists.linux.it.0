Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A7314E9F1
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2020 10:15:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 615B73C247C
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2020 10:15:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id BDDE43C245A
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 10:15:13 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 52E331001F4A
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 10:15:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580462111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ld2WRQ0md/u+wpN1/ftJJz8+jLRR9gKgFFzRQ8RFXcw=;
 b=iftV2F9ECTwMXb45h1J1sGMk2/AlScDkvkEDLdmvGQq0ozpj3xBYHyG8qCUdilj5CD92Qd
 iP54l+PeYWBVJwDdbunKbOJUqp80ml2NFCFM7SMqetnl99/lgfr7XaLM6L4rSAzSapssEF
 dO6nfloQ6+7bp3VTWr1ABqFYRo59QIA=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-qmxeQyfKN9GTd4jg9jkr4w-1; Fri, 31 Jan 2020 04:15:08 -0500
Received: by mail-ot1-f70.google.com with SMTP id b21so3186556otq.16
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 01:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tK93RSI9DHHYLxgpzjTUw6KRLISZWz2B7qibT3bEczs=;
 b=CLqTwLdO7nOEzIQV4z0VkQoUChKcGJ9fhs48aLnI2GcnFqnOMl/566B8pyfgVkfx6U
 FOeU9o500pTKnqzrOj5fZ1CfWZ4U5eji8/iHNvhyGwLekjHhg/iOqlOYxcYZbrx2tuqA
 395VfS8gVo+Q+fYmwECJ+iOggL7vXv7IzAW3AT63OHPX8YkWsGdmsZlJicW8ufifgo14
 CZYPkIrYX0Vypqz9wI4SViFHSWW8beKi1BwZrnM0hzaPN+ZTS9q3gW3iU/yNCcnu2rT6
 zdBd6BWa/faOKYPnBPq/1RKUQBEMbZW6+9czk11GEfd6vLlefn+6Q2elNC8SNOQ/bQL4
 godQ==
X-Gm-Message-State: APjAAAXs35upsK67OTaGcVCrQsSr88L77NeypPiDqZnM8i3DEqG8E8cp
 kgYSSdzWEvqRCXJXC+rPGQKVONLtN8xYfGI0ZkmHgWA+U7ntvT5WTxk2APU4J1mYL7F20kVw5LF
 xZE/3pu7kaCBcVpzoJ8cgVwSt/4s=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr6712858otl.118.1580462108201; 
 Fri, 31 Jan 2020 01:15:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqwbSfSBZDLl1gfmLFBsnnHv2bgHfYjsnDE7DnH2qufQWgfovpiy4wFs36QztuoXGvn+kb7y/M7AIyV4flyw0PU=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr6712839otl.118.1580462107810; 
 Fri, 31 Jan 2020 01:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20200130161337.31614-1-mdoucha@suse.cz>
In-Reply-To: <20200130161337.31614-1-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 31 Jan 2020 17:14:56 +0800
Message-ID: <CAEemH2f7s+q1upnaikCnQZSqxb-xgdN73aPxhKhLo2i5_M7FkA@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-MC-Unique: qmxeQyfKN9GTd4jg9jkr4w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Taunt OOM killer in fork12 setup()
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
Content-Type: multipart/mixed; boundary="===============0950681237=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0950681237==
Content-Type: multipart/alternative; boundary="000000000000847ad5059d6c02c9"

--000000000000847ad5059d6c02c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 12:13 AM Martin Doucha <mdoucha@suse.cz> wrote:

> On a system with low memory, fork12 can trigger OOM killer before it hits
> any fork() limits. The OOM killer might accidentally kill e.g. the parent
> shell and external testing tools will assume the test failed.
>
> Set high oom_score_adj on the fork12 process so that the OOM killer focus=
es
> on it and its children.
>

It sounds more like the OOM-Killer defect but not fork12. What we do for
that is to protect the parent shell and its harness to avoid
oom_kill_process() acting on them.

On the other side, if we do raise the oom score of fork12, that would not
guarantee OOM-Killer do right evaluation but just makes fork12 easily to be
killed in testing.

--=20
Regards,
Li Wang

--000000000000847ad5059d6c02c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jan 31, 2020 at 12:13 AM Martin Doucha &lt;=
<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On a system with low memo=
ry, fork12 can trigger OOM killer before it hits<br>
any fork() limits. The OOM killer might accidentally kill e.g. the parent<b=
r>
shell and external testing tools will assume the test failed.<br>
<br>
Set high oom_score_adj on the fork12 process so that the OOM killer focuses=
<br>
on it and its children.<br></blockquote><div><br></div>It sounds more like =
the OOM-Killer defect but not fork12. What we do for that<span class=3D"gma=
il_default" style=3D"font-size:small"></span> is to protect the parent shel=
l and its harness=C2=A0to avoid oom_kill_process() acting on them.<div><br>=
</div><div><div class=3D"gmail_default" style=3D"">On the other side, if we=
 do raise the oom score of fork12, that would not guarantee=C2=A0OOM-Killer=
 do right evaluation but just makes fork12 easily=C2=A0to be killed in test=
ing.</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div=
></div></div></div>

--000000000000847ad5059d6c02c9--


--===============0950681237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0950681237==--

