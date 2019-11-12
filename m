Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA94F91A3
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 15:11:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 810F43C2600
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 15:11:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1ED433C25F5
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:11 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 48FA220168C
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573567867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BrtUFZ0co03RSNPpbFhZDkdRJBLFeonIb5vU50yzYkY=;
 b=UFr1o6AeMI7M6YPrSyDeC4a0apHgsIuxrxT4yTdgUEzblnrXmqnjeTeWZjxtl3SqF0NjQ4
 QN3fqiwN6Hms2ntlIebwqE+H/wxsSK7MlQtQLr4vB3BrmdveSMeGVwlGwWsoww9WcEHPgX
 OEy7iV36dyB87+t8ozGNGc4tNQPDqkU=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-vT096ZZBPgyNdTXRjxurpw-1; Tue, 12 Nov 2019 09:11:05 -0500
Received: by mail-oi1-f197.google.com with SMTP id n190so13437437oig.23
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 06:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+lXqwKYKEMXWVkoGFXlJoHUbkpG1XzYVD3PaI1UoqmI=;
 b=abHs9fJ+xmwMevTphmp2QKAZQ4RtSVxjT/V3lsaTjqKgJ0RCkAMC/R5yxcQf8Q+8Ww
 be5ZG63ER+/L1hNd1M3k1R7LbxUkizSBA7ES4YdYOr0jelrVRB4IFas7ga0XtTz/LqIS
 /otvpQYADCY6TVfKADuPd5T/1GhaZnIAjCmgqs7sQZW3/PxpeUr2SsQwek8Xq4gYp6OS
 NcBcmJ4FrM/LH8jWkXcpVKxrmpi0g1bYH9ZYP54jNSPmCJY9TEBkLH+Pnn/Kj2R29E/2
 gnpIfUkfbByT+YrLCkeqCrOgYTJvDg3Z331MIdbA9UC6DMd1ua1PRrHVQAnC4gTwui7z
 AqWw==
X-Gm-Message-State: APjAAAX5lMlxlCHMnjv1MlW4Wn7wtOdJC10N4whSHKydPrjGTSBDRSwl
 OQrz4HBoG8TQcuDQ35N2drXBPNY/O54u2M0x+PkWP3uCEdS8kYRuHFsECW6VLiG0I1BN11C+639
 SUTPO8Rr/YLrv2reVt6ucvoLoJpI=
X-Received: by 2002:a9d:590f:: with SMTP id t15mr24701580oth.118.1573567864993; 
 Tue, 12 Nov 2019 06:11:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzi40hdg3qAJW9XjjJpXNC5xDbH3JJCEZciQ4ZlSV2w4t7WhoxpVWEggwK6aM/FXWIEKWJJIIQEv99C+0qiVxc=
X-Received: by 2002:a9d:590f:: with SMTP id t15mr24701566oth.118.1573567864786; 
 Tue, 12 Nov 2019 06:11:04 -0800 (PST)
MIME-Version: 1.0
References: <20191107153458.16917-1-rpalethorpe@suse.com>
 <20191107153458.16917-2-rpalethorpe@suse.com>
 <CACT4Y+aYVH=e+ZJhF2b-b92dkJZwjnPP4keup509twcQqK+wMg@mail.gmail.com>
 <CAEemH2eVR4U8dHR6anmirX_X5Y3hXKgL4cHxekeVXH_wSHnnpA@mail.gmail.com>
 <87ftitdwjq.fsf@rpws.prws.suse.cz>
In-Reply-To: <87ftitdwjq.fsf@rpws.prws.suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 12 Nov 2019 22:10:53 +0800
Message-ID: <CAEemH2eAnkr-n+DxtioUY1M3nbLN8sORWO2k2LBgacPTgGMKhA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
X-MC-Unique: vT096ZZBPgyNdTXRjxurpw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Wrapper for Syzkaller reproducers
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
Cc: Dmitry Vyukov <dvyukov@google.com>, syzkaller <syzkaller@googlegroups.com>,
 LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>,
 automated-testing@yoctoproject.org
Content-Type: multipart/mixed; boundary="===============1556257153=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1556257153==
Content-Type: multipart/alternative; boundary="0000000000009c71a9059726d1e0"

--0000000000009c71a9059726d1e0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 10:00 PM Richard Palethorpe <rpalethorpe@suse.de>
wrote:

> Hello,
>
> Li Wang <liwang@redhat.com> writes:
>
> >
> >
> > Just to try build it in LTP and hit errors:
> >
> > # cd ltp-new/
> > # make autotools
> > # ./configure --with-syzkaller-repros
> > # make -j32
> > ...
> > error: pathspec '/root/ltp-new/testcases/linux-arts' did not match any
> > file(s) known to git
> > make[3]: ***
> [/root/ltp-new/testcases/kernel/syzkaller-repros/Makefile:26:
> > /root/ltp-new/testcases/linux-arts/syzkaller-repros/linux] Error 1
> > make[3]: Leaving directory
> '/root/ltp-new/testcases/kernel/syzkaller-repros'
> > make[2]: *** [../../include/mk/generic_trunk_target.inc:93: all] Error =
2
> > make[2]: Leaving directory '/root/ltp-new/testcases/kernel'
> > make[1]: *** [../include/mk/generic_trunk_target.inc:93: all] Error 2
> > make[1]: Leaving directory '/root/ltp-new/testcases'
> > make: *** [Makefile:108: testcases-all] Error 2
> >
> >
>
> What happens if you try to pull the git submodule manually?
>
# pwd
/root/ltp-new

# git submodule update --init testcases/linux-arts
error: pathspec 'testcases/linux-arts' did not match any file(s) known to
git


>
> i.e. do git submodule update --init testcases/linux-arts
>
> It looks like it failed on the line where it gets the submodule, so I am
> wondering if you have an old git version?


Not sure if that related to git-version, I'm trying to look into it.

# git --version
git version 2.23.0

# uname -r
5.3.8-300.fc31.x86_64

--=20
Regards,
Li Wang

--0000000000009c71a9059726d1e0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 12, 2019 at 10:00 PM Richard Palethorpe=
 &lt;<a href=3D"mailto:rpalethorpe@suse.de">rpalethorpe@suse.de</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt;<br>
&gt;<br>
&gt; Just to try build it in LTP and hit errors:<br>
&gt;<br>
&gt; # cd ltp-new/<br>
&gt; # make autotools<br>
&gt; # ./configure --with-syzkaller-repros<br>
&gt; # make -j32<br>
&gt; ...<br>
&gt; error: pathspec &#39;/root/ltp-new/testcases/linux-arts&#39; did not m=
atch any<br>
&gt; file(s) known to git<br>
&gt; make[3]: *** [/root/ltp-new/testcases/kernel/syzkaller-repros/Makefile=
:26:<br>
&gt; /root/ltp-new/testcases/linux-arts/syzkaller-repros/linux] Error 1<br>
&gt; make[3]: Leaving directory &#39;/root/ltp-new/testcases/kernel/syzkall=
er-repros&#39;<br>
&gt; make[2]: *** [../../include/mk/generic_trunk_target.inc:93: all] Error=
 2<br>
&gt; make[2]: Leaving directory &#39;/root/ltp-new/testcases/kernel&#39;<br=
>
&gt; make[1]: *** [../include/mk/generic_trunk_target.inc:93: all] Error 2<=
br>
&gt; make[1]: Leaving directory &#39;/root/ltp-new/testcases&#39;<br>
&gt; make: *** [Makefile:108: testcases-all] Error 2<br>
&gt;<br>
&gt;<br>
<br>
What happens if you try to pull the git submodule manually?<br></blockquote=
><div><div class=3D"gmail_default" style=3D"font-size:small"></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"># pwd</div>/root/ltp-new<br>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small"># git=
 submodule update --init testcases/linux-arts</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">error: pathspec &#39;testcases/linux-arts&#3=
9; did not match any file(s) known to git</div></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
i.e. do git submodule update --init testcases/linux-arts<br>
<br>
It looks like it failed on the line where it gets the submodule, so I am<br=
>
wondering if you have an old git version?</blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">Not sure if that rela=
ted to git-version, I&#39;m trying to look into it.</div></div><div><br></d=
iv><div># git --version<br>git version 2.23.0</div><div><br># uname -r<br>5=
.3.8-300.fc31.x86_64<br><div class=3D"gmail_default" style=3D"font-size:sma=
ll"></div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div><=
/div></div></div>

--0000000000009c71a9059726d1e0--


--===============1556257153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1556257153==--

