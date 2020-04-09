Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B291A323E
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:07:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F81A3C2CDE
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:07:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 15AC23C0270
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:07:22 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C396D201277
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586426839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QtsBXHzBLf67D+ScCa+tt9rQzpAUSxvDmp5U9fjfrPs=;
 b=enfZGy44MrrB8gUQdPafzwuEl3zMJVlvE4IrIhNgjfw6noqF+fCsb0o85jTY63q5APwQKI
 wSYETyC6Y7ZBQQeaqwFRFjyiTO7yea1/ffWDGs2cCoE1aGnrI8M2giHcgjn/dYFLYSH01S
 2CFl27qheGws6+ZH94/Dwspbi41mU+Q=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-RB6EtcfjPlCQ6Dkz8Zrovg-1; Thu, 09 Apr 2020 06:07:09 -0400
X-MC-Unique: RB6EtcfjPlCQ6Dkz8Zrovg-1
Received: by mail-lj1-f198.google.com with SMTP id o21so1102266ljp.17
 for <ltp@lists.linux.it>; Thu, 09 Apr 2020 03:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j2MOHjA7jieWYgTQtavRZ/QpcA06rY5+C5vMkdUpHCU=;
 b=PG1GX4DNbAfrMLYcRIqG2J3cPVn9Y6CE77GSqzhytILWBOh2jV9zNpdSUpCpv+g17g
 fn3TXDpE/eIbnO5z+DOSRFnMR7YFfldVx3oyMPy3l6J3vhJSfheDdc9yjSxjwyXlnrFb
 V6j4oR7oYwHKIdS5A/gUBITCRZJgEsUW42I/BB9/jq3IHJlnhiLM35w21xATwxuPUBiH
 3yWhFJyTDHieMrBwgbR8ubs49E7xEoI27HBn4dBOtev0voLJc24U8TwsZz7yDIFZIL9C
 uiBHIl1o7IAFOyXkMpu/CM2SsYqR426raBMAcjaxRGSpHCLdTL+FCaY66Z7rhYvX42FC
 59ZQ==
X-Gm-Message-State: AGi0PuaGFhLNZUHiQZnf+ZEeyzwssaV0az1OsSSOuFuJmpVbCf5AZSk2
 5Vs9eb42HgYa9pHELlQ1Qe+Wihkr/9AEWtUsRJQD7HY5Wu3M6+sdL+VsP/d5dfZw9c5bwwYAdE7
 S8ytIsF5EHw5oq3Z1BXfTa+d9QzE=
X-Received: by 2002:a2e:98c3:: with SMTP id s3mr7852526ljj.6.1586426826994;
 Thu, 09 Apr 2020 03:07:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypLRL7VNylwia5VazREMhXneTuHVbR4ATjLpLN9EeNp53FrwddDbMLYhxteZj1bCqGV4QRcjjbgQIkTuWa3KaIA=
X-Received: by 2002:a2e:98c3:: with SMTP id s3mr7852507ljj.6.1586426826802;
 Thu, 09 Apr 2020 03:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200401083228.GA18685@dell5510> <20200401093934.GA23773@yuki.lan>
 <20200409074505.GA2601@dell5510>
In-Reply-To: <20200409074505.GA2601@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 Apr 2020 18:06:55 +0800
Message-ID: <CAEemH2fo2HOsgrS7q8s3gr5-BdLfO530f0WGszDDWmpw_V=KOg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP compilation broken with -fno-common
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Martin Doucha <martin.doucha@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0312288899=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0312288899==
Content-Type: multipart/alternative; boundary="000000000000795c6905a2d8c7b9"

--000000000000795c6905a2d8c7b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

Petr Vorel <pvorel@suse.cz> wrote:

...
> > I guess that we can even drop the TCID extern definition from the
> tst_test.h
> > header if the weak attribute works fine.
>
> I'd be for adding this patch (both version works), Cyril, will you send i=
t
> to ML / push it?
>
> I'd also be for adding -fno-common to Travis after this fix.
>

After building LTP with CFLAGS=3D"-fno-common" locally, I just find more
places that need to do the same improvement.

    ltp/testcases/kernel/controllers/libcontrollers/libcontrollers.h:56:
multiple definition of `num_line'
    ltp/lib/../include/tst_hugepage.h:16: multiple definition of `Hopt'

Sorry for involving the definition in tst_hugetlb.h without 'extern' issue
many hours ago. It'd be appreciated if you can fix them together in your
coming patch.

Hope this is a timely reminder in case you formatting patch V2 :).

--=20
Regards,
Li Wang

--000000000000795c6905a2d8c7b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@su=
se.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gma=
il_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span =
class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; I guess that we can even drop the TCID extern definition from the tst_=
test.h<br>
&gt; header if the weak attribute works fine.<br>
<br>
I&#39;d be for adding this patch (both version works), Cyril, will you send=
 it<br>
to ML / push it?<br>
<br>
I&#39;d also be for adding <span class=3D"gmail_default" style=3D"font-size=
:small"></span>-fno-common to Travis after this fix.<br></blockquote><div><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">After build=
ing LTP with CFLAGS=3D&quot;-fno-common&quot;=C2=A0locally, I just find mor=
e places that need to do the same improvement.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 ltp/testcases/kernel/controllers/libcon=
trollers/libcontrollers.h:56: multiple definition of `num_line&#39;</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 ltp/lib/=
../include/tst_hugepage.h:16: multiple definition of `Hopt&#39;</div></div>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
Sorry for involving the definition in tst_hugetlb.h without &#39;extern&#39=
; issue many hours ago. It&#39;d be appreciated=C2=A0if you can fix them to=
gether in your coming patch.</div></div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Hope this is a timely reminder in case you formatting patch V2 :=
).</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></d=
iv>

--000000000000795c6905a2d8c7b9--


--===============0312288899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0312288899==--

