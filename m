Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CDD24C9C1
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 03:57:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 798C93C2FCF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 03:57:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E540D3C0515
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 03:57:03 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9BB8514001F4
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 03:57:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597975021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u59hkoNAvFOmgGscOCpkpukUDEK2icLW4hOT6SYQX7c=;
 b=JqVpbRlFi4AEdZJg2x2f0cNfpsa2lsG5Q2qWKLXJ4DOYN21zz9T8rowVd29OjbqCfUJVY6
 I96Locn0LUrAXvOv4891b16TMmYhGp7+99PCprFwUif4EXmKSVPIKzQy6f1eKgpabv7S6b
 /YEA0DqjoV7YJzmTcHjeaQOPjz3uYUU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-slJJTW6ZPK6jKFWUuF2iyA-1; Thu, 20 Aug 2020 21:56:58 -0400
X-MC-Unique: slJJTW6ZPK6jKFWUuF2iyA-1
Received: by mail-yb1-f197.google.com with SMTP id u189so558408ybg.17
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 18:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u59hkoNAvFOmgGscOCpkpukUDEK2icLW4hOT6SYQX7c=;
 b=GkOnLBucSbR8VAQ+XU0NygA/F+bhITAfowgLjTvDXtqtSLAzIl2uwUej6QBgL4yZdk
 QEmrvioGZte4N6yUZMRr0L9krEWQ4gB7UyxyzZRVu97EBpsGFWyfw6tUTZgTUy2iSYRY
 tyGnquIdSuB07OwI2T+g/9x1S4iITirm7iVwQFuj5cm0QIJSAX+Vr9deyTuaGtnfiqVG
 QKxWCuD/jHm9bNNUTJpoAHlOHC1iUf+M4UMAvqLd+ksXPJIAyqsm/DMt/ehwZjDXEvP6
 qETJ/jLE27Q+8RbAFbVVlWmtx5XTFXG/dRrGb3N1oF6w5AqbPLN5TrrpaEOLAjen3PS5
 zPEQ==
X-Gm-Message-State: AOAM532R/LXp+pQT8jUoiFZ3aIwJ3R0yNOipQJh9MisS8+3fJwifMRk2
 VwMdt4MerMZxsktiugPTT5odd57H+KDHoQBfB746mrst7ENQ9azJAN0KEFUbmsi2hxDy80zwDGc
 3fPkksd0SVCQ6ZsIqmvUYJIxGqaI=
X-Received: by 2002:a25:ca41:: with SMTP id a62mr832361ybg.252.1597975018248; 
 Thu, 20 Aug 2020 18:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw/Ip/VJ/WuxWZ7E43ghc23uiSjvgu9M8rxLmTnCUmJB1hIcxERjbi9sPGxISNLPy1O6sWuGk7oS1O9Xrkj68=
X-Received: by 2002:a25:ca41:: with SMTP id a62mr832349ybg.252.1597975017992; 
 Thu, 20 Aug 2020 18:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <1597919168-10702-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1597919168-10702-2-git-send-email-zhufy.jy@cn.fujitsu.com>
 <CAEemH2eUd3yCuxt3iawHPXKUSryiJprud3HvneSr=JK_1wFhXg@mail.gmail.com>
 <43a404a1-dd4b-d091-5723-e756604fbbc8@cn.fujitsu.com>
In-Reply-To: <43a404a1-dd4b-d091-5723-e756604fbbc8@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 21 Aug 2020 09:56:46 +0800
Message-ID: <CAEemH2fjgYGLD0+JozNcMqv3Eo0eAwK8+BKOCo0QZihUPiP6eg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] syscalls/kill03,
 04: Cleanup && Convert to new library
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
Content-Type: multipart/mixed; boundary="===============0306575953=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0306575953==
Content-Type: multipart/alternative; boundary="0000000000004ed0f805ad598d8c"

--0000000000004ed0f805ad598d8c
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 21, 2020 at 9:18 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Hi Li
>
>
> >
> > Feiyu Zhu <zhufy.jy@cn.fujitsu.com <mailto:zhufy.jy@cn.fujitsu.com>>
> wrote:
> >
> >     ...
> >     +#include <unistd.h>
> >     +#include "tst_test.h"
> >     +
> >     +static pid_t real_pid, fake_pid, int_min_pid;
> >     +static void cleanup(void);
> >     +
> >     +static struct tcase {
> >     +       int test_sig;
> >     +       int exp_errno;
> >     +       int child_flag;
> >
> >
> > The child_flag field is not necessary, we could prepare a real child in
> > setup()
> > and reclaim it after testing via check the real_pid value, that will be
> > more easily.
> When I reviewed this patch in internal, I had the same idea. But when I
> try it and this case will hang because sub test will wait children
> finished by using tst_reap_childrens below:
>
> lib/tst_test.c
> static void run_tests(void)
> {
>         ...
>          for (i = 0; i < tst_test->tcnt; i++) {
>                  saved_results = *results;
>                  tst_test->test(i);
>
>                  if (getpid() != main_pid) {
>                          exit(0);
>                  }
>
>                  tst_reap_children();
>
>                  if (results_equal(&saved_results, results))
>                          tst_brk(TBROK, "Test %i haven't reported
> results!", i);
>          }
>
>
> }
>
> Also, we can use the current process id but it may has unexpected result
> when kill succeed. So fork a child to test maybe a better solution.
>

Hmm, sorry for the uncleared description, actually I meant, to use real_pid
instead of the tc->child_flag directly, then start to reclaim the child
when the
real_pid test finishing.

Does this below diff work for you?

--- a/testcases/kernel/syscalls/kill/kill03.c
+++ b/testcases/kernel/syscalls/kill/kill03.c
@@ -21,24 +21,17 @@ static void cleanup(void);
 static struct tcase {
        int test_sig;
        int exp_errno;
-       int child_flag;
        pid_t *pid;
 } tcases[] = {
-       {2000, EINVAL, 1, &real_pid},
-       {SIGKILL, ESRCH, 0, &fake_pid},
-       {SIGKILL, ESRCH, 0, &int_min_pid}
+       {2000, EINVAL, &real_pid},
+       {SIGKILL, ESRCH, &fake_pid},
+       {SIGKILL, ESRCH, &int_min_pid}
 };

 static void verify_kill(unsigned int n)
 {
        struct tcase *tc = &tcases[n];

-       if (tc->child_flag) {
-               real_pid = SAFE_FORK();
-               if (!real_pid)
-                       pause();
-       }
-
        TEST(kill(*tc->pid, tc->test_sig));
        if (TST_RET != -1) {
                tst_res(TFAIL, "kill should fail but not, return %ld",
TST_RET);
@@ -51,14 +44,19 @@ static void verify_kill(unsigned int n)
                tst_res(TFAIL | TTERRNO, "kill expected %s but got",
                        tst_strerrno(tc->exp_errno));

-       if (tc->child_flag) {
+       if (real_pid) {
                cleanup();
                real_pid = 0;
        }
+
 }

 static void setup(void)
 {
+       real_pid = SAFE_FORK();
+       if (!real_pid)
+               pause();
+
        fake_pid = tst_get_unused_pid();
        int_min_pid = INT_MIN;
 }
-- 
Regards,
Li Wang

--0000000000004ed0f805ad598d8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 21, 2020 at 9:18 AM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li<=
br>
<br>
<br>
&gt; <br>
&gt; Feiyu Zhu &lt;<a href=3D"mailto:zhufy.jy@cn.fujitsu.com" target=3D"_bl=
ank">zhufy.jy@cn.fujitsu.com</a> &lt;mailto:<a href=3D"mailto:zhufy.jy@cn.f=
ujitsu.com" target=3D"_blank">zhufy.jy@cn.fujitsu.com</a>&gt;&gt; wrote:<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#include &lt;unistd.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#include &quot;tst_test.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+static pid_t real_pid, fake_pid, int_min_pid;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+static void cleanup(void);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+static struct tcase {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0int test_sig;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0int exp_errno;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0int child_flag;<br>
&gt; <br>
&gt; <br>
&gt; The child_flag field is not necessary, we could prepare a real child i=
n <br>
&gt; setup()<br>
&gt; and=C2=A0reclaim it after testing via check the real_pid value, that w=
ill be <br>
&gt; more easily.<br>
When I reviewed this patch in internal, I had the same idea. But when I <br=
>
try it and this case will hang because sub test will wait children <br>
finished by using tst_reap_childrens below:<br>
<br>
lib/tst_test.c<br>
static void run_tests(void)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; tst_test-&gt;tcnt; i=
++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_results=
 =3D *results;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_test-&gt;=
test(i);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (getpid() =
!=3D main_pid) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0exit(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_reap_chil=
dren();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (results_e=
qual(&amp;saved_results, results))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;Test %i haven&#39;t reported <br>
results!&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
<br>
}<br>
<br>
Also, we can use the current process id but it may has unexpected result <b=
r>
when kill succeed. So fork a child to test maybe a better solution.<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Hmm, sorry for the uncleared description, actually I meant, to use=
 real_pid=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"=
>instead of the=C2=A0tc-&gt;child_flag directly, then start to reclaim the =
child when the</div><div class=3D"gmail_default" style=3D"font-size:small">=
real_pid test finishing.</div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Does this below diff work for you?</div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">--- a/testcases=
/kernel/syscalls/kill/kill03.c</div>+++ b/testcases/kernel/syscalls/kill/ki=
ll03.c<br>@@ -21,24 +21,17 @@ static void cleanup(void);<br>=C2=A0static st=
ruct tcase {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 int test_sig;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int exp_errno;<br>- =C2=A0 =C2=A0 =C2=A0 int child_flag;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid_t *pid;<br>=C2=A0} tcases[] =3D {<br>- =C2=
=A0 =C2=A0 =C2=A0 {2000, EINVAL, 1, &amp;real_pid},<br>- =C2=A0 =C2=A0 =C2=
=A0 {SIGKILL, ESRCH, 0, &amp;fake_pid},<br>- =C2=A0 =C2=A0 =C2=A0 {SIGKILL,=
 ESRCH, 0, &amp;int_min_pid}<br>+ =C2=A0 =C2=A0 =C2=A0 {2000, EINVAL, &amp;=
real_pid},<br>+ =C2=A0 =C2=A0 =C2=A0 {SIGKILL, ESRCH, &amp;fake_pid},<br>+ =
=C2=A0 =C2=A0 =C2=A0 {SIGKILL, ESRCH, &amp;int_min_pid}<br>=C2=A0};<br>=C2=
=A0<br>=C2=A0static void verify_kill(unsigned int n)<br>=C2=A0{<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 struct tcase *tc =3D &amp;tcases[n];<br>=C2=A0<br>- =
=C2=A0 =C2=A0 =C2=A0 if (tc-&gt;child_flag) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 real_pid =3D SAFE_FORK();<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!real_pid)<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pause();<br>- =C2=
=A0 =C2=A0 =C2=A0 }<br>-<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(kill(*tc-&gt;p=
id, tc-&gt;test_sig));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TST_RET !=3D -1) =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL,=
 &quot;kill should fail but not, return %ld&quot;, TST_RET);<br>@@ -51,14 +=
44,19 @@ static void verify_kill(unsigned int n)<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL | TTERRNO, &quot;kill expe=
cted %s but got&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_strerrno(tc-&gt;exp_errno));<br>=C2=
=A0<br>- =C2=A0 =C2=A0 =C2=A0 if (tc-&gt;child_flag) {<br>+ =C2=A0 =C2=A0 =
=C2=A0 if (real_pid) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cleanup();<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 real_pid =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>+<br>=C2=A0}<br>=C2=
=A0<br>=C2=A0static void setup(void)<br>=C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 r=
eal_pid =3D SAFE_FORK();<br>+ =C2=A0 =C2=A0 =C2=A0 if (!real_pid)<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pause();<br>+<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fake_pid =3D tst_get_unused_pid();<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int_min_pid =3D INT_MIN;<br>=C2=A0}<br><div class=3D"gmail_defau=
lt" style=3D"font-size:small"></div></div></div>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang=
<br></div></div></div></div>

--0000000000004ed0f805ad598d8c--


--===============0306575953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0306575953==--

