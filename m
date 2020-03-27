Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0910194F34
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 03:45:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3372C3C4BA2
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 03:45:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 620ED3C4AF8
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 03:45:10 +0100 (CET)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 75A52200990
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 03:45:09 +0100 (CET)
Received: by mail-pl1-x643.google.com with SMTP id x1so2916277plm.4
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 19:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GCKAt1EYHPSOlPBq7MaJxqOPe4T/MLyk2oLx/zwjSUg=;
 b=meQOQEXs+xrouCyt5P4edzSavFE3mONsQMZa7o+xs+jY1EfHmTf83lmtwTmBXCr+uM
 qgiqmwDIoSkStArfEoXiWU7ifkBmICvb1vHKhl8urj681ebD5HWJfvuF3P/E/nAXt0LJ
 vPErmzWiBm8i++CdGIuryHKzuQdtZAw8OH0eMgcqZPyyYiBbV9yG1NWGS/pzalHTyNAf
 HbbsASe8slBZ+qOTt8iM6tv8thN2rkRRK1oAKMqBpefwL96UPguGpUujV44xMna4YQxj
 lP7AlIU3Kib1glRJZW98OS5UJ/PzRG2fzjR0WWoF3ZRjcqayxQOjONHR/U8Lky7HZBiq
 2mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GCKAt1EYHPSOlPBq7MaJxqOPe4T/MLyk2oLx/zwjSUg=;
 b=uHBGk7g3LJVTTybaDUn+mLVmv6iq+gr/jrmZBDkUaeH1+rCxzEl7H8RZSMDwr7r0E8
 cFlJLqU4DqRI2SJ7FwwxTt7tqMPEoCSB5YPuTspg049xdgfqXMrYlyKPAH1awMTjF+qG
 kOF5/GzDf9PdvbjAJsAvp+v8YHOVLW30MsbC3nl5CsjyBkF0ITVXnSoMVGlHIU86reOJ
 nprj0q2WllBb+FXq/Jl3/F7S6JlsMq9vPta7BulbdET6dtk8AMyBbzabBISLZAYVRXww
 RMqq0mn/XGp2K7chsl6JdpBWf0nvedgbDOyKG4l6HIZsUJojAuhJ4fUDmC4cXOPWcuH7
 1X6w==
X-Gm-Message-State: ANhLgQ0HqJwrjH8SghL9DzMKx0RLkdFL2DKBAOwt7y0lcnEQiWoV4oUK
 wqcR6OQG3L1Q4o9b1PQ9tUaFeopK/gkf15UhO1s=
X-Google-Smtp-Source: ADFU+vtMZhiRunoNX/jG+fkNczl8m3plgjCwhRa3UTRqB2Al8qfr5pz6YB3UyQaKxmITvAgYcx5p9ckHCFCD+Yll76o=
X-Received: by 2002:a17:90a:8d10:: with SMTP id
 c16mr3316175pjo.7.1585277107962; 
 Thu, 26 Mar 2020 19:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200324121742.7130-1-gengcixi@gmail.com>
 <20200325102852.GD5404@yuki.lan> <20200325152821.GA21800@dell5510>
 <CAF12kFv0P4yTVVf-pfXOai8+3urEiWug_dbnTfAXpyfOvzi2ug@mail.gmail.com>
 <20200326070555.GA17560@dell5510>
In-Reply-To: <20200326070555.GA17560@dell5510>
From: Cixi Geng <gengcixi@gmail.com>
Date: Fri, 27 Mar 2020 10:44:31 +0800
Message-ID: <CAF12kFuqJQmiZW+otpb9Hp37kqVis9UzkOKJTMKQWCPnH1nPoQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] uart: add uart testcase in kernel
 device-drivers
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
Cc: Orson Zhai <orsonzhai@gmail.com>, ltp@lists.linux.it,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: multipart/mixed; boundary="===============1140466331=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1140466331==
Content-Type: multipart/alternative; boundary="000000000000e407b105a1cd163a"

--000000000000e407b105a1cd163a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr:
>> +    { sleep 1; serialcheck -b $UART_RATE -d $1 -f $temp_test_file -l
$UART_LOOPS -m t -${UART_HWFLOW}; }&
>Cyril already mentioned the need to use proper locks instead of sleep
I have realized the sleep is not a good way , but I don't have any idea
about the "proper locks"
Can you give me some help?

Petr Vorel <pvorel@suse.cz> =E4=BA=8E2020=E5=B9=B43=E6=9C=8826=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=883:05=E5=86=99=E9=81=93=EF=BC=9A

> Hi Cixi,
>
> > >We both Cyril and me mentioned that you don't need to use mktemp (+
> it'd be
> > >unnecessary dependency).
> > Now I knew  TST_NEEDS_TMPDIR  is make a temp direct and cd in it ,
> > but I need a file contains random data, this file is to used to test th=
e
> > PORT,
> > Do you meaning I should creat a normal file use dd ,and named by myself=
?
> Yes. We do not care about test concurrency of the same test (i.e. the sam=
e
> test
> run more times simultaneously). And even if we care it could be solved by
> adding $$ -
> PID, i.e.: foo.$$ (but you don't need to).
> BTW I wrote it in
> https://lists.linux.it/pipermail/ltp/2020-March/016107.html
>
> > >> This is problematic as well, it expects that all ports that are not
> > >> in-use are loopback connected. This is not true in general case, whi=
ch
> > >> means that we cannot add the test to the kernel_misc runtest file as
> it
> > >> is because it will fail on most of the systems out there.
> > >Oh, I didn't realize this obvious thing.
> > >> We will have to figure out how to pass which ports are interconnecte=
d
> to
> > >> the test somehow, because that is something that only the user who s=
et
> > >> up the machine knows.
> > >Maybe expect user sets it in some variable before running the test?
> e.g.:
> > we can decide  which PORT can be test,  But just like Cyril said, we
> don't
> > know the machines is run int loopback mode or  HW flow control  mode,
> > So can I put the testcase tags into two file in the runtest, one is use=
d
> to
> > test
> > loopback mode, and the other is test for   HW flow control  ?
> > runtest/uart-loopback
> > runtest/uart-HWflow
>
> Wouldn't it help this below?
> > > Maybe expect user sets it in some variable before running the test?
> e.g.:
>
> > > if [ -n "$UART_INTERCONNECTED_PORTS" ]; then
> > >     tst_brk TCONF "set space separated interconnected ports in
> > > \$UART_INTERCONNECTED_PORTS"
> > > fi
>
> Kind regards,
> Petr
>

--000000000000e407b105a1cd163a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Petr:<div><span style=3D"color:rgb(80,0,80)">&gt;&gt; +=
=C2=A0 =C2=A0 { sleep 1; serialcheck -b $UART_RATE -d $1 -f $temp_test_file=
 -l $UART_LOOPS -m t -${UART_HWFLOW}; }&amp;<br></span>&gt;Cyril already me=
ntioned the need to use proper locks instead of sleep=C2=A0</div><div>I hav=
e realized the sleep is not a good way , but I don&#39;t have any idea abou=
t the &quot;proper locks&quot;<br></div><div>Can you give me some help?</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Petr=
 Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.=
cz</a>&gt; =E4=BA=8E2020=E5=B9=B43=E6=9C=8826=E6=97=A5=E5=91=A8=E5=9B=9B =
=E4=B8=8B=E5=8D=883:05=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi Cixi,<br>
<br>
&gt; &gt;We both Cyril and me mentioned that you don&#39;t need to use mkte=
mp (+ it&#39;d be<br>
&gt; &gt;unnecessary dependency).<br>
&gt; Now I knew=C2=A0 TST_NEEDS_TMPDIR=C2=A0 is make a temp direct and cd i=
n it ,<br>
&gt; but I need a file contains random data, this file is to used to test t=
he<br>
&gt; PORT,<br>
&gt; Do you meaning I should creat a normal file use dd ,and named by mysel=
f?<br>
Yes. We do not care about test concurrency of the same test (i.e. the same =
test<br>
run more times simultaneously). And even if we care it could be solved by a=
dding $$ -<br>
PID, i.e.: foo.$$ (but you don&#39;t need to).<br>
BTW I wrote it in <a href=3D"https://lists.linux.it/pipermail/ltp/2020-Marc=
h/016107.html" rel=3D"noreferrer" target=3D"_blank">https://lists.linux.it/=
pipermail/ltp/2020-March/016107.html</a><br>
<br>
&gt; &gt;&gt; This is problematic as well, it expects that all ports that a=
re not<br>
&gt; &gt;&gt; in-use are loopback connected. This is not true in general ca=
se, which<br>
&gt; &gt;&gt; means that we cannot add the test to the kernel_misc runtest =
file as it<br>
&gt; &gt;&gt; is because it will fail on most of the systems out there.<br>
&gt; &gt;Oh, I didn&#39;t realize this obvious thing.<br>
&gt; &gt;&gt; We will have to figure out how to pass which ports are interc=
onnected to<br>
&gt; &gt;&gt; the test somehow, because that is something that only the use=
r who set<br>
&gt; &gt;&gt; up the machine knows.<br>
&gt; &gt;Maybe expect user sets it in some variable before running the test=
? e.g.:<br>
&gt; we can decide=C2=A0 which PORT can be test,=C2=A0 But just like Cyril =
said, we don&#39;t<br>
&gt; know the machines is run int loopback mode or=C2=A0 HW flow control=C2=
=A0 mode,<br>
&gt; So can I put the testcase tags into two file in the runtest, one is us=
ed to<br>
&gt; test<br>
&gt; loopback mode, and the other is test for=C2=A0 =C2=A0HW flow control=
=C2=A0 ?<br>
&gt; runtest/uart-loopback<br>
&gt; runtest/uart-HWflow<br>
<br>
Wouldn&#39;t it help this below?<br>
&gt; &gt; Maybe expect user sets it in some variable before running the tes=
t? e.g.:<br>
<br>
&gt; &gt; if [ -n &quot;$UART_INTERCONNECTED_PORTS&quot; ]; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0tst_brk TCONF &quot;set space separated interc=
onnected ports in<br>
&gt; &gt; \$UART_INTERCONNECTED_PORTS&quot;<br>
&gt; &gt; fi<br>
<br>
Kind regards,<br>
Petr<br>
</blockquote></div></div>

--000000000000e407b105a1cd163a--

--===============1140466331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1140466331==--
