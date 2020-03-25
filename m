Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E38731920A1
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 06:30:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 023843C4BDB
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 06:30:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7E2813C4BA6
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 06:30:27 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A7A2320004E
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 06:30:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585114225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l0rfICsHYqwH+3Qo4Zwhr5MmRD/Jzmc/bkwdEw0MlfM=;
 b=XwO9kcINYOC86J0+nERxse1uMsd5dhBbl9zX/kaDJogOQsP/LItX+5gtOGgEZ+MbvETCJw
 e1uIoPYDh5qqZ7v3hnEkHbRAXMC27OP6eFbZ9fJWR+HEeXnce2pIpyLH43DTGxem+sMj7E
 zAHC2fqkldcjyOkWHF1Pbl1Gtvk+bBM=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-a9-1V5dBNo-kqDpKPzBLEQ-1; Wed, 25 Mar 2020 01:30:22 -0400
X-MC-Unique: a9-1V5dBNo-kqDpKPzBLEQ-1
Received: by mail-ot1-f69.google.com with SMTP id a66so840169otb.6
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 22:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TR5wP+YaehqeGJFHvXD//2+CzBF7g3lj1qQVh4eijxY=;
 b=RPGyN2N/AXEfVE3CdJxLL2Jw0/N3z+1vtRAemwHkIpifcelNyxtNFq8BObg4EvTmdK
 778liUavS+dKoIkzAkKJZ1/De7fjc6JB35laxJmFgagA18mvo6Rse/Nfotcjbi1IHAGJ
 3Wox598MN6kupy/Cp327LHOPseIJ/6RvAd7t9LnhhtNSmMzIoMIKNuAsRo99mw3Bsevc
 KcJVKOjYcQp+QFy+PJDAG3UkSYpNo1DeWN5c8sM9QVpwCw8C61/eqNUQTH11SUvcANGV
 ZV71AHTitvmztZLjzLaOIxnKKXX9ame3wOSDKXEPTR/ft6fYpSyYzD1vO73Yt4IgAdAB
 QlTQ==
X-Gm-Message-State: ANhLgQ1Dtk4PbFDl9xk/ujnf51rvQ0HS996ovuJ91FqJd7XaCCt1XG+a
 uNedQlFdd6faUPyJDs8lTFda7kpQJblmWFTeYVX8hqBtnNtaWK5kxiv8VfooNCRw6LGVknHS2vn
 v0S7lN7kWZm/6GYa8NSfeTVIL2Tk=
X-Received: by 2002:a05:6830:11c1:: with SMTP id
 v1mr1265732otq.264.1585114221621; 
 Tue, 24 Mar 2020 22:30:21 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vstOg3t8hN3GpvcpkaTxfGwqdku0HrNrqoWvyU0LLrNxJwpiOeqNcANT5Xs5PP7KLpQR7KnSzZBXSaEu70x3HQ=
X-Received: by 2002:a05:6830:11c1:: with SMTP id
 v1mr1265717otq.264.1585114221327; 
 Tue, 24 Mar 2020 22:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
 <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
 <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
 <20200323160415.GC15673@dell5510> <20200324235150.GC4521@yuki.lan>
 <20200324172102.GA1307@dell5510> <20200325015324.GA15127@yuki.lan>
In-Reply-To: <20200325015324.GA15127@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 25 Mar 2020 13:30:09 +0800
Message-ID: <CAEemH2doL4m4-TLBBWTHygTRPSTa68dkoAFjZJrDmzrkmgUrSQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Content-Type: multipart/mixed; boundary="===============0827924500=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0827924500==
Content-Type: multipart/alternative; boundary="000000000000174f6105a1a72a20"

--000000000000174f6105a1a72a20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 1:57 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > Also if we are going to add this functionality it should be added as =
an
> > > .needs_cmds array in the tst_test structure.
> > .needs_cmds sounds as a good idea. But let's do it as a separate effort=
.
>
+1, thanks Petr!


> > I'll leave already sent v2 for review. Once .needs_cmds is implemented,
> we can
> > use it as well for copy_file_range02.c.
>
> Actually I would like to avoid exposing the function to the tests and
> force people to use the .needs_cmds instead in order to have a proper
> metadata.
>

Sounds good.

And this makes me think more of the '.request_hugepages' story. The
needs_foo flags require the foo to be present on the system as hard
requirements. In some situations(i.e copy_file_range02.c), we probably need
to handle the soft situation, which means, the commands are only part of
the test requirement. So if it writing with .needs_cmds=3D"xxx", it might
skip the whole test in setup() phase.

So things are clear now, checking for the command existence in
tst_run_cmd_fds_() is really necessary. For the test with "cmds" is needed
just adding the .needs_cmds=3D"xxx", for the test with "cmds" is only part =
of
it, we can avoid writing '.needs_cmds' but calling tst_run_cmd() function
directly.

--=20
Regards,
Li Wang

--000000000000174f6105a1a72a20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 25, 2020 at 1:57 AM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; Also if we are going to add this functionality it should be added=
 as an<br>
&gt; &gt; .needs_cmds array in the tst_test structure.<br>
&gt; .needs_cmds sounds as a good idea. But let&#39;s do it as a separate e=
ffort.<br></blockquote><div><span class=3D"gmail_default" style=3D"font-siz=
e:small"></span></div><div><span class=3D"gmail_default" style=3D"font-size=
:small">+1, thanks Petr!</span></div><div><span class=3D"gmail_default" sty=
le=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
&gt; I&#39;ll leave already sent v2 for review. Once .needs_cmds is impleme=
nted, we can<br>
&gt; use it as well for copy_file_range02.c.<br>
<br>
Actually I would like to avoid exposing the function to the tests and<br>
force people to use the .needs_cmds instead in order to have a proper<br>
metadata.<br></blockquote><div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Sounds good.</div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><font color=3D"#000000">And this makes me think more of the &=
#39;.request_hugepages&#39; story. The needs_foo flags require the foo to b=
e present on the system as hard requirements. In some situations(i.e copy_f=
ile_range02.c), we probably need to handle the soft situation, which means,=
 the commands are only part of the test requirement. So if it writing with =
.needs_cmds=3D&quot;xxx&quot;, it might skip the whole test in setup() phas=
e. </font></div></div><div class=3D"gmail_default" style=3D"font-size:small=
"><font color=3D"#000000"><br></font></div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><font color=3D"#000000">So things are clear now, che=
cking for the command existence in tst_run_cmd_fds_() is really necessary. =
For the test=C2=A0with &quot;cmds&quot; is needed just adding the .needs_cm=
ds=3D&quot;xxx&quot;, for the test with &quot;cmds&quot;</font><span style=
=3D"color:rgb(0,0,0)">=C2=A0is only part of it, we can avoid writing &#39;.=
needs_cmds&#39; but calling tst_run_cmd() function directly.</span></div><d=
iv><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div d=
ir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000174f6105a1a72a20--


--===============0827924500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0827924500==--

