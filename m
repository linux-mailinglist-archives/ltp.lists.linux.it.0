Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9AA2C412B
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 14:33:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 435583C4E32
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 14:33:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0248F3C2D04
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 14:33:45 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6142A200C8A
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 14:33:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606311223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bpr6o2Fi/CkO3IGm8xpGWx1LHjPA7g8Mq68+EhkSG68=;
 b=O5ppMxbhNjtZpUfBkuqPYiHEZdew/S0odYyt8uiRCF1IbOgW3dr4r47aYXpDzQYt/5tNms
 OMjMWDAYqrD1lvglI/X4O+Ma8f1MxWNHQFE7QZrnS3+CuDJ5pu5LBIe1bHZNioXQLPjJym
 J5sV70q5/ch/+iTIjQmuQ1JtueyfYDA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-lReuXxKmN8yYI21nWc8DSQ-1; Wed, 25 Nov 2020 08:33:41 -0500
X-MC-Unique: lReuXxKmN8yYI21nWc8DSQ-1
Received: by mail-qt1-f199.google.com with SMTP id f19so2497009qtx.6
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 05:33:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpr6o2Fi/CkO3IGm8xpGWx1LHjPA7g8Mq68+EhkSG68=;
 b=aBIut5dnf+5WUkKh/ZeLJ7jW6H8Hnak5+783g28PntpNgiXJCm54Rhoi+B23TSW7BW
 yKCpNkHCTWDdm2baXj5VQYrGOpjZXkdoaldjb8qN4QwgI9+sriCIDrBODKjSxckdhdI6
 IspoRtYVc73Di4biL1F7SDGzS/VWdPuKrp/McwWbP/fLgz7b0/Y5f+tP9KH8M2Hrc0X3
 sR+IiaXtQTvvRlmTmfo90/LlNZgLqMsHtcl7GsTczkPnkt11cS0otHXeSRIYHd65mrxB
 xp65O5St7FrS8p6rG+5ychv5OD9siSBBatIgpxsPzH/UCdAsL12ifoVh0feXOME0wKze
 8fyw==
X-Gm-Message-State: AOAM533C+pOKULLCMn/lvD2FiSFL66/KPXOFJ+GnGbQfWs6IedP/F1v5
 CT8wJNg87GcRAkU1YVYUiH1o3dgXqdCt2gNcz48MdRmjs8VcjsEsRB4iToQFDsDj32m6Hb/oRHx
 3NXOREmusRTnogNDjbCoDqsYLseQ=
X-Received: by 2002:a25:d9cf:: with SMTP id q198mr3494304ybg.243.1606311221066; 
 Wed, 25 Nov 2020 05:33:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvrVjvg0g4zi1Vsk3HTo/x2o5rEWuy03GhVD3Mq6DJbgSJqAFTrfvx6/TCClzOtb9PslFIf6cE14DlpprtPxc=
X-Received: by 2002:a25:d9cf:: with SMTP id q198mr3494283ybg.243.1606311220893; 
 Wed, 25 Nov 2020 05:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20201113131428.13199-1-chrubis@suse.cz>
 <20201113131428.13199-2-chrubis@suse.cz>
 <20201113202828.GA2229@pevik>
 <CAEemH2fXD-gFF_7PogAPB1txUrgQmmzeK8p=MaMSn1zam0YeVg@mail.gmail.com>
 <20201119130824.GC12628@yuki.lan> <20201125131803.GB30149@yuki.lan>
In-Reply-To: <20201125131803.GB30149@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 25 Nov 2020 21:33:29 +0800
Message-ID: <CAEemH2dWwLD-J+cP6mJ3LAHcbGBtZ+ZaUMBiBZBDBsyK-q8Zww@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 01/10] lib: Introduce more TEST_* macros
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
Content-Type: multipart/mixed; boundary="===============1747747614=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1747747614==
Content-Type: multipart/alternative; boundary="000000000000b8725705b4ee7955"

--000000000000b8725705b4ee7955
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 9:17 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > I agree to add an expected value check for TEST_PASS(), e.g
> > >
> > > #define TEST_PASS(SCALL, EXPECTED, ...)
> >
> > I would rather keep this simple case as it is, since many function
> > return zero on success and added more specialized functions if needed as
> > it was done with TEST_FD()
>

Ok.


>
> Is anyone against pushing this initial patchset as it is?
>

Another bit of concern I have is the TEST_FAIL might cause
confusion in code reading. It looks like the test will be failed here
but in finish the test report pass, maybe we'd better tell people the
failure is expected?
(that was just my feeling on TEST_FAIL at the first glance)

Or rename them to:

TEST_EXP_PASS
TEST_EXP_FAIL
TEST_EXP_FD

-- 
Regards,
Li Wang

--000000000000b8725705b4ee7955
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 9:17 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; I agree to add an expected value check for TEST_PASS(), e.g<br>
&gt; &gt; <br>
&gt; &gt; #define TEST_PASS(SCALL, EXPECTED, ...)<br>
&gt; <br>
&gt; I would rather keep this simple case as it is, since many function<br>
&gt; return zero on success and added more specialized functions if needed =
as<br>
&gt; it was done with TEST_FD()<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Ok.</div></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Is anyone against pushing this initial patchset as it is?<br></blockquote><=
div>=C2=A0</div><div><div class=3D"gmail_default" style=3D"font-size:small"=
>Another bit of concern I have is the TEST_FAIL might cause</div><div class=
=3D"gmail_default" style=3D"font-size:small">confusion in code reading. It =
looks like the test will be failed here</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">but in finish the test report pass, maybe we&#39;d=
 better tell people the</div></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">failure is expected?</div><div class=3D"gmail_default" style=
=3D"font-size:small">(that was just my feeling on TEST_FAIL=C2=A0<span styl=
e=3D"color:rgb(51,51,51);font-size:14px">at the first=C2=A0</span><span sty=
le=3D"color:rgb(51,51,51);font-size:14px">glance</span>)</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Or rename them to:</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">TEST_EXP_PASS</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">TEST_EXP_FAIL</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">TEST_EXP_FD</div></div><div><br></div>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></di=
v><div>Li Wang<br></div></div></div></div>

--000000000000b8725705b4ee7955--


--===============1747747614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1747747614==--

