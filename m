Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0125549F
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 08:41:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4CEB3C2E49
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 08:41:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 789033C1CDD
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 08:41:12 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9CEE2140118F
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 08:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598596870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sKZNQRlkezazXz9fWdAXB87tyxJhzyMQtoYJn/87lJs=;
 b=cscek8EAMr7NKP7sK8fpbDDmDVj7V82LaHLCr9R0ATw7Gcs3FKJHr1WHQH/+FJB58tzb+w
 zlvSD9LAZUw41wfWsZLTQq5K56wJvEmmqFP2w2ssGPgLf+ElHzmFG+vZUsYD1E5TSj+fI7
 D9XP61049BOn5wigYCso8CgXCLvMBd8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-wcFXaq8NNkiEQVSfjiD7fA-1; Fri, 28 Aug 2020 02:41:05 -0400
X-MC-Unique: wcFXaq8NNkiEQVSfjiD7fA-1
Received: by mail-yb1-f198.google.com with SMTP id q2so337630ybo.5
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 23:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sKZNQRlkezazXz9fWdAXB87tyxJhzyMQtoYJn/87lJs=;
 b=aOw/swbY1PzmPbAXPVnuTQGCyN5kv+e5HrMT0CRFe1qTuyJ3Fyn7OZsPJoIBmeJwZy
 ilM9f81MnKdcmFRyF4rtFVs14yhqbbCK1nYp6NH2QN/8nOP64ze2Phpl0LCNDyvrm9Kt
 YZOgamckoa8eOXH2W7i10s/Ml9xcZtxQqC48HnZJAIOnJ3EkXK7njKHIBf//Ktm1KBrS
 0DZM+rhhgrMeEx1HVf4y1hdFgIz9b7wEHl5Yx0dDkHA931nwCG9HkIjsWFqQlP2DOCGh
 UMkh2FSXxbcz3gWcZWQGVTzHOi3mDbGswB9FsIxgT9/m6J/4eKtEJzfV/ZM1rKyj01k6
 g26g==
X-Gm-Message-State: AOAM533T0vBfn/kZLCQSfBW2B9/jZ6wD1SAudoPag7G/RnnEiH3cnIna
 pEAmTN6M69IZRA75jFwOD0arJF69v7AFbp0aQ4xPHPihcxVaFjEL4trlppYAFNKETomEeGA2vGd
 2CjuUoxlUZ9zFAkSvlUdQE5Mh5Ho=
X-Received: by 2002:a5b:44d:: with SMTP id s13mr457958ybp.403.1598596864527;
 Thu, 27 Aug 2020 23:41:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGYci/C/6D+6fQtCSFMVxgylwe2cNHL+AMHPrpIBOL0A7utC+kgRHvqWzSuk3FkxvS9wNJG462/HTa8b1RbQE=
X-Received: by 2002:a5b:44d:: with SMTP id s13mr457939ybp.403.1598596864216;
 Thu, 27 Aug 2020 23:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200825064706.GA7135@x230>
 <1598339667-24948-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eS0PS=hmpiWBzkfBQ3cO4K2u2bVgcO5ZK4fz9N+xg7uQ@mail.gmail.com>
 <716a3ffc-fa20-01df-a63f-86a5a50239af@cn.fujitsu.com>
In-Reply-To: <716a3ffc-fa20-01df-a63f-86a5a50239af@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 28 Aug 2020 14:40:52 +0800
Message-ID: <CAEemH2faKH1xUAx7GAS_01UYwZfya3AbJj12fqzOoZ6=OTJZrQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] travis: Use centos:7 instead of centos:6
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
Content-Type: multipart/mixed; boundary="===============1916396264=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1916396264==
Content-Type: multipart/alternative; boundary="0000000000003b282b05adea5612"

--0000000000003b282b05adea5612
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

Sorry for the delay. I guess many Developers(European or North America) are
busy with the LPC(Linux Plumbers Conference) recently. please
keep patience:).

Btw, there is a new build error on CentOS7(seems unrelated to your patch):

  /usr/src/ltp/lib/tst_af_alg.c:205:21: error: 'ALG_SET_AEAD_ASSOCLEN'
undeclared (first use in this function)
  2084 cmsg->cmsg_type = ALG_SET_AEAD_ASSOCLEN;

https://travis-ci.com/github/wangli5665/ltp/jobs/378677988


On Fri, Aug 28, 2020 at 11:22 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Hi Li, Petr
>
> Does have anything block this patch? Or, we should listen some advise
> from Jan and Cyril?
>
> ps: Also, ALG_SET_AEAD_ASSOCLEN undefined error patch needs to be reviewed.
>
> Best Regards
> Yang Xu
> >
> >
> > On Tue, Aug 25, 2020 at 3:14 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com
> > <mailto:xuyang2018.jy@cn.fujitsu.com>> wrote:
> >
> >     I have this idea when I meet ALG_SET_AEAD_ASSOCLEN undefined error
> >     on centos7.
> >     It is more friendly for centos7 user and more meaningful. centos6 is
> >     outdated
> >     and we should drop it.
> >
> >     Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com
> >     <mailto:xuyang2018.jy@cn.fujitsu.com>>
> >
> > Acked-by: Li Wang <liwang@redhat.com <mailto:liwang@redhat.com>>
> >
> >     ---
> >       .travis.yml | 2 +-
> >       1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >     diff --git a/.travis.yml b/.travis.yml
> >     index e8e3189af..3c5ff99b7 100644
> >     --- a/.travis.yml
> >     +++ b/.travis.yml
> >     @@ -44,7 +44,7 @@ matrix:
> >                 compiler: clang
> >
> >               - os: linux
> >     -          env: DISTRO=centos:6 TREE=out
> >     +          env: DISTRO=centos:7 TREE=out
> >                 compiler: gcc
> >
> >               - os: linux
> >     --
> >     2.23.0
> >
> >
> >
> >
> >     --
> >     Mailing list info: https://lists.linux.it/listinfo/ltp
> >
> >
> >
> > --
> > Regards,
> > Li Wang
>
>
>

-- 
Regards,
Li Wang

--0000000000003b282b05adea5612
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"">Sorry=C2=A0for the =
delay. I guess many Developers(European or North America)=C2=A0are busy wit=
h the LPC(Linux Plumbers Conference) recently. please keep=C2=A0patience:).=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Btw, there is a new buil=
d error on CentOS7(seems unrelated to your patch):</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><span class=3D"gmail_default"=
 style=3D"font-size:small">=C2=A0 </span>/<span class=3D"gmail_default" sty=
le=3D"font-size:small"></span><span class=3D"gmail_default" style=3D"font-s=
ize:small"></span>usr/src/ltp/lib/tst_af_alg.c:205:21: error: &#39;ALG_SET_=
AEAD_ASSOCLEN&#39; undeclared (first use in this function)<br><span class=
=3D"gmail_default" style=3D"font-size:small">=C2=A0 </span>2084 cmsg-&gt;cm=
sg_type =3D ALG_SET_AEAD_ASSOCLEN;<div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><a href=3D"https://travis-ci.com/github/w=
angli5665/ltp/jobs/378677988" target=3D"_blank">https://travis-ci.com/githu=
b/wangli5665/ltp/jobs/378677988</a></div><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 28, 2020 at =
11:22 AM Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=
=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi Li, Petr<br>
<br>
Does have anything block this patch? Or, we should listen some advise <br>
from Jan and Cyril?<br>
<br>
ps: Also, ALG_SET_AEAD_ASSOCLEN undefined error patch needs to be reviewed.=
<br>
<br>
Best Regards<br>
Yang Xu<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Aug 25, 2020 at 3:14 PM Yang Xu &lt;<a href=3D"mailto:xuyang20=
18.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a> <b=
r>
&gt; &lt;mailto:<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_=
blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I have this idea when I meet ALG_SET_AEAD_ASSOCLEN =
undefined error<br>
&gt;=C2=A0 =C2=A0 =C2=A0on centos7.<br>
&gt;=C2=A0 =C2=A0 =C2=A0It is more friendly for centos7 user and more meani=
ngful. centos6 is<br>
&gt;=C2=A0 =C2=A0 =C2=A0outdated<br>
&gt;=C2=A0 =C2=A0 =C2=A0and we should drop it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang=
2018.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:xuyang2018.jy@cn.fujit=
su.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;&gt;<br>
&gt; <br>
&gt; Acked-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_=
blank">liwang@redhat.com</a> &lt;mailto:<a href=3D"mailto:liwang@redhat.com=
" target=3D"_blank">liwang@redhat.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.travis.yml | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-=
)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/.travis.yml b/.travis.yml<br>
&gt;=C2=A0 =C2=A0 =C2=A0index e8e3189af..3c5ff99b7 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/.travis.yml<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/.travis.yml<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -44,7 +44,7 @@ matrix:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compiler:=
 clang<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- os: linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env: DISTRO=3Dc=
entos:6 TREE=3Dout<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env: DISTRO=3Dc=
entos:7 TREE=3Dout<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compiler:=
 gcc<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- os: linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.23.0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Mailing list info: <a href=3D"https://lists.linux.i=
t/listinfo/ltp" rel=3D"noreferrer" target=3D"_blank">https://lists.linux.it=
/listinfo/ltp</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Regards,<br>
&gt; Li Wang<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000003b282b05adea5612--


--===============1916396264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1916396264==--

