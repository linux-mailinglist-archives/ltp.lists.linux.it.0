Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A554D162123
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 07:50:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3330C3C259D
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 07:50:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 039CA3C14BB
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 07:50:21 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 9EB2A600912
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 07:50:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582008619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lDrOz2SUNY0c9r3vBWQyOcw8TJXf5ECjd+OkccklKis=;
 b=Gz5/J4wPEH1gggGCdaZJtYw1iXJrMxNpL6dEM00P4ujkUMa3ihgau9oQ/WQE9Xv1gK1vCU
 yvjRNCJJkdQxeSp79o+WF1Lb0cQjfXm4taTYdawrodLwLcfnVm622otvM1aa2CZbFSNjKW
 UYFQ7Bl/xX+a82+6zAtR7ge2TU/GpWk=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-wjTzgtwSNLyImC3eHIOBkA-1; Tue, 18 Feb 2020 01:50:15 -0500
Received: by mail-oi1-f197.google.com with SMTP id j142so9486428oib.23
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 22:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fwkJyKugyiCtc9AUaLR8gWZa4PtFRVqD5ILC0ZeQ4gc=;
 b=peluUNNq4UwOEFb2yUtZpRfRgTfKmI92KxhiSFeqC9XLSFWlAy5qcF8pdgZejPq+TU
 GbqCbgEkAv7ugGHSrv2GVDpbhuhhyq2BNT3oxix0Dvd3UAKnF8f9johKGxti/wE6ZgN6
 CiRfiMq65lEaSfg5PusWfcRpOh4dACKedBzKWESKNMyUy4/gtZwEzF4/ELiN7wnGsSmH
 bkRA8P7AM4TDNBJw7W3Pk5QYkeipQBzyZMahpT2FRgDzROBiQtGr7nb/P6u8DhJbqngs
 hICk84qCIcDWg/sWWbJJrXkDZOhSE0MSA+nDqh9swlsH3Vky/5hrwKEROnkiVn1p1NP1
 z2cg==
X-Gm-Message-State: APjAAAVhaABSMWKGopXccR5TNEtVBy3pf9YCilaw6L5JjUfAxQSVvD67
 fIQdVnjNbxnmGNgIiZepI0/CaYfB7Ygge8h7HCvtSdt5RxHjDI2IDwF2s/rLjG7QcBTmHj3uU8J
 UzckC1M+XdRiknxOwSYLPdnaJMg0=
X-Received: by 2002:a9d:4e8a:: with SMTP id v10mr123067otk.17.1582008614463;
 Mon, 17 Feb 2020 22:50:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqzLG2BDGPUOinbwB+M3RfmWSfHCa2gA6a9lr5rGlbcURkcOGwrZtzVvvoHVPc7Byb8DxIAuS209+9PN849krWM=
X-Received: by 2002:a9d:4e8a:: with SMTP id v10mr123054otk.17.1582008614196;
 Mon, 17 Feb 2020 22:50:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <20200218061906.GB14282@dhcp-12-102.nay.redhat.com>
In-Reply-To: <20200218061906.GB14282@dhcp-12-102.nay.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Feb 2020 14:50:03 +0800
Message-ID: <CAEemH2dOnQanRKv6EQD2Y_ro65Wc4tXCkkyqnyEjwqf8WrD=JQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Zorro Lang <zlang@redhat.com>
X-MC-Unique: wjTzgtwSNLyImC3eHIOBkA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/7] Add new LTP tests related to fsmount family
 of syscalls
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
Content-Type: multipart/mixed; boundary="===============2062234716=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2062234716==
Content-Type: multipart/alternative; boundary="0000000000007b30ed059ed415f6"

--0000000000007b30ed059ed415f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2020 at 2:09 PM Zorro Lang <zlang@redhat.com> wrote:

> On Fri, Feb 14, 2020 at 05:05:49PM +0530, Viresh Kumar wrote:
> > Hello,
> >
> > This series adds a bunch of LTP tests related to fsmount family of
> > syscalls.
>
> Hi Viresh,
>
> Thanks for all these cases, that's really helpful.
>
> Although you write cases for each new mount API, each xxxxx01.c case look=
s
> nearly do same things.
>
Yes, I have the same feelings. Below are my 2 cents:

Probably because the APIs should be used to bind together, but it is best
to reflect the focus of each test case. e.g. fsmount01.c as basic test
needs to cover more parameters to verify that all the functionality is
really working. fsmount02.c more like a test target for all error
conditions.

FYI madvise test:
[1]
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/sysc=
alls/madvise/madvise01.c
[2]
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/sysc=
alls/madvise/madvise02.c


> That's why I only wrote one case for new-mount currently, due to basic
> mount
> test already can through most of new APIs(except open_tree and fspick). I
> don't
> know if we should write nearly same things in different directories.
> Actually I prepared open_tree and fspick test cases(planned to name as
> newmount02
> and newmount03. but the newmount01 has been changed to fsmount01 :), but
> didn't
> sent out, due to I hope to the first case(which does basic changes) can b=
e
> merged
> at first.
>

It'd be great if those tests can be merged together with Viresh's patch.


>
> All of your xxxxx02.c cases are great! I planned to test more different
> parameters of fsconfig() later too. Your invalid parameters test are nice=
.
> As you've sent these cases, I think these should be reviewed at first,
> avoid
> we do same things:) I'll try to help to review V2 patchset too, if I can:=
-P
>

Thank you in advance, Zorro!

--=20
Regards,
Li Wang

--0000000000007b30ed059ed415f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Feb 18, 2020 at 2:09 PM Zorro Lang &lt;<a h=
ref=3D"mailto:zlang@redhat.com">zlang@redhat.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Feb 14, 2020 at 05:=
05:49PM +0530, Viresh Kumar wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; This series adds a bunch of LTP tests related to fsmount family of<br>
&gt; syscalls.<br>
<br>
Hi Viresh,<br>
<br>
Thanks for all these cases, that&#39;s really helpful.<br>
<br>
Although you write cases for each new mount API, each xxxxx01.c case looks<=
br>
nearly do same things.<br></blockquote><div class=3D"gmail_default" style=
=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"font-size:=
small">Yes, I have the same feelings. Below are my 2 cents:</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Probably because the APIs should be used=
 to bind together, but it is best to reflect the focus of each test case. e=
.g. fsmount01.c as basic test needs to cover more parameters to verify that=
 all the functionality is really working. fsmount02.c more like a test targ=
et for all error conditions.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">FYI madvise test:</div><div class=3D"gmail_default" style=3D"font-size:=
small">[1]=C2=A0<a href=3D"https://github.com/linux-test-project/ltp/blob/m=
aster/testcases/kernel/syscalls/madvise/madvise01.c">https://github.com/lin=
ux-test-project/ltp/blob/master/testcases/kernel/syscalls/madvise/madvise01=
.c</a></div><div class=3D"gmail_default" style=3D"font-size:small">[2]=C2=
=A0<a href=3D"https://github.com/linux-test-project/ltp/blob/master/testcas=
es/kernel/syscalls/madvise/madvise02.c">https://github.com/linux-test-proje=
ct/ltp/blob/master/testcases/kernel/syscalls/madvise/madvise02.c</a></div><=
div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
That&#39;s why I only wrote one case for new-mount currently, due to basic =
mount<br>
test already can through most of new APIs(except open_tree and fspick). I d=
on&#39;t<br>
know if we should write nearly same things in different directories.<br>
Actually I prepared open_tree and fspick test cases(planned to name as newm=
ount02<br>
and newmount03. but the newmount01 has been changed to fsmount01 :), but di=
dn&#39;t<br>
sent out, due to I hope to the first case(which does basic changes) can be =
merged<br>
at first.<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">It&#39;d be great if those tests can be merged to=
gether with Viresh&#39;s patch.=C2=A0</div></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
All of your xxxxx02.c cases are great! I planned to test more different<br>
parameters of fsconfig() later too. Your invalid parameters test are nice.<=
br>
As you&#39;ve sent these cases, I think these should be reviewed at first, =
avoid<br>
we do same things:) I&#39;ll try to help to review V2 patchset too, if I ca=
n:-P<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Thank you in advance, Zorro!</div></div></div><div><br=
></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><=
div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000007b30ed059ed415f6--


--===============2062234716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2062234716==--

