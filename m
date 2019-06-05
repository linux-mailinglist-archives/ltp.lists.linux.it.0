Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F60359EC
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 11:53:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19CC53EA6CF
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 11:53:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 20F443EA699
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 11:53:28 +0200 (CEST)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A93321A00F13
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 11:53:26 +0200 (CEST)
Received: by mail-ua1-f68.google.com with SMTP id j2so4990358uaq.5
 for <ltp@lists.linux.it>; Wed, 05 Jun 2019 02:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9ErEjEAUVLIy97GQ/kbUb2WJ3tP1dNJiQAv2d+AefQ=;
 b=gLkkYrje7vFLFwHMGjKgfaY45gQswYVbdAiMr/aYUjbz9JrUPQucZ6YwEzrQMPKcA/
 bLbfbbdplHKEm6dep9w2LtyNfTB2vePF6RY/oMvRanLSBwj6GPGQk/mU+7OazO2g4RDS
 9GPJzW+bYx8vbBo8Eo6xBVq8ODN4LJUzfVN/gk9Zk7Gu8z+IIg8iL9aCkmFHoG33EAhB
 qwdOqtd5DR7cpMInhfvUkiOMkeuiBzH6agGcCkec6vPCME2rSHW3iCARpj+lxZTTSuqt
 iWjftQ9gBJ5pSKYHIKjQVyQ29AvVw/MOBuf8nE0M5sMBRLED7sr9LF5O40QD4Rz8GIbd
 E7xQ==
X-Gm-Message-State: APjAAAX9uBl2FBfaeIPlhK38BJJmjwqBw8ZoNafKys/x4ZP7oXRP2p3o
 XYwk2+geVdyVAykuHwY/ZTRjJ+wCBsLtjkPuZyNTQg==
X-Google-Smtp-Source: APXvYqxDkAXQJwihUR41qAfQqULEfaWorymyMglzCsCBtdmhZir0JwNYKUzIBU960lJCm8JVxzrLMUTjyZwpW/UHJFE=
X-Received: by 2002:ab0:4147:: with SMTP id j65mr19532020uad.142.1559728405467; 
 Wed, 05 Jun 2019 02:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
 <20190528141214.18752-1-xzhou@redhat.com>
 <20190528141214.18752-2-xzhou@redhat.com>
 <CAEemH2fcM18gLbM3bWRu7ddR+8QbmYCL+4U83Z5tiWgZ4suz_A@mail.gmail.com>
 <CAEemH2f275JA7f_mzyQwQeW8LJ2_YS5L42=KD1KWWGZKrmwitQ@mail.gmail.com>
 <20190605093005.qwpput3zxrd22z44@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190605093005.qwpput3zxrd22z44@XZHOUW.usersys.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 5 Jun 2019 17:53:13 +0800
Message-ID: <CAEemH2eezXfcn=cXPNDxTHf2wUn+auxh7jpJ3LuFnF-mm8yjig@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v6 2/4] swapon/libswapon: add helper
	is_swap_supported
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0688145291=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0688145291==
Content-Type: multipart/alternative; boundary="0000000000008dfc51058a9091be"

--0000000000008dfc51058a9091be
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 5, 2019 at 5:30 PM Murphy Zhou <xzhou@redhat.com> wrote:

> On Wed, Jun 05, 2019 at 02:55:47PM +0800, Li Wang wrote:
> > On Wed, Jun 5, 2019 at 1:51 PM Li Wang <liwang@redhat.com> wrote:
> >
> > >
> > >
> > > On Tue, May 28, 2019 at 10:13 PM Murphy Zhou <xzhou@redhat.com> wrote:
> > >
> > >> To check if the filesystem we are testing on supports FIBMAP, mkswap,
> > >> swapon and swapoff operations.
> > >> Modify make_swapfile function to test mkswap support status safely.
> > >>
> > >> Signed-off-by: Murphy Zhou <xzhou@redhat.com>
> > >> ---
> > >>  testcases/kernel/syscalls/swapon/libswapon.c | 45
> +++++++++++++++++++-
> > >>  testcases/kernel/syscalls/swapon/libswapon.h |  7 ++-
> > >>  2 files changed, 49 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/testcases/kernel/syscalls/swapon/libswapon.c
> > >> b/testcases/kernel/syscalls/swapon/libswapon.c
> > >> index cf6a98891..f66d19548 100644
> > >> --- a/testcases/kernel/syscalls/swapon/libswapon.c
> > >> +++ b/testcases/kernel/syscalls/swapon/libswapon.c
> > >> @@ -19,13 +19,15 @@
> > >>   *
> > >>   */
> > >>
> > >> +#include <errno.h>
> > >> +#include "lapi/syscalls.h"
> > >>  #include "test.h"
> > >>  #include "libswapon.h"
> > >>
> > >>  /*
> > >>   * Make a swap file
> > >>   */
> > >> -void make_swapfile(void (cleanup)(void), const char *swapfile)
> > >> +int make_swapfile(void (cleanup)(void), const char *swapfile, int
> safe)
> > >>  {
> > >>         if (!tst_fs_has_free(NULL, ".", sysconf(_SC_PAGESIZE) * 10,
> > >>             TST_BYTES)) {
> > >> @@ -45,5 +47,44 @@ void make_swapfile(void (cleanup)(void), const char
> > >> *swapfile)
> > >>         argv[1] = swapfile;
> > >>         argv[2] = NULL;
> > >>
> > >> -       tst_run_cmd(cleanup, argv, "/dev/null", "/dev/null", 0);
> > >> +       return tst_run_cmd(cleanup, argv, "/dev/null", "/dev/null",
> safe);
> > >> +}
> > >> +
> > >> +/*
> > >> + * Check swapon/swapoff support status of filesystems or files
> > >> + * we are testing on.
> > >> + */
> > >> +void is_swap_supported(void (cleanup)(void), const char *filename)
> > >> +{
> > >> +       int fibmap = tst_fibmap(filename);
> > >> +       long fs_type = tst_fs_type(cleanup, filename);
> > >> +       const char *fstype = tst_fs_type_name(fs_type);
> > >> +
> > >> +       int ret = make_swapfile(NULL, filename, 1);
> > >> +       if (ret != 0) {
> > >> +               if (fibmap != 0) {
> > >>
> > >
> > > As I replied in patch 1/4, how do we know that means FIBMAP not
> support if
> > > just verify fibmap != 0?
> > > So I would suggest to make the return value of tst_fibmap() is more
> > > precise and do if (fibmap == 1) check here.
>
> Very good catch. The return value should be more precise. Thanks!
>
> > >
> >
> > And also, imagine that if swapon01 test failed on BRTFS or NFS(support
> > swapfile but not
> > support FIBMAP ioctl), then here will report the new bug as a TCONF to
> LTP.
>
> Here is testing mkswap for swapon test preparation. If mkswap fail, and
> FIBMAP not supported, it's reasonable to me that we should not go on to
> test swapon.
>
> But yes, if a regression causes mkswap fail without FIBMAP supported, we
> could miss the bug here like you described. This situation should be
> covered by tcase for mkswap IMO.
>

I'm thinking maybe we cann't avoid adding a whilelist in the test, at least
for known filesystem without FIBMAP supported.

FYI: what do you think if change the is_swap_supported(...) like this?

void is_swap_supported(void (cleanup)(void), const char *filename)
{
        int fibmap = tst_fibmap(filename);

        if (fibmap == 1) {
                int ret;
                long fs_type = tst_fs_type(cleanup, filename);
                const char *fstype = tst_fs_type_name(fs_type);

                ret = make_swapfile(NULL, filename, 1);
                if (ret != 0) {
                        if (fs_type == TST_NFS_MAGIC ||
                                fs_type == TST_TMPFS_MAGIC ||
                                fs_type == TST_BRTFS_MAGIC) {
                                tst_brkm(TFAIL, cleanup,
                                        "mkswap on %s failed", fstype);
                        } else {
                                tst_brkm(TCONF, cleanup,
                                        "mkswap on %s not supported",
fstype);
                        }
                }

                TEST(ltp_syscall(__NR_swapon, filename, 0));
                if (TEST_RETURN == -1) {
                        if (errno == EINVAL) {
                                tst_brkm(TCONF, cleanup,
                                         "Swapfile on %s not implemented",
fstype);
                        } else {
                                tst_brkm(TFAIL | TERRNO, cleanup,
                                         "swapon on %s failed", fstype);
                        }
                }

                TEST(ltp_syscall(__NR_swapoff, filename, 0));
                if (TEST_RETURN == -1) {
                        tst_brkm(TFAIL | TERRNO, cleanup,
                                "swapoff on %s failed", fstype);
                }
        }
}

>
> I'm going to dig more on fibmap/mkswap/swapon/swapoff support status of
> varies filesystems.
>
> >
> >
> > > +                       tst_brkm(TCONF, cleanup,
> > >> +                               "mkswap on %s not supported", fstype);
> > >> +               } else {
> > >> +                       tst_brkm(TFAIL, cleanup,
> > >> +                               "mkswap on %s failed", fstype);
> > >> +               }
> > >> +       }
> > >> +
> > >> +       TEST(ltp_syscall(__NR_swapon, filename, 0));
> > >> +       if (TEST_RETURN == -1) {
> > >> +               if (fibmap != 0 && errno == EINVAL) {
> > >> +                       tst_brkm(TCONF, cleanup,
> > >> +                               "Swapfile on %s not implemented",
> fstype);
> > >>
> > >
> > > Maybe there is unnecessary to check fibmap value again? Since if the
> > > fibmap is 1, it has already broken in make_swapfile() error handler and
> > > never coming here?
>
> If mkswap succeeds, we are coming here.
>

Ah yes. I missed that situation.

>
> Thanks for reviewing!
> Murphy
>
> > >
> > >
> > >
> > >> +               } else {
> > >> +                       tst_brkm(TFAIL | TERRNO, cleanup,
> > >> +                                "swapon on %s failed", fstype);
> > >> +               }
> > >> +       }
> > >> +
> > >> +       TEST(ltp_syscall(__NR_swapoff, filename, 0));
> > >> +       if (TEST_RETURN == -1) {
> > >> +               tst_brkm(TFAIL | TERRNO, cleanup,
> > >> +                       "swapoff on %s failed", fstype);
> > >> +       }
> > >>  }
> > >> diff --git a/testcases/kernel/syscalls/swapon/libswapon.h
> > >> b/testcases/kernel/syscalls/swapon/libswapon.h
> > >> index 7f7211eb4..a51833ec1 100644
> > >> --- a/testcases/kernel/syscalls/swapon/libswapon.h
> > >> +++ b/testcases/kernel/syscalls/swapon/libswapon.h
> > >> @@ -29,6 +29,11 @@
> > >>  /*
> > >>   * Make a swap file
> > >>   */
> > >> -void make_swapfile(void (cleanup)(void), const char *swapfile);
> > >> +int make_swapfile(void (cleanup)(void), const char *swapfile, int
> safe);
> > >>
> > >> +/*
> > >> + * Check swapon/swapoff support status of filesystems or files
> > >> + * we are testing on.
> > >> + */
> > >> +void is_swap_supported(void (cleanup)(void), const char *filename);
> > >>  #endif /* __LIBSWAPON_H__ */
> > >> --
> > >> 2.21.0
> > >>
> > >>
> > >> --
> > >> Mailing list info: https://lists.linux.it/listinfo/ltp
> > >>
> > >
> > >
> > > --
> > > Regards,
> > > Li Wang
> > >
> >
> >
> > --
> > Regards,
> > Li Wang
>


-- 
Regards,
Li Wang

--0000000000008dfc51058a9091be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 5, 2019 at 5:30 PM Murphy Zhou &lt;<a h=
ref=3D"mailto:xzhou@redhat.com">xzhou@redhat.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jun 05, 2019 at 02:=
55:47PM +0800, Li Wang wrote:<br>
&gt; On Wed, Jun 5, 2019 at 1:51 PM Li Wang &lt;<a href=3D"mailto:liwang@re=
dhat.com" target=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Tue, May 28, 2019 at 10:13 PM Murphy Zhou &lt;<a href=3D"mailt=
o:xzhou@redhat.com" target=3D"_blank">xzhou@redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; To check if the filesystem we are testing on supports FIBMAP,=
 mkswap,<br>
&gt; &gt;&gt; swapon and swapoff operations.<br>
&gt; &gt;&gt; Modify make_swapfile function to test mkswap support status s=
afely.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Murphy Zhou &lt;<a href=3D"mailto:xzhou@redhat=
.com" target=3D"_blank">xzhou@redhat.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 testcases/kernel/syscalls/swapon/libswapon.c | 45 +++++=
++++++++++++++-<br>
&gt; &gt;&gt;=C2=A0 testcases/kernel/syscalls/swapon/libswapon.h |=C2=A0 7 =
++-<br>
&gt; &gt;&gt;=C2=A0 2 files changed, 49 insertions(+), 3 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/testcases/kernel/syscalls/swapon/libswapon.c<br>
&gt; &gt;&gt; b/testcases/kernel/syscalls/swapon/libswapon.c<br>
&gt; &gt;&gt; index cf6a98891..f66d19548 100644<br>
&gt; &gt;&gt; --- a/testcases/kernel/syscalls/swapon/libswapon.c<br>
&gt; &gt;&gt; +++ b/testcases/kernel/syscalls/swapon/libswapon.c<br>
&gt; &gt;&gt; @@ -19,13 +19,15 @@<br>
&gt; &gt;&gt;=C2=A0 =C2=A0*<br>
&gt; &gt;&gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +#include &lt;errno.h&gt;<br>
&gt; &gt;&gt; +#include &quot;lapi/syscalls.h&quot;<br>
&gt; &gt;&gt;=C2=A0 #include &quot;test.h&quot;<br>
&gt; &gt;&gt;=C2=A0 #include &quot;libswapon.h&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 /*<br>
&gt; &gt;&gt;=C2=A0 =C2=A0* Make a swap file<br>
&gt; &gt;&gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;&gt; -void make_swapfile(void (cleanup)(void), const char *swapfil=
e)<br>
&gt; &gt;&gt; +int make_swapfile(void (cleanup)(void), const char *swapfile=
, int safe)<br>
&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tst_fs_has_free(NULL, &=
quot;.&quot;, sysconf(_SC_PAGESIZE) * 10,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_BYTES)) {<=
br>
&gt; &gt;&gt; @@ -45,5 +47,44 @@ void make_swapfile(void (cleanup)(void), c=
onst char<br>
&gt; &gt;&gt; *swapfile)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv[1] =3D swapfile;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv[2] =3D NULL;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_run_cmd(cleanup, argv, &quot;=
/dev/null&quot;, &quot;/dev/null&quot;, 0);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return tst_run_cmd(cleanup, argv,=
 &quot;/dev/null&quot;, &quot;/dev/null&quot;, safe);<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +/*<br>
&gt; &gt;&gt; + * Check swapon/swapoff support status of filesystems or fil=
es<br>
&gt; &gt;&gt; + * we are testing on.<br>
&gt; &gt;&gt; + */<br>
&gt; &gt;&gt; +void is_swap_supported(void (cleanup)(void), const char *fil=
ename)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int fibmap =3D tst_fibmap(filenam=
e);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0long fs_type =3D tst_fs_type(clea=
nup, filename);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *fstype =3D tst_fs_typ=
e_name(fs_type);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D make_swapfile(NULL, f=
ilename, 1);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (f=
ibmap !=3D 0) {<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; As I replied in patch 1/4, how do we know that means FIBMAP not s=
upport if<br>
&gt; &gt; just verify fibmap !=3D 0?<br>
&gt; &gt; So I would suggest to make the return value of tst_fibmap() is mo=
re<br>
&gt; &gt; precise and do if (fibmap =3D=3D 1) check here.<br>
<br>
Very good catch. The return value should be more precise. Thanks!<br>
<br>
&gt; &gt;<br>
&gt; <br>
&gt; And also, imagine that if swapon01 test failed on BRTFS or NFS(support=
<br>
&gt; swapfile but not<br>
&gt; support FIBMAP ioctl), then here will report the new bug as a TCONF to=
 LTP.<br>
<br>
Here is testing mkswap for swapon test preparation. If mkswap fail, and<br>
FIBMAP not supported, it&#39;s reasonable to me that we should not go on to=
<br>
test swapon.<br>
<br>
But yes, if a regression causes mkswap fail without FIBMAP supported, we<br=
>
could miss the bug here like you described. This situation should be<br>
covered by tcase for mkswap IMO.<br></blockquote><div><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;m thinking maybe we cann=
&#39;t avoid adding a whilelist in the test, at least for known filesystem =
without FIBMAP supported.=C2=A0</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">FYI: what do you think if change the is_swap_supported(...) like thi=
s?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">void is_swap_supported=
(void (cleanup)(void), const char *filename)<br>{<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int fibmap =3D tst_fibmap(filename);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=C2=A0if (fibmap =3D=3D 1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=C2=A0int ret;</div><div class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=C2=A0long fs_type =3D tst_fs_type(cleanup, filename);</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0const char *fstype =3D tst_fs_type_n=
ame(fs_type);</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0ret =
=3D make_swapfile(NULL, filename, 1);</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0if (ret !=3D 0) {</div><div class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0if (fs_type =3D=3D TST_NFS_MAGIC =
||</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0fs_type =3D=3D TST_TMPFS_MAGIC ||</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 fs_type =3D=3D TST_BRTFS_MAGIC) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tst_brkm(TFAIL, cleanup,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mkswap on %s failed&quot;, =
fstype);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 } else {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_b=
rkm(TCONF, cleanup,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;mkswap on %s not supported&quot;, fstype);<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(ltp_syscall(__=
NR_swapon, filename, 0));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (TEST_RETURN =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D EINVA=
L) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm(TCONF, cleanup,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;Swapfile on %s not implemented&quot;, fstype);<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm(TFAIL | TERRNO, cleanup,<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;swapon on %s failed&quot;, fstype);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(ltp_syscall(__NR_swapoff, filename, 0));<=
/div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TEST_RETURN =3D=3D -1) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_brkm(TFAIL | TERRNO, cleanup,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;swapoff on %s failed&quot;, fstype);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<b=
r>}</div></div><div class=3D"gmail_quote"><div class=3D"gmail_default" styl=
e=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
I&#39;m going to dig more on fibmap/mkswap/swapon/swapoff support status of=
<br>
varies filesystems.<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0tst_brkm(TCONF, cleanup,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mkswap on %s not =
supported&quot;, fstype);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} els=
e {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TFAIL, cleanup,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mkswap on %s fail=
ed&quot;, fstype);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(ltp_syscall(__NR_swapon, fil=
ename, 0));<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TEST_RETURN =3D=3D -1) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (f=
ibmap !=3D 0 &amp;&amp; errno =3D=3D EINVAL) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TCONF, cleanup,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Swapfile on %s no=
t implemented&quot;, fstype);<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Maybe there is unnecessary to check fibmap value again? Since if =
the<br>
&gt; &gt; fibmap is 1, it has already broken in make_swapfile() error handl=
er and<br>
&gt; &gt; never coming here?<br>
<br>
If mkswap succeeds, we are coming here.<br></blockquote><div><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Ah yes. I missed that si=
tuation.</div><div class=3D"gmail_default" style=3D"font-size:small"></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks for reviewing!<br>
Murphy<br>
<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} els=
e {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TFAIL | TERRNO, cleanup,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;swapon on %s fai=
led&quot;, fstype);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(ltp_syscall(__NR_swapoff, fi=
lename, 0));<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TEST_RETURN =3D=3D -1) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_b=
rkm(TFAIL | TERRNO, cleanup,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;swapoff on %s failed&quot;, fstype);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt; diff --git a/testcases/kernel/syscalls/swapon/libswapon.h<br>
&gt; &gt;&gt; b/testcases/kernel/syscalls/swapon/libswapon.h<br>
&gt; &gt;&gt; index 7f7211eb4..a51833ec1 100644<br>
&gt; &gt;&gt; --- a/testcases/kernel/syscalls/swapon/libswapon.h<br>
&gt; &gt;&gt; +++ b/testcases/kernel/syscalls/swapon/libswapon.h<br>
&gt; &gt;&gt; @@ -29,6 +29,11 @@<br>
&gt; &gt;&gt;=C2=A0 /*<br>
&gt; &gt;&gt;=C2=A0 =C2=A0* Make a swap file<br>
&gt; &gt;&gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;&gt; -void make_swapfile(void (cleanup)(void), const char *swapfil=
e);<br>
&gt; &gt;&gt; +int make_swapfile(void (cleanup)(void), const char *swapfile=
, int safe);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +/*<br>
&gt; &gt;&gt; + * Check swapon/swapoff support status of filesystems or fil=
es<br>
&gt; &gt;&gt; + * we are testing on.<br>
&gt; &gt;&gt; + */<br>
&gt; &gt;&gt; +void is_swap_supported(void (cleanup)(void), const char *fil=
ename);<br>
&gt; &gt;&gt;=C2=A0 #endif /* __LIBSWAPON_H__ */<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.21.0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; Mailing list info: <a href=3D"https://lists.linux.it/listinfo=
/ltp" rel=3D"noreferrer" target=3D"_blank">https://lists.linux.it/listinfo/=
ltp</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Regards,<br>
&gt; &gt; Li Wang<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Regards,<br>
&gt; Li Wang<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000008dfc51058a9091be--

--===============0688145291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0688145291==--
