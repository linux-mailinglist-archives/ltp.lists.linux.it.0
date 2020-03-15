Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE8B185C4E
	for <lists+linux-ltp@lfdr.de>; Sun, 15 Mar 2020 13:20:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D875B3C578F
	for <lists+linux-ltp@lfdr.de>; Sun, 15 Mar 2020 13:20:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 030213C0EBE
 for <ltp@lists.linux.it>; Sun, 15 Mar 2020 13:20:47 +0100 (CET)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C6B4D1A00791
 for <ltp@lists.linux.it>; Sun, 15 Mar 2020 13:20:46 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id t3so6556391plz.9
 for <ltp@lists.linux.it>; Sun, 15 Mar 2020 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MD2VDM20Ug9r7ScCX0CMXiNrnNtdpPrkB/2NrQviyYo=;
 b=jTAYdlyTcgQkACyfGG7Z7sEQT6RZZPTYqvJtMGp9Xmmr3miEkEZSeCtBNgJm5f1Qts
 w1J1PfhHt3BfdrPWogTNAk+9A6PLI9t2kw0lyb91f8usDXaokiX1EzGSvjmXydLPUiaf
 Ivo3vXxNpnMVMGc2CnmJswaKxUe7E+xiXFFJzFVL35mU/m+G6S7MGZbYUWP4t3Qdn5Qv
 sUDtYQYqj2sUHuMxVsM1UFA3L7ASm0kfPzaXj2e9KugO6yj9rGyApfhb31LZKdSFgVd2
 BH395XRz3HV48DCHh7i2WrJi4a0V12XGb+9rtHQvcyLfrEw8pP7Mhl+534jBe985EYgS
 U1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MD2VDM20Ug9r7ScCX0CMXiNrnNtdpPrkB/2NrQviyYo=;
 b=rkk+8dSmLQbk0q3Dr5+YEUXYjU0h4bYqnv7RNC4gpPkCxJiu8FJa9XTy9PadiWBM9g
 6rw2/MJ2D5l5i1mMJ5aBup3S5GKbAwXwzGIi8e/iooTrdsS/LSN9bRKw8+pEIUmwQCcO
 MhCaZjFZ2Cp0JkWYvylujVKg0PDDMpZv5fA17w7+kqWeczd8DpqAlTioik0rImPe9b6T
 QHaaHbVd4SFGTh/dZ+Up9A1wRNojGjYE6ObM5zMLdF0JfNZBN0RB4h5D8hRsAcjSnvh9
 8ygVO9zmNxBdjMImJ1xQirASjSWB16IlTkYApCmkPb8yMcQ7jBSINHMQMjEHK/emg0Jt
 SwJQ==
X-Gm-Message-State: ANhLgQ31FNZQKsHUs/yLAAsInhgbY3UkGM43dA2mBksHAR6CE7XCYddw
 JIPOgQiP0EsHgV+Eucbzg7HpStFHb4176igKn1c=
X-Google-Smtp-Source: ADFU+vslKG8h2SiM56n48pn9TcOLdzmGWkCc577x0y1veB7/Q7kXXB5EIPR4XzycsciJ6WsIVUolJCHrfAlhJP7hqH8=
X-Received: by 2002:a17:902:b206:: with SMTP id
 t6mr20060925plr.75.1584274845117; 
 Sun, 15 Mar 2020 05:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAEX+82K_6yO1pB9utLg3TPheG91+oO-ode7kmMUPoLLe7aszxA@mail.gmail.com>
 <CAEemH2c6hkXMBsSQEm5MMhZoEieR0-OUwJ-ASLB9VFnG6Z-a8g@mail.gmail.com>
In-Reply-To: <CAEemH2c6hkXMBsSQEm5MMhZoEieR0-OUwJ-ASLB9VFnG6Z-a8g@mail.gmail.com>
From: Javier Romero <xavinux@gmail.com>
Date: Sun, 15 Mar 2020 09:20:30 -0300
Message-ID: <CAEX+82+X=V_Z4nhBqpu5MyPJxhbEEdRgz84t8iDxo-5WanGghA@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Contribution to the LTP.
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
Content-Type: multipart/mixed; boundary="===============1553620764=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1553620764==
Content-Type: multipart/alternative; boundary="0000000000005eb16105a0e3bb6b"

--0000000000005eb16105a0e3bb6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Li,

Thank you for your answer.

Will read those links you suggested.

BTW I have a Raspberry PI 3 to start working on testing, it could be useful
to test the Linux Kernel and subsystems on ARM processor?

Thanks again for your kind attention.

Best Regards,


El dom., 15 mar. 2020 03:27, Li Wang <liwang@redhat.com> escribi=C3=B3:

> Hi Javier,
>
> Of course yes, LTP[1] is an open-source project. Everyone who
> interested is welcomed.
>
> As you said you're a cloud engineer, so feel free to start LTP testing on
> your Linux product and find/report/fix the problem.
> https://github.com/linux-test-project/ltp/blob/master/README.md
>
> Also, this is the LTP testcase writing guidelines FYI:
>
> https://github.com/linux-test-project/ltp/blob/master/doc/test-writing-gu=
idelines.txt
>
> Any technical issues about LTP are suggested to discuss here(LTP-ML:
> ltp@lists.linux.it).
>
> [1] LTP provides tools and testsuites to verify the Linux kernel and
> related subsystems.
>
>
> On Sun, Mar 15, 2020 at 7:54 AM Javier Romero <xavinux@gmail.com> wrote:
>
>> Hi,
>>
>> My name is Javier, work as a cloud engineer and have been working as a
>> Linux sysadmin for the last 10 years.
>>
>> Would like to know if I can be useful for the Linux Test Proyect and
>> contribute as a tester.
>>
>> Thanks for your kind attention and sorry for the inconvenience.
>>
>> Best Regards
>>
>> --
>> Mailing list info: https://lists.linux.it/listinfo/ltp
>>
>
>
> --
> Regards,
> Li Wang
>

--0000000000005eb16105a0e3bb6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div dir=3D"auto">Hi Li,</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Thank you for your answer.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Will read those links you suggested.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">BTW I have a Raspberry PI 3 to star=
t working on testing, it could be useful to test the Linux Kernel and subsy=
stems on ARM processor?</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Thanks again for your kind attention.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Best Regards,</div><br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">El dom., 15 mar. 2020 03:27, Li Wang &lt;<a href=3D"mailto:liwang=
@redhat.com">liwang@redhat.com</a>&gt; escribi=C3=B3:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_de=
fault" style=3D"font-size:small"><font color=3D"#000000">Hi=C2=A0Javier,</f=
ont></div><div class=3D"gmail_default" style=3D"font-size:small"><font colo=
r=3D"#000000"><br></font></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><font color=3D"#000000">Of course yes, LTP[1] is an open-source =
project. Everyone who interested=C2=A0is welcomed.</font></div><div class=
=3D"gmail_default" style=3D"font-size:small"><font color=3D"#000000"><br></=
font></div><div class=3D"gmail_default" style=3D"font-size:small"><font col=
or=3D"#000000">As you said you&#39;re a cloud engineer, so feel free to sta=
rt LTP testing on your Linux product and find/report/fix the problem.</font=
></div><div class=3D"gmail_default" style=3D"font-size:small"><font color=
=3D"#000000"><a href=3D"https://github.com/linux-test-project/ltp/blob/mast=
er/README.md" target=3D"_blank" rel=3D"noreferrer">https://github.com/linux=
-test-project/ltp/blob/master/README.md</a><br></font></div><div class=3D"g=
mail_default" style=3D"font-size:small"><font color=3D"#000000"><br></font>=
</div><div class=3D"gmail_default" style=3D"font-size:small"><font color=3D=
"#000000">Also, this is the LTP testcase=C2=A0writing guidelines FYI:</font=
></div><div class=3D"gmail_default" style=3D"font-size:small"><font color=
=3D"#000000"><a href=3D"https://github.com/linux-test-project/ltp/blob/mast=
er/doc/test-writing-guidelines.txt" target=3D"_blank" rel=3D"noreferrer">ht=
tps://github.com/linux-test-project/ltp/blob/master/doc/test-writing-guidel=
ines.txt</a><br></font></div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><font color=3D"#000000"><br></font></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><font color=3D"#000000">Any technical issues =
about LTP are suggested to discuss here(LTP-ML: <a href=3D"mailto:ltp@lists=
.linux.it" target=3D"_blank" rel=3D"noreferrer">ltp@lists.linux.it</a>).</f=
ont></div><div class=3D"gmail_default"><font color=3D"#000000"><br></font><=
/div></div><div class=3D"gmail_default"><font color=3D"#000000">[1]=C2=A0<s=
pan style=3D"background-color:rgb(250,251,252);font-family:-apple-system,Bl=
inkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;">LTP provides tools and test=
suites to verify the Linux kernel and related subsystems</span>.</font></di=
v><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sun, Mar 15, 2020 at 7:54 AM Javier Romero &lt;<a href=3D"mai=
lto:xavinux@gmail.com" target=3D"_blank" rel=3D"noreferrer">xavinux@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"auto"><div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">My name is Javier, work as a cloud engineer and have been=
 working as a Linux sysadmin for the last 1<span class=3D"gmail_default" st=
yle=3D"font-size:small"></span>0 years.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Would like to know if I can be useful for the Linux Test Pr=
oyect and contribute as a tester.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks for your kind attention and sorry for the inconvenience.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Best Regards</div></div>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp=
</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>
</blockquote></div></div></div>

--0000000000005eb16105a0e3bb6b--

--===============1553620764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1553620764==--
