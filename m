Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B431B8F9A
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Apr 2020 14:00:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F8593C2890
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Apr 2020 14:00:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 18AE23C20DE
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 13:59:58 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B23BA600D0C
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 13:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587902395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tSy+NT8p3ZNJKOaJNTS1GAupTQrGxMBl0sXgEKQYreo=;
 b=d6xBJz6mWkkcsyQ/sj7V3azcOoXSdOTbkoEmu3k1m7yprG/llSGKPXock/gxb+dromvYlC
 0RmJLvng9krm1SZQ5ApwtEhPEOTEFhsMvNBZBXDwnOVFkIIRC2ytw68Q1I8DWRcOaMwMLA
 hOta713Rfy5AWzij5nMUqy3vWoXCQ7s=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-8ckDNV9KNL-AAx6qxc38Bg-1; Sun, 26 Apr 2020 07:59:53 -0400
X-MC-Unique: 8ckDNV9KNL-AAx6qxc38Bg-1
Received: by mail-lf1-f70.google.com with SMTP id t22so6105500lfe.14
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 04:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4ZKXmsr88yeH5WYV33EhS9/PSNMjwDP9uFf489BayM=;
 b=GRJUYX0Lk1tpYJ1UsFiArPpkuz9MyRmuFMUttcXXylEr0HEsg+IdqZ6BXgq+2n+/dS
 KGzVwRIWG+MAYid1nYO0jpm4OSwnYMheX7qRnLAgVW79VEnLxDk7VTbFaC8n6MlgX48U
 ECUrmKdB8+T69VEiKQboUuzCr519yybLNiFcWuxTqgJWI0skwsx/WY2L1jGoyjS8nAdj
 3YjqF0YEWhUeLT7W/XDCnNuNYZfarJAJWetqgsoeyOIM51WTbkAWcDZZR7y4M+u2Cq08
 QACLhNbRZEufhUKhsHA21iA3kxMTxBOVWVznlI/Y4H4DKz8fcRHrGk+OETblT183U0a5
 Lc2A==
X-Gm-Message-State: AGi0PubGL9MQpTb7XlXiFykD6wCFUVwyUv8exwD5w0+2hvghZjqbls/k
 nFcf0jYo0geYjESYmAweS+HuT2NP1UNvQznN116BFyWTXXU1kJ7ihFS38bwxkVq/YOyiKzq3+de
 lDEmT5rUNLecRmJPUcy9QUaJe8f4=
X-Received: by 2002:ac2:4853:: with SMTP id 19mr11974514lfy.171.1587902391773; 
 Sun, 26 Apr 2020 04:59:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypLPjgtclgkgVlNZ1GYwPNFupPSUKVnmZzwaiEpLzl3A5DpQl94aDqq6/gsRK5J0GBIMgxHj+RE/VqcYn8PdE0Q=
X-Received: by 2002:ac2:4853:: with SMTP id 19mr11974503lfy.171.1587902391569; 
 Sun, 26 Apr 2020 04:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587552329-21738-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ea_CtRyP9KtpJDjpEzobRyhrodiycDCAxhLbCjuOwhCQ@mail.gmail.com>
 <662aa817-04ff-e924-6880-7c23fa1cfe31@cn.fujitsu.com>
 <CAEemH2cF-kziNEHuN1GayTtzwdxFFzsu0wRGB85yJ=LaKS-XBw@mail.gmail.com>
 <3268f153-6730-708f-ed93-19ca4cf85fdd@cn.fujitsu.com>
In-Reply-To: <3268f153-6730-708f-ed93-19ca4cf85fdd@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Sun, 26 Apr 2020 19:59:39 +0800
Message-ID: <CAEemH2ee7c55=EQb5qohpu40XMACSOCrSStwWt7u=_GyqjrxLw@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
 linux-kernel <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1607068166=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1607068166==
Content-Type: multipart/alternative; boundary="000000000000fce3e405a430555b"

--000000000000fce3e405a430555b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2020 at 6:32 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Hi LI
>
> >
> >
> > On Thu, Apr 23, 2020 at 4:45 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com
> > <mailto:xuyang2018.jy@cn.fujitsu.com>> wrote:
> >
> >     ...
> >      > I got a failure on the ppc64le platform(page size: 65536kB).
> >      >
> >      > # ./pipe2_03
> >      > tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> >      > pipe_size =3D 1048576
> >      > PIPE_BUF =3D 4096
> >      > packet_num =3D 256
> >      > safe_macros.c:457: BROK: pipe2_03.c:58:
> >      > write(4,0x1001d2b8,18446744073709551615) failed:
> >     EAGAIN/EWOULDBLOCK (11)
> >     I think we should remove PIPE_BUF and use page_size  because we use=
 a
> >     page to store data not a fixed size buffer in kernel. as below(also=
,
> >     man-pages[1] is need to update):
> >
> >
> > Emm, If PIPE_BUF doesn't work correctly, shouldn't this a kernel pipe
> > bug? I think we need to take a close look at what happened there but no=
t
> > to replace by using page_size directly.
> > --
> It is only defined in limit.h(I only think it is a error in limit.h) and
>   PIPE_BUF doesn't be used in kernel.
>

[PAGE_SIZE or PIPE_BUFF]

From kernel code seems you are right. The pipe indeed takes use of
PAGE_SIZE(ppc64le: 64kB) to split the writes data in the packetized mode
(marked by O_DIRECT). But in the manual page, O_DIRECT indicates us the
PIPE_BUF is the correct atomic unit. Since PIPE_BUF is defined to 4kB that
is equal to PAGE_SIZE on x86_64 so your test gets PASS there.

I feel confused about whether it's a kernel pipe bug or just need to
correct the manual page.

@Linus, can you give some advice on this? Thanks!


> In kernel code, pipes use struct pipe_buffer to store buffer data and
> other info,
> struct pipe_buffer {
>          struct page *page; //alloc page to store data
>          unsigned int offset, len;
>          const struct pipe_buf_operations *ops;
>          unsigned int flags; //
>          unsigned long private;
> };
>
> as my pipe2_01.c said we only make buf with PIPE_BUF_FLAG_PACKET flag in
> write end , and read will check this flag.  This unit is a page instead
> of this PIPE_BUF macro.
>
> Best Regards
> Yang Xu
> > Regards,
> > Li Wang
>
>
>

--=20
Regards,
Li Wang

--000000000000fce3e405a430555b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Apr 23, 2020 at 6:32 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi LI<=
br>
<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Apr 23, 2020 at 4:45 PM Yang Xu &lt;<a href=3D"mailto:xuyang20=
18.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a> <b=
r>
&gt; &lt;mailto:<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_=
blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I got a failure on the ppc64le platform(page =
size: 65536kB).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; # ./pipe2_03<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; tst_test.c:1246: INFO: Timeout per run is 0h =
05m 00s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; pipe_size =3D 1048576<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; PIPE_BUF =3D 4096<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; packet_num =3D 256<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; safe_macros.c:457: BROK: pipe2_03.c:58:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; write(4,0x1001d2b8,18446744073709551615) fail=
ed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0EAGAIN/EWOULDBLOCK (11)<br>
&gt;=C2=A0 =C2=A0 =C2=A0I think we should remove PIPE_BUF and use page_size=
=C2=A0 because we use a<br>
&gt;=C2=A0 =C2=A0 =C2=A0page to store data not a fixed size buffer in kerne=
l. as below(also,<br>
&gt;=C2=A0 =C2=A0 =C2=A0man-pages[1] is need to update):<br>
&gt; <br>
&gt; <br>
&gt; Emm, If PIPE_BUF doesn&#39;t work correctly, shouldn&#39;t this a kern=
el pipe <br>
&gt; bug? I think we need to take a close look at what happened there but n=
ot <br>
&gt; to replace by=C2=A0using page_size directly.<br>
&gt; -- <br>
It is only defined in limit.h(I only think it is a error in limit.h) and <b=
r>
=C2=A0 PIPE_BUF doesn&#39;t be used in kernel.<br></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">[PAGE_SIZE o=
r PIPE_BUFF]</div><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">From kernel code seems you are right. The pipe indeed takes use of =
PAGE_SIZE(ppc64le: 64kB) to=C2=A0split the writes data in the packetized mo=
de (marked by O_DIRECT). But in the manual page, O_DIRECT indicates us the =
PIPE_BUF is the correct atomic unit. Since=C2=A0PIPE_BUF is defined to 4kB =
that is equal to PAGE_SIZE on x86_64 so your test gets=C2=A0PASS there.=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">I feel confused about=
 whether it&#39;s a kernel pipe bug or just need to correct the manual page=
.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">@Linus, can you g=
ive some advice=C2=A0on this? Thanks!</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
In kernel code, pipes use struct pipe_buffer to store buffer data and <br>
other info,<br>
struct pipe_buffer {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page *page; //alloc page to store =
data<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int offset, len;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct pipe_buf_operations *ops;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flags; //<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long private;<br>
};<br>
<br>
as my pipe2_01.c said we only make buf with PIPE_BUF_FLAG_PACKET flag in <b=
r>
write end , and read will check this flag.=C2=A0 This unit is a page instea=
d <br>
of this PIPE_BUF macro.<br>
<br>
Best Regards<br>
Yang Xu<br>
&gt; Regards,<br>
&gt; Li Wang<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000fce3e405a430555b--


--===============1607068166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1607068166==--

