Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13E17B67C
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 06:44:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F0593C63D2
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 06:43:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4D8CA3C12AE
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 06:43:54 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 25B5F1A00EF1
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 06:43:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583473431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HEupDfjpipqu3GJ+vIA1tNZlSN6veR65s/GnYEoE9cU=;
 b=VRex8/rKm0UEqPGWBSX/RmBLBkMEM9uks51n3XGEHzfXs4neCWDRUu5y6DLQJNSp+SyvFO
 W9mNEyjW5K2bBR0w1arWs9dyyoo0d7ETp32qD0VSeERsRw/Txrn+TY5F72+CzYxZoTuqEm
 Nx1Xnl/GWuMTGYAFF9EM8omXeCNnE90=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-ML_2phiqOBiSNWhZNxEucA-1; Fri, 06 Mar 2020 00:43:48 -0500
X-MC-Unique: ML_2phiqOBiSNWhZNxEucA-1
Received: by mail-oi1-f198.google.com with SMTP id w139so865119oiw.11
 for <ltp@lists.linux.it>; Thu, 05 Mar 2020 21:43:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ja/BgTNb0P70BHuvgWYioIOK2seuBJrK+s9FInP8uzc=;
 b=c1e3tmkpwQthDScQBGMw/qw3OAd/3cJMEye/bdk31ZpuR0N+69itdw0ANe10Q2MOBS
 teBpTDxnQEATeGb4Ys7BFwlaS8Sa3TW5HTWkeqzvnE7M/wKXIReOh2HHMxS6W4/E8/DU
 gtJUvVEka7TMYRP0AFoqbJ/31DXhFztw6n7nackmNRA/4HqX1iInhw8WEjjjoVx5zPaO
 ewnNKThPh85W2PnVwE4CupzU0huy3wy+c1VPYHM0Fu+B6pfibWkiw8C60YDhnrFLZuu7
 5+BEaws9uzfzdOR6JKDxbF648HZ5u/r7h6zO9ffROCw4X2wsRZrtF68cVb+/YRJit/fp
 DJYw==
X-Gm-Message-State: ANhLgQ3DNb9ZqeVkGM1HttUvlAxKvNHnIRJhsI2GwYO7R2iUvnUS2ztC
 TJXpWoq7rK2aGNorpLttjLD8dgkvPLgQy0MzAcoq2IX1mBADD1IEzyYuvhkP9QE2yr8e2kgUiHk
 bJUsV7RZc7Ec60ypMPv5L055GNTs=
X-Received: by 2002:aca:52c7:: with SMTP id g190mr1418504oib.144.1583473423892; 
 Thu, 05 Mar 2020 21:43:43 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt/r1mTIvq+7+88KZOn2HWQTsvYkag/Op4zQKopZgFTxBkhZGufxQaycdR3gZ31Z3hHifPDjEkW/ezjB0mQ51g=
X-Received: by 2002:aca:52c7:: with SMTP id g190mr1418493oib.144.1583473423563; 
 Thu, 05 Mar 2020 21:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20200305171844.24020-1-pvorel@suse.cz>
 <cd067b8a-224d-993f-8668-e8f7b70f59bc@cn.fujitsu.com>
In-Reply-To: <cd067b8a-224d-993f-8668-e8f7b70f59bc@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 6 Mar 2020 13:43:32 +0800
Message-ID: <CAEemH2c9nXB1mVcv_6qtrHS+dbVz5xUyiaHfsLstLwkQu3_Bmg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] hugeshmctl01: Fix reset stat_time when
 looping with -i n
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
Content-Type: multipart/mixed; boundary="===============1073939254=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1073939254==
Content-Type: multipart/alternative; boundary="000000000000ec4fce05a029220e"

--000000000000ec4fce05a029220e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2020 at 9:53 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote=
:

> Hi Petr
>
> > c7a2d296b didn't reset stat_time, thus uninitialized set_shared was
> > assigned to test variable and test got value from a null pointer,
> > which leaded to segfault.
> >
> > hugeshmctl01.c:279: PASS: shmctl in func_rmid() failed as expected,
> shared memory appears to be removed
> > tst_checkpoint.c:147: BROK: hugeshmctl01.c:152: tst_checkpoint_wait(0,
> 10000): ETIMEDOUT (110)
> > mem.c:817: INFO: set nr_hugepages to 0
> >
> > dmesg:
> > segfault at 7f73f8c00000 ip 00000000004051e1 sp 00007ffef375f9a0 error =
6
> in hugeshmctl01.master[404000+13000]
> > addr2line -e hugeshmctl01 -f  00000000004051e1
> > stat_setup
> > hugeshmctl01.c:139 (discriminator 4)
> >
> > test =3D (stat_time =3D=3D FIRST) ? set_shmat() : set_shared;
> >
> > /* do an assignement for fun */
> > *(int *)test =3D i; // error here
> >
> > Fixes: c7a2d296b ("hugeshmctl: Use loop from the API")
> >
> > Reported-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> > Suggested-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi Xu,
> >
> > I'm sorry for introducing a regression.
> > Thank you for a report and fixing the test.
> > I'd personally prefer to keep .tcnt =3D ARRAY_SIZE(tcases),
> > but maybe others will prefer to keep loop in test_hugeshmctl()
> > as it was before my change.
> >
> > BTW it'd be nice to have something like setup_i() and cleanup_i(),
> > which would be called before/after each run of whole test, when run wit=
h
> > -i n.
> Sub tests have own clean and setup function. They only reused  a System
> V shared memory segment. IMO, this is a question of coupling.
> >
> > Kind regards,
> > Petr
> >
> >   .../mem/hugetlb/hugeshmctl/hugeshmctl01.c     | 27 ++++++++++--------=
-
> >   1 file changed, 14 insertions(+), 13 deletions(-)
> >
> > diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
> b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
> > index e6cf8bf09..3b7e14363 100644
> > --- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
> > +++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
> > @@ -75,6 +75,20 @@ struct tcase {
> >
> >   static void test_hugeshmctl(unsigned int i)
> >   {
> > +     stat_time =3D FIRST;
> > +
> My description may confuse you.  stat_time should not be reseted every
> time, it only needs to be reseted when next loop. This value will be +1
>   when call stat_cleanup.
>

Xu Yang is correct here. If we do reset 'stat_time' to FIRST in each loop
then it would be missing the SECOND part in the stat_setup(). We can fix
the problem simply to move the 'stat_time' to if-condition as he suggested.

But to be honest, the looping workflow of hugeshmctl01 looks a little bit
in disorder that may be the reason makes Petr missed the 'stat_time' value
part, I appreciated if someone who can help to refactor the hugeshmctl01:).


> struct tcase {
>          int cmd;
>          void (*func_test) (void);
>          void (*func_setup) (void);
> } tcases[] =3D {
>          {IPC_STAT, func_stat, stat_setup},   //stat_time =3D FIRST
>          {IPC_STAT, func_stat, stat_setup},   //stat_time =3D SECOND
>
> As you do, the first and second case are same. it should be added into
> the "if =3D=3D 0".
>
> ps: I personally think old case is more cleaner. Let's hear from others.
>
> Best Regards
> Yang Xu
> > +     /*
> > +      * Create a shared memory segment with read and write
> > +      * permissions. Do this here instead of in setup()
> > +      * so that looping (-i) will work correctly.
> > +      */
> > +     if (i =3D=3D 0) {
> > +             shm_id_1 =3D shmget(shmkey, shm_size,
> > +                             SHM_HUGETLB | IPC_CREAT | IPC_EXCL |
> SHM_RW);
> > +             if (shm_id_1 =3D=3D -1)
> > +                     tst_brk(TBROK | TERRNO, "shmget #main");
> > +     }
> > +
> >       /*
> >        * if needed, set up any required conditions by
> >        * calling the appropriate setup function
> > @@ -296,19 +310,6 @@ void setup(void)
> >       shm_size =3D hpage_size * hugepages / 2;
> >       update_shm_size(&shm_size);
> >       shmkey =3D getipckey();
> > -
> > -     /* initialize stat_time */
> > -     stat_time =3D FIRST;
> > -
> > -     /*
> > -      * Create a shared memory segment with read and write
> > -      * permissions.  Do this here instead of in setup()
> > -      * so that looping (-i) will work correctly.
> > -      */
> > -     shm_id_1 =3D shmget(shmkey, shm_size,
> > -                     SHM_HUGETLB | IPC_CREAT | IPC_EXCL | SHM_RW);
> > -     if (shm_id_1 =3D=3D -1)
> > -             tst_brk(TBROK | TERRNO, "shmget #main");
> >   }
> >
> >   void cleanup(void)
> >
>
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--000000000000ec4fce05a029220e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Mar 6, 2020 at 9:53 AM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Pet=
r<br>
<br>
&gt; c7a2d296b didn&#39;t reset stat_time, thus uninitialized set_shared wa=
s<br>
&gt; assigned to test variable and test got value from a null pointer,<br>
&gt; which leaded to segfault.<br>
&gt; <br>
&gt; hugeshmctl01.c:279: PASS: shmctl in func_rmid() failed as expected, sh=
ared memory appears to be removed<br>
&gt; tst_checkpoint.c:147: BROK: hugeshmctl01.c:152: tst_checkpoint_wait(0,=
 10000): ETIMEDOUT (110)<br>
&gt; mem.c:817: INFO: set nr_hugepages to 0<br>
&gt; <br>
&gt; dmesg:<br>
&gt; segfault at 7f73f8c00000 ip 00000000004051e1 sp 00007ffef375f9a0 error=
 6 in hugeshmctl01.master[404000+13000]<br>
&gt; addr2line -e hugeshmctl01 -f=C2=A0 00000000004051e1<br>
&gt; stat_setup<br>
&gt; hugeshmctl01.c:139 (discriminator 4)<br>
&gt; <br>
&gt; test =3D (stat_time =3D=3D FIRST) ? set_shmat() : set_shared;<br>
&gt; <br>
&gt; /* do an assignement for fun */<br>
&gt; *(int *)test =3D i; // error here<br>
&gt; <br>
&gt; Fixes: c7a2d296b (&quot;hugeshmctl: Use loop from the API&quot;)<br>
&gt; <br>
&gt; Reported-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.co=
m" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
&gt; Suggested-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.c=
om" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
&gt; Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=
=3D"_blank">pvorel@suse.cz</a>&gt;<br>
&gt; ---<br>
&gt; Hi Xu,<br>
&gt; <br>
&gt; I&#39;m sorry for introducing a regression.<br>
&gt; Thank you for a report and fixing the test.<br>
&gt; I&#39;d personally prefer to keep .tcnt =3D ARRAY_SIZE(tcases),<br>
&gt; but maybe others will prefer to keep loop in test_hugeshmctl()<br>
&gt; as it was before my change.<br>
&gt; <br>
&gt; BTW it&#39;d be nice to have something like setup_i() and cleanup_i(),=
<br>
&gt; which would be called before/after each run of whole test, when run wi=
th<br>
&gt; -i n.<br>
Sub tests have own clean and setup function. They only reused=C2=A0 a Syste=
m <br>
V shared memory segment. IMO, this is a question of coupling.<br>
&gt; <br>
&gt; Kind regards,<br>
&gt; Petr<br>
&gt; <br>
&gt;=C2=A0 =C2=A0.../mem/hugetlb/hugeshmctl/hugeshmctl01.c=C2=A0 =C2=A0 =C2=
=A0| 27 ++++++++++---------<br>
&gt;=C2=A0 =C2=A01 file changed, 14 insertions(+), 13 deletions(-)<br>
&gt; <br>
&gt; diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c b/=
testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c<br>
&gt; index e6cf8bf09..3b7e14363 100644<br>
&gt; --- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c<br>
&gt; +++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c<br>
&gt; @@ -75,6 +75,20 @@ struct tcase {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void test_hugeshmctl(unsigned int i)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0stat_time =3D FIRST;<br>
&gt; +<br>
My description may confuse you.=C2=A0 stat_time should not be reseted every=
 <br>
time, it only needs to be reseted when next loop. This value will be +1 <br=
>
=C2=A0 when call stat_cleanup.<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Xu Yang is correct here. If =
we do reset &#39;stat_time&#39; to FIRST in each loop then it would be miss=
ing=C2=A0the SECOND part in the stat_setup(). We can fix the problem simply=
 to move the &#39;stat_time&#39; to if-condition as he suggested.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">But to be honest, the looping work=
flow of hugeshmctl01=C2=A0looks a little bit in disorder that may be the re=
ason makes Petr missed the &#39;stat_time&#39; value part, I=C2=A0appreciat=
ed=C2=A0if someone who can help to refactor the hugeshmctl01:).</div></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
struct tcase {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int cmd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void (*func_test) (void);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void (*func_setup) (void);<br>
} tcases[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{IPC_STAT, func_stat, stat_setup},=C2=A0 =
=C2=A0//stat_time =3D FIRST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{IPC_STAT, func_stat, stat_setup},=C2=A0 =
=C2=A0//stat_time =3D SECOND<br>
<br>
As you do, the first and second case are same. it should be added into <br>
the &quot;if =3D=3D 0&quot;.<br>
<br>
ps: I personally think old case is more cleaner. Let&#39;s hear from others=
.<br>
<br>
Best Regards<br>
Yang Xu<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Create a shared memory segment with read and w=
rite<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * permissions. Do this here instead of in setup(=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * so that looping (-i) will work correctly.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shm_id_1 =3D shmget(s=
hmkey, shm_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SHM_HUGETLB | IPC_CREAT | IPC_EXCL | SHM=
_RW);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (shm_id_1 =3D=3D -=
1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_brk(TBROK | TERRNO, &quot;shmget #main&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * if needed, set up any required conditions=
 by<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * calling the appropriate setup function<br=
>
&gt; @@ -296,19 +310,6 @@ void setup(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shm_size =3D hpage_size * hugepages / 2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0update_shm_size(&amp;shm_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shmkey =3D getipckey();<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* initialize stat_time */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0stat_time =3D FIRST;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Create a shared memory segment with read and w=
rite<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * permissions.=C2=A0 Do this here instead of in =
setup()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * so that looping (-i) will work correctly.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0shm_id_1 =3D shmget(shmkey, shm_size,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0SHM_HUGETLB | IPC_CREAT | IPC_EXCL | SHM_RW);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (shm_id_1 =3D=3D -1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TERRN=
O, &quot;shmget #main&quot;);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void cleanup(void)<br>
&gt; <br>
<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000ec4fce05a029220e--


--===============1073939254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1073939254==--

