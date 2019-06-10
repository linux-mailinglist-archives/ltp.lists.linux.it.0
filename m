Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D693B219
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 11:29:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFF533EB025
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 11:29:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 941D23EB019
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 11:29:08 +0200 (CEST)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 12F9B2009DB
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 11:29:06 +0200 (CEST)
Received: by mail-ua1-f66.google.com with SMTP id 94so2768489uam.3
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 02:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LKgu1Tp2JPKwQNlDyNWVSieTQbUjgTWGKJZyfwcwa5o=;
 b=E1FvovTqYi2KHOVv1U0BUA6Yiy+ITLyYMqJ5XRdOgGzRJHmg8Zfx0olLvHKvQJqys3
 jNOlxPoNyf83YzZIYL6EiZKKRVmuvAsorQjXPsD6MsfViSoBmcJGwXo8DDuR17bcG73M
 ndg4tJQLaTFA8hbLybJzDcQTr5H2SpegvNzs+U9RqobXmjV4e5xwShC6yE/fEkHosTsB
 GiziT2X0S/w72M6Kror2TikJzopM1tGHII62ir+bk01pqOV62lXFm8ENlUEmgofQuz2o
 9Wii1QIqRS2JkiutT1ZwQMT+4UMXNtZgpUy/ME8CZLi9JLoiF9jzEG9bns7zkU7EfdeK
 h9TQ==
X-Gm-Message-State: APjAAAUfk5DavBBIZA6XRMU+dpkUY526tS6Z7FX4zOuX34BnIxErGyng
 NAG/VRpyd+gfS7Oxb4jDzq5RuKvhbJR296106L3iPw==
X-Google-Smtp-Source: APXvYqwo8HupicFoyi4Ac5X2TmQTHKwqXrbXjB6FvOKQ5R9xWEy2g+qNksfyIK9nnYW53JNE1PTAC89fdmZWom2Kshc=
X-Received: by 2002:a9f:37c8:: with SMTP id q66mr33056412uaq.119.1560158944831; 
 Mon, 10 Jun 2019 02:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
 <20190528141214.18752-1-xzhou@redhat.com>
 <20190528141214.18752-2-xzhou@redhat.com>
 <CAEemH2fcM18gLbM3bWRu7ddR+8QbmYCL+4U83Z5tiWgZ4suz_A@mail.gmail.com>
 <CAEemH2f275JA7f_mzyQwQeW8LJ2_YS5L42=KD1KWWGZKrmwitQ@mail.gmail.com>
 <20190605093005.qwpput3zxrd22z44@XZHOUW.usersys.redhat.com>
 <CAEemH2eezXfcn=cXPNDxTHf2wUn+auxh7jpJ3LuFnF-mm8yjig@mail.gmail.com>
 <20190610061209.bsdrcld6ilh4vjk5@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190610061209.bsdrcld6ilh4vjk5@XZHOUW.usersys.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 10 Jun 2019 17:28:53 +0800
Message-ID: <CAEemH2e5b4q+bOeE3v8FG-piSUteCinPMVmxpnkVcYCmrUc4Uw@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1705882641=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1705882641==
Content-Type: multipart/alternative; boundary="000000000000b344a4058af4cf54"

--000000000000b344a4058af4cf54
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 10, 2019 at 2:12 PM Murphy Zhou <xzhou@redhat.com> wrote:

> On Wed, Jun 05, 2019 at 05:53:13PM +0800, Li Wang wrote:
> > On Wed, Jun 5, 2019 at 5:30 PM Murphy Zhou <xzhou@redhat.com> wrote:
> >
> > > On Wed, Jun 05, 2019 at 02:55:47PM +0800, Li Wang wrote:
> > > > On Wed, Jun 5, 2019 at 1:51 PM Li Wang <liwang@redhat.com> wrote:
> > > >
> > > > >
> > > > >
> > > > > On Tue, May 28, 2019 at 10:13 PM Murphy Zhou <xzhou@redhat.com>
> wrote:
> > > > >
> > > > >> To check if the filesystem we are testing on supports FIBMAP,
> mkswap,
> > > > >> swapon and swapoff operations.
> > > > >> Modify make_swapfile function to test mkswap support status
> safely.
> > > > >>
> > > > >> Signed-off-by: Murphy Zhou <xzhou@redhat.com>
> > > > >> ---
> > > > >>  testcases/kernel/syscalls/swapon/libswapon.c | 45
> > > +++++++++++++++++++-
> > > > >>  testcases/kernel/syscalls/swapon/libswapon.h |  7 ++-
> > > > >>  2 files changed, 49 insertions(+), 3 deletions(-)
> > > > >>
> > > > >> diff --git a/testcases/kernel/syscalls/swapon/libswapon.c
> > > > >> b/testcases/kernel/syscalls/swapon/libswapon.c
> > > > >> index cf6a98891..f66d19548 100644
> > > > >> --- a/testcases/kernel/syscalls/swapon/libswapon.c
> > > > >> +++ b/testcases/kernel/syscalls/swapon/libswapon.c
> > > > >> @@ -19,13 +19,15 @@
> > > > >>   *
> > > > >>   */
> > > > >>
> > > > >> +#include <errno.h>
> > > > >> +#include "lapi/syscalls.h"
> > > > >>  #include "test.h"
> > > > >>  #include "libswapon.h"
> > > > >>
> > > > >>  /*
> > > > >>   * Make a swap file
> > > > >>   */
> > > > >> -void make_swapfile(void (cleanup)(void), const char *swapfile)
> > > > >> +int make_swapfile(void (cleanup)(void), const char *swapfile, int
> > > safe)
> > > > >>  {
> > > > >>         if (!tst_fs_has_free(NULL, ".", sysconf(_SC_PAGESIZE) *
> 10,
> > > > >>             TST_BYTES)) {
> > > > >> @@ -45,5 +47,44 @@ void make_swapfile(void (cleanup)(void), const
> char
> > > > >> *swapfile)
> > > > >>         argv[1] = swapfile;
> > > > >>         argv[2] = NULL;
> > > > >>
> > > > >> -       tst_run_cmd(cleanup, argv, "/dev/null", "/dev/null", 0);
> > > > >> +       return tst_run_cmd(cleanup, argv, "/dev/null",
> "/dev/null",
> > > safe);
> > > > >> +}
> > > > >> +
> > > > >> +/*
> > > > >> + * Check swapon/swapoff support status of filesystems or files
> > > > >> + * we are testing on.
> > > > >> + */
> > > > >> +void is_swap_supported(void (cleanup)(void), const char
> *filename)
> > > > >> +{
> > > > >> +       int fibmap = tst_fibmap(filename);
> > > > >> +       long fs_type = tst_fs_type(cleanup, filename);
> > > > >> +       const char *fstype = tst_fs_type_name(fs_type);
> > > > >> +
> > > > >> +       int ret = make_swapfile(NULL, filename, 1);
> > > > >> +       if (ret != 0) {
> > > > >> +               if (fibmap != 0) {
> > > > >>
> > > > >
> > > > > As I replied in patch 1/4, how do we know that means FIBMAP not
> > > support if
> > > > > just verify fibmap != 0?
> > > > > So I would suggest to make the return value of tst_fibmap() is more
> > > > > precise and do if (fibmap == 1) check here.
> > >
> > > Very good catch. The return value should be more precise. Thanks!
> > >
> > > > >
> > > >
> > > > And also, imagine that if swapon01 test failed on BRTFS or
> NFS(support
> > > > swapfile but not
> > > > support FIBMAP ioctl), then here will report the new bug as a TCONF
> to
> > > LTP.
> > >
> > > Here is testing mkswap for swapon test preparation. If mkswap fail, and
> > > FIBMAP not supported, it's reasonable to me that we should not go on to
> > > test swapon.
> > >
> > > But yes, if a regression causes mkswap fail without FIBMAP supported,
> we
> > > could miss the bug here like you described. This situation should be
> > > covered by tcase for mkswap IMO.
> > >
> >
> > I'm thinking maybe we cann't avoid adding a whilelist in the test, at
> least
> > for known filesystem without FIBMAP supported.
>
> No, I think we don't need a whilelist here. Amir and I discussed long way
> to here, you can check that. We are not using fibmap test as a verdict for
> swapfile is supported or not. Doing a mkswap/swapon/swapoff test before
> real tests to detect the support situation. tst_fibmap result helps us
> to decide how to report. If the underneath filesystem can survive these
> test, it should be supporting swapfiles and swapon/swapoff tests should
> run.


> The whitelisted nfs and tmpfs are well covered by these pre-tests. More,
> NFS should not be skipped as if we turn on kernle configs for NFS_SWAP,
> these tests can run on NFS.
>
> Whitelist could skip more tests and bugs.
>
> I tested some fibmap/mkswap/swapon/swapoff tests for your reference:
>

Thanks a lot for the test report, good to know these details.


>
> 1 means positive, 0 means negative.
>
> -------- On 5.3-rc3+ kernel, NFS_SWAP=y SUNRPC_SWAP=y -------
>         fibamp  mkswap  swapon swapoff
> xfs     1       1       1       1
> ext4    1       1       1       1
>
> btrfs   0       1       0       0
> tmpfs   0       1       0       0
>
> ovl     1       1       1       1
>
> cifs
> v3.11   0       1       0       0
> v1      0       1       0       0
> v2      0       1       0       0
>
> nfs
> v4.2    0       1       1*      1
> v4.1    0       1       1       1
> v4.0    0       1       1*      1
> v3      0       1       1       1
>
> * hang sometimes
>
> --------- On 3.10.0 based kernel ----------------
>         fibamp  mkswap  swapon swapoff
> xfs     1       1       1       1
> ext4    1       1       1       1
>
> btrfs   0       1       0       0
> tmpfs   0       1       0       0
>
> ovl     1       1       1       1
>
> cifs
> v3.0    0       1       0       0
>
> nfs
> v4.2    0       1       0       0
>
>
> ---------- On 2.6.32 based kernel ---------------
>         fibamp  mkswap  swapon swapoff
> tmpfs   0       1       0       0
> xfs     1       1       1       1
> ext4    1       1       1       1
> cifs    0       0       0       0
> nfs     0       0       0       0
>
> >
> > FYI: what do you think if change the is_swap_supported(...) like this?
> >
> > void is_swap_supported(void (cleanup)(void), const char *filename)
> > {
> >         int fibmap = tst_fibmap(filename);
> >
> >         if (fibmap == 1) {
>
> fibmap == 0 does not mean swapfile is supported. We need to make sure that
> survivors of this function are supporting swapfiles.
>

Yes, it sounds quite reasonable. So besides that return value of
tst_fibmap() is not precise, patch V6 LGTM. Feel free to add my review in
patch v7:

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000b344a4058af4cf54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 10, 2019 at 2:12 PM Murphy Zhou &lt;<a =
href=3D"mailto:xzhou@redhat.com">xzhou@redhat.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jun 05, 2019 at 05=
:53:13PM +0800, Li Wang wrote:<br>
&gt; On Wed, Jun 5, 2019 at 5:30 PM Murphy Zhou &lt;<a href=3D"mailto:xzhou=
@redhat.com" target=3D"_blank">xzhou@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Jun 05, 2019 at 02:55:47PM +0800, Li Wang wrote:<br>
&gt; &gt; &gt; On Wed, Jun 5, 2019 at 1:51 PM Li Wang &lt;<a href=3D"mailto=
:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Tue, May 28, 2019 at 10:13 PM Murphy Zhou &lt;<a hre=
f=3D"mailto:xzhou@redhat.com" target=3D"_blank">xzhou@redhat.com</a>&gt; wr=
ote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; To check if the filesystem we are testing on suppor=
ts FIBMAP, mkswap,<br>
&gt; &gt; &gt; &gt;&gt; swapon and swapoff operations.<br>
&gt; &gt; &gt; &gt;&gt; Modify make_swapfile function to test mkswap suppor=
t status safely.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Signed-off-by: Murphy Zhou &lt;<a href=3D"mailto:xz=
hou@redhat.com" target=3D"_blank">xzhou@redhat.com</a>&gt;<br>
&gt; &gt; &gt; &gt;&gt; ---<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 testcases/kernel/syscalls/swapon/libswapon.c =
| 45<br>
&gt; &gt; +++++++++++++++++++-<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 testcases/kernel/syscalls/swapon/libswapon.h =
|=C2=A0 7 ++-<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 2 files changed, 49 insertions(+), 3 deletion=
s(-)<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; diff --git a/testcases/kernel/syscalls/swapon/libsw=
apon.c<br>
&gt; &gt; &gt; &gt;&gt; b/testcases/kernel/syscalls/swapon/libswapon.c<br>
&gt; &gt; &gt; &gt;&gt; index cf6a98891..f66d19548 100644<br>
&gt; &gt; &gt; &gt;&gt; --- a/testcases/kernel/syscalls/swapon/libswapon.c<=
br>
&gt; &gt; &gt; &gt;&gt; +++ b/testcases/kernel/syscalls/swapon/libswapon.c<=
br>
&gt; &gt; &gt; &gt;&gt; @@ -19,13 +19,15 @@<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0*<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; +#include &lt;errno.h&gt;<br>
&gt; &gt; &gt; &gt;&gt; +#include &quot;lapi/syscalls.h&quot;<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 #include &quot;test.h&quot;<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 #include &quot;libswapon.h&quot;<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 /*<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0* Make a swap file<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt;&gt; -void make_swapfile(void (cleanup)(void), const cha=
r *swapfile)<br>
&gt; &gt; &gt; &gt;&gt; +int make_swapfile(void (cleanup)(void), const char=
 *swapfile, int<br>
&gt; &gt; safe)<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tst_fs_has_fr=
ee(NULL, &quot;.&quot;, sysconf(_SC_PAGESIZE) * 10,<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_=
BYTES)) {<br>
&gt; &gt; &gt; &gt;&gt; @@ -45,5 +47,44 @@ void make_swapfile(void (cleanup=
)(void), const char<br>
&gt; &gt; &gt; &gt;&gt; *swapfile)<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv[1] =3D swapfi=
le;<br>
&gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv[2] =3D NULL;<=
br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_run_cmd(cleanup, ar=
gv, &quot;/dev/null&quot;, &quot;/dev/null&quot;, 0);<br>
&gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return tst_run_cmd(clea=
nup, argv, &quot;/dev/null&quot;, &quot;/dev/null&quot;,<br>
&gt; &gt; safe);<br>
&gt; &gt; &gt; &gt;&gt; +}<br>
&gt; &gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt; &gt;&gt; +/*<br>
&gt; &gt; &gt; &gt;&gt; + * Check swapon/swapoff support status of filesyst=
ems or files<br>
&gt; &gt; &gt; &gt;&gt; + * we are testing on.<br>
&gt; &gt; &gt; &gt;&gt; + */<br>
&gt; &gt; &gt; &gt;&gt; +void is_swap_supported(void (cleanup)(void), const=
 char *filename)<br>
&gt; &gt; &gt; &gt;&gt; +{<br>
&gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int fibmap =3D tst_fibm=
ap(filename);<br>
&gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0long fs_type =3D tst_fs=
_type(cleanup, filename);<br>
&gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *fstype =3D =
tst_fs_type_name(fs_type);<br>
&gt; &gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D make_swapfi=
le(NULL, filename, 1);<br>
&gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<br>
&gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (fibmap !=3D 0) {<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; As I replied in patch 1/4, how do we know that means FI=
BMAP not<br>
&gt; &gt; support if<br>
&gt; &gt; &gt; &gt; just verify fibmap !=3D 0?<br>
&gt; &gt; &gt; &gt; So I would suggest to make the return value of tst_fibm=
ap() is more<br>
&gt; &gt; &gt; &gt; precise and do if (fibmap =3D=3D 1) check here.<br>
&gt; &gt;<br>
&gt; &gt; Very good catch. The return value should be more precise. Thanks!=
<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And also, imagine that if swapon01 test failed on BRTFS or N=
FS(support<br>
&gt; &gt; &gt; swapfile but not<br>
&gt; &gt; &gt; support FIBMAP ioctl), then here will report the new bug as =
a TCONF to<br>
&gt; &gt; LTP.<br>
&gt; &gt;<br>
&gt; &gt; Here is testing mkswap for swapon test preparation. If mkswap fai=
l, and<br>
&gt; &gt; FIBMAP not supported, it&#39;s reasonable to me that we should no=
t go on to<br>
&gt; &gt; test swapon.<br>
&gt; &gt;<br>
&gt; &gt; But yes, if a regression causes mkswap fail without FIBMAP suppor=
ted, we<br>
&gt; &gt; could miss the bug here like you described. This situation should=
 be<br>
&gt; &gt; covered by tcase for mkswap IMO.<br>
&gt; &gt;<br>
&gt; <br>
&gt; I&#39;m thinking maybe we cann&#39;t avoid adding a whilelist in the t=
est, at least<br>
&gt; for known filesystem without FIBMAP supported.<br>
<br>
No, I think we don&#39;t need a whilelist here. Amir and I discussed long w=
ay<br>
to here, you can check that. We are not using fibmap test as a verdict for<=
br>
swapfile is supported or not. Doing a mkswap/swapon/swapoff test before<br>
real tests to detect the support situation. tst_fibmap result helps us<br>
to decide how to report. If the underneath filesystem can survive these<br>
test, it should be supporting swapfiles and swapon/swapoff tests should<br>
run.</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The whitelisted nfs and tmpfs are well covered by these pre-tests. More, <b=
r>
NFS should not be skipped as if we turn on kernle configs for NFS_SWAP,<br>
these tests can run on NFS.<br>
<br>
Whitelist could skip more tests and bugs.<br>
<br>
I tested some fibmap/mkswap/swapon/swapoff tests for your reference:<br></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">Thanks a lot for the test report, good to know these details.</di=
v></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
1 means positive, 0 means negative.<br>
<br>
-------- On 5.3-rc3+ kernel, NFS_SWAP=3Dy SUNRPC_SWAP=3Dy -------<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fibamp=C2=A0 mkswap=C2=A0 swapon swapoff<br>
xfs=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =
=C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
ext4=C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=
=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
<br>
btrfs=C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A00=
=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
tmpfs=C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A00=
=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
<br>
ovl=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =
=C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
<br>
cifs<br>
v3.11=C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A00=
=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
v1=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =
=C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
v2=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =
=C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
<br>
nfs<br>
v4.2=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=
*=C2=A0 =C2=A0 =C2=A0 1<br>
v4.1=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=
=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
v4.0=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=
*=C2=A0 =C2=A0 =C2=A0 1<br>
v3=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =
=C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
<br>
* hang sometimes<br>
<br>
--------- On 3.10.0 based kernel ----------------<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fibamp=C2=A0 mkswap=C2=A0 swapon swapoff<br>
xfs=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =
=C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
ext4=C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=
=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
<br>
btrfs=C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A00=
=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
tmpfs=C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A00=
=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
<br>
ovl=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =
=C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
<br>
cifs<br>
v3.0=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A00=
=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
<br>
nfs<br>
v4.2=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A00=
=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
<br>
<br>
---------- On 2.6.32 based kernel ---------------<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fibamp=C2=A0 mkswap=C2=A0 swapon swapoff<br>
tmpfs=C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A00=
=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
xfs=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =
=C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
ext4=C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A01=
=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
cifs=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A00=
=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
nfs=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =
=C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
<br>
&gt; <br>
&gt; FYI: what do you think if change the is_swap_supported(...) like this?=
<br>
&gt; <br>
&gt; void is_swap_supported(void (cleanup)(void), const char *filename)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fibmap =3D tst_fibmap(filename);<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fibmap =3D=3D 1) {<br>
<br>
fibmap =3D=3D 0 does not mean swapfile is supported. We need to make sure t=
hat<br>
survivors of this function are supporting swapfiles.<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes, i=
t sounds quite reasonable. So besides that return value of tst_fibmap() is =
not precise, patch V6 LGTM. Feel free to add my review in patch v7:</div></=
div></div><div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li=
 Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</d=
iv></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><=
div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></=
div>

--000000000000b344a4058af4cf54--

--===============1705882641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1705882641==--
