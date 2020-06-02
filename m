Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 104CC1EB4AC
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 06:43:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E9793C303E
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 06:43:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8F58C3C02C2
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 06:43:04 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 91A691000C03
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 06:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591072980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FGAYVk26nSWSb7fzujZBi6JRtMDpxNhn/R4/4l5SyuI=;
 b=SIkjT8mtU2PAPfKI4507g7kOIJod8y1ngF9VWpPsPOV/nC990zN2Fm24X/T5EZOoHfIlhe
 lp3YQBbpPtX6jOJgLrCMWnrj3Hn83P6K8uXisPeUjJgx1DcOh0SClMzT7pa6Ry52nVFTbv
 knl8aCDGJmzaKxIm9ROMGaUG2y8i+T4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-s1eT3GDfM2GHWYdZalfUpw-1; Tue, 02 Jun 2020 00:42:57 -0400
X-MC-Unique: s1eT3GDfM2GHWYdZalfUpw-1
Received: by mail-qv1-f72.google.com with SMTP id j4so2337746qvt.20
 for <ltp@lists.linux.it>; Mon, 01 Jun 2020 21:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRaEoeU4Y76CrhR03BK1dTSIcMovh/YSSTreQxQW40E=;
 b=R/DkUCclmLX2LVlpIXf5xpiV7DdLsNObYFtek2m5qtx/ue7Vk497hojFArSmtQ6BKb
 43HQ4+/R2k+5a9oWdmkQ2GQkb49k2+rpJJQ8S4CdvA6nR768gaFztx2z0TJ2lbUOl3An
 +VpB+CXHtAejegYBAl6Yu2FEiGEmZnNBmICQv06NDk6mz5jkiI8vDrByHB7HMl/RwVzu
 Agn/1d67fXRB+0RkaXwXMUS6OS/aGi46tp5Rkw8BoAQp0DKoX7FHQGt0suS7L4i3Wi2J
 pf28edfVRwps2AMY9P9FOndKrG783ZvbVTJUheopGTJv8JKBqACZkNWUik+pJ1XCN5Hv
 MSTA==
X-Gm-Message-State: AOAM530xr1w5Os3pSXSHXPmT2ahTDi1xEAJGSRhyRLAGVXLcsvQh9jFb
 c/5Paba0XE85zK0679oDuYV652Xe/bjo8XA+eJ72yTjmIgjp+cuFVPsunYoCLIk/OqKAjg4kjb6
 V63JHAgf5OmfohOdz0xFFjGX/1hs=
X-Received: by 2002:a37:4682:: with SMTP id t124mr8914984qka.378.1591072973742; 
 Mon, 01 Jun 2020 21:42:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5erj/MzE4nWFuZ1N4cQmeeJiq8eJttKArM14EqrkXEsI1VSOR7vdVB/9BqyU7/JH+Z49UD8g0IR5FYF3PR54=
X-Received: by 2002:a37:4682:: with SMTP id t124mr8914486qka.378.1591072967111; 
 Mon, 01 Jun 2020 21:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200601100459.32511-1-liwang@redhat.com>
 <1365679659.14324910.1591019831545.JavaMail.zimbra@redhat.com>
In-Reply-To: <1365679659.14324910.1591019831545.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 2 Jun 2020 12:42:34 +0800
Message-ID: <CAEemH2ffNHY6Ej-Er5a4Ng_9zw+RX+wEBc0widntmYqDLNRqxw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="0000000000001ce08905a7128bc0"
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--0000000000001ce08905a7128bc0
Content-Type: multipart/alternative; boundary="0000000000001ce08605a7128bbe"

--0000000000001ce08605a7128bbe
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Mon, Jun 1, 2020 at 9:57 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > +
> > +[source,c]
> >
> +-------------------------------------------------------------------------------
> > +#include "tst_test.h"
> > +
> > +static void run(void)
> > +{
> > +     ...
> > +
> > +     tst_cgroup_move_current(PATH_TMP_CG1_MEM);
> > +     tst_cgroup_mem_set_maxbytes(PATH_TMP_CG1_MEM, MEMSIZE);
>
> Goal for API is to hide differences between cgroup 1/2, but example above
> is passing cgroup specific directory.
>

Sorry for the misleading info, actually that's no different to use any
directory whatever you pass via parameter, it will recognize cgroup
version to be mounted intelligently.

Here as I commented in the last email. the specific dir are typos which
inherent from patch v1. We should fix them.


>
> My suggestion was to have directory parameter relative to cgroup mount,
>

Patch v2 is already achieved this even includes more functions(i.e mount
many same cgroup).



> I didn't consider there would be need for mounting cgroup more than once
> from single process. Is there such need?
>

Yes right, the test21.c mounting many cgroups in a single process is just a
test
 to verify these APIs works fine, it meaningless in real situations.


>
> Since there's only one global 'tst_cgroup_mnt_path', is there need to have
> paths absolute? If we assume that single process will mount cgroup only
> once,
> then all paths could be relative to 'tst_cgroup_mnt_path', and test doesn't
> need to even use 'tst_cgroup_mnt_path'.
>

No, the global 'tst_cgroup_mnt_path' is not only to pass mount directory but
also for storing path when searching from get_cgroup_get_path().

Why we need this? Because, if a testcase(i.e oom05.c) needs more than one
cgroup
subsystem(memory, cpuset) on RHEL7(cgroup-v1), it should mount two
different
directories and do some knob setting.


>
> > +
> > +static void tst_cgroup_set_path(const char *cgroup_dir)
> > +{
> > +     struct tst_cgroup_path *tst_cgroup_path, *a;
> > +
> > +     if (!cgroup_dir)
> > +             tst_brk(TBROK, "Invalid cgroup dir, plese check
> cgroup_dir");
> > +
> > +     sprintf(tst_cgroup_mnt_path, "%s", cgroup_dir);
> > +     sprintf(tst_cgroup_new_path, "%s/ltp_%d", cgroup_dir, rand());
> > +
> > +     /* To store cgroup path in the shared 'path' list */
> > +     tst_cgroup_path = SAFE_MMAP(NULL, (sizeof(struct tst_cgroup_path)),
> > +                     PROT_READ | PROT_WRITE, MAP_ANONYMOUS |
> MAP_SHARED, -1, 0);
>
> I'm not sure I understand what is the reason to have tst_cgroup_path. Is
> it expected,
> that mount and umount are called by different processes? It might be easier
>

The shared 'tst_cgroup_path' is necessary especially for mounting
different cgoups in setup(). Otherwise, it would be easy to get lost
which directory for kind of cgroup type.

And the worth to say, the random directory name for same cgroup
mounting is also on purpose, though we mount same(i.e memory)
cgroup in two places it still belongs to the one hierarchy, and create
the same name of the new directory will be hit an error in EEXIST.

static void tst_cgroup_set_path(const char *cgroup_dir)
{
    ...
    sprintf(tst_cgroup_mnt_path, "%s", cgroup_dir);
    sprintf(tst_cgroup_new_path, "%s/ltp_%d", cgroup_dir, rand());
}



> to define API as per-process and require same process to call mount and
> umount.
>
> > +     tst_cgroup_path->mnt_path =
> SAFE_MALLOC(strlen(tst_cgroup_mnt_path));
> > +     tst_cgroup_path->new_path =
> SAFE_MALLOC(strlen(tst_cgroup_new_path));
>
> Pointers are in shared memory, but content they point to is not, so it's
> accessible
> only from process that called tst_cgroup_set_path().
>

Good catch. This should be also use shared memory.


>
> Can you describe all different scenarios you wanted to support?
>

Sure, we have to consider many scenarios:

1. mount only one cgroup in a single process on the system support cgroup
v1 or v2 (i.e ksm03.c)

#include "tst_cgroup.h"
#define PATH_CGROUP  /tmp/cgroup

static void run(void)
{
    tst_cgroup_move_current(PATH_CGROUP);
    tst_cgroup_mem_set_maxbytes(PATH_CGROUP, 1024*1024*1024);
    // do your test
}

static void setup(void)
{
    tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP);
}

static void cleanup(void)
{
    tst_cgroup_umount(PATH_CGROUP);
}

static struct tst_test test = {
    ...
    .test_all = run,
};


2. mount different cgroups in a single process on the system only support
cgroup-v1 (i.e ksm04.c, oom05.c)

#include "tst_cgroup.h"
#define PATH_CGROUP1  /tmp/cgroup1
#define PATH_CGROUP2  /tmp/cgroup2

static void run(void)
{
    tst_cgroup_move_current(PATH_CGROUP1);
    tst_cgroup_move_current(PATH_CGROUP2);

    // we have to recognize the correct cgroup path if we
    // mount two or more cgroup subsystems in a single
    // process, in case we get lost in knob setting

    // the tst_cgroup_get_path() helps to find and get
    // correct path in tst_cgroup_mnt_path, tst_cgroup_new_path

    // that's also the reason why we need a shared list to
    // store many cgoup pathes. And, this is extendible for
    // mounting more cgroup subsystems in the future.

    tst_cgroup_mem_set_maxbytes(PATH_CGROUP1, 1024*1024*1024);
    // some cpuset configration
}

static void setup(void)
{
    tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP1);
    tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_CGROUP2);
}

static void cleanup(void)
{
    tst_cgroup_umount(PATH_CGROUP1);
    tst_cgroup_umount(PATH_CGROUP2);
}

static struct tst_test test = {
    ...
    .test_all = run,
};


3. mount different cgroups in different process on the system support v1 or
v2

#include "tst_cgroup.h"
#define PATH_CGROUP1  /tmp/cgroup1
#define PATH_CGROUP2  /tmp/cgroup2

static void run(void)
{
    if (fork() == 0) {
        tst_cgroup_move_current(PATH_CGROUP1);
        tst_cgroup_mem_set_maxbytes(PATH_CGROUP1, 1024*1024*1024);
        // test code
    }

    tst_cgroup_move_current(PATH_CGROUP2);
    // some cpuset configuration
    // and test code
}

static void setup(void)
{
    // we do cgroup mount work unified in setup()
    // whatever the cgroup is being used in the parent
    // or children, there is also no need to care about the
    // details of cgroup v1 or v2.

    tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP1);
    tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_CGROUP2);
}

static void cleanup(void)
{
    tst_cgroup_umount(PATH_CGROUP1);
    tst_cgroup_umount(PATH_CGROUP2);
}

static struct tst_test test = {
    ...
    .test_all = run,
};


4. mount same cgroup in different process on the system support v1 or v2

#include "tst_cgroup.h"
#define PATH_CGROUP1  /tmp/cgroup1
#define PATH_CGROUP2  /tmp/cgroup2

static void run(void)
{
    if (fork() == 0) {
        tst_cgroup_move_current(PATH_CGROUP1);
        tst_cgroup_mem_set_maxbytes(PATH_CGROUP1, 1024*1024*1024);
        // test code1
    }

        tst_cgroup_move_current(PATH_CGROUP2);
        tst_cgroup_mem_set_maxbytes(PATH_CGROUP2, 2048*2048);
        // test code2
}

static void setup(void)
{
    // we mount two memory cgroup in the parent
    // but setting different value in corresponding
    // knob for different process to test more configration

    tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP1);
    tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP2);
}

static void cleanup(void)
{
    tst_cgroup_umount(PATH_CGROUP1);
    tst_cgroup_umount(PATH_CGROUP2);
}

static struct tst_test test = {
    ...
    .test_all = run,
};


5. mount many cgroups on different process for future extendible work
i.e.

// tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP1);
// tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_CGROUP2);
// tst_cgroup_mount(TST_CGROUP_CPUACT, PATH_CGROUP3);
// tst_cgroup_mount(TST_CGROUP_PIDSCG,  PATH_CGROUP4);
// tst_cgroup_mount(TST_CGROUP_HUGTLB, PATH_CGROUP5);
// ...


Btw, I attach the patch v2.1 for better readable.

-- 
Regards,
Li Wang

--0000000000001ce08605a7128bbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Jan,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jun 1, 2020 at 9:57 PM Jan Stancek &lt;<=
a href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<br>
<br>
----- Original Message -----<br>
&gt; +<br>
&gt; +[source,c]<br>
&gt; +---------------------------------------------------------------------=
----------<br>
&gt; +#include &quot;tst_test.h&quot;<br>
&gt; +<br>
&gt; +static void run(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0...<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_cgroup_move_current(PATH_TMP_CG1_MEM);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_cgroup_mem_set_maxbytes(PATH_TMP_CG1_MEM, MEM=
SIZE);<br>
<br>
Goal for API is to hide differences between cgroup 1/2, but example above<b=
r>
is passing cgroup <span class=3D"gmail_default" style=3D"font-size:small"><=
/span>specific directory.<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">Sorry for the misleading info, ac=
tually that&#39;s no different to use any</div><div class=3D"gmail_default"=
 style=3D"font-size:small">directory=C2=A0whatever you pass via parameter, =
it will recognize cgroup</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">version to be mounted intelligently.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Here as I commented in the last email. the specific d=
ir are typos which</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">inherent from patch v1. We should fix them.</div></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
My suggestion was to have directory parameter relative to cgroup mount,<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">Patch v2 is already achieved this even includes more functions=
(i.e mount many same cgroup).</div><br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
I didn&#39;t consider there would be need for mounting cgroup more than onc=
e<br>
from single process. Is there such need?<br></blockquote><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">Yes right, the tes=
t21.c mounting many cgroups in a single process is just a test</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">=C2=A0to verify these APIs =
works fine, it meaningless in real situations.</div></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Since there&#39;s only one global &#39;tst_cgroup_mnt_path&#39;, is there n=
eed to have<br>
paths absolute? If we assume that single process will mount cgroup only onc=
e,<br>
then all paths could be relative to &#39;tst_cgroup_mnt_path&#39;, and test=
 doesn&#39;t<br>
need to even use &#39;tst_cgroup_mnt_path&#39;.<br></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">No, the glo=
bal &#39;tst_cgroup_mnt_path&#39; is not only to pass mount directory but</=
div><div class=3D"gmail_default" style=3D"font-size:small">also for storing=
 path when searching=C2=A0from get_cgroup_get_path().</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Why we need this? Because, if a testcase(i.e o=
om05.c) needs more than one cgroup<br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">subsystem(memory, cpuset) on RHEL7(cgroup-v1), it s=
hould mount two different=C2=A0</div><div class=3D"gmail_default" style=3D"=
font-size:small">directories and do some knob setting.</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +static void tst_cgroup_set_path(const char *cgroup_dir)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tst_cgroup_path *tst_cgroup_path, *a;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!cgroup_dir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;=
Invalid cgroup dir, plese check cgroup_dir&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprintf(tst_cgroup_mnt_path, &quot;%s&quot;, cgro=
up_dir);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprintf(tst_cgroup_new_path, &quot;%s/ltp_%d&quot=
;, cgroup_dir, rand());<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* To store cgroup path in the shared &#39;path&#=
39; list */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_cgroup_path =3D SAFE_MMAP(NULL, (sizeof(struc=
t tst_cgroup_path)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_SHARED, -1, 0);<br>
<br>
I&#39;m not sure I understand what is the reason to have tst_cgroup_path. I=
s it expected,<br>
that mount and umount are called by different processes? It might be easier=
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">The shared &#39;tst_cgroup_path&#39; is necessary especial=
ly for mounting</div><div class=3D"gmail_default" style=3D"font-size:small"=
>different cgoups=C2=A0in setup(). Otherwise, it would be easy to get lost<=
/div><div class=3D"gmail_default" style=3D"font-size:small">which directory=
 for kind of cgroup type.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>And the worth to say, the random directory=C2=A0name for same cgroup</div>=
<div class=3D"gmail_default" style=3D"font-size:small">mounting is also on =
purpose, though we mount same(i.e memory)=C2=A0</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">cgroup in two places it still belongs to t=
he one hierarchy, and create=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small">the same name of the new directory=C2=A0will be hit an=
 error=C2=A0in EEXIST.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">st=
atic void tst_cgroup_set_path(const char *cgroup_dir)<br>{<br>=C2=A0 =C2=A0=
 ...<br>=C2=A0 =C2=A0 sprintf(tst_cgroup_mnt_path, &quot;%s&quot;, cgroup_d=
ir);<br>=C2=A0 =C2=A0 sprintf(tst_cgroup_new_path, &quot;%s/ltp_%d&quot;, c=
group_dir, rand());<br></div><div class=3D"gmail_default" style=3D"font-siz=
e:small">}</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
to define API as per-process and require same process to call mount and umo=
unt.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_cgroup_path-&gt;mnt_path =3D SAFE_MALLOC(strl=
en(tst_cgroup_mnt_path));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_cgroup_path-&gt;new_path =3D SAFE_MALLOC(strl=
en(tst_cgroup_new_path));<br>
<br>
Pointers are in shared memory, but content they point to is not, so it&#39;=
s accessible<br>
only from process that called tst_cgroup_set_path().<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Good c=
atch. This should be also use shared memory.</div></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Can you describe all different scenarios you wanted to support?<br></blockq=
uote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Sure, we have to consider many scenarios:</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">1. mount only one cgroup in a single process on the system=
=C2=A0support cgroup v1 or v2 (i.e ksm03.c)</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">#include &quot;tst_cgroup.h&quot;<br>#define PATH_CGRO=
UP=C2=A0 /tmp/cgroup</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br>static void run(void)<br>{<br>=C2=A0 =C2=A0 tst_cgroup_move_curre=
nt(PATH_CGROUP);<br>=C2=A0 =C2=A0 tst_cgroup_mem_set_maxbytes(PATH_CGROUP, =
1024*1024*1024);<br>=C2=A0 =C2=A0 // do your test<br>}<br><br>static void s=
etup(void)<br>{<br>=C2=A0 =C2=A0 tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CG=
ROUP);<br>}<br><br>static void cleanup(void)<br>{<br>=C2=A0 =C2=A0 tst_cgro=
up_umount(PATH_CGROUP);<br>}<br><br>static struct tst_test test =3D {<br>=
=C2=A0 =C2=A0 ...<br>=C2=A0 =C2=A0 .test_all =3D run,<br>};<br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">2. mount different cgroups in a single process on the system=
 only support cgroup-v1 (i.e ksm04.c, oom05.c)</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">#include &quot;tst_cgroup.h&quot;<br>#define PATH_CGR=
OUP1=C2=A0 /tmp/cgroup1</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">#define PATH_CGROUP2=C2=A0 /tmp/cgroup2<br><br>static void run(voi=
d)<br>{<br>=C2=A0 =C2=A0 tst_cgroup_move_current(PATH_CGROUP1);</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 tst_cgroup_m=
ove_current(PATH_CGROUP2);</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">=C2=A0 =C2=A0 // we have to recognize the correct cgroup path if we</div>=
<div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 // mou=
nt two or more cgroup subsystems in a single</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">=C2=A0 =C2=A0 // process, in case we get lost=
 in knob setting</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =
=C2=A0 // the tst_cgroup_get_path() helps to find and get</div><div class=
=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 // correct path =
in tst_cgroup_mnt_path, tst_cgroup_new_path</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 =C2=A0 // that&#39;s also the reason why we nee=
d a shared list to</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">=C2=A0 =C2=A0 // store many cgoup=C2=A0pathes. And, this is extendible =
for=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0 =C2=A0 // mounting more cgroup subsystems in the future.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br>=C2=A0 =C2=A0 tst_cgroup_=
mem_set_maxbytes(PATH_CGROUP1, 1024*1024*1024);</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">=C2=A0 =C2=A0 // some cpuset configration<=
br>}<br><br>static void setup(void)<br>{<br>=C2=A0 =C2=A0 tst_cgroup_mount(=
TST_CGROUP_MEMCG, PATH_CGROUP1);</div><div class=3D"gmail_default" style=3D=
"font-size:small">=C2=A0 =C2=A0 tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_CG=
ROUP2);<br>}<br><br>static void cleanup(void)<br>{<br>=C2=A0 =C2=A0 tst_cgr=
oup_umount(PATH_CGROUP1);</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">=C2=A0 =C2=A0 tst_cgroup_umount(PATH_CGROUP2);<br>}<br><br>stati=
c struct tst_test test =3D {<br>=C2=A0 =C2=A0 ...<br>=C2=A0 =C2=A0 .test_al=
l =3D run,<br>};<br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">3. mount diffe=
rent cgroups in different process on the system support v1 or v2</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">#include &quot;tst_cgroup.h&q=
uot;</div><div class=3D"gmail_default">#define PATH_CGROUP1=C2=A0 /tmp/cgro=
up1</div><div class=3D"gmail_default">#define PATH_CGROUP2=C2=A0 /tmp/cgrou=
p2<br><br>static void run(void)<br>{</div><div class=3D"gmail_default">=C2=
=A0 =C2=A0 if (fork() =3D=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup=
_move_current(PATH_CGROUP1);</div><div class=3D"gmail_default">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tst_cgroup_mem_set_maxbytes(PATH_CGROUP1, 1024*1024*1024)=
;</div><div class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 // test cod=
e</div><div class=3D"gmail_default">=C2=A0 =C2=A0 }<br></div><div class=3D"=
gmail_default"><br></div><div class=3D"gmail_default"><div class=3D"gmail_d=
efault">=C2=A0 =C2=A0 tst_cgroup_move_current(PATH_CGROUP2);</div><div clas=
s=3D"gmail_default">=C2=A0 =C2=A0 // some cpuset configuration=C2=A0</div><=
div class=3D"gmail_default">=C2=A0 =C2=A0 // and test code<br></div>}<br><b=
r>static void setup(void)<br>{</div><div class=3D"gmail_default">=C2=A0 =C2=
=A0 // we do cgroup mount work unified in setup()</div><div class=3D"gmail_=
default">=C2=A0 =C2=A0 // whatever the cgroup is being used in the parent</=
div><div class=3D"gmail_default">=C2=A0 =C2=A0 // or children, there is als=
o no need to care about the</div><div class=3D"gmail_default">=C2=A0 =C2=A0=
 // details of cgroup v1 or v2.</div><div class=3D"gmail_default"><br>=C2=
=A0 =C2=A0 tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP1);</div><div clas=
s=3D"gmail_default">=C2=A0 =C2=A0 tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_=
CGROUP2);<br>}<br><br>static void cleanup(void)<br>{<br>=C2=A0 =C2=A0 tst_c=
group_umount(PATH_CGROUP1);</div><div class=3D"gmail_default">=C2=A0 =C2=A0=
 tst_cgroup_umount(PATH_CGROUP2);<br>}<br><br>static struct tst_test test =
=3D {<br>=C2=A0 =C2=A0 ...<br>=C2=A0 =C2=A0 .test_all =3D run,<br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">};</div><div><br></div>=
<div><br></div><div class=3D"gmail_default" style=3D"font-size:small">4. mo=
unt same cgroup in different process on the system support v1 or v2</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">#include &quot;tst_cgroup.h&qu=
ot;</div><div class=3D"gmail_default">#define PATH_CGROUP1=C2=A0 /tmp/cgrou=
p1</div><div class=3D"gmail_default">#define PATH_CGROUP2=C2=A0 /tmp/cgroup=
2<br><br>static void run(void)<br>{</div><div class=3D"gmail_default">=C2=
=A0 =C2=A0 if (fork() =3D=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup=
_move_current(PATH_CGROUP1);</div><div class=3D"gmail_default">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tst_cgroup_mem_set_maxbytes(PATH_CGROUP1, 1024*1024*1024)=
;</div><div class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 // test cod=
e1</div><div class=3D"gmail_default">=C2=A0 =C2=A0 }<br></div><div class=3D=
"gmail_default"><br></div><div class=3D"gmail_default"><div class=3D"gmail_=
default"><div class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgrou=
p_move_current(PATH_CGROUP2);</div><div class=3D"gmail_default">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tst_cgroup_mem_set_maxbytes(PATH_CGROUP2, 2048*2048);</di=
v><div class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 // test code2</d=
iv></div>}<br><br>static void setup(void)<br>{</div><div class=3D"gmail_def=
ault">=C2=A0 =C2=A0 // we mount two memory cgroup in the parent</div><div c=
lass=3D"gmail_default">=C2=A0 =C2=A0 // but setting different value in corr=
esponding=C2=A0</div><div class=3D"gmail_default">=C2=A0 =C2=A0 // knob for=
 different process to test more configration</div><div class=3D"gmail_defau=
lt"><br>=C2=A0 =C2=A0 tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP1);</di=
v><div class=3D"gmail_default">=C2=A0 =C2=A0 tst_cgroup_mount(TST_CGROUP_ME=
MCG, PATH_CGROUP2);<br>}<br><br>static void cleanup(void)<br>{<br>=C2=A0 =
=C2=A0 tst_cgroup_umount(PATH_CGROUP1);</div><div class=3D"gmail_default">=
=C2=A0 =C2=A0 tst_cgroup_umount(PATH_CGROUP2);<br>}<br><br>static struct ts=
t_test test =3D {<br>=C2=A0 =C2=A0 ...<br>=C2=A0 =C2=A0 .test_all =3D run,<=
br></div><div class=3D"gmail_default" style=3D"font-size:small">};</div><di=
v><br></div><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">5. mount many cgroups on different process for future extendibl=
e work</div><div class=3D"gmail_default" style=3D"font-size:small">i.e.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">// tst_cgroup_mount(TST_CGRO=
UP_MEMCG, PATH_CGROUP1);</div><div class=3D"gmail_default">// tst_cgroup_mo=
unt(TST_CGROUP_CPUSET, PATH_CGROUP2);</div><div class=3D"gmail_default"><di=
v class=3D"gmail_default">// tst_cgroup_mount(TST_CGROUP_CPUACT, PATH_CGROU=
P3);</div><div class=3D"gmail_default"><div class=3D"gmail_default">// tst_=
cgroup_mount(TST_CGROUP_PIDSCG,=C2=A0 PATH_CGROUP4);</div><div class=3D"gma=
il_default"><div class=3D"gmail_default">// tst_cgroup_mount(TST_CGROUP_HUG=
TLB, PATH_CGROUP5);</div></div></div></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">// ...</div><br></div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Btw, I attach the patch v2.1 f=
or better readable.</div></div><div><br></div>-- <br><div dir=3D"ltr"><div =
dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000001ce08605a7128bbe--

--0000000000001ce08905a7128bc0
Content-Type: text/x-patch; charset="UTF-8"; name="0001-lib-add-new-cgroup-test-API.patch"
Content-Disposition: attachment; 
	filename="0001-lib-add-new-cgroup-test-API.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kaxfofz30>
X-Attachment-Id: f_kaxfofz30

RnJvbSBjNjkxMmMxMGY3YjliMTZhYTVkYmJmOTg3NTI4ZGE5MDlkOTMyMTIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KRGF0ZTogVHVl
LCAxOSBNYXkgMjAyMCAxNjo1ODozMiArMDgwMApTdWJqZWN0OiBbUEFUQ0ggdjIuMSAxLzRdIGxp
YjogYWRkIG5ldyBjZ3JvdXAgdGVzdCBBUEkKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKCk1hbnkgb2Ygb3VyIExUUCB0ZXN0cyBuZWVkIENvbnRyb2wgR3JvdXAgaW4gdGhlIGNvbmZp
Z3VyYXRpb24sCnRoaXMgcGF0Y2ggbWFrZXMgY2dyb3VwIHVuaWZpZWQgbW91bnRpbmcgYXQgc2V0
dXAgcGhhc2UgdG8gYmUKcG9zc2libGUuIFRoZSBtZXRob2TCoGlzIGV4dHJhY3RlZCBmcm9tIG1l
bS5oIHdpdGggdGhlIHB1cnBvc2UKb2bCoGV4dGVuZGlibGUgZm9yIGZ1cnRoZXIgZGV2ZWxvcGlu
ZywgYW5kIHRyeWluZ8KgdG8gY29tcGF0aWJsZQp0aGUgY3VycmVudCB0d28gdmVyc2lvbnMgb2Yg
Y2dyb3VwLAoKSXQncyBoYXJkIHRvIG1ha2UgYWxsIEFQSXMgYmUgc3RyaWN0bHkgY29uc2lzdGVu
dCBiZWNhdXNlIHRoZXJlCmFyZSBtYW55IGRpZmZlcmVuY2VzIGJldHdlZW4gdjEgYW5kIHYyLiBC
dXQgaXTCoGNhcHN1bGF0ZSB0aGUgZGV0YWlsCm9mIGNncm91cCBtb3VudGluZyBpbiBoaWdoLWxl
dmVsIGZ1bmN0aW9ucywgd2hpY2ggd2lsbCBiZSBlYXNpZXIKdG8gdXNlIGNncm91cCB3aXRob3V0
IGNvbnNpZGVyaW5nIHRvbyBtdWNoIHRlY2huaWNhbCB0aGluZy7CoCDCoAoKQnR3LCB0ZXN0IGdl
dCBwYXNzZWQgb24gUkhFTDcoeDg2XzY0KSwgUkhFTDgocHBjNjRsZSksIEZlZG9yYTMyKHg4Nl82
NCkuCgpTaWduZWQtb2ZmLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KLS0tCiBkb2Mv
dGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0IHwgIDQ0ICsrKysrCiBpbmNsdWRlL3RzdF9jZ3Jv
dXAuaCAgICAgICAgICAgIHwgIDM3ICsrKysKIGluY2x1ZGUvdHN0X3Rlc3QuaCAgICAgICAgICAg
ICAgfCAgIDEgKwogbGliL25ld2xpYl90ZXN0cy90ZXN0MjEuYyAgICAgICB8ICA3NiArKysrKysr
CiBsaWIvdHN0X2Nncm91cC5jICAgICAgICAgICAgICAgIHwgMzM5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDQ5NyBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS90c3RfY2dyb3VwLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBs
aWIvbmV3bGliX3Rlc3RzL3Rlc3QyMS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3RzdF9jZ3Jv
dXAuYwoKZGlmZiAtLWdpdCBhL2RvYy90ZXN0LXdyaXRpbmctZ3VpZGVsaW5lcy50eHQgYi9kb2Mv
dGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0CmluZGV4IDkzY2E1MDZkOS4uNDJiMzYwZGEwIDEw
MDY0NAotLS0gYS9kb2MvdGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0CisrKyBiL2RvYy90ZXN0
LXdyaXRpbmctZ3VpZGVsaW5lcy50eHQKQEAgLTIwNTMsNiArMjA1Myw1MCBAQCB0aGUgcHJlZml4
IGZpZWxkIG9mIGZpbGUgcG9pbnRlZCBieSBwYXRoIGVxdWFscyB0byB0aGUgdmFsdWUgcGFzc2Vk
IHRvIHRoaXMgZnVuYwogQWxzbyBoYXZpbmcgYSBzaW1pbGFyIGFwaSBwYWlyIFRTVF9BU1NFUlRf
RklMRV9JTlQvU1RSKHBhdGgsIHByZWZpeCwgdmFsKSB0byBhc3NlcnQKIHRoZSBmaWVsZCB2YWx1
ZSBvZiBmaWxlLgogCisyLjIuMzYgVXNpbmcgQ29udHJvbCBHcm91cAorXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl4KK1NvbWUgb2YgTFRQIHRlc3RzIG5lZWQgQ29udHJvbCBHcm91cCBpbiB0aGVp
ciBjb25maWd1cmF0aW9uLCB0c3RfY2dyb3VwLmggcHJvdmlkZXMKK0FQSXMgdG8gbWFrZSBjZ3Jv
dXAgdW5pZmllZCBtb3VudGluZyBhdCBzZXR1cCBwaGFzZSB0byBiZSBwb3NzaWJsZS4gVGhlIG1l
dGhvZMKgaXMKK2V4dHJhY3RlZCBmcm9tIG1lbS5oIHdpdGggdGhlIHB1cnBvc2Ugb2bCoGV4dGVu
ZGlibGUgZm9yIGZ1cnRoZXIgZGV2ZWxvcGluZywgYW5kCit0cnlpbmcgdG8gY29tcGF0aWJsZSB0
aGUgY3VycmVudCB0d28gdmVyc2lvbnMgb2YgY2dyb3VwLgorCitDb25zaWRlcmluZyB0aGVyZSBh
cmUgbWFueSBkaWZmZXJlbmNlcyBiZXR3ZWVuIGNncm91cCB2MSBhbmQgdjIsIGhlcmUgd2UgY2Fw
c3VsYXRlCit0aGUgZGV0YWlsIG9mIGNncm91cCBtb3VudGluZyBpbiBoaWdoLWxldmVsIGZ1bmN0
aW9ucywgd2hpY2ggd2lsbCBiZSBlYXNpZXIgdG8gdXNlCitjZ3JvdXAgd2l0aG91dCBjYXJpbmcg
YWJvdXQgdG9vIG11Y2ggdGVjaG5pY2FsIHRoaW5nLsKgIMKgCisKK0Fsc28sIHdlIGRvIGNncm91
cCBtb3VudC91bW91bnQgd29yayBmb3IgdGhlIGRpZmZlcmVudCBoaWVyYXJjaHkgYXV0b21hdGlj
YWxseS4KKworW3NvdXJjZSxjXQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorI2luY2x1ZGUgInRz
dF90ZXN0LmgiCisKK3N0YXRpYyB2b2lkIHJ1bih2b2lkKQoreworCS4uLgorCisJdHN0X2Nncm91
cF9tb3ZlX2N1cnJlbnQoUEFUSF9UTVBfQ0dfTUVNKTsKKwl0c3RfY2dyb3VwX21lbV9zZXRfbWF4
Ynl0ZXMoUEFUSF9UTVBfQ0dfTUVNLCBNRU1TSVpFKTsKKworCS8vIGRvIHRlc3QgdW5kZXIgY2dy
b3VwCisJLi4uCit9CisKK3N0YXRpYyB2b2lkIHNldHVwKHZvaWQpCit7CisJdHN0X2Nncm91cF9t
b3VudChUU1RfQ0dST1VQX01FTUNHLCBQQVRIX1RNUF9DR19NRU0pOworfQorCitzdGF0aWMgdm9p
ZCBjbGVhbnVwKHZvaWQpCit7CisJdHN0X2Nncm91cF91bW91bnQoUEFUSF9UTVBfQ0dfTUVNKTsK
K30KKworc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CisJLnRlc3RfYWxsID0gcnVuLAorCS4uLgor
fTsKKworLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMi4zIFdyaXRpbmcgYSB0ZXN0Y2FzZSBpbiBz
aGVsbAogfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogCmRpZmYgLS1naXQgYS9pbmNs
dWRlL3RzdF9jZ3JvdXAuaCBiL2luY2x1ZGUvdHN0X2Nncm91cC5oCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMC4uZGIxMjNlOWJlCi0tLSAvZGV2L251bGwKKysrIGIvaW5jbHVk
ZS90c3RfY2dyb3VwLmgKQEAgLTAsMCArMSwzNyBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKy8qCisgKiBDb3B5cmlnaHQgKGMpIDIwMjAgUmVkIEhhdCwg
SW5jLgorICogQ29weXJpZ2h0IChjKSAyMDIwIExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgor
ICovCisKKyNpZm5kZWYgVFNUX0NHUk9VUF9ICisjZGVmaW5lIFRTVF9DR1JPVVBfSAorCisjZGVm
aW5lIFBBVEhfVE1QX0NHX01FTQkiL3RtcC9jZ19tZW0iCisjZGVmaW5lIFBBVEhfVE1QX0NHX0NT
VAkiL3RtcC9jZ19jc3QiCisKK2VudW0gdHN0X2Nncm91cF92ZXIgeworCVRTVF9DR1JPVVBfVjEg
PSAxLAorCVRTVF9DR1JPVVBfVjIgPSAyLAorfTsKKworZW51bSB0c3RfY2dyb3VwX2N0cmwgewor
CVRTVF9DR1JPVVBfTUVNQ0cgPSAxLAorCVRTVF9DR1JPVVBfQ1BVU0VUID0gMiwKKwkvKiBhZGQg
Y2dyb3VwIGNvbnRyb2xsZXIgKi8KK307CisKK2V4dGVybiBjaGFyIHRzdF9jZ3JvdXBfbW50X3Bh
dGhbUEFUSF9NQVhdOworZXh0ZXJuIGNoYXIgdHN0X2Nncm91cF9uZXdfcGF0aFtQQVRIX01BWF07
CitleHRlcm4gY2hhciB0c3RfY2dyb3VwX2N0bF9rbm9iW1BBVEhfTUFYXTsKKworZW51bSB0c3Rf
Y2dyb3VwX3ZlciB0c3RfY2dyb3VwX3ZlcnNpb24odm9pZCk7Cit2b2lkIHRzdF9jZ3JvdXBfbW91
bnQoZW51bSB0c3RfY2dyb3VwX2N0cmwgY3RybCwgY29uc3QgY2hhciAqY2dyb3VwX2Rpcik7Cit2
b2lkIHRzdF9jZ3JvdXBfdW1vdW50KGNvbnN0IGNoYXIgKmNncm91cF9kaXIpOwordm9pZCB0c3Rf
Y2dyb3VwX3NldF9rbm9iKGNvbnN0IGNoYXIgKmNncm91cF9kaXIsIGNvbnN0IGNoYXIgKmtub2Is
IGxvbmcgdmFsdWUpOwordm9pZCB0c3RfY2dyb3VwX21vdmVfY3VycmVudChjb25zdCBjaGFyICpj
Z3JvdXBfZGlyKTsKK3ZvaWQgdHN0X2Nncm91cF9tZW1fc2V0X21heGJ5dGVzKGNvbnN0IGNoYXIg
KmNncm91cF9kaXIsIGxvbmcgbWVtc3opOworaW50IHRzdF9jZ3JvdXBfbWVtX3N3YXBhY2N0X2Vu
YWJsZWQoY29uc3QgY2hhciAqY2dyb3VwX2Rpcik7Cit2b2lkIHRzdF9jZ3JvdXBfbWVtX3NldF9t
YXhzd2FwKGNvbnN0IGNoYXIgKmNncm91cF9kaXIsIGxvbmcgbWVtc3opOworCisjZW5kaWYgLyog
VFNUX0NHUk9VUF9IICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL3RzdF90ZXN0LmggYi9pbmNsdWRl
L3RzdF90ZXN0LmgKaW5kZXggNWJlZGI0ZjZmLi5iODRmN2I5ZGQgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvdHN0X3Rlc3QuaAorKysgYi9pbmNsdWRlL3RzdF90ZXN0LmgKQEAgLTM5LDYgKzM5LDcgQEAK
ICNpbmNsdWRlICJ0c3RfY2FwYWJpbGl0eS5oIgogI2luY2x1ZGUgInRzdF9odWdlcGFnZS5oIgog
I2luY2x1ZGUgInRzdF9hc3NlcnQuaCIKKyNpbmNsdWRlICJ0c3RfY2dyb3VwLmgiCiAKIC8qCiAg
KiBSZXBvcnRzIHRlc3RjYXNlIHJlc3VsdC4KZGlmZiAtLWdpdCBhL2xpYi9uZXdsaWJfdGVzdHMv
dGVzdDIxLmMgYi9saWIvbmV3bGliX3Rlc3RzL3Rlc3QyMS5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMC4uYzgyZjIwYTcwCi0tLSAvZGV2L251bGwKKysrIGIvbGliL25ld2xp
Yl90ZXN0cy90ZXN0MjEuYwpAQCAtMCwwICsxLDc2IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vci1sYXRlcgorLyoKKyAqIENvcHlyaWdodCAoYykgMjAyMCBSZWQgSGF0
LCBJbmMuCisgKiBDb3B5cmlnaHQgKGMpIDIwMjAgTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+
CisgKi8KKworLyoKKyAqIFRlc3RzIHRzdF9jZ3JvdXAuaCBBUElzCisgKi8KKworI2luY2x1ZGUg
InRzdF90ZXN0LmgiCisjaW5jbHVkZSAidHN0X2Nncm91cC5oIgorCisjZGVmaW5lIFBBVEhfQ0dS
T1VQMSAiL21udC9saXdhbmcxIgorI2RlZmluZSBQQVRIX0NHUk9VUDIgIi9tbnQvbGl3YW5nMiIK
KyNkZWZpbmUgTUVNU0laRSAxMDI0ICogMTAyNAorCitzdGF0aWMgdm9pZCBkb190ZXN0KHZvaWQp
Cit7CisJLyogd2Ugc2hvdWxkIGFzc2lnbiBvbmUgb3IgbW9yZSBtZW1vcnkgbm9kZXMgdG8gY3B1
c2V0Lm1lbXMKKwkgKiBhbmQgY3B1c2V0LmNwdXMsIG90aGVyd2lzZSwgZWNobyAkJCA+IHRhc2tz
IGdpdmVzIOKAnG5vIHNwYWNlCisJICogbGVmdCBvbiBkZXZpY2XigJ0gd2hlbiB0cnlpbmcgdG8g
dXNlIGNwdXNldC4KKwkgKgorCSAqIE9yLCBzZXR0aW5nIGNncm91cC5jbG9uZV9jaGlsZHJlbiB0
byAxIGNhbiBoZWxwIGluIGF1dG9tYXRpY2FsbHkKKwkgKiBpbmhlcml0aW5nIG1lbW9yeSBhbmQg
bm9kZSBzZXR0aW5nIGZyb20gcGFyZW50IGNncm91cCB3aGVuCisJICogYSBjaGlsZCBjZ3JvdXAg
aXMgY3JlYXRlZC4KKwkgKi8KKwl0c3RfY2dyb3VwX3NldF9rbm9iKFBBVEhfVE1QX0NHX0NTVCwg
Ii4uL2Nncm91cC5jbG9uZV9jaGlsZHJlbiIsIDEpOworCisJcGlkX3QgcGlkID0gU0FGRV9GT1JL
KCk7CisKKwlzd2l0Y2ggKHBpZCkgeworCWNhc2UgMDoKKwkJdHN0X2Nncm91cF9tb3ZlX2N1cnJl
bnQoUEFUSF9DR1JPVVAxKTsKKwkJdHN0X2Nncm91cF9tZW1fc2V0X21heGJ5dGVzKFBBVEhfQ0dS
T1VQMSwgTUVNU0laRSk7CisJCXRzdF9jZ3JvdXBfbWVtX3NldF9tYXhzd2FwKFBBVEhfQ0dST1VQ
MSwgTUVNU0laRSk7CisKKwkJdHN0X2Nncm91cF9tb3ZlX2N1cnJlbnQoUEFUSF9DR1JPVVAyKTsK
KworCWJyZWFrOworCWRlZmF1bHQ6CisJCXRzdF9jZ3JvdXBfbW92ZV9jdXJyZW50KFBBVEhfVE1Q
X0NHX0NTVCk7CisKKwkJdHN0X2Nncm91cF9tb3ZlX2N1cnJlbnQoUEFUSF9UTVBfQ0dfTUVNKTsK
KwkJdHN0X2Nncm91cF9tZW1fc2V0X21heGJ5dGVzKFBBVEhfVE1QX0NHX01FTSwgTUVNU0laRSk7
CisJCXRzdF9jZ3JvdXBfbWVtX3NldF9tYXhzd2FwKFBBVEhfVE1QX0NHX01FTSwgTUVNU0laRSk7
CisJYnJlYWs7CisJfQorCisJdHN0X3JlcyhUUEFTUywgIkNncm91cCBtb3VudCB0ZXN0Iik7Cit9
CisKK3N0YXRpYyB2b2lkIHNldHVwKHZvaWQpCit7CisJdHN0X2Nncm91cF9tb3VudChUU1RfQ0dS
T1VQX01FTUNHLCBQQVRIX1RNUF9DR19NRU0pOworCXRzdF9jZ3JvdXBfbW91bnQoVFNUX0NHUk9V
UF9NRU1DRywgUEFUSF9DR1JPVVAxKTsKKworCXRzdF9jZ3JvdXBfbW91bnQoVFNUX0NHUk9VUF9D
UFVTRVQsIFBBVEhfVE1QX0NHX0NTVCk7CisJdHN0X2Nncm91cF9tb3VudChUU1RfQ0dST1VQX01F
TUNHLCBQQVRIX0NHUk9VUDIpOworfQorCitzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCit7CisJ
dHN0X2Nncm91cF91bW91bnQoUEFUSF9UTVBfQ0dfTUVNKTsKKwl0c3RfY2dyb3VwX3Vtb3VudChQ
QVRIX0NHUk9VUDEpOworCisJdHN0X2Nncm91cF91bW91bnQoUEFUSF9UTVBfQ0dfQ1NUKTsKKwl0
c3RfY2dyb3VwX3Vtb3VudChQQVRIX0NHUk9VUDIpOworfQorCitzdGF0aWMgc3RydWN0IHRzdF90
ZXN0IHRlc3QgPSB7CisJLnRlc3RfYWxsID0gZG9fdGVzdCwKKwkuc2V0dXAgPSBzZXR1cCwKKwku
Y2xlYW51cCA9IGNsZWFudXAsCisJLmZvcmtzX2NoaWxkID0gMSwKK307CmRpZmYgLS1naXQgYS9s
aWIvdHN0X2Nncm91cC5jIGIvbGliL3RzdF9jZ3JvdXAuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAuLmM1NDMzMGJhMgotLS0gL2Rldi9udWxsCisrKyBiL2xpYi90c3RfY2dy
b3VwLmMKQEAgLTAsMCArMSwzMzkgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9yLWxhdGVyCisvKgorICogQ29weXJpZ2h0IChjKSAyMDIwIFJlZCBIYXQsIEluYy4KKyAq
IENvcHlyaWdodCAoYykgMjAyMCBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KKyAqLworCisj
ZGVmaW5lIFRTVF9OT19ERUZBVUxUX01BSU4KKworI2luY2x1ZGUgPHN0ZGlvLmg+CisjaW5jbHVk
ZSA8c3RkbGliLmg+CisjaW5jbHVkZSA8c3lzL21vdW50Lmg+CisKKyNpbmNsdWRlICJ0c3RfdGVz
dC5oIgorI2luY2x1ZGUgInRzdF9zYWZlX21hY3Jvcy5oIgorI2luY2x1ZGUgInRzdF9zYWZlX3N0
ZGlvLmgiCisjaW5jbHVkZSAidHN0X2Nncm91cC5oIgorI2luY2x1ZGUgInRzdF9kZXZpY2UuaCIK
KworY2hhciB0c3RfY2dyb3VwX21udF9wYXRoW1BBVEhfTUFYXTsKK2NoYXIgdHN0X2Nncm91cF9u
ZXdfcGF0aFtQQVRIX01BWF07CitjaGFyIHRzdF9jZ3JvdXBfY3RsX2tub2JbUEFUSF9NQVhdOwor
CitzdGF0aWMgZW51bSB0c3RfY2dyb3VwX3ZlciB0c3RfY2dfdmVyOworCitzdHJ1Y3QgdHN0X2Nn
cm91cF9wYXRoIHsKKwljaGFyICptbnRfcGF0aDsKKwljaGFyICpuZXdfcGF0aDsKKwlzdHJ1Y3Qg
dHN0X2Nncm91cF9wYXRoICpuZXh0OworfTsKKworc3RhdGljIHN0cnVjdCB0c3RfY2dyb3VwX3Bh
dGggKnRzdF9jZ3JvdXBfcGF0aGVzOworCitzdGF0aWMgaW50IHRzdF9jZ3JvdXBfY2hlY2soY29u
c3QgY2hhciAqY2dyb3VwKQoreworCWNoYXIgbGluZVtQQVRIX01BWF07CisJRklMRSAqZmlsZTsK
KwlpbnQgY2dfY2hlY2sgPSAwOworCisJZmlsZSA9IFNBRkVfRk9QRU4oIi9wcm9jL2ZpbGVzeXN0
ZW1zIiwgInIiKTsKKwl3aGlsZSAoZmdldHMobGluZSwgc2l6ZW9mKGxpbmUpLCBmaWxlKSkgewor
CQlpZiAoc3Ryc3RyKGxpbmUsIGNncm91cCkgIT0gTlVMTCkgeworCQkJY2dfY2hlY2sgPSAxOwor
CQkJYnJlYWs7CisJCX0KKwl9CisJU0FGRV9GQ0xPU0UoZmlsZSk7CisKKwlyZXR1cm4gY2dfY2hl
Y2s7Cit9CisKK2VudW0gdHN0X2Nncm91cF92ZXIgdHN0X2Nncm91cF92ZXJzaW9uKHZvaWQpCit7
CisJaWYgKHRzdF9jZ3JvdXBfY2hlY2soImNncm91cDIiKSkgeworCQlpZiAoIXRzdF9pc19tb3Vu
dGVkKCJjZ3JvdXAyIikgJiYgdHN0X2lzX21vdW50ZWQoImNncm91cCIpKQorCQkJcmV0dXJuIFRT
VF9DR1JPVVBfVjE7CisJCWVsc2UKKwkJCXJldHVybiBUU1RfQ0dST1VQX1YyOworCX0KKworCWlm
ICh0c3RfY2dyb3VwX2NoZWNrKCJjZ3JvdXAiKSkKKwkJcmV0dXJuIFRTVF9DR1JPVVBfVjE7CisK
Kwl0c3RfYnJrKFRDT05GLCAiQ2dyb3VwIGlzIG5vdCBjb25maWd1cmVkIik7Cit9CisKK3N0YXRp
YyB2b2lkIHRzdF9jZ3JvdXAxX21vdW50KGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKm9w
dGlvbiwKKwkJCWNvbnN0IGNoYXIgKm1udF9wYXRoLCBjb25zdCBjaGFyICpuZXdfcGF0aCkKK3sK
KwlpZiAodHN0X2lzX21vdW50ZWQobW50X3BhdGgpKQorCQlnb3RvIG91dDsKKworCVNBRkVfTUtE
SVIobW50X3BhdGgsIDA3NzcpOworCWlmIChtb3VudChuYW1lLCBtbnRfcGF0aCwgImNncm91cCIs
IDAsIG9wdGlvbikgPT0gLTEpIHsKKwkJaWYgKGVycm5vID09IEVOT0RFVikgeworCQkJaWYgKHJt
ZGlyKG1udF9wYXRoKSA9PSAtMSkKKwkJCQl0c3RfcmVzKFRXQVJOIHwgVEVSUk5PLCAicm1kaXIg
JXMgZmFpbGVkIiwgbW50X3BhdGgpOworCQkJdHN0X2JyayhUQ09ORiwKKwkJCQkgIkNncm91cCB2
MSBpcyBub3QgY29uZmlndXJlZCBpbiBrZXJuZWwiKTsKKwkJfQorCQl0c3RfYnJrKFRCUk9LIHwg
VEVSUk5PLCAibW91bnQgJXMiLCBtbnRfcGF0aCk7CisJfQorCitvdXQ6CisJU0FGRV9NS0RJUihu
ZXdfcGF0aCwgMDc3Nyk7CisKKwl0c3RfcmVzKFRJTkZPLCAiQ2dyb3VwKCVzKSB2MSBtb3VudCBh
dCAlcyBzdWNjZXNzIiwgb3B0aW9uLCBtbnRfcGF0aCk7Cit9CisKK3N0YXRpYyB2b2lkIHRzdF9j
Z3JvdXAyX21vdW50KGNvbnN0IGNoYXIgKm1udF9wYXRoLCBjb25zdCBjaGFyICpuZXdfcGF0aCkK
K3sKKwlpZiAodHN0X2lzX21vdW50ZWQobW50X3BhdGgpKQorCQlnb3RvIG91dDsKKworCVNBRkVf
TUtESVIobW50X3BhdGgsIDA3NzcpOworCWlmIChtb3VudCgiY2dyb3VwMiIsIG1udF9wYXRoLCAi
Y2dyb3VwMiIsIDAsIE5VTEwpID09IC0xKSB7CisJCWlmIChlcnJubyA9PSBFTk9ERVYpIHsKKwkJ
CWlmIChybWRpcihtbnRfcGF0aCkgPT0gLTEpCisJCQkJdHN0X3JlcyhUV0FSTiB8IFRFUlJOTywg
InJtZGlyICVzIGZhaWxlZCIsIG1udF9wYXRoKTsKKwkJCXRzdF9icmsoVENPTkYsCisJCQkJICJD
Z3JvdXAgdjIgaXMgbm90IGNvbmZpZ3VyZWQgaW4ga2VybmVsIik7CisJCX0KKwkJdHN0X2JyayhU
QlJPSyB8IFRFUlJOTywgIm1vdW50ICVzIiwgbW50X3BhdGgpOworCX0KKworb3V0OgorCVNBRkVf
TUtESVIobmV3X3BhdGgsIDA3NzcpOworCisJdHN0X3JlcyhUSU5GTywgIkNncm91cCB2MiBtb3Vu
dCBhdCAlcyBzdWNjZXNzIiwgbW50X3BhdGgpOworfQorCitzdGF0aWMgdm9pZCB0c3RfY2dyb3Vw
Tl91bW91bnQoY29uc3QgY2hhciAqbW50X3BhdGgsIGNvbnN0IGNoYXIgKm5ld19wYXRoKQorewor
CUZJTEUgKmZwOworCWludCBmZDsKKwljaGFyIHNfbmV3W0JVRlNJWl0sIHNbQlVGU0laXSwgdmFs
dWVbQlVGU0laXTsKKworCWlmICghdHN0X2lzX21vdW50ZWQobW50X3BhdGgpKQorCQlyZXR1cm47
CisKKwkvKiBNb3ZlIGFsbCBwcm9jZXNzZXMgaW4gdGFzayh2MjogY2dyb3VwLnByb2NzKSB0byBp
dHMgcGFyZW50IG5vZGUuICovCisJaWYgKHRzdF9jZ192ZXIgJiBUU1RfQ0dST1VQX1YxKQorCQlz
cHJpbnRmKHMsICIlcy90YXNrcyIsIG1udF9wYXRoKTsKKwlpZiAodHN0X2NnX3ZlciAmIFRTVF9D
R1JPVVBfVjIpCisJCXNwcmludGYocywgIiVzL2Nncm91cC5wcm9jcyIsIG1udF9wYXRoKTsKKwor
CWZkID0gb3BlbihzLCBPX1dST05MWSk7CisJaWYgKGZkID09IC0xKQorCQl0c3RfcmVzKFRXQVJO
IHwgVEVSUk5PLCAib3BlbiAlcyIsIHMpOworCisJaWYgKHRzdF9jZ192ZXIgJiBUU1RfQ0dST1VQ
X1YxKQorCQlzbnByaW50ZihzX25ldywgQlVGU0laLCAiJXMvdGFza3MiLCBuZXdfcGF0aCk7CisJ
aWYgKHRzdF9jZ192ZXIgJiBUU1RfQ0dST1VQX1YyKQorCQlzbnByaW50ZihzX25ldywgQlVGU0la
LCAiJXMvY2dyb3VwLnByb2NzIiwgbmV3X3BhdGgpOworCisJZnAgPSBmb3BlbihzX25ldywgInIi
KTsKKwlpZiAoZnAgPT0gTlVMTCkKKwkJdHN0X3JlcyhUV0FSTiB8IFRFUlJOTywgImZvcGVuICVz
Iiwgc19uZXcpOworCWlmICgoZmQgIT0gLTEpICYmIChmcCAhPSBOVUxMKSkgeworCQl3aGlsZSAo
ZmdldHModmFsdWUsIEJVRlNJWiwgZnApICE9IE5VTEwpCisJCQlpZiAod3JpdGUoZmQsIHZhbHVl
LCBzdHJsZW4odmFsdWUpIC0gMSkKKwkJCSAgICAhPSAoc3NpemVfdClzdHJsZW4odmFsdWUpIC0g
MSkKKwkJCQl0c3RfcmVzKFRXQVJOIHwgVEVSUk5PLCAid3JpdGUgJXMiLCBzKTsKKwl9CisJaWYg
KGZkICE9IC0xKQorCQljbG9zZShmZCk7CisJaWYgKGZwICE9IE5VTEwpCisJCWZjbG9zZShmcCk7
CisJaWYgKHJtZGlyKG5ld19wYXRoKSA9PSAtMSkKKwkJdHN0X3JlcyhUV0FSTiB8IFRFUlJOTywg
InJtZGlyICVzIiwgbmV3X3BhdGgpOworCWlmICh1bW91bnQobW50X3BhdGgpID09IC0xKQorCQl0
c3RfcmVzKFRXQVJOIHwgVEVSUk5PLCAidW1vdW50ICVzIiwgbW50X3BhdGgpOworCWlmIChybWRp
cihtbnRfcGF0aCkgPT0gLTEpCisJCXRzdF9yZXMoVFdBUk4gfCBURVJSTk8sICJybWRpciAlcyIs
IG1udF9wYXRoKTsKKworCWlmICh0c3RfY2dfdmVyICYgVFNUX0NHUk9VUF9WMSkKKwkJdHN0X3Jl
cyhUSU5GTywgIkNncm91cCB2MSB1bm1vdW50IHN1Y2Nlc3MiKTsKKwlpZiAodHN0X2NnX3ZlciAm
IFRTVF9DR1JPVVBfVjIpCisJCXRzdF9yZXMoVElORk8sICJDZ3JvdXAgdjIgdW5tb3VudCBzdWNj
ZXNzIik7Cit9CisKK3N0YXRpYyB2b2lkIHRzdF9jZ3JvdXBfc2V0X3BhdGgoY29uc3QgY2hhciAq
Y2dyb3VwX2RpcikKK3sKKwlzdHJ1Y3QgdHN0X2Nncm91cF9wYXRoICp0c3RfY2dyb3VwX3BhdGgs
ICphOworCisJaWYgKCFjZ3JvdXBfZGlyKQorCQl0c3RfYnJrKFRCUk9LLCAiSW52YWxpZCBjZ3Jv
dXAgZGlyLCBwbGVzZSBjaGVjayBjZ3JvdXBfZGlyIik7CisKKwlzcHJpbnRmKHRzdF9jZ3JvdXBf
bW50X3BhdGgsICIlcyIsIGNncm91cF9kaXIpOworCXNwcmludGYodHN0X2Nncm91cF9uZXdfcGF0
aCwgIiVzL2x0cF8lZCIsIGNncm91cF9kaXIsIHJhbmQoKSk7CisKKwkvKiBUbyBzdG9yZSBjZ3Jv
dXAgcGF0aCBpbiB0aGUgc2hhcmVkICdwYXRoJyBsaXN0ICovCisJdHN0X2Nncm91cF9wYXRoID0g
U0FGRV9NTUFQKE5VTEwsIChzaXplb2Yoc3RydWN0IHRzdF9jZ3JvdXBfcGF0aCkpLAorCQkJUFJP
VF9SRUFEIHwgUFJPVF9XUklURSwgTUFQX0FOT05ZTU9VUyB8IE1BUF9TSEFSRUQsIC0xLCAwKTsK
Kwl0c3RfY2dyb3VwX3BhdGgtPm1udF9wYXRoID0gU0FGRV9NTUFQKE5VTEwsIChzdHJsZW4odHN0
X2Nncm91cF9tbnRfcGF0aCkgKyAxKSwKKwkJCVBST1RfUkVBRCB8IFBST1RfV1JJVEUsIE1BUF9B
Tk9OWU1PVVMgfCBNQVBfU0hBUkVELCAtMSwgMCk7CisJdHN0X2Nncm91cF9wYXRoLT5uZXdfcGF0
aCA9IFNBRkVfTU1BUChOVUxMLCAoc3RybGVuKHRzdF9jZ3JvdXBfbmV3X3BhdGgpICsgMSksCisJ
CQlQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLCBNQVBfQU5PTllNT1VTIHwgTUFQX1NIQVJFRCwgLTEs
IDApOworCisJaWYgKCF0c3RfY2dyb3VwX3BhdGhlcykgeworCQl0c3RfY2dyb3VwX3BhdGhlcyA9
IHRzdF9jZ3JvdXBfcGF0aDsKKwl9IGVsc2UgeworCQlhID0gdHN0X2Nncm91cF9wYXRoZXM7CisJ
CWRvIHsKKwkJCWlmICghYS0+bmV4dCkgeworCQkJCWEtPm5leHQgPSB0c3RfY2dyb3VwX3BhdGg7
CisJCQkJYnJlYWs7CisJCQl9CisJCQlhID0gYS0+bmV4dDsKKwkJfSB3aGlsZSAoYSk7CisJfQor
CisJc3ByaW50Zih0c3RfY2dyb3VwX3BhdGgtPm1udF9wYXRoLCAiJXMiLCB0c3RfY2dyb3VwX21u
dF9wYXRoKTsKKwlzcHJpbnRmKHRzdF9jZ3JvdXBfcGF0aC0+bmV3X3BhdGgsICIlcyIsIHRzdF9j
Z3JvdXBfbmV3X3BhdGgpOworfQorCitzdGF0aWMgdm9pZCB0c3RfY2dyb3VwX2dldF9wYXRoKGNv
bnN0IGNoYXIgKmNncm91cF9kaXIpCit7CisJc3RydWN0IHRzdF9jZ3JvdXBfcGF0aCAqYSA9IHRz
dF9jZ3JvdXBfcGF0aGVzOworCisJd2hpbGUgKHN0cmNtcChhLT5tbnRfcGF0aCwgY2dyb3VwX2Rp
cikgIT0gMCl7CisJCWEgPSBhLT5uZXh0OworCX07CisKKwlzcHJpbnRmKHRzdF9jZ3JvdXBfbW50
X3BhdGgsICIlcyIsIGEtPm1udF9wYXRoKTsKKwlzcHJpbnRmKHRzdF9jZ3JvdXBfbmV3X3BhdGgs
ICIlcyIsIGEtPm5ld19wYXRoKTsKK30KKworc3RhdGljIHZvaWQgdHN0X2Nncm91cF9kZWxfcGF0
aChjb25zdCBjaGFyICpjZ3JvdXBfZGlyKQoreworCXN0cnVjdCB0c3RfY2dyb3VwX3BhdGggKmEs
ICpiOworCWEgPSBiID0gdHN0X2Nncm91cF9wYXRoZXM7CisKKwl3aGlsZSAoc3RyY21wKGItPm1u
dF9wYXRoLCBjZ3JvdXBfZGlyKSAhPSAwKXsKKwkJYSA9IGI7CisJCWIgPSBiLT5uZXh0OworCX07
CisKKwlpZiAoYiA9PSB0c3RfY2dyb3VwX3BhdGhlcykKKwkJdHN0X2Nncm91cF9wYXRoZXMgPSBi
LT5uZXh0OworCWVsc2UKKwkJYS0+bmV4dCA9IGItPm5leHQ7CisKKwlTQUZFX01VTk1BUChiLT5t
bnRfcGF0aCwgc2l6ZW9mKGItPm1udF9wYXRoKSk7CisJU0FGRV9NVU5NQVAoYi0+bmV3X3BhdGgs
IHNpemVvZihiLT5uZXdfcGF0aCkpOworCVNBRkVfTVVOTUFQKGIsIHNpemVvZihiKSk7Cit9CisK
K3ZvaWQgdHN0X2Nncm91cF9tb3VudChlbnVtIHRzdF9jZ3JvdXBfY3RybCBjdHJsLCBjb25zdCBj
aGFyICpjZ3JvdXBfZGlyKQoreworCXRzdF9jZ192ZXIgPSB0c3RfY2dyb3VwX3ZlcnNpb24oKTsK
KworCXRzdF9jZ3JvdXBfc2V0X3BhdGgoY2dyb3VwX2Rpcik7CisKKwlpZiAodHN0X2NnX3ZlciAm
IFRTVF9DR1JPVVBfVjEpIHsKKwkJc3dpdGNoKGN0cmwpIHsKKwkJY2FzZSBUU1RfQ0dST1VQX01F
TUNHOgorCQkJdHN0X2Nncm91cDFfbW91bnQoIm1lbWNnIiwgIm1lbW9yeSIsIHRzdF9jZ3JvdXBf
bW50X3BhdGgsIHRzdF9jZ3JvdXBfbmV3X3BhdGgpOworCQlicmVhazsKKwkJY2FzZSBUU1RfQ0dS
T1VQX0NQVVNFVDoKKwkJCXRzdF9jZ3JvdXAxX21vdW50KCJjcHVzZXRjZyIsICJjcHVzZXQiLCB0
c3RfY2dyb3VwX21udF9wYXRoLCB0c3RfY2dyb3VwX25ld19wYXRoKTsKKwkJYnJlYWs7CisJCWRl
ZmF1bHQ6CisJCQl0c3RfYnJrKFRCUk9LLCAiSW52YWxpZCBjZ3JvdXAgY29udHJvbGxlcjogJWQi
LCBjdHJsKTsKKwkJfQorCX0KKworCWlmICh0c3RfY2dfdmVyICYgVFNUX0NHUk9VUF9WMikgewor
CQl0c3RfY2dyb3VwMl9tb3VudCh0c3RfY2dyb3VwX21udF9wYXRoLCB0c3RfY2dyb3VwX25ld19w
YXRoKTsKKworCQlzd2l0Y2goY3RybCkgeworCQljYXNlIFRTVF9DR1JPVVBfTUVNQ0c6CisJCQlz
cHJpbnRmKHRzdF9jZ3JvdXBfY3RsX2tub2IsICIlcy9jZ3JvdXAuc3VidHJlZV9jb250cm9sIiwg
dHN0X2Nncm91cF9tbnRfcGF0aCk7CisJCQlTQUZFX0ZJTEVfUFJJTlRGKHRzdF9jZ3JvdXBfY3Rs
X2tub2IsICIlcyIsICIrbWVtb3J5Iik7CisJCWJyZWFrOworCQljYXNlIFRTVF9DR1JPVVBfQ1BV
U0VUOgorCQkJdHN0X2JyayhUQ09ORiwgIkNncm91cCB2MiBoYXNuJ3QgYWNoaWV2ZSBjcHVzZXQg
c3Vic3lzdGVtIik7CisJCWJyZWFrOworCQlkZWZhdWx0OgorCQkJdHN0X2JyayhUQlJPSywgIklu
dmFsaWQgY2dyb3VwIGNvbnRyb2xsZXI6ICVkIiwgY3RybCk7CisJCX0KKwl9Cit9CisKK3ZvaWQg
dHN0X2Nncm91cF91bW91bnQoY29uc3QgY2hhciAqY2dyb3VwX2RpcikKK3sKKwl0c3RfY2dyb3Vw
X2dldF9wYXRoKGNncm91cF9kaXIpOworCXRzdF9jZ3JvdXBfZGVsX3BhdGgoY2dyb3VwX2Rpcik7
CisJdHN0X2Nncm91cE5fdW1vdW50KHRzdF9jZ3JvdXBfbW50X3BhdGgsIHRzdF9jZ3JvdXBfbmV3
X3BhdGgpOworfQorCit2b2lkIHRzdF9jZ3JvdXBfc2V0X2tub2IoY29uc3QgY2hhciAqY2dyb3Vw
X2RpciwgY29uc3QgY2hhciAqa25vYiwgbG9uZyB2YWx1ZSkKK3sKKwl0c3RfY2dyb3VwX2dldF9w
YXRoKGNncm91cF9kaXIpOworCisJc3ByaW50Zih0c3RfY2dyb3VwX2N0bF9rbm9iLCAiJXMvJXMi
LCB0c3RfY2dyb3VwX25ld19wYXRoLCBrbm9iKTsKKwlTQUZFX0ZJTEVfUFJJTlRGKHRzdF9jZ3Jv
dXBfY3RsX2tub2IsICIlbGQiLCB2YWx1ZSk7Cit9CisKK3ZvaWQgdHN0X2Nncm91cF9tb3ZlX2N1
cnJlbnQoY29uc3QgY2hhciAqY2dyb3VwX2RpcikKK3sKKwlpZiAodHN0X2NnX3ZlciAmIFRTVF9D
R1JPVVBfVjEpCisJCXRzdF9jZ3JvdXBfc2V0X2tub2IoY2dyb3VwX2RpciwgInRhc2tzIiwgZ2V0
cGlkKCkpOworCisJaWYgKHRzdF9jZ192ZXIgJiBUU1RfQ0dST1VQX1YyKQorCQl0c3RfY2dyb3Vw
X3NldF9rbm9iKGNncm91cF9kaXIsICJjZ3JvdXAucHJvY3MiLCBnZXRwaWQoKSk7Cit9CisKK3Zv
aWQgdHN0X2Nncm91cF9tZW1fc2V0X21heGJ5dGVzKGNvbnN0IGNoYXIgKmNncm91cF9kaXIsIGxv
bmcgbWVtc3opCit7CisJaWYgKHRzdF9jZ192ZXIgJiBUU1RfQ0dST1VQX1YxKQorCQl0c3RfY2dy
b3VwX3NldF9rbm9iKGNncm91cF9kaXIsICJtZW1vcnkubGltaXRfaW5fYnl0ZXMiLCBtZW1zeik7
CisKKwlpZiAodHN0X2NnX3ZlciAmIFRTVF9DR1JPVVBfVjIpCisJCXRzdF9jZ3JvdXBfc2V0X2tu
b2IoY2dyb3VwX2RpciwgIm1lbW9yeS5tYXgiLCBtZW1zeik7Cit9CisKK2ludCB0c3RfY2dyb3Vw
X21lbV9zd2FwYWNjdF9lbmFibGVkKGNvbnN0IGNoYXIgKmNncm91cF9kaXIpCit7CisJdHN0X2Nn
cm91cF9nZXRfcGF0aChjZ3JvdXBfZGlyKTsKKworCWlmICh0c3RfY2dfdmVyICYgVFNUX0NHUk9V
UF9WMSkgeworCQlzcHJpbnRmKHRzdF9jZ3JvdXBfY3RsX2tub2IsICIlcy8lcyIsCisJCQkJdHN0
X2Nncm91cF9uZXdfcGF0aCwgIi9tZW1vcnkubWVtc3cubGltaXRfaW5fYnl0ZXMiKTsKKworCQlp
ZiAoKGFjY2Vzcyh0c3RfY2dyb3VwX2N0bF9rbm9iLCBGX09LKSA9PSAtMSkpIHsKKwkJCWlmIChl
cnJubyA9PSBFTk9FTlQpCisJCQkJdHN0X3JlcyhUQ09ORiwgIm1lbWNnIHN3YXAgYWNjb3VudGlu
ZyBpcyBkaXNhYmxlZCIpOworCQkJZWxzZQorCQkJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sICJm
YWlsZWQgdG8gYWNjZXNzICVzIiwgdHN0X2Nncm91cF9jdGxfa25vYik7CisJCX0gZWxzZSB7CisJ
CQlyZXR1cm4gMTsKKwkJfQorCX0KKworCWlmICh0c3RfY2dfdmVyICYgVFNUX0NHUk9VUF9WMikg
eworCQlzcHJpbnRmKHRzdF9jZ3JvdXBfY3RsX2tub2IsICIlcy8lcyIsCisJCQkJdHN0X2Nncm91
cF9uZXdfcGF0aCwgIi9tZW1vcnkuc3dhcC5tYXgiKTsKKworCQlpZiAoKGFjY2Vzcyh0c3RfY2dy
b3VwX2N0bF9rbm9iLCBGX09LKSA9PSAtMSkpIHsKKwkJCWlmIChlcnJubyA9PSBFTk9FTlQpCisJ
CQkJdHN0X3JlcyhUQ09ORiwgIm1lbWNnIHN3YXAgYWNjb3VudGluZyBpcyBkaXNhYmxlZCIpOwor
CQkJZWxzZQorCQkJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sICJmYWlsZWQgdG8gYWNjZXNzICVz
IiwgdHN0X2Nncm91cF9jdGxfa25vYik7CisJCX0gZWxzZSB7CisJCQlyZXR1cm4gMTsKKwkJfQor
CX0KKworCXJldHVybiAwOworfQorCit2b2lkIHRzdF9jZ3JvdXBfbWVtX3NldF9tYXhzd2FwKGNv
bnN0IGNoYXIgKmNncm91cF9kaXIsIGxvbmcgbWVtc3opCit7CisJaWYgKHRzdF9jZ192ZXIgJiBU
U1RfQ0dST1VQX1YxKQorCQl0c3RfY2dyb3VwX3NldF9rbm9iKGNncm91cF9kaXIsICJtZW1vcnku
bWVtc3cubGltaXRfaW5fYnl0ZXMiLCBtZW1zeik7CisKKwlpZiAodHN0X2NnX3ZlciAmIFRTVF9D
R1JPVVBfVjIpCisJCXRzdF9jZ3JvdXBfc2V0X2tub2IoY2dyb3VwX2RpciwgIm1lbW9yeS5zd2Fw
Lm1heCIsIG1lbXN6KTsKK30KLS0gCjIuMjEuMQoK
--0000000000001ce08905a7128bc0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--0000000000001ce08905a7128bc0--

