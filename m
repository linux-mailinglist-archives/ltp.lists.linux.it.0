Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A67328D9FF
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 08:27:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C38D3C269F
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 08:27:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 70E143C2219
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 08:27:51 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 45C5F200D53
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 08:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602656869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xK8d2nmQnK6z5tPuHX+EOTjEby7B8ts6VtSspjtj7Ow=;
 b=HGXk+UggWRqIAgXtSLPkNWiLex1Dtg9wyGqr278IbqglwpRDrh2d7tWUcH8KjKnFD7QyUS
 1nfDgWiP+WtpG5q/YZaf1c0mUskiCqS+/AJTVtq6E1+j8Ft6/jRGC1qEPU6roqdi1qZ+Wn
 Ul/OEpJQLDLUy+U4NJ2IOMxbVr7jTdY=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-JpT6mzH0Mzie6-t2_27jAQ-1; Wed, 14 Oct 2020 02:27:46 -0400
X-MC-Unique: JpT6mzH0Mzie6-t2_27jAQ-1
Received: by mail-yb1-f197.google.com with SMTP id x14so2224957ybg.7
 for <ltp@lists.linux.it>; Tue, 13 Oct 2020 23:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xK8d2nmQnK6z5tPuHX+EOTjEby7B8ts6VtSspjtj7Ow=;
 b=mjSxzV6MsuiRZCbY6mxwsCl2wX3TbbqEdqejI3xkVEuAaEJbqv8ph68whMAgRai/vc
 L89Hil2lD3/abN4s8sLviF+MlBCEBYifGLFOyHGCfR4zpBA5J6FviUFCzxIJMDi/8ViV
 RCxDyYpbShfLVRyg6YECBD2UQvnuLvw59tC5D+SmNYeyYUMT6HVYUY370v/AH2pxT/m6
 nhe8vUWosIg1NAgLuaVEWXnXKawsUiNybZUutRzSzqVcUr9yRi1PAkIL2Zl4SgNV4kRz
 M2ob0C0qYxpxFJFaaLprSlTFHvyNfRa04+LAXvUUd2qpLMX85llr5qxeKuG8KGLRKLJj
 3olw==
X-Gm-Message-State: AOAM530e9qFTmwxKeTVycDZzpV2kbAtWIEWOFHQAdG5DNPM0a7UFbadm
 I1/TDiHD++Lf3qLNPhZEA47mMRl2RF//8Tf4rlrvSa45T54UExRNNR8dJX4wFTQH4yJXqQyBgz8
 lvQyn6WrSXfXnkM1polW5Cw4nO+s=
X-Received: by 2002:a25:5f45:: with SMTP id h5mr4833840ybm.286.1602656865596; 
 Tue, 13 Oct 2020 23:27:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxFX8ueE7jqvog4CMnTT5pIKnrVi3SxCg0ycJo+nWIIce90iywWTIvORRCb6utDyJIoSI0SN4AXaHiwrym4mk=
X-Received: by 2002:a25:5f45:: with SMTP id h5mr4833817ybm.286.1602656865280; 
 Tue, 13 Oct 2020 23:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200911092121.1917-1-chenhx.fnst@cn.fujitsu.com>
 <7584a7ab-bc37-111f-f9bf-38da2d1e8099@cn.fujitsu.com>
 <ebd86e7d991642cbb13e3ce46d032a69@G08CNEXMBPEKD04.g08.fujitsu.local>
 <5F851CD7.8030005@cn.fujitsu.com>
In-Reply-To: <5F851CD7.8030005@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 14 Oct 2020 14:27:33 +0800
Message-ID: <CAEemH2fNrmOcY_wa3xC0GoHBqpnZkOkkMkoBDqeV1vs8pzHfgA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, 
 =?UTF-8?B?Q2hlbiwgSGFueGlhby/pmYgg5pmX6ZyE?= <chenhx.fnst@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
	=?utf-8?b?562U5aSNOiAgW1BBVENIXSBtZW1jZ191c2VfaGllcmFyY2h5?=
	=?utf-8?q?=5Ftest=2Esh=3A_skip_setting_use=5Fhierarchy_if_not_avai?=
	=?utf-8?q?lable?=
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
Content-Type: multipart/mixed; boundary="===============0364204784=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0364204784==
Content-Type: multipart/alternative; boundary="00000000000026fa6505b19ba1ba"

--00000000000026fa6505b19ba1ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 11:19 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Hi Hanxiao
>
> > Hi, Yang
> >
> >> -----=E9=96=AD=EE=86=BB=E6=AC=A2=E9=8D=98=E7=86=B6=E6=AC=A2-----
> >> =E6=B6=93=E5=A9=9A=EE=95=BD: Re: [LTP] [PATCH] memcg_use_hierarchy_tes=
t.sh: skip setting
> >> use_hierarchy if not available
> >>
> >> Hi hanxiao
> >>
> >>
> >>> The precondition of this case is that we can disable use_hierarchy.
> >>> But some distributions such as CentOS 8 had enabled it in root cgroup
> >>> and hard to disabled.
> > [snip]
> >> /dev/memcg/memory.use_hierarchy" \
> >>> +                                    "to 0 failed"
> >>> +                        fi
> >>> +                fi
> >> I test this patch on centos7 and testcase2 skips. On centos7(without
> installing
> >> docker), /sys/fs/cgroup/memory/memory.use_hierarchy value is equal to =
1
> and I
> >> still can disable value for /dev/memcg/memory.use_hierarchy.
> >>
> > The behavior above looks conflicting with
> https://www.kernel.org/doc/Documentation/cgroup-v1/memory.txt.
> Yes. Centos7 behavior is different from the documentation.
> >> So why not directly use /dev/memcg/memory.use_hierarchy value to judge
> in
> >> testcase after setting 0.
> > In setup_test from memcg_lib.sh, we actually did:
> >     mount -t cgroup -omemory memcg /dev/memcg
> > Then kernel will find a suitable cgroup root for us in cgroup1_mount.
> >
> > In this case, /sys/fs/cgroup/memory/ would be the good choice.
> > So it's equivalent to read memory.use_hierarchy from either side.
> I understand. Only a minor suggestion, please use tabs instead of spaces
> at the beginning of the line.
>
>
> This patch looks good to me,
> Acked-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>
> @Li, I think this patch is ok, Do you have some comment about it?
>

I'm ok to go with memory.use_hierarchy checking in the preconditioning
phase.

But how can you assert the default memory cgroup is mount at path:
"/sys/fs/cgroup/memory", is there any possibility the default path mount at
other places(for different distribution)?
--=20
Regards,
Li Wang

--00000000000026fa6505b19ba1ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 13, 2020 at 11:19 AM Yang Xu &lt;<a hre=
f=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Ha=
nxiao<br>
<br>
&gt; Hi, Yang<br>
&gt;<br>
&gt;&gt; -----=E9=96=AD=EE=86=BB=E6=AC=A2=E9=8D=98=E7=86=B6=E6=AC=A2-----<b=
r>
&gt;&gt; =E6=B6=93=E5=A9=9A=EE=95=BD: Re: [LTP] [PATCH] memcg_use_hierarchy=
_test.sh: skip setting<br>
&gt;&gt; use_hierarchy if not available<br>
&gt;&gt;<br>
&gt;&gt; Hi hanxiao<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; The precondition of this case is that we can disable use_hiera=
rchy.<br>
&gt;&gt;&gt; But some distributions such as CentOS 8 had enabled it in root=
 cgroup<br>
&gt;&gt;&gt; and hard to disabled.<br>
&gt; [snip]<br>
&gt;&gt; /dev/memcg/memory.use_hierarchy&quot; \<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;to=
 0 failed&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br=
>
&gt;&gt; I test this patch on centos7 and testcase2 skips. On centos7(witho=
ut installing<br>
&gt;&gt; docker), /sys/fs/cgroup/memory/memory.use_hierarchy value is equal=
 to 1 and I<br>
&gt;&gt; still can disable value for /dev/memcg/memory.use_hierarchy.<br>
&gt;&gt;<br>
&gt; The behavior above looks conflicting with <a href=3D"https://www.kerne=
l.org/doc/Documentation/cgroup-v1/memory.txt" rel=3D"noreferrer" target=3D"=
_blank">https://www.kernel.org/doc/Documentation/cgroup-v1/memory.txt</a>.<=
br>
Yes. Centos7 behavior is different from the documentation.<br>
&gt;&gt; So why not directly use /dev/memcg/memory.use_hierarchy value to j=
udge in<br>
&gt;&gt; testcase after setting 0.<br>
&gt; In setup_test from memcg_lib.sh, we actually did:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mount -t cgroup -omemory memcg /dev/memcg<br>
&gt; Then kernel will find a suitable cgroup root for us in cgroup1_mount.<=
br>
&gt;<br>
&gt; In this case, /sys/fs/cgroup/memory/ would be the good choice.<br>
&gt; So it&#39;s equivalent to read memory.use_hierarchy from either side.<=
br>
I understand. Only a minor suggestion, please use tabs instead of spaces<br=
>
at the beginning of the line.<br>
<br>
<br>
This patch looks good to me,<br>
Acked-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" targe=
t=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
<br>
@Li, I think this patch is ok, Do you have some comment about it?<br></bloc=
kquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">I&#39;m ok to go with memory.use_hierarchy checking in the preconditionin=
g phase.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">But how can you =
assert the default memory cgroup is mount at path: &quot;/sys/fs/cgroup/mem=
ory&quot;, is there any possibility the default path mount at other places(=
for different distribution)?</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--00000000000026fa6505b19ba1ba--


--===============0364204784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0364204784==--

