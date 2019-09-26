Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3887BEFB6
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87DE63C22C8
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 780F03C240D
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:33:57 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 20899201296
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 10:35:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569486933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p/S/9AsIx/FPv7iMsTqgrEdx8fo+7IEbKzF3RYWsX8w=;
 b=dsVfnlqtM5+iezEe79+iT3+tDKcRWSQ6+IeiAyPnJEDauQawIhV/oUUz/jPnZ/jAYvboPf
 STmmxx+ogzSIygOVMkeSxUcDEWvjF2PJPdEmEf32o5tB5ubDr7jA796PNMag7uRzhdUgWr
 hWrI1+jwVuokf0YmVFB4xERNOAkGe2Q=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-udTHIT0rNxqLKYxzU5oG8g-1; Thu, 26 Sep 2019 04:35:31 -0400
Received: by mail-ot1-f71.google.com with SMTP id d12so855617ote.0
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 01:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3//l2z4+jr8GT6mRGxxS29CiZjw0iRX3pc0uwln7ZnA=;
 b=kVSfyxiMbc9N27S0I/boW2ArfGnF3w0+j3X+35X00Y/2ypgnIVYdVRpqEKlZ/Ht35i
 Y11nwOURINDt5ONF8bROFjdyKvAeQm3ezlXotq99bdHK7jUybieVIMbHNhRFSI8/TYnY
 4JIykda7FH1ugrdeGRGG6YbH1VLuNq4ykR3U6A48dgF3D8BBSOeZyAvvFhqtqZXF7kbm
 H4bCT/BcXFRsgD3I/zr4vwx3DU9BBtuLMg1ODxjY5WCH5Vdv7BWza2Hdd34DyWrP3j/g
 4TG5Rev384b8AdLLAdKaxEt/AXciQyCei6vevYm/5kPyZj63+nNJnGf4CR99sbNk1BC7
 CSiw==
X-Gm-Message-State: APjAAAUZXJGLH876y+MSVYgvXa57nwUEN7KESCzKVbxgp5l+HFFSJIUE
 BWzYb/3ZHSg0BUfUBRl6CzQG4HqthsHRTcTDHfho3PH2HIVAkfSZXhWt5XktNNekVQDsElJyiIM
 yk09/LdJybrZEihMiS1s5fb/gbes=
X-Received: by 2002:a9d:7841:: with SMTP id c1mr1717527otm.264.1569486930859; 
 Thu, 26 Sep 2019 01:35:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqtyVnS4/k8vneB8ALz7JYtl3Wc4DwxDZSw5EETOfUvKyoLQqU3V65N5LO5FVeLM8n8ELS2IAXkdzEOBDVkl0=
X-Received: by 2002:a9d:7841:: with SMTP id c1mr1717501otm.264.1569486930550; 
 Thu, 26 Sep 2019 01:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190808054513.31041-1-liwang@redhat.com>
 <87a7arxznf.fsf@rpws.prws.suse.cz>
In-Reply-To: <87a7arxznf.fsf@rpws.prws.suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 26 Sep 2019 16:35:19 +0800
Message-ID: <CAEemH2d=KXmeGs+LVjUph2sgxVhkhVC3sAReyDuLkFNpqd64UQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
X-MC-Unique: udTHIT0rNxqLKYxzU5oG8g-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] move_pages12: handle errno EBUSY for
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
Cc: Michal Hocko <mhocko@suse.cz>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 LTP List <ltp@lists.linux.it>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: multipart/mixed; boundary="===============0870256095=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0870256095==
Content-Type: multipart/alternative; boundary="000000000000f9c25d059370a628"

--000000000000f9c25d059370a628
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 3:52 PM Richard Palethorpe <rpalethorpe@suse.de>
wrote:

> Hello,
>
> Li Wang <liwang@redhat.com> writes:
>
> > The test#2 is going to simulate the race condition, where move_pages()
> > and soft offline are called on a single hugetlb page concurrently. But,
> > it return EBUSY and report FAIL in soft-offline a moving hugepage as a
> > result sometimes.
> >
> > The root cause seems a call to page_huge_active return false, then the
> > soft offline action will failed to isolate hugepage with EBUSY return a=
s
> > below call trace:
> >
> > In Parent:
> >   madvise(..., MADV_SOFT_OFFLINE)
> >   ...
> >     soft_offline_page
> >       soft_offline_in_use_page
> >         soft_offline_huge_page
> >           isolate_huge_page
> >             page_huge_active
> >              # return false at here
> >
> > In Child:
> >   move_pages()
> >   ...
> >     do_move_pages
> >       do_move_pages_to_node
> >         add_page_for_migration
> >           isolate_huge_page
> >             # it has already isolated the hugepage
> >
> > In this patch, I simply regard the returned EBUSY as a normal situation
> and
> > mask it in error handler. Because move_pages is calling
> add_page_for_migration
> > to isolate hugepage before do migration, so that's very possible to hit
> the
> > collision and return EBUSY on the same page.
>
> We also get EIO (on aarch64) and ENOMEM (on x86). From looking at
> migrate_pages, this seems normal, although the behaviour on older kernels
> is different to newer ones.
>
> On OpenSUSE with kernel 5.2 the test completes without any problem, but
> on SLES kernel 5.12 we get the other error codes.
>

Can you help to check if these commits have been backported to SLEL
kernel-5.12?
    commit e66f17ff71772b209eed39de35aaa99ba819c93d
    commit c9d398fa237882ea07167e23bcfc5e6847066518
    commit 4643d67e8cb0b3536ef0ab5cddd1cedc73fa14ad

The move_pages12 test actually found three regression BUG which has all
been fixed in the mainline kernel so far.


> TBH I'm not sure what we are testing when checking the return value of
> MADV_SOFT_OFFLINE? The bug is not reproduced if madvise always fails, so
> the test should pass right?
>

The return value checking of MADV_SOFT_OFFLINE are two:
    EINVAL - To make sure system support MADV_SOFT_OFFLINE
    EBUSY -  To make ignore the defect(EBUSY when soft-offlining hugepage)
designed by the kernel

The madvise(MADV_SOFT_OFFLINE) should not always fail, it might get failure
occasionally on EBUSY(ignored already), but exit with TCONF if hit EINVAL.

@MIke & @Naoyo, If I was wrong please correct me.

--=20
Regards,
Li Wang

--000000000000f9c25d059370a628
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 26, 2019 at 3:52 PM Richard Palethorpe =
&lt;<a href=3D"mailto:rpalethorpe@suse.de" target=3D"_blank">rpalethorpe@su=
se.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hello,<br>
<br>
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt; The test#2 is going to simulate the race condition, where move_pages()=
<br>
&gt; and soft offline are called on a single hugetlb page concurrently. But=
,<br>
&gt; it return EBUSY and report FAIL in soft-offline a moving hugepage as a=
<br>
&gt; result sometimes.<br>
&gt;<br>
&gt; The root cause seems a call to page_huge_active return false, then the=
<br>
&gt; soft offline action will failed to isolate hugepage with EBUSY return =
as<br>
&gt; below call trace:<br>
&gt;<br>
&gt; In Parent:<br>
&gt;=C2=A0 =C2=A0madvise(..., MADV_SOFT_OFFLINE)<br>
&gt;=C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0soft_offline_page<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0soft_offline_in_use_page<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0soft_offline_huge_page<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isolate_huge_page<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_huge_active<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # return false at here=
<br>
&gt;<br>
&gt; In Child:<br>
&gt;=C2=A0 =C2=A0move_pages()<br>
&gt;=C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0do_move_pages<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do_move_pages_to_node<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_page_for_migration<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isolate_huge_page<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# it has already isolat=
ed the hugepage<br>
&gt;<br>
&gt; In this patch, I simply regard the returned EBUSY as a normal situatio=
n and<br>
&gt; mask it in error handler. Because move_pages is calling add_page_for_m=
igration<br>
&gt; to isolate hugepage before do migration, so that&#39;s very possible t=
o hit the<br>
&gt; collision and return EBUSY on the same page.<br>
<br>
We also get EIO (on aarch64) and ENOMEM (on x86). From looking at<br>
migrate_pages, this seems normal, although the behaviour on older kernels<b=
r>
is different to newer ones.<br>
<br>
On OpenSUSE with kernel 5.2 the test completes without any problem, but<br>
on SLES kernel 5.12 we get the other error codes.<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">Can you h=
elp to check if these commits have been backported to SLEL kernel-5.12?</di=
v><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 comm=
it e66f17ff71772b209eed39de35aaa99ba819c93d</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">=C2=A0 =C2=A0 commit c9d398fa237882ea07167e23b=
cfc5e6847066518</div><div class=3D"gmail_default" style=3D"font-size:small"=
>=C2=A0 =C2=A0 commit 4643d67e8cb0b3536ef0ab5cddd1cedc73fa14ad</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">The move_pages12 test actually found =
three regression BUG which has all been fixed in the mainline kernel so far=
.</div></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
TBH I&#39;m not sure what we are testing when checking the return value of<=
br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>MADV_SOFT_OF=
FLINE? The bug is not reproduced if madvise always fails, so<br>
the test should pass right?<br></blockquote><div>=C2=A0</div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">The return value checking of=
=C2=A0<span class=3D"gmail_default"></span>MADV_SOFT_OFFLINE are two:</div>=
<div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 EINVAL=
 - To make sure system support=C2=A0<span class=3D"gmail_default"></span>MA=
DV_SOFT_OFFLINE<br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">=C2=A0 =C2=A0 EBUSY -=C2=A0 To make ignore the defect(EBUSY when soft-=
offlining hugepage) designed by the kernel</div></div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">The madvise(MADV_SOFT_OFFLINE)=C2=A0should not alwa=
ys fail, it might get failure occasionally on EBUSY(ignored already), but e=
xit with TCONF if hit EINVAL.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">@MIke &amp; @Naoyo, If I was wrong please correct me.</div></div><div>=
<br></div>-- <br><div dir=3D"ltr" class=3D"m_-992398280566816610m_-46741879=
73698281157m_4453656924332093744gmail_signature"><div dir=3D"ltr"><div>Rega=
rds,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000f9c25d059370a628--


--===============0870256095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0870256095==--

