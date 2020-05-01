Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C761C3491
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:36:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A44123C26A7
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:36:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C6F043C5E07
 for <ltp@lists.linux.it>; Fri,  1 May 2020 11:47:07 +0200 (CEST)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 70133601634
 for <ltp@lists.linux.it>; Fri,  1 May 2020 11:47:06 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id u16so5766663wmc.5
 for <ltp@lists.linux.it>; Fri, 01 May 2020 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r/LjebcBkvhMXw1x6G27fd6e0muMBawzUxXgVwjrdDM=;
 b=FuS2tsLLQ6MfvjK4eDWTkoUSfxhBFin2zrl1V8caaufAVUtBEfCTBLOeEDPw9++c97
 24VUagJy+oOwbX4lvyHg6Vh96MAL4TMcaZ5gRC9sydZo3RxqU+pJbpE3JMytRXgZdZUp
 M28k0EJbX8oQMm575aSkg7Df2Jm6SF2AZKL7cOZlJSnmqkT49XNAVR1lqCoBUZ8ZMAwm
 d2+FDjdTl9NIdk6wldN3ESohenwQ3r1fCO7htXIrHHI+2iWiJBfrzlVnLQ65xNhtlMUa
 H4HW78tP2Vo8YvxjGpwtM10N7GGyrLXfc3MsHJ5xlhUP46miTaJb0VQOAMf5asnNk2BP
 MzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/LjebcBkvhMXw1x6G27fd6e0muMBawzUxXgVwjrdDM=;
 b=qWbo+a6Jbgif44ezdbTcPZXA14G23s8IODt9Np4YX1GJxnHoa9kBS+GqzAqRaGQh/1
 fKSvSm2oUADlNrsKLXS9yf5Vnw58M8BL8HfW3dz5TbNWP3qFQsfdZIWoWJoVBgHse9SX
 vBtOwQpAYaxgvxdkN+6rghr9YTusUP4onDOCKGlZy/7y3fh6QBin0Z/OcKU3wcyTrMAn
 2RZ1W0wyPooxDDN7SWnuq6/f5390ZupaPvo1gGcBDYeOeWJ0/tTgkUwdn1lddiCVZ1Ko
 WAViNQmn/fydPDFTwWKkgANh8jaeBitw3pelSrzgGLhfg95DiFdv8zKPMU8S+PYCGavo
 tjOQ==
X-Gm-Message-State: AGi0PuZSe/bBm9H1uRdL0OU6xWMEX1wYyIxN+a8dB1LhChhHlsum5k/z
 yLCp2zLZgUt/UTcrt2pUm170iwB3+CL6ZGfusGt6
X-Google-Smtp-Source: APiQypJ7sf+nFldSSbTJl6KP5kDVTKwrbjVoiAZjTqMdVX9+UpLPoHmN/ruxcUWkLRfSDW9xfcXi0PccCz7LpBnCMOw=
X-Received: by 2002:a1c:2457:: with SMTP id k84mr2990029wmk.96.1588326425942; 
 Fri, 01 May 2020 02:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-2-amir73il@gmail.com>
 <20200501071740.GA2217@morpheus.bobrowski.net>
 <CAOQ4uxi3mKYH68oWZmqJ7NMs2SgGirYx=pnBQ3UD-0LkHjRw3A@mail.gmail.com>
In-Reply-To: <CAOQ4uxi3mKYH68oWZmqJ7NMs2SgGirYx=pnBQ3UD-0LkHjRw3A@mail.gmail.com>
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
Date: Fri, 1 May 2020 19:46:55 +1000
Message-ID: <CAC0goKdzHxxobDuhp1z=xVtDgv0Ry_YS6WU9vBrEsyioe05dnQ@mail.gmail.com>
To: Amir Goldstein <amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 04 May 2020 10:36:17 +0200
Subject: Re: [LTP] [PATCH 1/4] syscalls/fanotify09: Check merging of events
 on directories
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1341723516=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1341723516==
Content-Type: multipart/alternative; boundary="00000000000067fd6f05a493100e"

--00000000000067fd6f05a493100e
Content-Type: text/plain; charset="UTF-8"

Ah, right.

I'll finish off the review tomorrow when I have some more time.

Chat then!

/M

On Fri, 1 May 2020, 7:05 pm Amir Goldstein, <amir73il@gmail.com> wrote:

> On Fri, May 1, 2020 at 10:17 AM Matthew Bobrowski
> <mbobrowski@mbobrowski.org> wrote:
> >
> > On Tue, Apr 21, 2020 at 09:49:59AM +0300, Amir Goldstein wrote:
> > > +static void event_res(int ttype, int group,
> > > +                   struct fanotify_event_metadata *event)
> > > +{
> > > +     int len;
> > > +     sprintf(symlnk, "/proc/self/fd/%d", event->fd);
> > > +     len = readlink(symlnk, fdpath, sizeof(fdpath));
> > > +     if (len < 0)
> > > +             len = 0;
> > > +     fdpath[len] = 0;
> > > +     tst_res(ttype, "group %d got event: mask %llx pid=%u fd=%d
> path=%s",
> > > +             group, (unsigned long long)event->mask,
> > > +             (unsigned)event->pid, event->fd, fdpath);
> > > +}
> >
> > Nice helper, although it would be nice not to see all these statements
> > clunked together like this.
> >
> > > -      * generate FAN_CLOSE_NOWRITE event on a child subdir.
> > > +      * generate FAN_CLOSE_NOWRITE event on a testdir (subdir or ".")
> >            ^ s/g/G :P
> >
> > Reviewed-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>
> >
>
> Thanks for the review Matthew, but this patch has already been merged,
> so those cleanups could be done at a later time.
> I will address you comments to fanotify15 and fanotify16, which are
> still not merged, when you are done with review.
>
> Thanks,
> Amir.
>

--00000000000067fd6f05a493100e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Ah, right.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I&#39;ll finish off the review tomorrow when I have some more=C2=
=A0time.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Chat then=
!<br><br><div data-smartmail=3D"gmail_signature" dir=3D"auto">/M</div><br><=
div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, 1 May 2020, 7:05 pm Amir Goldstein, &lt;<a href=3D"mailto:amir73i=
l@gmail.com">amir73il@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Fri, May 1, 2020 at 10:17 AM Matthew Bobrowski<br>
&lt;<a href=3D"mailto:mbobrowski@mbobrowski.org" target=3D"_blank" rel=3D"n=
oreferrer">mbobrowski@mbobrowski.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Apr 21, 2020 at 09:49:59AM +0300, Amir Goldstein wrote:<br>
&gt; &gt; +static void event_res(int ttype, int group,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct fanotify_event_metadata *event)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int len;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0sprintf(symlnk, &quot;/proc/self/fd/%d&quot;=
, event-&gt;fd);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0len =3D readlink(symlnk, fdpath, sizeof(fdpa=
th));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (len &lt; 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0fdpath[len] =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0tst_res(ttype, &quot;group %d got event: mas=
k %llx pid=3D%u fd=3D%d path=3D%s&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0group, (unsigned=
 long long)event-&gt;mask,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned)event-=
&gt;pid, event-&gt;fd, fdpath);<br>
&gt; &gt; +}<br>
&gt;<br>
&gt; Nice helper, although it would be nice not to see all these statements=
<br>
&gt; clunked together like this.<br>
&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 * generate FAN_CLOSE_NOWRITE event on a chi=
ld subdir.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * generate FAN_CLOSE_NOWRITE event on a tes=
tdir (subdir or &quot;.&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ s/g/G :P<br>
&gt;<br>
&gt; Reviewed-by: Matthew Bobrowski &lt;<a href=3D"mailto:mbobrowski@mbobro=
wski.org" target=3D"_blank" rel=3D"noreferrer">mbobrowski@mbobrowski.org</a=
>&gt;<br>
&gt;<br>
<br>
Thanks for the review Matthew, but this patch has already been merged,<br>
so those cleanups could be done at a later time.<br>
I will address you comments to fanotify15 and fanotify16, which are<br>
still not merged, when you are done with review.<br>
<br>
Thanks,<br>
Amir.<br>
</blockquote></div></div></div>

--00000000000067fd6f05a493100e--

--===============1341723516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1341723516==--
