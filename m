Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DDC1EC6DB
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jun 2020 03:39:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 570043C303D
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jun 2020 03:39:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 79D313C00BE
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 03:39:14 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 322C81A00F97
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 03:39:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591148351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kiq6BFj6ATs5vONaDhbVZ0wFOdnu7tA4dZgsUVEcpeM=;
 b=LSrtWAkUaftQh9GaN9jWwPWnuc189Kg/RDHD6DDeI4uCLp2b0E9sJWqmOg5XI1nv38MvfI
 BQYjCpAVNOk6B3+cy8MhmTyOBR9dMzQGye6Zbrt2F4Dg65x2fpsZ0pyAYpIfL0+Pk2ZyOZ
 6IUIIKrIX2WlLIlBDcqI7MxDujBuEr0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-xcgaM7S3PsukUYvlF2lkzg-1; Tue, 02 Jun 2020 21:39:08 -0400
X-MC-Unique: xcgaM7S3PsukUYvlF2lkzg-1
Received: by mail-lj1-f199.google.com with SMTP id z10so78744ljj.5
 for <ltp@lists.linux.it>; Tue, 02 Jun 2020 18:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kiq6BFj6ATs5vONaDhbVZ0wFOdnu7tA4dZgsUVEcpeM=;
 b=c8eVJbz0SlXsKywdbeMbRJPjr4harJSI7w/f3wrcjEUwx20GUKmngyhnzvpvs7Y7Js
 f3iJhP3BdKS9wNhIegJw1ylPFgKgAz9OQwQWvYqSrywhABy3Ld2gkgKdAoFS62GIU/Jq
 7UtJlGbu5VptHYpbVIAp4EquPORgWvnhbioSCLLX2rHdY21xj4XzeKcBBObUtWauvNlT
 906+kvlTFto1QtYIaTic9VZ95dZUJnAzWNvR3jLQRgJoJjEJ+SCKav6mrdj2i4U3K3IA
 GwyAqjYkpYHUCnAY3IWwETh0Uvbw8DtS+i5SmLsqKwF5M6EkvmVWRc5zxy9N/91KEFXp
 +jmw==
X-Gm-Message-State: AOAM533PsfPb7Km9RHbk9kW+rLi+4XndxrtxsScTIjB0by2Ju68t05DL
 stwIooFavh+BRglByNj/7afintIXz+ALYPBDab+I+r7CNFsDbM0EsiKk1mp0sVn5Shj1618oK09
 2ZryGACpuX3a+3PWUP8irIuCXlac=
X-Received: by 2002:a2e:5757:: with SMTP id r23mr852649ljd.468.1591148347102; 
 Tue, 02 Jun 2020 18:39:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylO5hfyi+DRBCCfdzE+EcOyDu1fxUtROgdJ61QqUcQTt+ACG/aK+YFgO2VuYfjh6gKlzzgjFpdBKXTMUt2GJI=
X-Received: by 2002:a2e:5757:: with SMTP id r23mr852638ljd.468.1591148346754; 
 Tue, 02 Jun 2020 18:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200601100459.32511-1-liwang@redhat.com>
 <1365679659.14324910.1591019831545.JavaMail.zimbra@redhat.com>
 <CAEemH2ffNHY6Ej-Er5a4Ng_9zw+RX+wEBc0widntmYqDLNRqxw@mail.gmail.com>
 <20200602121232.GA22599@janakin.usersys.redhat.com>
In-Reply-To: <20200602121232.GA22599@janakin.usersys.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 3 Jun 2020 09:38:53 +0800
Message-ID: <CAEemH2d7OzG6jBZ15bYGRHm7ry-gVjzuwJYhbHp3yitB3_928w@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] lib: add new cgroup test API
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
Content-Type: multipart/mixed; boundary="===============1815005697=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1815005697==
Content-Type: multipart/alternative; boundary="000000000000fe7ac705a72417ca"

--000000000000fe7ac705a72417ca
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 2, 2020 at 8:12 PM Jan Stancek <jstancek@redhat.com> wrote:

> Hi Li,
>
> >Why we need this? Because, if a testcase(i.e oom05.c) needs more than one
> >cgroup
> >subsystem(memory, cpuset) on RHEL7(cgroup-v1), it should mount two
> >different
> >directories and do some knob setting.
>
> Mounting with different controllers is fine, I meant do we have a case for
> mounting
> same controller multiple times? We might have, because current design
> allows
> only for single directory (tst_cgroup_new_path), that's automatically
> created on mount.
> (This is your example 4)
>
> >
> >
> >>
> >> > +
> >> > +static void tst_cgroup_set_path(const char *cgroup_dir)
> >> > +{
> >> > +     struct tst_cgroup_path *tst_cgroup_path, *a;
> >> > +
> >> > +     if (!cgroup_dir)
> >> > +             tst_brk(TBROK, "Invalid cgroup dir, plese check
> >> cgroup_dir");
> >> > +
> >> > +     sprintf(tst_cgroup_mnt_path, "%s", cgroup_dir);
> >> > +     sprintf(tst_cgroup_new_path, "%s/ltp_%d", cgroup_dir, rand());
> >> > +
> >> > +     /* To store cgroup path in the shared 'path' list */
> >> > +     tst_cgroup_path = SAFE_MMAP(NULL, (sizeof(struct
> tst_cgroup_path)),
> >> > +                     PROT_READ | PROT_WRITE, MAP_ANONYMOUS |
> >> MAP_SHARED, -1, 0);
> >>
> >> I'm not sure I understand what is the reason to have tst_cgroup_path. Is
> >> it expected,
> >> that mount and umount are called by different processes? It might be
> easier
> >>
> >
> >The shared 'tst_cgroup_path' is necessary especially for mounting
> >different cgoups in setup(). Otherwise, it would be easy to get lost
> >which directory for kind of cgroup type.
>
> But why is it shared? Is cleanup going to run in different process context?
> Which one of your examples needs shared memory?
>

My original thought was that if children want to remove some paths
from the list, so this shared memory was made sense. But in the
signed-off patch v2, it seems we only do the deletion in cleanup(),
so private memory is enough.

Another slight reason to keep using share memory is to avoid the
children have a new copy of the list, that will allocate more memory
in testing, but that's fine, I have no objection to using private memory.


>
> >
> >And the worth to say, the random directory name for same cgroup
> >mounting is also on purpose, though we mount same(i.e memory)
> >cgroup in two places it still belongs to the one hierarchy, and create
> >the same name of the new directory will be hit an error in EEXIST.
> >
> >static void tst_cgroup_set_path(const char *cgroup_dir)
> >{
> >    ...
> >    sprintf(tst_cgroup_mnt_path, "%s", cgroup_dir);
> >    sprintf(tst_cgroup_new_path, "%s/ltp_%d", cgroup_dir, rand());
>
> I see why you are tracking this in list, but this exchange of state through
> global variables does seem bit unclear.
>

Yes, that's a compromise to support more usage of the APIs.


>
> Could we leave "new_path" creation to testcase itself? It would give
> us more flexibility and we don't have to worry about name collisions.
>

Hmm, more flexibility sometimes means more complicated to use, I don't
want these APIs to become difficult for newbies of LTP.


> It also avoids need to mount same controller multiple times
> (example 4 in your reply).
>

To be honest, most situations we have are examples 1 and 2, the
others(ex3,4,5) might rarely happen in our test. So maybe leave too
much work(i.e "new_path" creation) in testcase is not wise, and I don't
want to make usage complicated just for ingratiating the rare situations.


>
> Let's assume this is API:
>
> #include "tst_cgroup.h"
> #define MEM_MNT  "/tmp/cgroup1"
> #define CPUSET_MNT  "/tmp/cgroup2"
> #define DIR1 "ltp_test_blah_dir1"
> #define DIR2 "ltp_test_blah_dir2"
> #define DIR3 "ltp_test_blah_dir3"
>
> static void run(void)
> {
>     if (fork() == 0) {
>         tst_cgroup_move_current(MEM_MNT, DIR2);
>         // do your test
>         exit(0);
>     }
>     tst_cgroup_move_current(MEM_MNT, DIR1);
>     // do your test
> }
>
> static void setup(void)
> {
>     tst_cgroup_mount(TST_CGROUP_MEMCG, MEM_MNT);
>     tst_cgroup_mkdir(MEM_MNT, DIR1);
>     tst_cgroup_mem_set_maxbytes(MEM_MNT, DIR1, 1*1024*1024);
>     tst_cgroup_mkdir(MEM_MNT, DIR2);
>     tst_cgroup_mem_set_maxbytes(MEM_MNT, DIR2, 2*1024*1024);
>
>     tst_cgroup_mount(TST_CGROUP_CPUSET, CPUSET_MNT);
>     tst_cgroup_mkdir(CPUSET_MNT, DIR3);
>     tst_cgroup_move_current(CPUSET_MNT, DIR3);

}
>
> static void cleanup(void)
> {
>     tst_cgroup_umount(MEM_MNT);
>     tst_cgroup_umount(CPUSET_MNT);
> }
>
> static struct tst_test test = {
>     ...
>     .test_all = run,
> };
>
> On library side we would have a list that tracks all mounts. And every
> mount
> record would have list that tracks all mkdir() operations, so we can
> cleanup anything that test creates. I think tracking per-process would be
> sufficient.
>

To compare with my v2, this design leaves simple code in lib, and flexible
in usage. The only disadvantage is that people need to define more macros
and mkdir() by themself.

I have no strong preference to shift from v2 to this method, or maybe we
can try
to combine together and do more optimize work in the lib side.


>
> (without spinning v3) What are your thoughts?
>
> Regards,
> Jan
>
>

-- 
Regards,
Li Wang

--000000000000fe7ac705a72417ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 2, 2020 at 8:12 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt;Why we need this? Because, if a testcase(i.e oom05.c) needs more than o=
ne<br>
&gt;cgroup<br>
&gt;subsystem(memory, cpuset) on RHEL7(cgroup-v1), it should mount two<br>
&gt;different<br>
&gt;directories and do some knob setting.<br>
<br>
Mounting with different controllers is fine, I meant do we have a case for =
mounting<br>
same controller multiple times? We might have, because current design allow=
s<br>
only for single directory (tst_cgroup_new_path), that&#39;s automatically c=
reated on mount.<br>
(This is your example 4)<br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static void tst_cgroup_set_path(const char *cgroup_dir)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct tst_cgroup_path *tst_cgroup_path,=
 *a;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!cgroup_dir)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBRO=
K, &quot;Invalid cgroup dir, plese check<br>
&gt;&gt; cgroup_dir&quot;);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0sprintf(tst_cgroup_mnt_path, &quot;%s&qu=
ot;, cgroup_dir);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0sprintf(tst_cgroup_new_path, &quot;%s/lt=
p_%d&quot;, cgroup_dir, rand());<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* To store cgroup path in the shared &#=
39;path&#39; list */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0tst_cgroup_path =3D SAFE_MMAP(NULL, (siz=
eof(struct tst_cgroup_path)),<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0PROT_READ | PROT_WRITE, MAP_ANONYMOUS |<br>
&gt;&gt; MAP_SHARED, -1, 0);<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m not sure I understand what is the reason to have tst_cgrou=
p_path. Is<br>
&gt;&gt; it expected,<br>
&gt;&gt; that mount and umount are called by different processes? It might =
be easier<br>
&gt;&gt;<br>
&gt;<br>
&gt;The shared &#39;tst_cgroup_path&#39; is necessary especially for mounti=
ng<br>
&gt;different cgoups in setup(). Otherwise, it would be easy to get lost<br=
>
&gt;which directory for kind of cgroup type.<br>
<br>
But why is it shared? Is cleanup going to run in different process context?=
<br>
Which one of your examples needs shared memory?<br></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">My original=
 thought was that if children want to remove some paths</div><div class=3D"=
gmail_default" style=3D"font-size:small">from the list, so this shared memo=
ry was made sense. But in the</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">signed-off patch v2, it seems we only do the deletion in cle=
anup(),</div><div class=3D"gmail_default" style=3D"font-size:small">so priv=
ate memory is enough.</div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Another slight reason to keep using share memory is t=
o avoid the</div><div class=3D"gmail_default" style=3D"font-size:small">chi=
ldren have a new copy of the list, that will allocate more memory</div><div=
 class=3D"gmail_default" style=3D"font-size:small">in testing, but that&#39=
;s fine, I have no objection to using private memory.</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;And the worth to say, the random directory name for same cgroup<br>
&gt;mounting is also on purpose, though we mount same(i.e memory)<br>
&gt;cgroup in two places it still belongs to the one hierarchy, and create<=
br>
&gt;the same name of the new directory will be hit an error in EEXIST.<br>
&gt;<br>
&gt;static void tst_cgroup_set_path(const char *cgroup_dir)<br>
&gt;{<br>
&gt;=C2=A0 =C2=A0 ...<br>
&gt;=C2=A0 =C2=A0 sprintf(tst_cgroup_mnt_path, &quot;%s&quot;, cgroup_dir);=
<br>
&gt;=C2=A0 =C2=A0 sprintf(tst_cgroup_new_path, &quot;%s/ltp_%d&quot;, cgrou=
p_dir, rand());<br>
<br>
I see why you are tracking this in list, but this exchange of state through=
<br>
global variables does seem bit unclear.<br></blockquote><div><span class=3D=
"gmail_default" style=3D"font-size:small"><br></span></div><div><span class=
=3D"gmail_default" style=3D"font-size:small">Yes, that&#39;s a compromise t=
o support more usage of the APIs.</span></div><div><span class=3D"gmail_def=
ault" style=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Could we leave &quot;new_path&quot; creation to testcase itself? It would g=
ive<br>
us more flexibility and we don&#39;t have to worry about name collisions.<b=
r></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Hmm, more flexibility sometimes means more complicated to us=
e, I don&#39;t</div><div class=3D"gmail_default" style=3D"font-size:small">=
want these APIs to become difficult for newbies of LTP.</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
It also avoids need to mount same controller multiple times<br>
(example 4 in your reply).<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">To be honest, most situations =
we have are examples 1 and 2, the</div><div class=3D"gmail_default" style=
=3D"font-size:small">others(ex3,4,5) might rarely happen in our test. So ma=
ybe leave too</div><div class=3D"gmail_default" style=3D"font-size:small">m=
uch work(i.e &quot;new_path&quot; creation) in testcase is not wise, and I =
don&#39;t</div><div class=3D"gmail_default" style=3D"font-size:small">want =
to make usage complicated just for=C2=A0ingratiating the rare situations.</=
div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Let&#39;s assume this is API:<br>
<br>
#include &quot;tst_cgroup.h&quot;<br>
#define MEM_MNT=C2=A0 &quot;/tmp/cgroup1&quot;<br>
#define CPUSET_MNT=C2=A0 &quot;/tmp/cgroup2&quot;<br>
#define DIR1 &quot;ltp_test_blah_dir1&quot;<br>
#define DIR2 &quot;ltp_test_blah_dir2&quot;<br>
#define DIR3 &quot;ltp_test_blah_dir3&quot;<br>
<br>
static void run(void)<br>
{<br>
=C2=A0 =C2=A0 if (fork() =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup_move_current(MEM_MNT, DIR2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // do your test<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 tst_cgroup_move_current(MEM_MNT, DIR1);<br>
=C2=A0 =C2=A0 // do your test<br>
}<br>
<br>
static void setup(void)<br>
{<br>
=C2=A0 =C2=A0 tst_cgroup_mount(TST_CGROUP_MEMCG, MEM_MNT);<br>
=C2=A0 =C2=A0 tst_cgroup_mkdir(MEM_MNT, DIR1);<br>
=C2=A0 =C2=A0 tst_cgroup_mem_set_maxbytes(MEM_MNT, DIR1, 1*1024*1024);<br>
=C2=A0 =C2=A0 tst_cgroup_mkdir(MEM_MNT, DIR2);<br>
=C2=A0 =C2=A0 tst_cgroup_mem_set_maxbytes(MEM_MNT, DIR2, 2*1024*1024);<br>
<br>
=C2=A0 =C2=A0 tst_cgroup_mount(TST_CGROUP_CPUSET, CPUSET_MNT);<br>
=C2=A0 =C2=A0 tst_cgroup_mkdir(CPUSET_MNT, DIR3);<br>
=C2=A0 =C2=A0 tst_cgroup_move_current(CPUSET_MNT, DIR3);</blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
}<br>
<br>
static void cleanup(void)<br>
{<br>
=C2=A0 =C2=A0 tst_cgroup_umount(MEM_MNT);<br>
=C2=A0 =C2=A0 tst_cgroup_umount(CPUSET_MNT);<br>
}<br>
<br>
static struct tst_test test =3D {<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 .test_all =3D run,<br>
};<br>
<br>
On library side we would have a list that tracks all mounts. And every moun=
t<br>
record would have list that tracks all mkdir() operations, so we can<br>
cleanup anything that test creates. I think tracking per-process would be s=
ufficient.<br></blockquote><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">To compare with my v2, this design leaves simple=
 code in lib, and flexible</div><div class=3D"gmail_default" style=3D"font-=
size:small">in usage. The only disadvantage is that people need to define m=
ore macros</div><div class=3D"gmail_default" style=3D"font-size:small">and =
mkdir() by themself.=C2=A0</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">I have no strong preference to shift from v2 to this method, or maybe we =
can try</div><div class=3D"gmail_default" style=3D"font-size:small">to comb=
ine together and do more optimize work in the lib side.</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
(without spinning v3) What are your thoughts?<br>
<br>
Regards,<br>
Jan<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000fe7ac705a72417ca--


--===============1815005697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1815005697==--

