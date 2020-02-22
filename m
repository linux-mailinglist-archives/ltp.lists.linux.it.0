Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA094168C1F
	for <lists+linux-ltp@lfdr.de>; Sat, 22 Feb 2020 04:02:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B64D3C2683
	for <lists+linux-ltp@lfdr.de>; Sat, 22 Feb 2020 04:02:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7BC9F3C1CDA
 for <ltp@lists.linux.it>; Sat, 22 Feb 2020 04:02:45 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 10C711400B7D
 for <ltp@lists.linux.it>; Sat, 22 Feb 2020 04:02:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582340561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ljIuE4sSSg4LtTEsgbu5UNLBt9RXzaZY/oHgRAG2y+0=;
 b=cK67IopWroIphzkse5JzCQBq5zcfFXOLxGvCPPXrNvfss85ijezcLE/4p2QKGzWCqmN2x4
 TKWeYxpBZakYR8p1R8RD6Rpdni2OTbjqFanXiQKMCTEMjGEcsjZKgNjDF7JuRiW5VXci4v
 E0/1TWkgiDigH64eHHHxVj7xEWCoTwM=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-m3VOA4GANUiQ77Qt6BiTNA-1; Fri, 21 Feb 2020 22:02:38 -0500
X-MC-Unique: m3VOA4GANUiQ77Qt6BiTNA-1
Received: by mail-oi1-f198.google.com with SMTP id k6so1992835oij.8
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 19:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nHLug4RDDO4D9Qy1+QKLtXqZL4BEXb4jI1I5FffBQTk=;
 b=mh72FMznO3MUOjrH2SN/wJpo6sjGAf9n83QXWuVkfNlokKdHDqwP2GwpCrWZMgKi3R
 oC6NGmDDeTIrbq65Dph+scDnlKRxqk48RetzCC93LhW9qRJhRCftHiBYutFoUoBzi8yj
 o18F1pPScpaXmt0Ss9znPAmBlDrSGZyORvMyygxuXPeRR2f+J7r3JEBCyISTBZxL+A8U
 ab6yeMYf+74UST2xqiSYhu1rDknxp8o/vm4fJ8fOx0jsE0G6LZxVYIYCOV8KWENOX/ON
 JQTjtAEZ8U+1hSicCqXcjK+5CoReAFroZmybTQ1iHirTAoFUNMFeuUrsE++JS/JbdLjB
 E8rA==
X-Gm-Message-State: APjAAAUZVsmzflLHKeK5An54btQw7nPrPaAE9TzJhUWbxC2NuFvIwYmu
 Yqv6Qg3ydWeyIKEEzMJs9h5YdjT1y0StM3PsKmmIDC73EmzOH0MXmEKv8Nvy4KSmjIoO+3QyvcO
 ydAuMAX7Xejxdtts+KJ8OHqVAd9Q=
X-Received: by 2002:aca:4b0f:: with SMTP id y15mr4408149oia.153.1582340557868; 
 Fri, 21 Feb 2020 19:02:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUj8QgFlCdg9rMeWcxs4u55cNWNmVg3S9zj3k2NvvENygly+W8hlPOC55go+EXei+uXAGmjH/albHHQP20hz8=
X-Received: by 2002:aca:4b0f:: with SMTP id y15mr4408133oia.153.1582340557630; 
 Fri, 21 Feb 2020 19:02:37 -0800 (PST)
MIME-Version: 1.0
References: <20200208092014.24824-1-liwang@redhat.com>
 <20200218162739.GA9985@rei.lan> <20200221121618.GA16421@dell5510>
In-Reply-To: <20200221121618.GA16421@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Sat, 22 Feb 2020 11:02:26 +0800
Message-ID: <CAEemH2ftLanZppq4kiVCK7JuRvCh+xX4GG9--GKrOQ8j8c2idw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] lib: add .request_hugepages to reserve
 hugepage
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
Content-Type: multipart/mixed; boundary="===============1341395290=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1341395290==
Content-Type: multipart/alternative; boundary="000000000000da109f059f215e49"

--000000000000da109f059f215e49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 8:16 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li, Cyril,
>
> > > +   if (FILE_LINES_SCANF("/proc/meminfo",
> > > +                           "MemAvailable: %ld", &mem_avail)) {
> > > +           /*
> > > +            * Using "MemFree:" on kernel that doesn't have
> > > +            * "MemAvailable:" in Meminfo
> > > +            */
> > > +           tst_res(TINFO, "MemAvailable: not found in /proc/meminfo"=
);
> > > +
> > > +           mem_avail =3D SAFE_READ_MEMINFO("MemFree:");
> > > +   }
>
> > I guess that we don't have to bother with MemAvailable here, since we d=
o
> > drop the system caches the MemFree should be equal to MemAvailable. So =
I
> > would be for reading just MemFree unconditionally here.
>
> > If you agree with this change I can change it before applying.
>
> Merged both patches with this change and my docs change.
>

Thanks very much Petr. Btw, I added a commit to remove the surplus variable
'mem_avail'.(It's a tiny issue so I pushed directly:)

--=20
Regards,
Li Wang

--000000000000da109f059f215e49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Feb 21, 2020 at 8:16 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Li, Cyril,<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0if (FILE_LINES_SCANF(&quot;/proc/meminfo&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;MemAvailable: %ld&quot;, &amp;mem_a=
vail)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Using &quot;MemFree:=
&quot; on kernel that doesn&#39;t have<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * &quot;MemAvailable:&=
quot; in Meminfo<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Me=
mAvailable: not found in /proc/meminfo&quot;);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem_avail =3D SAFE_READ=
_MEMINFO(&quot;MemFree:&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
<br>
&gt; I guess that we don&#39;t have to bother with MemAvailable here, since=
 we do<br>
&gt; drop the system caches the MemFree should be equal to MemAvailable. So=
 I<br>
&gt; would be for reading just MemFree unconditionally here.<br>
<br>
&gt; If you agree with this change I can change it before applying.<br>
<br>
Merged both patches with this change and my docs change.<br></blockquote><d=
iv><br></div><div class=3D"gmail_default" style=3D"font-size:small">Thanks =
very much Petr. Btw, I added a commit to remove the surplus variable &#39;m=
em_avail&#39;.(It&#39;s a tiny issue so I pushed directly:)</div></div><div=
><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000da109f059f215e49--


--===============1341395290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1341395290==--

