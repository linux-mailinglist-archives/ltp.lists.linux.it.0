Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA3011A4BE
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 07:59:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 973673C1B17
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 07:59:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5D4683C17C4
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 07:59:53 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 714FF609689
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 07:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576047590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AhKwNLH1qVlY8ooVfGo4Dp/lC/5j08mTiWQugPtRYz4=;
 b=KjThj/uYhBRSbI7lH/m/9DxtYcbhJW85dFcCklDJuBPGkgwLnuzbJp+q6U9c67nZb1z2Ih
 GMulYOnXw0NhMyl9+rv8YdEZJsSPleKOVWgvw/ZIpgw6ocqiX8Hn8MBqGXkTziG8ZoztJQ
 LLKLYC3+AJ53SB5WIK6mv8I3z2SjbO8=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-U76N0XX8PS6EwwKMI0D9xQ-1; Wed, 11 Dec 2019 01:59:48 -0500
Received: by mail-oi1-f199.google.com with SMTP id r6so3255577oic.16
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 22:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o9ou7kuCzGB3yDerL2mlpYZ6x+abjsY8XEiUtClC7+E=;
 b=lMUijFxfyoW2dSu+/ek2MrqnSNUor7V18EJutxPVvsi0z4ppFICXdE+e86hhx0L95V
 f5H2+5ClUC7hXMLBnUH5UOCiDKVHrpTjZsQesyeUG+ydFmAivOFViUB5FxLnNhqWYmUg
 8e0WFvAW5Op6SZjd1Wo76y/x3Q1KZHCSpd79l5cbWOAiVX8lrDVlH2hpKeYU7NUuggmE
 IvKCcW/5C78yEQZ59g8474C58RQ/CP39xQTaBJEGEHjzDraHrOlWeQYBkRH+uoE29DCP
 oazDqHZBbwbavmJOmpAOfSqeEvgs/+FMuuUXyQqz0mw6VipNOFywpsVhJvumRa7MdKrd
 9xWw==
X-Gm-Message-State: APjAAAXC7y2rI7oUkULK/LUo2NSaitdvQrw/SEviO4QJa+YZF/G9m94L
 7NUtzjMM+FxpJxhcb4VP0bWTIo9AQ/om1d9FfoIajHKAVDcLFX5/8OK1zOLe3I44BlML2oxFXEh
 gV+FsGhOviZ0Q7S9DlaDwAY8KO5Y=
X-Received: by 2002:aca:aad8:: with SMTP id t207mr1506503oie.138.1576047588084; 
 Tue, 10 Dec 2019 22:59:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvdZthD+4zbgUKUcApIJam3gkKa1nxx2+dAXRfjKPGP/XYwLTQOx6t6z8sMWB/RPGZ7aA7+mihhQTeJaSazUA=
X-Received: by 2002:aca:aad8:: with SMTP id t207mr1506485oie.138.1576047587648; 
 Tue, 10 Dec 2019 22:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20191205103342.5980-1-liwang@redhat.com>
 <20191205115742.GA5693@rei.lan>
In-Reply-To: <20191205115742.GA5693@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 11 Dec 2019 14:59:36 +0800
Message-ID: <CAEemH2cq2WSFW=iEEOiDW4=ZiHyMNb0Dj2goaKSEVnj7wOM_fw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: U76N0XX8PS6EwwKMI0D9xQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: add .needs_hugepages to reserve
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
Content-Type: multipart/mixed; boundary="===============1808275264=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1808275264==
Content-Type: multipart/alternative; boundary="0000000000009c84640599682c0c"

--0000000000009c84640599682c0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2019 at 7:57 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> ...
> > +2.2.34 Reproducing race-conditions
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Can we please avoid renumbering the paragraphs, i.e. can you add the
> hugepages docs after this?
>

Yes, sure.


> ...
> > +/*
> > + * If system does not support hugetlb or failed to reserve the expecte=
d
> > + * number of hugepage, then this value will be set to 1.
> > + */
> > +extern unsigned int tst_no_hugepage;
>
> Hmm, this needs a bit more thoughts.
>
> So far all the needs_foo flags require the foo to be present on the
> system, i.e. are hard requirements. In this case hugepages are soft
> requirement, i.e. only part of the test will need that.
>
> We probably need a better name for this than needs_hugepages in
> tst_test. We may as well need a generic way how to describe that some of
> the requirements are hard and some of them are soft. I will give it some
> thoughts.
>

Your consideration is valuable. '.needs_hugepages' might fail to reserve
the expected page numbers on any kind of platform which with fragmental
memory, we'd better give an elegant way to handle that situation to make
our test can work well on the remaining part.


>
> At least we should just call it request_hugepages in the tst_test
> structure instead.
>

Ok, it's fine. Unless we can come up with a better.


> ...
> > +
> > +int tst_request_hugepages(int hpages)
> > +{
> > +     int val;
> > +     long mem_avail, max_hpages;
> > +
> > +     if (access(PATH_HUGEPAGES, F_OK)) {
> > +             tst_res(TCONF, "Huge page is not supported.");
> > +             tst_no_hugepage =3D 1;
>
> I guess that it will make more sense to call it tst_hugepages and set it
> to a number of hugepages that we were able to reserve. I.e. set it to 0
> here and to hpages at the end.
>

Agree, that sounds more useful in many situations.


> ...
> > +     if (tst_test->needs_hugepages) {
> > +             tst_sys_conf_save("?/proc/sys/vm/nr_hugepages");
>
> Can we call this from the tst_hugepage.c instead and only if we actually
> written to that file?
>

I will have a try then.


> > +             tst_request_hugepages(tst_test->needs_hugepages);
> > +     }
> > +
> >       setup_ipc();
> >
> >       if (tst_test->bufs)
> > @@ -1006,7 +1011,8 @@ static void do_cleanup(void)
> >               tst_rmdir();
> >       }
> >
> > -     if (tst_test->save_restore)
> > +     if (tst_test->save_restore ||
> > +             (tst_test->needs_hugepages && !tst_no_hugepage))
> >               tst_sys_conf_restore(0);
>
> We can call the tst_sys_conf_restore() unconditionally here, if nothing
> has been saved it's no-op.
>

Right!


>
> >       if (tst_test->restore_wallclock)
>
> Otherwise it looks good.
>

Thanks for these useful advises.

--=20
Regards,
Li Wang

--0000000000009c84640599682c0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Dec 5, 2019 at 7:57 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +2.2.34 Reproducing race-conditions<br>
&gt;=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
<br>
Can we please avoid renumbering the paragraphs, i.e. can you add the<br>
hugepages docs after this?<br></blockquote><div>=C2=A0</div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Yes, sure.</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +/*<br>
&gt; + * If system does not support hugetlb or failed to reserve the expect=
ed<br>
&gt; + * number of hugepage, then this value will be set to 1.<br>
&gt; + */<br>
&gt; +extern unsigned int tst_no_hugepage;<br>
<br>
Hmm, this needs a bit more thoughts.<br>
<br>
So far all the needs_foo flags require the foo to be present on the<br>
system, i.e. are hard requirements. In this case hugepages are soft<br>
requirement, i.e. only part of the test will need that.<br>
<br>
We probably need a better name for this than needs_hugepages in<br>
tst_test. We may as well need a generic way how to describe that some of<br=
>
the requirements are hard and some of them are soft. I will give it some<br=
>
thoughts.<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">Your consideration is valuable. &#39;.needs_hugep=
ages&#39; might fail to reserve the expected page numbers on any kind of pl=
atform which with fragmental memory, we&#39;d better give an elegant way to=
 handle that situation to make our test can work well on the remaining part=
.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
At least we should just call it request_hugepages in the tst_test<br>
structure instead.<br></blockquote><div>=C2=A0</div><div><div class=3D"gmai=
l_default" style=3D"font-size:small">Ok, it&#39;s fine. Unless we can come =
up with a better.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +<br>
&gt; +int tst_request_hugepages(int hpages)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0long mem_avail, max_hpages;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (access(PATH_HUGEPAGES, F_OK)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TCONF, &quot;=
Huge page is not supported.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_no_hugepage =3D 1=
;<br>
<br>
I guess that it will make more sense to call it tst_hugepages and set it<br=
>
to a number of hugepages that we were able to reserve. I.e. set it to 0<br>
here and to hpages at the end.<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Agree, that sounds more usef=
ul in many situations.=C2=A0</div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tst_test-&gt;needs_hugepages) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_sys_conf_save(&qu=
ot;?/proc/sys/vm/nr_hugepages&quot;);<br>
<br>
Can we call this from the tst_hugepage.c instead and only if we actually<br=
>
written to that file?<br></blockquote><div>=C2=A0</div><div><div class=3D"g=
mail_default" style=3D"font-size:small">I will have a try then.</div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_request_hugepages=
(tst_test-&gt;needs_hugepages);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0setup_ipc();<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_test-&gt;bufs)<br>
&gt; @@ -1006,7 +1011,8 @@ static void do_cleanup(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_rmdir();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (tst_test-&gt;save_restore)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tst_test-&gt;save_restore ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(tst_test-&gt;needs_h=
ugepages &amp;&amp; !tst_no_hugepage))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_sys_conf_res=
tore(0);<br>
<br>
We can call the tst_sys_conf_restore() unconditionally here, if nothing<br>
has been saved it&#39;s no-op.<br></blockquote><div>=C2=A0</div><div><span =
class=3D"gmail_default" style=3D"font-size:small">Right!</span></div><div><=
span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_test-&gt;restore_wallclock)<br>
<br>
Otherwise it looks good.<br>
</blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Thanks for these useful advises.</div></div><div><br></div>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br=
></div><div>Li Wang<br></div></div></div></div>

--0000000000009c84640599682c0c--


--===============1808275264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1808275264==--

