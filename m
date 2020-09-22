Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A68E273B03
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Sep 2020 08:37:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED5D13C4DD8
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Sep 2020 08:37:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 24E753C20D7
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 08:37:03 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 4F6D0600A58
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 08:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600756620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rFr90c233Eu2dfnAfI5+vAfLGHqoDQPDaASKWDofnpw=;
 b=dtMQHm5hO9HirB4OvM+c/9HyPWQhKrta8WKRsibA9kieLqa049F/6U1CZH7qc4ifJ/JSUL
 f3/wp/k1uhoPocZL+jm7TNGyj7VsQhD6zGNqTL3oB0ZpCzvmSGboGuZTrELLDARWb7x429
 dlerggn2KlIUCjuFKIdZw2nO1CCA8pk=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-E_wNeHqpMcOnFkxsTARvsw-1; Tue, 22 Sep 2020 02:36:56 -0400
X-MC-Unique: E_wNeHqpMcOnFkxsTARvsw-1
Received: by mail-yb1-f199.google.com with SMTP id a7so6960326ybq.22
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 23:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFr90c233Eu2dfnAfI5+vAfLGHqoDQPDaASKWDofnpw=;
 b=p7WcGHGtfXPSKF9reUqIQ2ErWivmBL+US5ZbUxhA8UXav2ZZr4EiPL4mfjELIBcs4o
 3V6QXaJtBPBTIZVN20M+O1DcCDe4bwTVmlkENcmiru+E1gW8uxCRZvbTCc8LusB8oI69
 k6VNIKRuPY+dwvHNBhD4xYQbR/dgqZCWf5lXlLiKHUkyezihg0Zn1Ezn0W2J0egVcySN
 d4uYdSP1DICFiYlH/FrvKxswSpJjwW7Eb0XuidR/V+/EMlTl1Z5RxGHjALugSJ7ani51
 XO1hSoDituJoI6CwjCfVR0XzuHG/KW2cCf/pN4yOY3m5W05Rjp7kH9PjC+e/hY2nesE5
 HOCA==
X-Gm-Message-State: AOAM530+E4ApuTAxaxcTskvWSt6RSOz2mIJeGN/LAt9EXVD6fkY9+rzr
 efLT16/L7RVmw2P9iZh/Mu1sOYJVXe9OSl/9iExZXuxtl+JJQgfDgJiZ8Bm37JFIoT1gPiMvopf
 D+xPUueBR2LjicgsHy3bgoJuBQp8=
X-Received: by 2002:a25:2cd1:: with SMTP id s200mr5051385ybs.110.1600756615625; 
 Mon, 21 Sep 2020 23:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEhJsqDV3owQ7az6Q5l7kSyz5iqfTlmc1CWI7HX3wkKzQVikpFxqkw8P48BnABe5k4sHn0LodVazPWqLSz53I=
X-Received: by 2002:a25:2cd1:: with SMTP id s200mr5051369ybs.110.1600756615358; 
 Mon, 21 Sep 2020 23:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200918171710.19227-1-chrubis@suse.cz>
 <CAEemH2d_m16MhGrjxWHCeQ0BU9Fa562TVjaa+C_ecnPYhCfthw@mail.gmail.com>
 <20200921094714.GA2311@yuki.lan>
In-Reply-To: <20200921094714.GA2311@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 22 Sep 2020 14:36:43 +0800
Message-ID: <CAEemH2f+yqe2rtNh34fkWiLtVrp=hP70qzNX1HbVt13oyoNzXQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: pravin <pravinraghul@zilogic.com>, LTP List <ltp@lists.linux.it>,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: multipart/mixed; boundary="===============0753438646=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0753438646==
Content-Type: multipart/alternative; boundary="0000000000006e46d905afe131d9"

--0000000000006e46d905afe131d9
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 21, 2020 at 5:46 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> > As the stack grows down, shouldn't grow from stack_bottom to stack_top?
> > which
> > means stack_bottom = start + reserved_size.
>
> That depends on the definition of top and bottom. For me it makes sense
> that the the stack grows from top to the bottom because it grows down,
> which is consistent with the MAP_GROWSDOWN flag.
>

Ok, it sounds we have different comprehension of the MAP_GROWSDOWN flag.
As I thought the flag takes effect on an area of memory and then we regard
the
region as a stack, so I said it grows from the bottom. But if we think a
stack grows
down, then the definition is reverted here.

As this is a gray zone as you said, so I don't want to stick to my own
opinion.

Reviewed-by: Li Wang <liwang@redhat.com>


>
> Also this is really the reason why I added the ASCII art to the top
> level comment of the test in order to make clear how these terms are
> used in the code.


-- 
Regards,
Li Wang

--0000000000006e46d905afe131d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Sep 21, 2020 at 5:46 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cla=
ss=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; As the stack grows down, shouldn&#39;t grow from stack_bottom to stack=
_top?<br>
&gt; which<br>
&gt; means stack_bottom =3D start + reserved_size.<br>
<br>
That depends on the definition of top and bottom. For me it makes sense<br>
that the the stack grows from top to the bottom because it grows down,<br>
which is consistent with the MAP_GROWSDOWN flag.<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">Ok, it sou=
nds we have different=C2=A0comprehension of the MAP_GROWSDOWN flag.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">As I thought the flag =
takes effect on an area of memory and then we regard the</div><div class=3D=
"gmail_default" style=3D"font-size:small">region as a stack, so I said it g=
rows from the bottom. But if we think a stack grows</div><div class=3D"gmai=
l_default" style=3D"font-size:small">down, then the definition is reverted=
=C2=A0here.</div></div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div>As this is a gray zone as you said, so I don&#39;t want to sti=
ck to <span class=3D"gmail_default" style=3D"font-size:small">my</span>=C2=
=A0own opinion<span class=3D"gmail_default" style=3D"font-size:small"></spa=
n>.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><d=
iv class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &=
lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also this is really the reason why I added the ASCII art to the top<br>
level comment of the test in order to make clear how these terms are<br>
used in the code.</blockquote></div><div><br></div>-- <br><div dir=3D"ltr">=
<div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div><=
/div>

--0000000000006e46d905afe131d9--


--===============0753438646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0753438646==--

