Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 983912FCD8A
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 10:44:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C4993C5DBE
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 10:44:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3B8673C53D7
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 10:44:47 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 97FF46000EA
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 10:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611135885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KolI9Iu/kHKvJ8RAG5WuBpr1xk3FTpU+/+rb85ITseY=;
 b=UKTOLaCjRn+WYFOvoKpJlxJrsPFoZRrdh3Gx6cdjxlT332Ev3fWqj+HLNy2NjfmvoEm5Ev
 7Mzavd2ef5XF8gtGjGMuomL5pa3uuQupnOcshTAQt1pyLnCBw6OTfNyMq0/+FeblnUmJfm
 gVJa3/ghD4PdMWiILsusCDYdGm+0kU0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-jOc_9n0dPsCMKHHKB8aPuw-1; Wed, 20 Jan 2021 04:44:42 -0500
X-MC-Unique: jOc_9n0dPsCMKHHKB8aPuw-1
Received: by mail-yb1-f200.google.com with SMTP id e74so29710137ybh.19
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 01:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KolI9Iu/kHKvJ8RAG5WuBpr1xk3FTpU+/+rb85ITseY=;
 b=NYw0Zjf7ADl4hq3ReOp9R0OF5BuahiPiD7odJXU+lof2FP7+2New+VvAVWzLkw0lTC
 bYnw+Np9Bq2wJ5KM9Ggkt5ctK3X42wOAxKRMlaB3HY2MCCISkv3Va9tHdhu7CZXF5pK7
 CKH5o8sTvv6d1fDu2Wg4pD3Z/vNhff7eDwdtMF8liJBl4HA7kRupAeJuHiWOKVKGsNkv
 qXJ+EJ1fL+M58UKf+th3S3ZVGxPPScrLIEKWRGYzq4QWpIDbay4jQntEyY+/8PyvXwe8
 oIPfvFBzuSH/Wb3zxInCOqToel5yV4AcGl9sXdOZLeUjNMSR9bxaKfGGetIyNHtdpvZM
 +xkA==
X-Gm-Message-State: AOAM5307gARoRH6r+QMB2I9pYcoOPYIXa7Jfk6vMcKm+3wiMtW5xDQl+
 Pzvav02+tBwIlba9eFCvGLNpHRNn2uwdvFFQUAy6hZHeEj2t6Gh7b92dsz6OBR8JjdU/rOvgN9e
 ADdgfM1t1CXCAk5VvJCMRJIDfI9U=
X-Received: by 2002:a25:1241:: with SMTP id 62mr12867845ybs.366.1611135882116; 
 Wed, 20 Jan 2021 01:44:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv+6Iu1Mt8u6t2OWN7fIKVDhT7ljI85sFYE/uMTyX+ysT/kKxlLo3CIrHVhK4WIQT45wnrAGjiAzGUdUcuU+0=
X-Received: by 2002:a25:1241:: with SMTP id 62mr12867826ybs.366.1611135881904; 
 Wed, 20 Jan 2021 01:44:41 -0800 (PST)
MIME-Version: 1.0
References: <20201216100121.16683-1-rpalethorpe@suse.com>
 <20201216100121.16683-3-rpalethorpe@suse.com>
 <CAEemH2ddomP4XO=61vNx5=3vQYNj4WOurUX2zcuC-46RxhMk0g@mail.gmail.com>
 <87eej1dpgm.fsf@suse.de>
 <CAEemH2diKwkvjZ=20+MGpNJsWzM3OskDbcyuY7MH3tEsGV4U=Q@mail.gmail.com>
 <87eeihp1gx.fsf@suse.de>
In-Reply-To: <87eeihp1gx.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 20 Jan 2021 17:44:30 +0800
Message-ID: <CAEemH2ddvRZ5YjvGkAbR8rmPfgEHv8O5Q+zFch_2pk0+0avrHw@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/5] CGroup API rewrite
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
Content-Type: multipart/mixed; boundary="===============0210209098=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0210209098==
Content-Type: multipart/alternative; boundary="000000000000ed1afb05b951cd4b"

--000000000000ed1afb05b951cd4b
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Richard Palethorpe <rpalethorpe@suse.de> wrote:

> ...
> >> > As I was mentioned in 0/5 that maybe we should create test_cgroup_dir
> >> > for different progress so that the test could use the same controller
> >> with
> >> > various configurations in parallel.
> >> >
> >> > e.g. child_1 set SIZE to memory.limit_in_bytes
> >> >        child_2 set SIZE/2 to memory.limit_in_bytes
> >> >
> >> > Any possibility to move this to tst_cgroup_move_current?
> >>
> >> Yes I suppose we can try this. Is there a test which already requires
> it?
> >>
> >
> > So far we don't have such a test, I remember that in the previous Lib is
> > also to keep expandability.
>
> I think we have at least two problems:
>
> 1) This allows many CGroups to be created for each test and we must
>    clean them up, adding some complication.
>
> 2) It's not clear if a future test will require the CGroup hierarchy to
>    be the same as the process hierarchy or different. Depending what
>    behaviour for tst_cgroup_move_current we choose it will make some
>    configurations impossible.
>
> So if we add this then it will add complexity, but I am not sure it will
> help in the future. If we make it flexible enough to support any
> hierarchy this will add a lot of complication.
>

Okay. I do NOT insist to implement a future feature at this early
moment, but do u think we'd better mention this in documents?
To let people(avoid abusing it) know that the current CGroup lib
hasn't supported children using the same controller in parallel?

And another new query is, do we really need to export many
cleanup-levels to users? I guess we can handle it in the library
with intelligently choose levels no matter in parallel or sequential.

i.e. As now only one directory(test-pid/) created for one test in a
hierarchy, how about going with TST_CGROUP_CLEANUP_ROOT
level by default, unless it detects more or equal to two directories
(that probably means parallel) goes TST_CGROUP_CLEANUP_TEST?


>
> Also if we did need this feature in the future, then we can add some new
> functions which take a sub-group (or hierarchy) parameter. e.g.
>
> void tst_cgroup_move(enum tst_cgroup_ctrl type, pid_t pid,
>                      struct tst_cgroup_tree *path);
>

Sounds good to me.


>
> Alternate versions of other functions would also need to be added. Also
> some changes to the internal data structures may be needed. However it
> would keep the current API functions simple.
>
> So until we have a test which requires this, I think the best option is
> to do nothing :-)
>
> --
> Thank you,
> Richard.
>
>

-- 
Regards,
Li Wang

--000000000000ed1afb05b951cd4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.=
de" target=3D"_blank">rpalethorpe@suse.de</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" styl=
e=3D"font-size:small">...</span><br>
&gt;&gt; &gt; As I was mentioned in 0/5 that maybe we should create test_cg=
roup_dir<br>
&gt;&gt; &gt; for different progress so that the test could use the same co=
ntroller<br>
&gt;&gt; with<br>
&gt;&gt; &gt; various configurations in parallel.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; e.g. child_1 set SIZE to memory.limit_in_bytes<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 child_2 set SIZE/2 to memory.limit=
_in_bytes<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Any possibility to move this to tst_cgroup_move_current?<br>
&gt;&gt;<br>
&gt;&gt; Yes I suppose we can try this. Is there a test which already requi=
res it?<br>
&gt;&gt;<br>
&gt;<br>
&gt; So far we don&#39;t have such a test, I remember that in the previous =
Lib is<br>
&gt; also to keep expandability.<br>
<br>
I think we have at least two problems:<br>
<br>
1) This allows many CGroups to be created for each test and we must<br>
=C2=A0 =C2=A0clean them up, adding some complication.<br>
<br>
2) It&#39;s not clear if a future test will require the CGroup hierarchy to=
<br>
=C2=A0 =C2=A0be the same as the process hierarchy or different. Depending w=
hat<br>
=C2=A0 =C2=A0behaviour for tst_cgroup_move_current we choose it will make s=
ome<br>
=C2=A0 =C2=A0configurations impossible.<br>
<br>
So if we add this then it will add complexity, but I am not sure it will<br=
>
help in the future. If we make it flexible enough to support any<br>
hierarchy this will add a lot of complication.<br></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">Okay. I do N=
OT insist=C2=A0to implement a future feature at this early</div><div class=
=3D"gmail_default" style=3D"font-size:small">moment, but do u think we&#39;=
d better mention this in documents?=C2=A0</div><div class=3D"gmail_default"=
 style=3D"font-size:small">To let people(avoid abusing it) know that the cu=
rrent CGroup lib</div><div class=3D"gmail_default" style=3D"font-size:small=
">hasn&#39;t supported children using the same controller in parallel?</div=
></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">And another new query i=
s, do we really need to export many</div><div class=3D"gmail_default" style=
=3D"font-size:small">cleanup-levels to users? I guess we can handle it in t=
he library</div><div class=3D"gmail_default" style=3D"font-size:small">with=
 intelligently choose levels no matter in parallel or sequential.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">i.e. As now only one directory(tes=
t-pid/) created for one test in a</div><div class=3D"gmail_default" style=
=3D"font-size:small">hierarchy, how about going with TST_CGROUP_CLEANUP_ROO=
T</div><div class=3D"gmail_default" style=3D"font-size:small">level by defa=
ult, unless it detects more or equal to two directories</div><div class=3D"=
gmail_default" style=3D"font-size:small">(that probably means parallel) goe=
s TST_CGROUP_CLEANUP_TEST?</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Also if we did need this feature in the future, then we can add some new<br=
>
functions which take a sub-group (or hierarchy) parameter. e.g.<br>
<br>
void tst_cgroup_move(enum tst_cgroup_ctrl type, pid_t pid,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct tst_cgroup_tree *path);<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Sounds good to me.</div><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alternate versions of other functions would also need to be added. Also<br>
some changes to the internal data structures may be needed. However it<br>
would keep the current API functions simple.<br>
<br>
So until we have a test which requires this, I think the best option is<br>
to do nothing :-)<br>
<br>
-- <br>
Thank you,<br>
Richard.<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000ed1afb05b951cd4b--


--===============0210209098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0210209098==--

