Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F9CBEFBB
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7CBDD3C22F5
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 480053C250C
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:34:02 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id CACDC1401164
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 11:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569488553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ko/EFXFrlDmijB2vpWN+7+8IJudz/AmB6G3kuJqSXN4=;
 b=NLqF8Cxvg1dq/I+8pvD77J0u/HNHNXqck51yREwaf1uLXT9JYyYra2Qulzop4qIK3Jf1FY
 Nmb26yzdHM4PGz2eL8j1z20tzWOYDe8WA3Q7K7+VB72nFZwzaim/W7b4EkSLYvBxwXQrP2
 JJs/cWgATgHtiORVaJhdwamK8W0LHlE=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-1z3atXYINBm5OgxIgLqQcg-1; Thu, 26 Sep 2019 05:02:29 -0400
Received: by mail-oi1-f197.google.com with SMTP id 19so977951oii.2
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 02:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q5EuQBUTF4kZBMu+zal9TI4xlZb753xrrlRvcQ+ciOw=;
 b=V6Qiub3vQdGK/yLFEr+zdmEAyqj43GS7HVY71nOqViVzelO+WQ5dHuT2Wtwo7QTMK6
 3L4P4pQOYxx6GkJOd+gOwRX5jngKkTxVxo4pSe/W+S34ZLyea9Dy/IRN2IM/G8GNQxQF
 TVZdYZ7rrS+cDoHCxJeeZ8bccSVT47LG9uP/wTfm5x95HMFSrxdJUBHWOGgywBIdF/u7
 1+tbKzo5vM3KFlZOnafKD1bcObzIg7O3oeDz0/jPRjlPR7a6fkhpXnIKYik9EEO8Cf8S
 zRLb7irXR4LQsD2L4jxvFBBCouVxmWlB2O5nE+C+7rfdGYP3VCe/NdFbuw//19N09GR/
 ML+g==
X-Gm-Message-State: APjAAAVweNFWh+6hEXxANWanYdKVhg6OnAIEg3PKOKH3sAhW4nP6GXbo
 bDbFvEfPC9MT5hft0miEIAj7YDwJQlSco3X+IFnbzWZI4/rsnK8zQYv1RFvQKFDf1NuEpZQiXkI
 rRURyMcj2dpK/+Gwig2lmrz5PakU=
X-Received: by 2002:aca:ed52:: with SMTP id l79mr1685618oih.47.1569488548312; 
 Thu, 26 Sep 2019 02:02:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuPKyR0r7pqGd9gplvUz8rlYWArUWFsM7UAe7sLFxCJlu0RLzNct9LkLJeRGwm+9kzFyCs/EuOY/JJTSaC64o=
X-Received: by 2002:aca:ed52:: with SMTP id l79mr1685609oih.47.1569488548088; 
 Thu, 26 Sep 2019 02:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190906130707.GA7515@rei.lan> <20190925112236.GA17496@rei.lan>
In-Reply-To: <20190925112236.GA17496@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 26 Sep 2019 17:02:15 +0800
Message-ID: <CAEemH2cCONPcaTJGz=-3ndZFoHAKkr7gxw1ezuZDdP=rj10MMw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: 1z3atXYINBm5OgxIgLqQcg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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
Content-Type: multipart/mixed; boundary="===============0604788777=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0604788777==
Content-Type: multipart/alternative; boundary="000000000000636e8c0593710718"

--000000000000636e8c0593710718
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2019 at 7:22 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> I did a few testruns and so far it looks good.
>
> I've send one patch for acct02, which is mostly cosmetic, that I would
> like to get merged.
>
> I would still consider merging the eBPF regression test, does anybody
> have a strong opinion on this?
>
> Apart from this preadv203 sometimes fails to trigger EAGAIN on virtual
> machines, but I doubt we can fix this before the release, I will try to
> do so later on.
>
> The rest seems to be good, i.e. failures does not seem to be bugs in
> tests.
>
> What is the status from rest of you? Is there anything that should be
> considered for the release? Is something failing unexpectedly?
>

No more failure from my side except the known issues(timer_create01,
acct02). It's time to release a new package since now is already ending in
September.

--=20
Regards,
Li Wang

--000000000000636e8c0593710718
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 25, 2019 at 7:22 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
I did a few testruns and so far it looks good.<br>
<br>
I&#39;ve send one patch for acct02, which is mostly cosmetic, that I would<=
br>
like to get merged.<br>
<br>
I would still consider merging the eBPF regression test, does anybody<br>
have a strong opinion on this?<br>
<br>
Apart from this preadv203 sometimes fails to trigger EAGAIN on virtual<br>
machines, but I doubt we can fix this before the release, I will try to<br>
do so later on.<br>
<br>
The rest seems to be good, i.e. failures does not seem to be bugs in<br>
tests.<br>
<br>
What is the status from rest of you? Is there anything that should be<br>
considered for the release? Is something failing unexpectedly?<br></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">No more failure from my side except the known issues(timer_create01, ac=
ct02). It&#39;s time to release a new package since now is already ending i=
n September.</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--000000000000636e8c0593710718--


--===============0604788777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0604788777==--

