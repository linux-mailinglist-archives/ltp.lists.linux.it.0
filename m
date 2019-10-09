Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20399D0B0E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 11:26:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1F243C207E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 11:26:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A40A33C1045
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 11:26:17 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 09482601E81
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 11:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1570613175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=um8vd8OyljV6sH+F/hC+kbshCqBK2qBYev/jAiSTRx0=;
 b=aJqbvBHBaM/vHI1R2oJFewQ/2RLUEHaIiuwzxZ2FZNmM5Ltb+eKzWmvRUFX+OJ+WOPJF/Q
 cTNAMDGD5ooJvo2AoXZZC4uZHXwTWDY7ZwdigLuxqvGWXIPcF7GGid7BZf2OXcwKfe185v
 NH6G219BDxzUik7XvM0dOyVlMI6a20A=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-MDimOQABOC2KsN4JNFSnow-1; Wed, 09 Oct 2019 05:26:12 -0400
Received: by mail-ot1-f69.google.com with SMTP id i8so831026otc.19
 for <ltp@lists.linux.it>; Wed, 09 Oct 2019 02:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHBSJqEvmVR3rJ548kPP4aygXdSAoJJ28NAcoW+mweE=;
 b=hQ2EaQRE01Ull6dcja9ScH4L8BKhvetvpqW2stdWRDj1Z9go8lVx63IRggc1oaXEcD
 Y0jTNUVB7P4NuK6TlF8c51eJrZNbvOB0czZyqFiePzK5PR1zJLl3CNlzVOFFa3CfXhTq
 rGuRyJ7L8fdB8mIUEFI6RK/8QtyS+Oe0l14F9M3bcQXY9HgBF54PU8R5SW2C6oTd/i2v
 kVGCI6ZewAhHMKTy3iGhftmM6gcjuvSpRWbmF9XwOPMN1af28Lbu9x/bn+aWqJx9xDrU
 T5DsPbmPJfo10nFbrAu/J6DHrMVxi+Uo9qYlFk3MHTqq3dCjJzm0skgOxSGTEDwe/xSw
 6q+Q==
X-Gm-Message-State: APjAAAVk/w4AoN0mh49Hsw6mIztJDtbdYAaT9589sLw+kAFofiN3FYsk
 bGFkNstBXdG7KmyjX8K12lqwIBHwM3vBf5qRFJIzDHgsod+nDp99RO9153dURZwQpFj7bmhhI1u
 mF3i3xZ5pxwqK+Yrof9iC0ZofjR4=
X-Received: by 2002:aca:72cf:: with SMTP id p198mr1373430oic.153.1570613170935; 
 Wed, 09 Oct 2019 02:26:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzM2vUVUeG2xEjzdhG4xdlaQS11ulGbWh8H1zjhTXGD1CyVNvubuuirf1yn3D4DnHKIKcN0NmNKz7M/UUdI9u4=
X-Received: by 2002:aca:72cf:: with SMTP id p198mr1373419oic.153.1570613170681; 
 Wed, 09 Oct 2019 02:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190926093921.21247-1-liwang@redhat.com>
 <20191008125625.GA6180@dell5510>
In-Reply-To: <20191008125625.GA6180@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Wed, 9 Oct 2019 17:25:59 +0800
Message-ID: <CAEemH2f+MFs9dq4WaG5FCQcVW=TL5u0YYfqRJUkBf=gFtNqNew@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: MDimOQABOC2KsN4JNFSnow-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [Patch v4.1] fzsync: revoke thread_b if parent hits
 accidental break
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1035854979=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1035854979==
Content-Type: multipart/alternative; boundary="0000000000001e50d6059476e01f"

--0000000000001e50d6059476e01f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2019 at 8:56 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi LI,
>
> > We shouldn't rely entirely on the pair->exit flag in
> tst_fzsync_pair_cleanup()
> > since there is possible to call tst_brk() at anyplace of thread_a, that
> will
> > lead to timeout eventually because of thread_b(tst_fzsync_wait_b) fall
> into
> > an infinite(no explicit condition to exit) loop.
>
> > Thread_a path trace:
> >   tst_brk()
> >     cleanup()
> >       tst_fzsync_pair_cleanup()
> >         SAFE_PTHREAD_JOIN(pair->thread_b, NULL)
> >         #Or pthread_cancel(pair->thread_b)
>
> > We fix the problem via a way to kill thread_b with pthread_cancel. With
> new
> > thread wrapper involves enabling thread cancel at the start of the
> thread B,
> > then do asynchronous cancellation in tst_fzsync_pair_cleanup if
> pair->exit
> > is not being set to 1.
>
> > Workaround: [commit 2e74d996: Check recvmmsg exists before entering
> fuzzy loop]
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > Cc: Richard Palethorpe <rpalethorpe@suse.com>
> > Cc: Cyril Hrubis <chrubis@suse.cz>
> > Acked-by: Richard Palethorpe <rpalethorpe@suse.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>

Pushed. Thanks for the review.

--=20
Regards,
Li Wang

--0000000000001e50d6059476e01f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 8, 2019 at 8:56 PM Petr Vorel &lt;<a hr=
ef=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi LI,<br>
<br>
&gt; We shouldn&#39;t rely entirely on the pair-&gt;exit flag in tst_fzsync=
_pair_cleanup()<br>
&gt; since there is possible to call tst_brk() at anyplace of thread_a, tha=
t will<br>
&gt; lead to timeout eventually because of thread_b(tst_fzsync_wait_b) fall=
 into<br>
&gt; an infinite(no explicit condition to exit) loop.<br>
<br>
&gt; Thread_a path trace:<br>
&gt;=C2=A0 =C2=A0tst_brk()<br>
&gt;=C2=A0 =C2=A0 =C2=A0cleanup()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_fzsync_pair_cleanup()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_JOIN(pair-&gt;thread_b, =
NULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#Or pthread_cancel(pair-&gt;thread_b)=
<br>
<br>
&gt; We fix the problem via a way to kill thread_b with pthread_cancel. Wit=
h new<br>
&gt; thread wrapper involves enabling thread cancel at the start of the thr=
ead B,<br>
&gt; then do asynchronous cancellation in tst_fzsync_pair_cleanup if pair-&=
gt;exit<br>
&gt; is not being set to 1.<br>
<br>
&gt; Workaround: [commit 2e74d996: Check recvmmsg exists before entering fu=
zzy loop]<br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; Cc: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.com" tar=
get=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
&gt; Cc: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_bla=
nk">chrubis@suse.cz</a>&gt;<br>
&gt; Acked-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.co=
m" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br></blockquote><div><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Pushed. Thanks for the review.</div>=
</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div=
 dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div=
>

--0000000000001e50d6059476e01f--


--===============1035854979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1035854979==--

