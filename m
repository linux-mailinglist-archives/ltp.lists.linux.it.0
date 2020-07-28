Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21780230B76
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 15:29:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C554B3C269F
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 15:29:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 406B73C0EAD
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 15:29:32 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7B9B2200B63
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 15:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595942969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b4Glc/qvF8i39QfOuBt8L83DUxFPlZDbLJDEwTM6ZfU=;
 b=jCGie2c2IEoVpsRd/nrp3Tlka5i84ubU9Fm1T1yomyIMY29p3U5FwIyrQUCqbOl/DQg5qQ
 bSxtgAVQtuIvB6tRb46JOC7F6uRe8zqOsqJ7pwdE8a9YkkUeE/O03KSsPe2ONI25f5kwbX
 SYj58tjQmH3MU4iGz+RNX8ascSFzlxA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-uj9l2rH7NL2PKojnnXv4DQ-1; Tue, 28 Jul 2020 09:29:27 -0400
X-MC-Unique: uj9l2rH7NL2PKojnnXv4DQ-1
Received: by mail-lf1-f72.google.com with SMTP id x13so3932037lfr.15
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 06:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b4Glc/qvF8i39QfOuBt8L83DUxFPlZDbLJDEwTM6ZfU=;
 b=LLqV2K8oOvriiWua++eK+lJ3A7bUz7cMgPY0FOPRD0FtRqyD9nQdUo0gsCGsVbiQTa
 +lk9i/xgiPggNsYDXByt9QUe+rsKtMLG+lH9wk2ZZYC0QvxB3BY0G0netlEsD/Xbgn2P
 OmpS2QsOxgMj+C2+TUuOEc7VQ1XFXU0xBbDjF2emawUVH6EuMKASCxu6mQwNQSaFyM4f
 rVAnK1O3HPaiQEUN5ug4e7OROT3unjfBYV2S/xAv5DdH3MR6vkCwxviNKUzIjWmVT7Ux
 HsVoVJdDzB6FN8iDd4cmcNVN/tIVp3m15KVOARtNDAPS89twVEd0EepGHmwj5k9gW65A
 o6Xw==
X-Gm-Message-State: AOAM532/uHrnCRxZv6dXd4aBRD9Sxk/ahXI42EZOMtIQF3Xn8Ocj6p0G
 lukJDuXicvNzlX/AmlXfIttR6DHXr2NQlFzd6b0ECCpiL5LD2ZqtphqKcTh0hXwyTaIW8v1t8E2
 78qT5svCJI1WqQY8rjq5TfJacWRw=
X-Received: by 2002:ac2:5468:: with SMTP id e8mr10453647lfn.83.1595942965450; 
 Tue, 28 Jul 2020 06:29:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIE8f5fpdbVeiNszilx5iI/KNV/HSvAUdzWpWblDdivAmqwKVkWM+Emit88/4sfjz4pgWY0PX1cOP3ntT59e8=
X-Received: by 2002:ac2:5468:: with SMTP id e8mr10453638lfn.83.1595942965192; 
 Tue, 28 Jul 2020 06:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200703030811.11521-1-pravinraghul@zilogic.com>
 <CAEemH2febKOruSdyVDMa8sOTFNnSEdEwZkY1OP_34=Ac2GDxSA@mail.gmail.com>
In-Reply-To: <CAEemH2febKOruSdyVDMa8sOTFNnSEdEwZkY1OP_34=Ac2GDxSA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 28 Jul 2020 21:29:12 +0800
Message-ID: <CAEemH2egK01VqrZEaedr_YpgGmz8YLvBDq7bOkA2w+cJdupy5g@mail.gmail.com>
To: pravin <pravinraghul@zilogic.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: LTP List <ltp@lists.linux.it>, vijaykumar@zilogic.com
Content-Type: multipart/mixed; boundary="===============1561282238=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1561282238==
Content-Type: multipart/alternative; boundary="00000000000085c22605ab806d39"

--00000000000085c22605ab806d39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:20 AM Li Wang <liwang@redhat.com> wrote:

> ...
>
>> +       return !(local_var_1 < &local_var_2);
>>
>
> Shouldn't local_var_1 less than local_var_2 on a stack grow up arch? why
> we return the reverse value here?
>
> And the worth to say that the optimization of GCC will break this rule in
> the compilation.
>
> -O2  (ltp default gcc flag)
> mmap18.c:46: INFO: local_var_1 =3D 0x3ffd177dea0, loval_var_2 =3D 0x3ffd1=
77dea4
> -O0
> mmap18.c:46: INFO: local_var_1 =3D 0x3ffc86fe614, loval_var_2 =3D 0x3ffc8=
6fe56c
>

To avoid the compiler optimization disturbing the address order of
variables, I'd
suggest using only one local variable as the baseline to compare with
itself new
address in another recursive function calling.

Something maybe like this:

static int check_stackgrow_up(void)
{
    char local_var;
    static char *addr =3D 0;

    if (addr =3D=3D 0) {
        addr =3D &local_var;
        return check_stackgrow_up();
    }

    return ((&local_var > addr) ? 1 : 0);
}


--------
>
> Apart from that, mmap18 also gets FAIL with s390x platform like:
>
> # ./mmap18
> tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
> mmap18.c:46: INFO: local_var_1 =3D 0x3fff537e5d4, loval_var_2 =3D 0x3fff5=
37e52c
> mmap18.c:126: INFO: mem =3D 0x3ff8dd3a000, stack =3D 0x3ff8dd5a000
> mmap18.c:136: FAIL: Child killed by SIGSEGV
>

From my observation, the failure only occurs on s390x, and it could not
overstride to the unmap memory area. With the following debug-code
adding to run_test():

+       memset(stack, 1, getpagesize());
+       tst_res(TINFO, "write to *stack sucess");
+       memset(stack - getpagesize(), 1, getpagesize());
+       tst_res(TINFO, "write to *(stack - %d) sucess", getpagesize());

mmap18 (on s390x) prints:

  tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
  mmap18.c:137: INFO: write to *stack sucess
  tst_test.c:1292: BROK: Test killed by SIGSEGV!

But trying with other architectures(x86_64, aarch64), they all override
the stack and write into the unmapped area.

  tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
  mmap18.c:139: INFO: write to *stack sucess
  mmap18.c:141: INFO: write to *(stack - 65536) sucess
  mmap18.c:151: PASS: Stack grows in unmapped region


And the Linux Manual makes me feel confusing here, what is the correct
behavior when writing the "guard" page? Can someone help explain this?

=E2=80=9C"=E2=80=9D
    MAP_GROWSDOWN
    ...
    Touching an address in the "guard" page below the mapping will
    cause the mapping to grow by a page. This growth can be repeated
    until the mapping grows to within a page of the high end of the next
    lower mapping, at which point touching the "guard" page will result
    in a SIGSEGV signal.
"""

--=20
Regards,
Li Wang

--00000000000085c22605ab806d39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jul 28, 2020 at 11:20 AM Li Wang &lt;<a hre=
f=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><span class=3D"gma=
il_default" style=3D"font-size:small">...</span></div></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return !(local_var_1 &lt; &amp;local_var_2);<br=
></blockquote><div><br></div><div><div style=3D"font-size:small">Shouldn&#3=
9;t local_var_1 less than local_var_2 on a stack grow up arch? why we retur=
n the reverse value here?</div><br></div><div><div style=3D"font-size:small=
">And=C2=A0the worth to say that the optimization of GCC will break this ru=
le in the compilation.=C2=A0</div><div style=3D"font-size:small"><br></div>=
<div style=3D"font-size:small">-O2=C2=A0 (ltp default gcc flag)</div><div s=
tyle=3D"font-size:small">mmap18.c:46: INFO: local_var_1 =3D 0x3ffd177dea0, =
loval_var_2 =3D 0x3ffd177dea4<br></div><div style=3D"font-size:small"> -O0<=
/div><div style=3D"font-size:small">mmap18.c:46: INFO: local_var_1 =3D 0x3f=
fc86fe614, loval_var_2 =3D 0x3ffc86fe56c</div></div></div></div></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">To avoid the compiler optimization disturbing the address order of variab=
les, I&#39;d</div><div class=3D"gmail_default" style=3D"font-size:small">su=
ggest using only one local variable=C2=A0as the baseline to compare with it=
self new</div><div class=3D"gmail_default" style=3D"font-size:small">addres=
s in another recursive function calling.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Something maybe like this:</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">static int check_stackgrow_up(void)<br>{<br>=C2=A0 =C2=A0=
 char local_var;<br>=C2=A0 =C2=A0 static char *addr =3D 0;<br><br>=C2=A0 =
=C2=A0 if (addr =3D=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D &amp;lo=
cal_var;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return check_stackgrow_up();<br>=C2=
=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 return ((&amp;local_var &gt; addr) ? 1 : =
0);<br>}</div></div><div>=C2=A0</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div=
><div style=3D"font-size:small">--------</div><br></div><div><div style=3D"=
font-size:small">Apart from that, mmap18 also gets FAIL with s390x platform=
 like:</div><div style=3D"font-size:small"><br></div># ./mmap1<span class=
=3D"gmail_default" style=3D"font-size:small">8</span><br>tst_test.c:1247: I=
NFO: Timeout per run is 0h 05m 00s<br>mmap18.c:46: INFO: local_var_1 =3D 0x=
3fff537e5d4, loval_var_2 =3D 0x3fff537e52c<br>mmap18.c:126: INFO: mem =3D 0=
x3ff8dd3a000, stack =3D 0x3ff8dd5a000<br>mmap18.c:136: FAIL: Child killed b=
y SIGSEGV</div></div></div></blockquote><div>=C2=A0</div></div><div class=
=3D"gmail_default" style=3D"font-size:small">From my observation, the failu=
re only occurs on s390x, and it could not</div><div class=3D"gmail_default"=
 style=3D"font-size:small">overstride to the unmap=C2=A0memory area. With t=
he following debug-code</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">adding to run_test():</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">+ =C2=A0 =C2=A0 =C2=A0 memset(stack, 1, getpagesize());<br>+ =C2=A0 =
=C2=A0 =C2=A0 tst_res(TINFO, &quot;write to *stack sucess&quot;);<br>+ =C2=
=A0 =C2=A0 =C2=A0 memset(stack - getpagesize(), 1, getpagesize());<br>+ =C2=
=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;write to *(stack - %d) sucess&quot;,=
 getpagesize());<br></div><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">mmap18 (on s390x) prints:</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><span class=3D"gmail_default=
" style=3D"font-size:small">=C2=A0 </span>tst_test.c:1247: INFO: Timeout pe=
r run is 0h 05m 00s<br><span class=3D"gmail_default" style=3D"font-size:sma=
ll">=C2=A0 </span>mmap18.c:137: INFO: write to *stack sucess<br><span class=
=3D"gmail_default" style=3D"font-size:small">=C2=A0 </span>tst_test.c:1292:=
 BROK: Test killed by SIGSEGV!</div><div><br><div class=3D"gmail_default" s=
tyle=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">But trying with other architectures(x86_64, aarch64), they all o=
verride</div><div class=3D"gmail_default" style=3D"font-size:small">the sta=
ck and write into the unmapped area.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">=C2=A0 tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s<br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 mmap18.=
c:139: INFO: write to *stack sucess<br>=C2=A0 mmap18.c:141: INFO: write to =
*(stack - 65536) sucess<br>=C2=A0 mmap18.c:151: PASS: Stack grows in unmapp=
ed region</div></div><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">And the Linux Manual makes me feel confusing here, what is the c=
orrect</div><div class=3D"gmail_default" style=3D"font-size:small">behavior=
 when writing the &quot;guard&quot; page? Can someone help explain this?=C2=
=A0</div><br></div><div><span class=3D"gmail_default" style=3D"font-size:sm=
all">=E2=80=9C&quot;=E2=80=9D</span></div><div><span class=3D"gmail_default=
" style=3D"font-size:small">=C2=A0 =C2=A0 </span>MAP_GROWSDOWN<br><span cla=
ss=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0</span><span cl=
ass=3D"gmail_default" style=3D"font-size:small"> ...</span></div><div><span=
 class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>Tou=
ching an address in the &quot;guard&quot; page below the<span class=3D"gmai=
l_default" style=3D"font-size:small"> </span>mapping will</div><div><span c=
lass=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>cause=
 the mapping to grow by a page. This growth can be repeated</div><div><span=
 class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>unt=
il the mapping grows to within a page of the high end of the next</div><div=
><span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </sp=
an>lower<span class=3D"gmail_default" style=3D"font-size:small"> </span>map=
<span class=3D"gmail_default">p</span>ing, at which point touching the &quo=
t;guard&quot; page will result</div><div><span class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 </span>in a SIGSEGV signal.</div><div><=
div class=3D"gmail_default" style=3D"font-size:small">&quot;&quot;&quot;</d=
iv></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000085c22605ab806d39--


--===============1561282238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1561282238==--

