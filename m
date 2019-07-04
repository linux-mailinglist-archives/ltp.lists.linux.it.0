Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 946AB5F25D
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 07:48:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DEA13C1DA4
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 07:48:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7F19B3C1D3D
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 07:48:23 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AF14E1401A96
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 07:48:21 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id s141so1268625vsc.3
 for <ltp@lists.linux.it>; Wed, 03 Jul 2019 22:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZgCegHdSMHjbIcKQcysNJ+5esBcxXmfHGv1M4BAf0uM=;
 b=YemhXxGQulaaMi2EV1yYvn0SjuNuL1UhDYG8zv6jsBbmYr7e4SLQuOA585pM7V6+9w
 o5cx/wwNAuE3fKMz0tWAnY/Z7CPQEOOnxKLC2asG7YwtoOK5s4OQJH2H5opxA0BaUvOz
 ELIF+goqZglLB/p7t/cYx/8m9u5gt4wMULYP57L95bwHElDjfOA9AR4V1hK4DaNPOLz9
 eEY/LihNFVOHE95zoaCghqfcq9ItseZFni6YXy4a+3k9V1/DW2jExw0wjDkpE65ceOoC
 QFtuKbkpS7MzM6D4ALzYybnXw5xpZhcbbYUGaOiywcfbSr1IsFujFIH7rsiU295x50rx
 8Z4w==
X-Gm-Message-State: APjAAAWMy7MLg0mXpNa0sNqH3Ql7f+nEe4gVjwoUN7eNq9ujY6VRk4mu
 +j7AZb29uF+7fwgKLXEz+PTkq9NLVFQrPs2JKpvQzw==
X-Google-Smtp-Source: APXvYqxrlYfJlndFU4a/lZS3XKMNDhoCOhiaj77GSIUkkc4Ruz5pG5Dw5ZoyqRwsOlG2iM5AS2utS/LEUzNbyLjZdY8=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr21508100vsq.179.1562219300344; 
 Wed, 03 Jul 2019 22:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190607095213.13372-1-liwang@redhat.com>
 <20190703131005.GA1712@rei>
In-Reply-To: <20190703131005.GA1712@rei>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Jul 2019 13:48:09 +0800
Message-ID: <CAEemH2fGUABOfz=Yq6xONgmHwjaiU6n_q=9EXyZz2EUedpuK8Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0604857600=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0604857600==
Content-Type: multipart/alternative; boundary="000000000000756c41058cd486e1"

--000000000000756c41058cd486e1
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 3, 2019 at 9:10 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > +                     if (ret == EINVAL) {
> >                               SAFE_KILL(cpid, SIGKILL);
> >                               SAFE_WAITPID(cpid, &status, 0);
> >                               SAFE_MUNMAP(addr, tcases[n].tpages * hpsz);
> >                               tst_res(TCONF,
> >                                       "madvise() didn't support
> MADV_SOFT_OFFLINE");
> >                               return;
> > +                     } else if (ret == EBUSY) {
> > +                             SAFE_MUNMAP(addr, tcases[n].tpages * hpsz);
> > +                             goto out;
>
> Shouldn't we continue with the test here rather than exit?
>
> I guess that there is no harm in doing a few more iterations if we
> manage to hit EBUSY, or is there a good reason to exit the test here?
>

Yes, we can do more iterations then, but it probably makes no sense.

The reason I guess is that, if we get an EBUSY on the hugepage offline,
that means the page is already being isolated by move_pages() in the child
at that moment and we can't really release it. So in the next iteration,
the mmap() will be failed with ENOMEM(since we only have 1 huge page in
/proc/.../nr_hugepages).

To confirm that, I change the code to continue after get EBUSY, but it
couldn't:

# ./move_pages12
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
move_pages12.c:251: INFO: Free RAM 30860672 kB
move_pages12.c:269: INFO: Increasing 2048kB hugepages pool on node 0 to 4
move_pages12.c:279: INFO: Increasing 2048kB hugepages pool on node 1 to 5
move_pages12.c:195: INFO: Allocating and freeing 4 hugepages on node 0
move_pages12.c:195: INFO: Allocating and freeing 4 hugepages on node 1
move_pages12.c:185: PASS: Bug not reproduced
move_pages12.c:146: CONF: Cannot allocate hugepage, memory too fragmented?

>
> Otherwise the patch looks good.
>

Thanks for review.

-- 
Regards,
Li Wang

--000000000000756c41058cd486e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 3, 2019 at 9:10 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret =3D=3D EINVAL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_KILL(cpid, SIGKILL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WAITPID(cpid, &amp;status, 0)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_MUNMAP(addr, tcases[n].tpages=
 * hpsz);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TCONF,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
madvise() didn&#39;t support MADV_SOFT_OFFLINE&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0} else if (ret =3D=3D EBUSY) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_MUNMAP(addr, tcases[n].tpages * hps=
z);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
<br>
Shouldn&#39;t we continue with the test here rather than exit?<br>
<br>
I guess that there is no harm in doing a few more iterations if we<br>
manage to hit EBUSY, or is there a good reason to exit the test here?<br></=
blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Yes, we can do more iterations then, but it probably makes no se=
nse.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">The reason I g=
uess is that, if we get an EBUSY on the hugepage offline, that means the pa=
ge is already being isolated by move_pages() in the child at that moment an=
d we can&#39;t really release it. So in the next iteration, the mmap() will=
 be failed with ENOMEM(since we only have 1 huge page in /proc/.../nr_hugep=
ages).</div></div><div>=C2=A0</div><div><div class=3D"gmail_default" style=
=3D"font-size:small">To confirm that, I change the code to continue after g=
et EBUSY, but it couldn&#39;t:</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div># ./move_pages12 <br>tst_test.c:1100: INFO: Timeo=
ut per run is 0h 05m 00s<br>move_pages12.c:251: INFO: Free RAM 30860672 kB<=
br>move_pages12.c:269: INFO: Increasing 2048kB hugepages pool on node 0 to =
4<br>move_pages12.c:279: INFO: Increasing 2048kB hugepages pool on node 1 t=
o 5<br>move_pages12.c:195: INFO: Allocating and freeing 4 hugepages on node=
 0<br>move_pages12.c:195: INFO: Allocating and freeing 4 hugepages on node =
1<br>move_pages12.c:185: PASS: Bug not reproduced<br>move_pages12.c:146: CO=
NF: Cannot allocate hugepage, memory too fragmented?<br><div class=3D"gmail=
_default" style=3D"font-size:small"></div></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Otherwise the patch looks good.<br></blockquote><div><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Thanks for review.</div></div>=
<div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000756c41058cd486e1--

--===============0604857600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0604857600==--
