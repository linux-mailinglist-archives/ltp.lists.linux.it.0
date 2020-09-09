Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA5A262ACD
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 10:46:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B12933C2C27
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 10:46:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 73B143C262C
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 10:46:48 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id C681B6008D8
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 10:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599641206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3U3j0GKiv/C6QgFfQaUkV2N8yojiekpTCjhJOshM0vs=;
 b=Rbn9qYe3rBGhzGboAcEr4j9+cnzPTxDt5L+8vNswz6SvU1scU5n23fzi5gjobTy8f9gN/h
 +G+Vyt9JPBYeJJcaAcBC/GffFkENnvIQ2/Wg+CerYDlM3n3i9mVAacmOKk0iwbjhJBYzAB
 bpu6HikE9463rnjsIEb0us8b/S6yp30=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-6Wvhpq7RPLq8Tj7UJHGgJw-1; Wed, 09 Sep 2020 04:46:41 -0400
X-MC-Unique: 6Wvhpq7RPLq8Tj7UJHGgJw-1
Received: by mail-yb1-f200.google.com with SMTP id u128so1794477ybg.17
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 01:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jj4/IA1mP7H0ZdtCMys3HrkTMdl2w+fd32spEf/4znY=;
 b=uYnfXPHPqH+oQEr5Yw9nyq+9DTlWs6QNaF4XyW6mGssUAjzUF+uL2azTEAjalqTvZa
 lwgc9kBjfCSbbTd8yAq5kO/0SjemjiJANcBTptL80HIxh8ulS0rbyq0wF3N8viE+UyfK
 CfpFVPYboXBUiUGbwjVOiIaTm9RnhAPN4qTBmVGScZ+vx11WyJ/eUon/zeTZVMtibsuW
 z7rhUHSgdRFEx24kpzhy9u7UCEQBZqa2yyFBZQzo8I2Zh3XUKux8ypwf723/nfUCNpfT
 Q902fnW+myu+cBIcxSI9yAbDQN9F22vnMEhSNCnlC70nLk2Ipafdb8b5xh55fLU01GMs
 cUNg==
X-Gm-Message-State: AOAM532xB1gkgxT59hjJhf7ZtcMrl+SVkkQ+3uz3FtCzndC/nUAMR6XI
 EAZWtWZbW5Rm36MowefYiA0COSYHko7UiiFBw0S4kndRioUxJ6p6J/9UBvO3DyUOrkyXpt9tJoi
 FvoqBFcnIEvd+38iS2yxG5PxKZng=
X-Received: by 2002:a25:cc14:: with SMTP id l20mr4509468ybf.110.1599641201023; 
 Wed, 09 Sep 2020 01:46:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzckUdPP1+Zeu3uVyLDQbFYX6LnQJyi0Z/VAtE8+EMzYhEs0QVJvqggFf8ZwSal5+zL8zFP761awF9mzZej05k=
X-Received: by 2002:a25:cc14:: with SMTP id l20mr4509451ybf.110.1599641200827; 
 Wed, 09 Sep 2020 01:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan>
 <CAEemH2cHvM_KD7W6fyX6z3bc0qfVtkp=yEM8MDvvohouyj5N2w@mail.gmail.com>
 <20200908153659.GA16066@yuki.lan>
In-Reply-To: <20200908153659.GA16066@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 9 Sep 2020 16:46:29 +0800
Message-ID: <CAEemH2eq0fwF8zt1uez5vuwM0vtrLtoFd_45sFqE=iQ8hpudfQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: "Pravin Raghul S." <pravinraghul@zilogic.com>,
 LTP List <ltp@lists.linux.it>, "Vijay Kumar B." <vijaykumar@zilogic.com>
Content-Type: multipart/mixed; boundary="===============1828955096=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1828955096==
Content-Type: multipart/alternative; boundary="0000000000008b31ee05aedd7dd8"

--0000000000008b31ee05aedd7dd8
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 8, 2020 at 11:36 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > And I'd like to add the MAP_GROWSDOWN test too, but I haven't come up
> with
> > a way to solve the segment fault on s390x.
> > http://lists.linux.it/pipermail/ltp/2020-August/018416.html
>
> Maybe we end up allocating a mapping that is too close to something
> else, see:
>
>
> https://stackoverflow.com/questions/56888725/why-is-map-growsdown-mapping-does-not-grow
>
> I guess that we should make the initial mmap in find_free_range() larger
> and return and adress that is quaranteed not to have a mapping that is
> closer than 256 pages in the direction we want to grow.
>

Sounds reasonable. I tried to reserve more space for the mapping grows, and
that works for me:).

static void *find_free_range(size_t size)
{
    void *mem;

    /*
    * To avoid the mapping grows to within a page of the high end of
    * the next lower mapping, which might result in a SIGSEGV signal.
    * Here reserve twifold memory spaces for growing, especially for s390x.
    */
    mem = SAFE_MMAP(NULL, size * 2, PROT_READ | PROT_WRITE,
    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    SAFE_MUNMAP(mem, size * 2);

    return mem;
}

-- 
Regards,
Li Wang

--0000000000008b31ee05aedd7dd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Sep 8, 2020 at 11:36 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; And I&#39;d like to add the MAP_GROWSDOWN test too, but I haven&#39;t =
come up with<br>
&gt; a way to solve the segment fault on s390x.<br>
&gt; <a href=3D"http://lists.linux.it/pipermail/ltp/2020-August/018416.html=
" rel=3D"noreferrer" target=3D"_blank">http://lists.linux.it/pipermail/ltp/=
2020-August/018416.html</a><br>
<br>
Maybe we end up allocating a mapping that is too close to something<br>
else, see:<br>
<br>
<a href=3D"https://stackoverflow.com/questions/56888725/why-is-map-growsdow=
n-mapping-does-not-grow" rel=3D"noreferrer" target=3D"_blank">https://stack=
overflow.com/questions/56888725/why-is-map-growsdown-mapping-does-not-grow<=
/a><br>
<br>
I guess that we should make the initial mmap in find_free_range() larger<br=
>
and return and adress that is quaranteed not to have a mapping that is<br>
closer than 256 pages in the direction we want to grow.<br></blockquote><di=
v><br></div><div class=3D"gmail_default" style=3D"font-size:small">Sounds r=
easonable. I tried to reserve more space for the mapping grows, and that wo=
rks for me:). </div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div></div><div class=3D"gmail_default" style=3D"font-size:small">stat=
ic void *find_free_range(size_t size)</div>{<br>=09<span class=3D"gmail_def=
ault" style=3D"font-size:small">=C2=A0 =C2=A0 </span>void *mem;<br><br>=09<=
span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span=
>/*<br>=09 <span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =
=C2=A0 </span>* To avoid the mapping grows to within a page of the high end=
 of<br>=09 <span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =
=C2=A0 </span>* the next lower mapping, which might result in a SIGSEGV sig=
nal.<br>=09 <span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =
=C2=A0 </span>* Here reserve twifold memory spaces for growing, especially =
for s390x.<br>=09 <span class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 =C2=A0 </span>*/<br>=09<span class=3D"gmail_default" style=3D"font-s=
ize:small">=C2=A0 =C2=A0 </span>mem =3D SAFE_MMAP(NULL, size * 2, PROT_READ=
 | PROT_WRITE,<br>=09=09=09<span class=3D"gmail_default" style=3D"font-size=
:small">=C2=A0 =C2=A0 </span>MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);<br>=09<sp=
an class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>S=
AFE_MUNMAP(mem, size * 2);<br><br>=09<span class=3D"gmail_default" style=3D=
"font-size:small">=C2=A0 =C2=A0 </span>return mem;<br>}<br><div class=3D"gm=
ail_default" style=3D"font-size:small"></div><div><br></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--0000000000008b31ee05aedd7dd8--


--===============1828955096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1828955096==--

