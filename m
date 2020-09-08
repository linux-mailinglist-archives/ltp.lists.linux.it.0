Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D1260C51
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 09:46:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5FED3C53BF
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 09:46:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3D1E13C093E
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 09:46:00 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A1EBC1A01068
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 09:45:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599551158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KFmc0edPAR73IdhXd8gq969YgbhiHzVOpLjmgTGziRQ=;
 b=UGrZwG/HKhoZdx+61FhatZRvOHfUuY/h5cLK7udWuINLRWZyI5eftsYOpYhfZJ+tLbMA5F
 A0ZuYz8jYN+qeFLry3G2yz8bmRSeUnD+ByLlSHKwdHf9k8bdbusDHl9G4f9edkSrotT6CP
 +J7U55RxHSUEuwHJDbiHRp1miRUHIC0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-hwmZt-obNbW55kR8WfT1IA-1; Tue, 08 Sep 2020 03:45:54 -0400
X-MC-Unique: hwmZt-obNbW55kR8WfT1IA-1
Received: by mail-yb1-f200.google.com with SMTP id a84so14630096ybb.9
 for <ltp@lists.linux.it>; Tue, 08 Sep 2020 00:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KFmc0edPAR73IdhXd8gq969YgbhiHzVOpLjmgTGziRQ=;
 b=b64Ss/OmxOstKYM8qbMBEFM65iExZ2VD0I82tapELWWWjWeHvy4STvBTfSGpNUyWRN
 jqKOKrVY+ZJfzArzqJd1HIRdFVhf/+k8uYE8DvfJgS06IpcBAKGQMTw6X2DwOIZzsyYt
 H0/qP4dsL8dNhVlFXeKO+JD15yE/xD3GJ0xENG4zbfP5+3J21PJZaXkIyreACVfyitSS
 ycfihnJmyFji2TrZZI3yo6odPNNmGKZ+smGTLPp/mrxwAYoQydLzeVGc+OWXjUadTDXL
 nzfPP8E+22w/a6zDbvjM8qs6x5+/MvPn4hTEGOVojOVTeJ2OJ7D8NJUIs4Sk0Okz059K
 PPYw==
X-Gm-Message-State: AOAM533TnTvJpgbw8aHb5Ofa5ijZLoa+vDakbVMSBZ+Ng+rLCNaONG/7
 SgvAV8HsLkyk14k3aRWgBG2zgmlqu6e1ETJ7CD8YowmpH1m2XRpVInygzFcWrKyRbNnkzlvS5aq
 2Nb+J1PZGcHjr7Mr/hkUaT8d2vt8=
X-Received: by 2002:a25:902:: with SMTP id 2mr30504897ybj.366.1599551153726;
 Tue, 08 Sep 2020 00:45:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlGisRlfXgoK81/4NwXkY8VQ4ypDdz1DQEE9dd8nS3V3w2gSP4ErClqJjsH9Q6Ol5NtXm6hkr9EjhyuvhapXo=
X-Received: by 2002:a25:902:: with SMTP id 2mr30504883ybj.366.1599551153553;
 Tue, 08 Sep 2020 00:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan>
In-Reply-To: <20200908073138.GB2475@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 8 Sep 2020 15:45:41 +0800
Message-ID: <CAEemH2cHvM_KD7W6fyX6z3bc0qfVtkp=yEM8MDvvohouyj5N2w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Content-Type: multipart/mixed; boundary="===============1273347032=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1273347032==
Content-Type: multipart/alternative; boundary="0000000000004edcd305aec886e1"

--0000000000004edcd305aec886e1
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 8, 2020 at 3:31 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> As usual we should start preparing for a next release.
>
> As usuall we will have a week or two where we should merge everthing
> that should go in before the release, then git freeze for another week
> and finally a release.
>
> So let's start with a list of things that should go in.
>
> For me it would be:
>
> * ptrace08 fix
>
> * if possible the shmctl() rewrite
>
+1 these rewrite looks good, I will finish my test by the end of today.


>
>
> What else should go in?
>

It may be better to fix ioctl_loop01 too.
https://github.com/linux-test-project/ltp/issues/718

And I'd like to add the MAP_GROWSDOWN test too, but I haven't come up with
a way to solve the segment fault on s390x.
http://lists.linux.it/pipermail/ltp/2020-August/018416.html

-- 
Regards,
Li Wang

--0000000000004edcd305aec886e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Sep 8, 2020 at 3:31 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
As usual we should start preparing for a next release.<br>
<br>
As usuall we will have a week or two where we should merge everthing<br>
that should go in before the release, then git freeze for another week<br>
and finally a release.<br>
<br>
So let&#39;s start with a list of things that should go in.<br>
<br>
For me it would be:<br>
<br>
* ptrace08 fix<br>
<br>
* if possible the shmctl() rewrite<br></blockquote><div><span class=3D"gmai=
l_default" style=3D"font-size:small">+1 these rewrite looks good, I will fi=
nish my test by the end of today.</span></div><div><span class=3D"gmail_def=
ault" style=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
<br>
What else should go in?<br></blockquote><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">It may be=C2=A0better to fix ioctl_=
loop01 too.</div><div class=3D"gmail_default" style=3D"font-size:small"><a =
href=3D"https://github.com/linux-test-project/ltp/issues/718" target=3D"_bl=
ank">https://github.com/linux-test-project/ltp/issues/718</a></div></div></=
div><div><br></div>And I&#39;d like to add the MAP_GROWSDOWN<span class=3D"=
gmail_default" style=3D"font-size:small"> test too, but I haven&#39;t come =
up with a way to solve the segment fault on s390x.</span><div><div class=3D=
"gmail_default" style=3D"font-size:small"><a href=3D"http://lists.linux.it/=
pipermail/ltp/2020-August/018416.html" target=3D"_blank">http://lists.linux=
.it/pipermail/ltp/2020-August/018416.html</a></div><br></div>-- <br><div di=
r=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></d=
iv></div></div>

--0000000000004edcd305aec886e1--


--===============1273347032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1273347032==--

