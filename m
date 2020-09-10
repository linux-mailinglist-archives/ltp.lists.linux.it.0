Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 80660263E33
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 09:12:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 122D43C5275
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 09:12:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 392DE3C240A
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 09:12:32 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 79FA8600ECA
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 09:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599721949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jKqZhhvfM5yKAJxikaE55rWUE/VdAahmRaxmdap/CCc=;
 b=SNJowYfqJZLx3uC1S6/qMH4Nzno/0cWNxjzvbdZPYgKAr49FsaTLktSxVIwzX9vPF9k/+G
 WCmF472jcyfzVqWz3dUkMQZmsVPxWHEcJ3WvDH0cVl67suNTLMNM86IOWxvliUDzxUfEfI
 9ZzWPRCgEIgDrVANLeF4NeVTL9iXl30=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-XWdfm3RuNRG-ExVliJoA9g-1; Thu, 10 Sep 2020 03:12:26 -0400
X-MC-Unique: XWdfm3RuNRG-ExVliJoA9g-1
Received: by mail-yb1-f199.google.com with SMTP id u128so4585917ybg.17
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 00:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jKqZhhvfM5yKAJxikaE55rWUE/VdAahmRaxmdap/CCc=;
 b=X7bVK4K7FQK5bbEfNfoFPKEFI7Z3h23Wb7R+4VD0+QrKhUAeM0LP7eV++O09BV5ReD
 gDWWGtpA/i5gM2Id8TUt1QSLdNHbC7uEWT2qM7i4Vq+Hz0XTaAXb9xFoG4UgV07Lanba
 FttC129HzsthEXcAq0rezXBiS3bC8H45pbu5flBHfPzM95UC5TSv77fGDm1yxuFsXLe8
 2brRvBQwMJGYgxi3etkUUzvsOEqmD7jogyVTqu6cuOyyNrAvAE7UPDMA5o0k3I4VdbBF
 EgZlDwxYllY1kRFXWtV9GUOu8KVujw+DhUz1lpmgnXj1zSpnPXbsa7rSXP3bl4uCgwqJ
 e1sQ==
X-Gm-Message-State: AOAM530ufir8kOWduRCzd1GuVvx35rbN1meR03AhfQVDpsmL9kWpXBMa
 DQqWLwoRaGPeCzXSIMTiF0QMFlUkIMIBwv/icQC249WehfdMM/hYOSST83dSe/QzS1Kc32VV2Tk
 RimaUHlSD/JJAewdYFdlHiyJfqZg=
X-Received: by 2002:a25:2d59:: with SMTP id s25mr11484464ybe.86.1599721946303; 
 Thu, 10 Sep 2020 00:12:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsG8zj+Zs6oY6JsumwsmwPGg6LIoj/h+3irjGEejdcPgJiL+cJoTt/T3fobzs0NP5E3Sa7DCf6ru7kOvuIgBw=
X-Received: by 2002:a25:2d59:: with SMTP id s25mr11484437ybe.86.1599721945988; 
 Thu, 10 Sep 2020 00:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan>
 <CAEemH2cHvM_KD7W6fyX6z3bc0qfVtkp=yEM8MDvvohouyj5N2w@mail.gmail.com>
 <20200908153659.GA16066@yuki.lan>
 <CAEemH2eq0fwF8zt1uez5vuwM0vtrLtoFd_45sFqE=iQ8hpudfQ@mail.gmail.com>
 <CAEemH2es3sMSfAar8Xj4_Vr+2nsD0isPws4v=8=csLyYROAQGQ@mail.gmail.com>
 <20200909131327.GA3241@yuki.lan>
In-Reply-To: <20200909131327.GA3241@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 10 Sep 2020 15:12:14 +0800
Message-ID: <CAEemH2e7QZu3HeGfo2-+8jAOhVCatw7X+A4dEq_1PEasU3N1CQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1637642245=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1637642245==
Content-Type: multipart/alternative; boundary="000000000000549cff05aef04ad2"

--000000000000549cff05aef04ad2
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 9, 2020 at 9:13 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> > static void split_unmapped_plus_stack(void *start, size_t size)
> > {
> >     /* start           start + size
> >     * +---------------------+----------------------+-----------+
> >     * + unmapped            | mapped               | 256 pages |
> >     * +---------------------+----------------------+-----------+
> >     *                       stack
> >     */
>
> Shouldn't the 256 pages follow the unmapped part?
>

Yes, you're right. I made a mistake on draw that. Will fix in V4.


>
> If I'm not mistaken if stack grows down the address decreases with stack
> allocations, so it should be as:
>
> | 256 pages | unmapped | mapped |
>
>
> That would also mean that we should map the stack at address start +
> total_size - size if I'm not mistaken. I guess that we can put all the
> mess into a single function as well and have just allocate_stack() that
> will find a suitable address, mmap the stack together, splitting this
> into two functions is unnecessary confusing.
>

Good point, it makes sense to me.



>
> >     stack = SAFE_MMAP(start + size, size, PROT_READ | PROT_WRITE,
> >                              MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS |
> > MAP_GROWSDOWN,
> >                              -1, 0);
> > }
>
> Also I would like to get rid of the -fno-optimize-sibling-calls in the
> Makefile, this makes the test a bit fragile and less portable.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>
>

-- 
Regards,
Li Wang

--000000000000549cff05aef04ad2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 9, 2020 at 9:13 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span clas=
s=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; static void split_unmapped_plus_stack(void *start, size_t size)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
art + size<br>
&gt;=C2=A0 =C2=A0 =C2=A0* +---------------------+----------------------+---=
--------+<br>
&gt;=C2=A0 =C2=A0 =C2=A0* + unmapped=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | mapped=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 256 pa=
ges |<br>
&gt;=C2=A0 =C2=A0 =C2=A0* +---------------------+----------------------+---=
--------+<br>
&gt;=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stack<br>
&gt;=C2=A0 =C2=A0 =C2=A0*/<br>
<br>
Shouldn&#39;t the 256 pages follow the unmapped part?<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes, =
you&#39;re right. I made a mistake on draw that. Will fix in V4.</div></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If I&#39;m not mistaken if stack grows down the address decreases with stac=
k<br>
allocations, so it should be as:<br>
<br>
| 256 pages | unmapped | mapped |<br>
<br>
<br>
That would also mean that we should map the stack at address start +<br>
total_size - size if I&#39;m not mistaken. I guess that we can put all the<=
br>
mess into a single function as well and have just allocate_stack() that<br>
will find a suitable address, mmap the stack together, splitting this<br>
into two functions is unnecessary confusing.<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">Good point, it=
 makes sense to me.</div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0stack =3D SAFE_MMAP(start + size, size, PROT_READ |=
 PROT_WRITE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS =
|<br>
&gt; MAP_GROWSDOWN,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1, 0);<br>
&gt; }<br>
<br>
Also I would like to get rid of the -fno-optimize-sibling-calls in the<br>
Makefile, this makes the test a bit fragile and less portable.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000549cff05aef04ad2--


--===============1637642245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1637642245==--

