Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1EE1E3EB5
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 12:11:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 854E43C322E
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 12:11:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 596E23C2123
 for <ltp@lists.linux.it>; Wed, 27 May 2020 12:11:11 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 48CF6100112F
 for <ltp@lists.linux.it>; Wed, 27 May 2020 12:11:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590574268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pekfEB01NbPTcxMMfzIFWHHdjtY6sc6i0OtiBtEaHAs=;
 b=NfW8TrbIsLrIsIvuHIZsQq3bylQNPYlMoKhc1/7IMjuqOH6ZGboVAoXDHpan85aT4Y7Ox+
 0g5SLuoahRTMSgq/22ssQB6GV5GXmi8jPtDtaUH9oL2AS0kWGxBKrpfssUNaOrFlNymrji
 +5vHCtybOLY8nTmeewLe88DX8VyMQtQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-XE3CsrEwPaO9GrehBdSuIg-1; Wed, 27 May 2020 06:11:05 -0400
X-MC-Unique: XE3CsrEwPaO9GrehBdSuIg-1
Received: by mail-lf1-f72.google.com with SMTP id u5so5372979lfo.6
 for <ltp@lists.linux.it>; Wed, 27 May 2020 03:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pekfEB01NbPTcxMMfzIFWHHdjtY6sc6i0OtiBtEaHAs=;
 b=Jy9PoY+Fye5OV9WTcLdR4+QZFBzFK6Wm9wh8oBrtgXuEvlHvSP/wtnEwA9uATNTHym
 N+rZ0XKWj5Rzynm4jMhmFmFLoy0NGyqHU1mDREtGACBFO8b1cPj/mDRF3KAd9l2ckow6
 rlIyEbkO7pr99FftCix8ThI3gLFwaOUc9rf8iIkJBCIbbysuexPX2ged29BARi2C60UV
 1iVQWmZtxP9hLEMd11gFUT64GbrHI+cejWhYrkD6f3Ha1odX6fzDYLNtwT12erGdpf4B
 tE8xDKTfVxq+TfKMKAPgDr67hLPQVDcHNMhZTxaEkMG64/23zmwj3B7wPJIfwI7AQZ9V
 z97A==
X-Gm-Message-State: AOAM530SsspqXSuMQYIg+Q22a0wogdN54kzz+Cn68hQOMMUnXD+82bOZ
 V1i3dCQkjcdy+zhPcICfZ741zQ5LYX3XVQK66AMQkT8QQRnIGLmwuanfmjk5R6qUq3kmIJh0HVR
 SOeEs7GwOv9TqVYeP49L0HxOQKz4=
X-Received: by 2002:a2e:b5b0:: with SMTP id f16mr2874389ljn.100.1590574263999; 
 Wed, 27 May 2020 03:11:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr9oYPf8PIrPcQcbPWHb066Oqw6XT1lzzuAeXi78xlXAmvkJS/fMFKgP6NOXVSCdjWpj5RKCzr2Abc/irwVdQ=
X-Received: by 2002:a2e:b5b0:: with SMTP id f16mr2874232ljn.100.1590574259319; 
 Wed, 27 May 2020 03:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200527031430.22144-1-liwang@redhat.com>
 <20200527031430.22144-2-liwang@redhat.com>
 <396532423.13763181.1590565518615.JavaMail.zimbra@redhat.com>
In-Reply-To: <396532423.13763181.1590565518615.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 27 May 2020 18:10:47 +0800
Message-ID: <CAEemH2cdS9OX6HvGPOwULMTkjfbNSbnz6ZF27rsZrsjcJ6r3AQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/4] mem: take use of new cgroup API
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
Content-Type: multipart/mixed; boundary="===============0119802406=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0119802406==
Content-Type: multipart/alternative; boundary="000000000000b7775a05a69e6d54"

--000000000000b7775a05a69e6d54
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 3:45 PM Jan Stancek <jstancek@redhat.com> wrote:

> > diff --git a/testcases/kernel/mem/cpuset/cpuset01.c
> > b/testcases/kernel/mem/cpuset/cpuset01.c
> > index 853f7fe55..cecc4ba86 100644
> > --- a/testcases/kernel/mem/cpuset/cpuset01.c
> > +++ b/testcases/kernel/mem/cpuset/cpuset01.c
> > @@ -51,11 +51,11 @@ static void test_cpuset(void)
> >       unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
> >       char mems[BUFSIZ], buf[BUFSIZ];
> >
> > -     read_cpuset_files(CPATH, "cpus", buf);
> > -     write_cpuset_files(CPATH_NEW, "cpus", buf);
> > -     read_cpuset_files(CPATH, "mems", mems);
> > -     write_cpuset_files(CPATH_NEW, "mems", mems);
> > -     SAFE_FILE_PRINTF(CPATH_NEW "/tasks", "%d", getpid());
> > +     read_cpuset_files(PATH_TMP_CG1_CST, "cpus", buf);
> > +     write_cpuset_files(PATH_CG1_CST_LTP, "cpus", buf);
> > +     read_cpuset_files(PATH_TMP_CG1_CST, "mems", mems);
> > +     write_cpuset_files(PATH_CG1_CST_LTP, "mems", mems);
>
> This mixes generic api with cgroup1. It currently relies on implementation
> detail of tst_cgroup_mount(), which isn't visible just by looking at this
> test.
>

Yes, here just uses many path macros, which makes things easy since mem/lib
achieved many functions for cpuset files, I don't want to break the struct
so keep it similar as previous. Anyway, we can reconstruct that but that is
not the intention of this patchset.

Btw, the test has no chance to go there because in setup() the
tst_cgroup_mount(TST_CGROUP_CPUSET)
will get TCONF if the system uses cgroup-v2.

>
> We should make it generic or make it clear that test is for cgroup1 only:
>

But sure, we can add this, it makes code clear to readers.


>
> setup()
>   if (tst_cgroup_version() != TST_CGROUP_V1)
>     TCONF
>
>
> > diff --git a/testcases/kernel/mem/oom/oom03.c
> > b/testcases/kernel/mem/oom/oom03.c
> > index ce0b34c31..af3a565ce 100644
> > --- a/testcases/kernel/mem/oom/oom03.c
> > +++ b/testcases/kernel/mem/oom/oom03.c
> > @@ -36,27 +36,26 @@
> >
> >  #ifdef HAVE_NUMA_V2
> >
> > -static int memcg_mounted;
> > -
> >  static void verify_oom(void)
> >  {
> >  #ifdef TST_ABI32
> >       tst_brk(TCONF, "test is not designed for 32-bit system.");
> >  #endif
> >
> > -     SAFE_FILE_PRINTF(MEMCG_PATH_NEW "/tasks", "%d", getpid());
> > -     SAFE_FILE_PRINTF(MEMCG_LIMIT, "%ld", TESTMEM);
> > +     tst_cgroup_mem_set_maxbytes(TESTMEM);
> >
> >       testoom(0, 0, ENOMEM, 1);
> >
> > -     if (access(MEMCG_SW_LIMIT, F_OK) == -1) {
> > +     if ((access(PATH_MEMORY_SW_LIMIT, F_OK) == -1) ||
> > +                     (access(PATH_MEMORY_SW_MAX, F_OK) == -1)) {
>
> This could be tst_cgroup_mem_swapacct_enabled(), without need for test
> to probe specific cgroup[12] files.
>

Sounds good. I will have a try.

-- 
Regards,
Li Wang

--000000000000b7775a05a69e6d54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, May 27, 2020 at 3:45 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; diff --git a/te=
stcases/kernel/mem/cpuset/cpuset01.c<br>
&gt; b/testcases/kernel/mem/cpuset/cpuset01.c<br>
&gt; index 853f7fe55..cecc4ba86 100644<br>
&gt; --- a/testcases/kernel/mem/cpuset/cpuset01.c<br>
&gt; +++ b/testcases/kernel/mem/cpuset/cpuset01.c<br>
&gt; @@ -51,11 +51,11 @@ static void test_cpuset(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long nmask[MAXNODES / BITS_PER_LONG=
] =3D { 0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char mems[BUFSIZ], buf[BUFSIZ];<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0read_cpuset_files(CPATH, &quot;cpus&quot;, buf);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0write_cpuset_files(CPATH_NEW, &quot;cpus&quot;, b=
uf);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0read_cpuset_files(CPATH, &quot;mems&quot;, mems);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0write_cpuset_files(CPATH_NEW, &quot;mems&quot;, m=
ems);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(CPATH_NEW &quot;/tasks&quot;, &q=
uot;%d&quot;, getpid());<br>
&gt; +=C2=A0 =C2=A0 =C2=A0read_cpuset_files(PATH_TMP_CG1_CST, &quot;cpus&qu=
ot;, buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0write_cpuset_files(PATH_CG1_CST_LTP, &quot;cpus&q=
uot;, buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0read_cpuset_files(PATH_TMP_CG1_CST, &quot;mems&qu=
ot;, mems);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0write_cpuset_files(PATH_CG1_CST_LTP, &quot;mems&q=
uot;, mems);<br>
<br>
This mixes generic api with cgroup1. It currently relies on implementation<=
br>
detail of tst_cgroup_mount(), which isn&#39;t visible just by looking at th=
is test.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Yes, here just uses many path macros, which makes =
things easy since mem/lib achieved many functions for cpuset files, I don&#=
39;t want to break the struct so keep it similar as previous. Anyway, we ca=
n reconstruct that but that is not the intention of this patchset.</div><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Btw, the test=
 has no chance to go there because in setup() the tst_cgroup_mount(TST_CGRO=
UP_CPUSET)</div><div class=3D"gmail_default" style=3D"font-size:small">will=
 get TCONF if the system uses cgroup-v2.</div><div class=3D"gmail_default" =
style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
We should make it generic or make it clear that test is for cgroup1 only:<b=
r></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">But sure, we can add this, it makes code clear to readers.</=
div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
setup()<br>
=C2=A0 if (tst_cgroup_version() !=3D TST_CGROUP_V1)<br>
=C2=A0 =C2=A0 TCONF<br>
<br>
<br>
&gt; diff --git a/testcases/kernel/mem/oom/oom03.c<br>
&gt; b/testcases/kernel/mem/oom/oom03.c<br>
&gt; index ce0b34c31..af3a565ce 100644<br>
&gt; --- a/testcases/kernel/mem/oom/oom03.c<br>
&gt; +++ b/testcases/kernel/mem/oom/oom03.c<br>
&gt; @@ -36,27 +36,26 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #ifdef HAVE_NUMA_V2<br>
&gt;=C2=A0 <br>
&gt; -static int memcg_mounted;<br>
&gt; -<br>
&gt;=C2=A0 static void verify_oom(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 #ifdef TST_ABI32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quot;test is not designed fo=
r 32-bit system.&quot;);<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(MEMCG_PATH_NEW &quot;/tasks&quot=
;, &quot;%d&quot;, getpid());<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(MEMCG_LIMIT, &quot;%ld&quot;, TE=
STMEM);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_cgroup_mem_set_maxbytes(TESTMEM);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0testoom(0, 0, ENOMEM, 1);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (access(MEMCG_SW_LIMIT, F_OK) =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((access(PATH_MEMORY_SW_LIMIT, F_OK) =3D=3D -1=
) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(access(PATH_MEMORY_SW_MAX, F_OK) =3D=3D -1)) {<br>
<br>
This could be tst_cgroup_mem_swapacct_enabled(), without need for test<br>
to probe specific cgroup[12] files.<br></blockquote><div><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Sounds good. I will have a t=
ry.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div>

--000000000000b7775a05a69e6d54--


--===============0119802406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0119802406==--

