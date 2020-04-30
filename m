Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 959451BF0A6
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 08:57:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 363453C27DC
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 08:57:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1B2E33C26E4
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 08:57:57 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2E57A10018B8
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 08:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588229875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kw9NStxyQNxw0I9gWBjJcwR3psbu1v74/K1+0mYc5X0=;
 b=JwKHKkDN2HuLT3P2Y+S2+LU1oHKrkzpAqc0MXNeKDlCIcstVyOn4P+nIczvkeRGhhsCix6
 cOodL/7SM0D8LKVdmxNY+YMBIlvD2rcbdn+X38BRJN9K+pRUODtb2TxFD/LSKY9jTjNmFI
 m3aBSOGLi8KklwQtjNHdVKDs0ppLNPU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-WfGw-DAuOPSJGXFmY7ib_w-1; Thu, 30 Apr 2020 02:57:49 -0400
X-MC-Unique: WfGw-DAuOPSJGXFmY7ib_w-1
Received: by mail-lf1-f70.google.com with SMTP id c7so114178lfp.13
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 23:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XoJLgA+PzBlCvO5L61IjdIRGjSKEf/7sRtL7nuEUcrE=;
 b=LntNYH6gX56t23RfbN9DtOeUf7PR1dex1rl2EmmosHd/4tl1jC25HmiGCMyfgS249E
 FNyVghub7i9FZY/T9wNkHujuNz+xR4thLc1cnfZkmdfLHLjEQN+ILn4tgN4F/uorDjeQ
 PdPN1t51dvkqsI/kRjHuJW6+nLA76Fm/MHwG41+jmjdVAKb0RHP2EhYcTMPEzZq8hR/U
 +rAcDWKGLwOSiKcbZTgcEYpz8+rMs1R3dPfTKd7hG52Bg0DnWBqk/5s0dDB4DERFxxBB
 lfQcXiJwXY1ayovLlZkxRNY/BRZ4TJOOFdNVRFTGkLT32wOhI086RfiujatCaVOeQp8B
 gw+A==
X-Gm-Message-State: AGi0PuaOBcsEMccZOEXZ9V8N6QOlv5P8HPrHlI4yt9HgWSDsaZiKBJo2
 Qd3aU0w+dMu00r6ClsKVNR3fUusWN9D9cjiCYyYz2bBOPz1Y4LdhLjpC7u6jyhXqES2rxIYgtIP
 Q1M7CYgddcOQJvGOAImvU8+xAPIQ=
X-Received: by 2002:ac2:531c:: with SMTP id c28mr1131576lfh.138.1588229866984; 
 Wed, 29 Apr 2020 23:57:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypLqhDfkSZpx97Q8ImCnsCFU9Xn3QeI9y638T/tfWxuq9nlOSD5DJiW3Sgh8ZQslIP5dD7egtYSUmdGcdsKEUc8=
X-Received: by 2002:ac2:531c:: with SMTP id c28mr1131558lfh.138.1588229866760; 
 Wed, 29 Apr 2020 23:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587552329-21738-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ea_CtRyP9KtpJDjpEzobRyhrodiycDCAxhLbCjuOwhCQ@mail.gmail.com>
 <662aa817-04ff-e924-6880-7c23fa1cfe31@cn.fujitsu.com>
 <CAEemH2cF-kziNEHuN1GayTtzwdxFFzsu0wRGB85yJ=LaKS-XBw@mail.gmail.com>
 <3268f153-6730-708f-ed93-19ca4cf85fdd@cn.fujitsu.com>
 <CAEemH2ee7c55=EQb5qohpu40XMACSOCrSStwWt7u=_GyqjrxLw@mail.gmail.com>
 <CAHk-=wg7u4AjZQd49VjrZXikDMfK-HchOKHYqoUFwcXjsbJ3XQ@mail.gmail.com>
 <36bd1e20-414b-ec24-f7e3-16ef7e2395d9@cn.fujitsu.com>
In-Reply-To: <36bd1e20-414b-ec24-f7e3-16ef7e2395d9@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 30 Apr 2020 14:57:35 +0800
Message-ID: <CAEemH2d-puNst+Mro8oSCiobw2dhHcQVaS=6YoBX=v2+hVMqzQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Cc: David Howells <dhowells@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0629623525=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0629623525==
Content-Type: multipart/alternative; boundary="00000000000007c04d05a47c9579"

--00000000000007c04d05a47c9579
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

Hi Linus
>
>
> > On Sun, Apr 26, 2020 at 4:59 AM Li Wang <liwang@redhat.com> wrote:
> >>
> >>  From kernel code seems you are right. The pipe indeed takes use of
> PAGE_SIZE(ppc64le: 64kB) to split the writes data in the packetized mode
> (marked by O_DIRECT). But in the manual page, O_DIRECT indicates us the
> PIPE_BUF is the correct atomic unit.
>


> >
> > The manual is correct.
> >
> > PIPE_BUF is the size we _guarantee_ can be used atomically.
> >
> > The fact that in practice we do have bigger buffers on some platforms
> > is an implementation detail.
> >
> > Yes, that implementation detail can be visible, but basically any test
> > code that tries to test for "what if we use a bigger bug that
> > PIPE_BUF" is buggy. It's simply not guaranteed to work any more.
> >
> > O_DIRECT is kind of immaterial, except it's just one of those things
> > where the atomic size is slightly more visible. But basically,
> > packetized pipes with bigger packets than PIPE_BUF is random behavior.
> > It may work. It may not.
>


> Thanks for your explanation. I am more curious about the user scene of
> this flag.
>
>

> @Li, so how to design this test? In this test, we don't have complex
> scene to test this automic unit.
>

As Linus pointed out that "packetized pipes with bigger packets than
PIPE_BUF is random behavior", it looks the way in your test is not
guaranteed to work correctly, so I would drop the pipe2_03.c patch.
But according to the pipe(7) manual page, we could try to verify writing
data less than PIPE_BUF is atomic, and the pipe read end also should
provide us correct data in one packet at a time.

"
PIPE_BUF
  POSIX.1 says that write(2)s of less than PIPE_BUF bytes must be
  atomic: the output data is written to the pipe as a contiguous sequence
  ...
  POSIX.1 requires PIPE_BUF to be at least 512 bytes. (On Linux, PIPE_BUF
is 4096 bytes.)
  ...

  O_NONBLOCK disabled, n <=3D PIPE_BUF ...

  O_NONBLOCK enabled, n <=3D PIPE_BUF ...
"
http://man7.org/linux/man-pages/man7/pipe.7.html

--=20
Regards,
Li Wang

--00000000000007c04d05a47c9579
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fu=
jitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><div dir=3D=
"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi Linus<br>
<br>
<br>
&gt; On Sun, Apr 26, 2020 at 4:59 AM Li Wang &lt;<a href=3D"mailto:liwang@r=
edhat.com" target=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 From kernel code seems you are right. The pipe indeed takes =
use of PAGE_SIZE(ppc64le: 64kB) to split the writes data in the packetized =
mode (marked by O_DIRECT). But in the manual page, O_DIRECT indicates us th=
e PIPE_BUF is the correct atomic unit.<br></blockquote><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; The manual is correct.<br>
&gt; <br>
&gt; PIPE_BUF is the size we _guarantee_ can be used atomically.<br>
&gt; <br>
&gt; The fact that in practice we do have bigger buffers on some platforms<=
br>
&gt; is an implementation detail.<br>
&gt; <br>
&gt; Yes, that implementation detail can be visible, but basically any test=
<br>
&gt; code that tries to test for &quot;what if we use a bigger bug that<br>
&gt; PIPE_BUF&quot; is buggy. It&#39;s simply not guaranteed to work any mo=
re.<br>
&gt; <br>
&gt; O_DIRECT is kind of immaterial, except it&#39;s just one of those thin=
gs<br>
&gt; where the atomic size is slightly more visible. But basically,<br>
&gt; packetized pipes with bigger packets than PIPE_BUF is random behavior.=
<br>
&gt; It may work. It may not.<br></blockquote><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Thanks for your explanation. I am more curious about the user scene of <br>
this flag.<br>
<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
@Li, so how to design this test? In this test, we don&#39;t have complex <b=
r>
scene to test this automic unit.<br></blockquote><div><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">As Linus pointed out that &quo=
t;packetized pipes with bigger packets than=C2=A0</div><div class=3D"gmail_=
default" style=3D"font-size:small">PIPE_BUF is random behavior&quot;, it lo=
oks the way in your test is not</div><div class=3D"gmail_default" style=3D"=
font-size:small">guaranteed to work correctly, so I would drop the pipe2_03=
.c patch.</div></div><div class=3D"gmail_default" style=3D"font-size:small"=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">But acco=
rding to the pipe(7) manual page, we could try to verify writing=C2=A0</div=
><div class=3D"gmail_default" style=3D"font-size:small">data less than PIPE=
_BUF is atomic, and the pipe read end also should</div><div class=3D"gmail_=
default" style=3D"font-size:small">provide us correct data in one packet at=
 a time.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><span class=3D"gmail_default" style=3D"font-size:small">&quot;</span></=
div><div>PIPE_BUF=C2=A0</div><div><span class=3D"gmail_default" style=3D"fo=
nt-size:small">=C2=A0 </span>POSIX.1 says that write(2)s of less than PIPE_=
BUF bytes must be=C2=A0</div><div><span class=3D"gmail_default" style=3D"fo=
nt-size:small">=C2=A0 </span>atomic: the output data is written to the pipe=
 as a contiguous sequence</div><div><span class=3D"gmail_default" style=3D"=
font-size:small">=C2=A0 ...</span></div><div><span class=3D"gmail_default" =
style=3D"font-size:small">=C2=A0 </span>POSIX.1 requires PIPE_BUF to be at =
least 512 bytes. (On Linux, PIPE_BUF is 4096 bytes.)<span class=3D"gmail_de=
fault" style=3D"font-size:small"></span></div><div><span class=3D"gmail_def=
ault" style=3D"font-size:small">=C2=A0 ...</span><br></div><div><span class=
=3D"gmail_default" style=3D"font-size:small"><br></span></div><span class=
=3D"gmail_default" style=3D"font-size:small">=C2=A0 </span>O_NONBLOCK disab=
led, n &lt;=3D PIPE_BUF <span class=3D"gmail_default" style=3D"font-size:sm=
all">...</span><div><div><br></div><div><span class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 </span>O_NONBLOCK enabled, n &lt;=3D PIPE_BUF<s=
pan class=3D"gmail_default" style=3D"font-size:small"> ...</span></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">&quot;</div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><a href=3D"http://man7=
.org/linux/man-pages/man7/pipe.7.html">http://man7.org/linux/man-pages/man7=
/pipe.7.html</a></div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div>=
</div></div></div></div>

--00000000000007c04d05a47c9579--


--===============0629623525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0629623525==--

