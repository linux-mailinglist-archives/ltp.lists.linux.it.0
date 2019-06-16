Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E8447399
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 09:20:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D77723EB05E
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 09:20:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B15203EA4BE
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 09:20:14 +0200 (CEST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DB5DC14060B1
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 09:20:11 +0200 (CEST)
Received: by mail-vs1-f45.google.com with SMTP id q64so4305334vsd.1
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 00:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tB0YPadNqTHpOnTqMNJ6gLSnmMz+f/qGd96TdW9smIo=;
 b=IW90gjBNZ3o5TZZgVrP5km7Nns8uBFKbuZDreyRynfSMIlJMBVDyZZZi3IqY0yktAm
 jSIQNf1VY47VTg8AKreOL+vS8yBN5zSD4PzGPEQ7RuMYJQ4gagQM+yHPZq0Feactieg2
 Ygb3+I4PJ7e0IAlB3JLwoCC5qJgDRY8SF035u9pNBXBTwh296i6LSLEGQD6fPN8GDNBz
 nzM7hfumuQp6yQt/vuHcJP8yx9QeJhZWwSDI23d6+z27ruOXQaWp6MyAIKauwBQ4IUzK
 M0pQKtxqUnlVd2mxxMxLA/7mB4TqZCmJ0z7iaXan3vQ+TZhSfxQhekIHjzDac85KhRAX
 dFaw==
X-Gm-Message-State: APjAAAXfx3X7aAwOoRYn5PBl41qTiDWbuoYjAjKKDTAtLrHqtyLQplh/
 oYElcT127rtErUokq1Y/8M2nUiRXkeQX18dgoaSpkQ==
X-Google-Smtp-Source: APXvYqzLPBII2VraU6Hb6bkymBscVMRzE/mrIO/DDh5Ruu9F3jxqrD+KT15HLnC6mH2tIfu8ndJlqJfOl7BNnwlGDIQ=
X-Received: by 2002:a67:11c1:: with SMTP id 184mr28740515vsr.217.1560669610790; 
 Sun, 16 Jun 2019 00:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <1552978181-27748-1-git-send-email-sumit.garg@linaro.org>
 <1552978181-27748-4-git-send-email-sumit.garg@linaro.org>
 <1142529550.28348566.1560640103965.JavaMail.zimbra@redhat.com>
 <CAEemH2cCvaPKa480Y3L5+V8ihRtwcTYZPo5ebU7Ss8tfRDXkuQ@mail.gmail.com>
 <847341899.28355719.1560668683548.JavaMail.zimbra@redhat.com>
In-Reply-To: <847341899.28355719.1560668683548.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Sun, 16 Jun 2019 15:19:59 +0800
Message-ID: <CAEemH2dw=HaFAaL+AraOTot=V1zPM4qwLx8KVv-v8hhPchVEuw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: daniel thompson <daniel.thompson@linaro.org>, LTP List <ltp@lists.linux.it>,
 Greg Hackmann <ghackmann@google.com>
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/tgkill03: add new test
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
Content-Type: multipart/mixed; boundary="===============1489524852=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1489524852==
Content-Type: multipart/alternative; boundary="000000000000c371da058b6bb527"

--000000000000c371da058b6bb527
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 16, 2019 at 3:04 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > On Sun, Jun 16, 2019 at 7:08 AM Jan Stancek <jstancek@redhat.com> wrote:
> >
> > >
> > > ----- Original Message -----
> > > > +static void setup(void)
> > > > +{
> > > > +     sigset_t sigusr1;
> > > > +     pthread_t defunct_thread;
> > > > +
> > > > +     sigemptyset(&sigusr1);
> > > > +     sigaddset(&sigusr1, SIGUSR1);
> > > > +     pthread_sigmask(SIG_BLOCK, &sigusr1, NULL);
> > > > +
> > > > +     parent_tgid = getpid();
> > > > +     parent_tid = sys_gettid();
> > > > +
> > > > +     SAFE_PTHREAD_CREATE(&child_thread, NULL, child_thread_func,
> NULL);
> > > > +
> > > > +     TST_CHECKPOINT_WAIT(0);
> > >
> > > I'm seeing reports of this test failing on s390x:
> > >
> > > st_test.c:1096: INFO: Timeout per run is 0h 05m 00s
> > > tgkill03.c:92: PASS: Invalid tgid failed as expected: EINVAL
> > > tgkill03.c:92: PASS: Invalid tid failed as expected: EINVAL
> > > tgkill03.c:92: PASS: Invalid signal failed as expected: EINVAL
> > > tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH: SUCCESS
> > > tgkill03.c:92: PASS: Defunct tgid failed as expected: ESRCH
> > > tgkill03.c:99: PASS: Valid tgkill call succeeded
> > >
> > > and I suspect this piece:
> > >
> > > > +
> > > > +     SAFE_PTHREAD_CREATE(&defunct_thread, NULL, defunct_thread_func,
> > > NULL);
> > > > +
> > > > +     SAFE_PTHREAD_JOIN(defunct_thread, NULL);
> > > > +}
> > >
> > > glibc pthread_join() waits for CLONE_CHILD_CLEARTID to clear tid,
> > > and then resumes. Which kernel does at:
> > >   do_exit
> > >     exit_mm
> > >       mm_release
> > >         put_user(0, tsk->clear_child_tid);
> > >
> > > so there's still work to be done after that, and I suspect tid is still
> > > valid
> > > while that happens.
> > >
> > > My first idea: wait until /proc/pid/task/<tid> disappears.
> > >
> >
> > The anaysis is probably right, but this idea doesn't work for me. Seems
> > /proc/pid/task/<tid> is not the key point to confirm that tid has been
> > clear.
> >
> > I just have a try as below:
> >
> > ===========
> > # for i in `seq 1000`; do echo "i = $i" && ./tgkill03 || break; done
> > ...
> > i = 96
> > tst_test.c:1112: INFO: Timeout per run is 0h 05m 00s
> > tgkill03.c:106: FAIL: Defunct tid should have failed with ESRCH: SUCCESS
> >
> > ===========
> > --- a/testcases/kernel/syscalls/tgkill/tgkill03.c
> > +++ b/testcases/kernel/syscalls/tgkill/tgkill03.c
> > @@ -5,6 +5,7 @@
> >   * Test simple tgkill() error cases.
> >   */
> >
> > +#include <stdio.h>
> >  #include <pthread.h>
> >  #include <pwd.h>
> >  #include <sys/types.h>
> > @@ -19,6 +20,7 @@ static pid_t parent_tgid;
> >  static pid_t parent_tid;
> >  static pid_t child_tid;
> >  static pid_t defunct_tid;
> > +char buf[1024];
> >
> >  static const int invalid_pid = -1;
> >
> > @@ -35,6 +37,8 @@ static void *defunct_thread_func(void *arg)
> >  {
> >         defunct_tid = sys_gettid();
> >
> > +       sprintf(buf, "/proc/pid/task/%d", defunct_tid);
>
> How about?
>           sprintf(buf, "/proc/%d/task/%d", getpid(), defunct_tid);
>
>
Ah, I was stupid to lost the getpid :-).

This look prettry good. The test fall into while loop when defunct_tid is
still exit, and get the expected result once /proc/pid/task/<tid>
disappears.

# for i in `seq 1000`; do echo "i = $i" && ./tgkill03 || break; done
...
i = 997
tst_test.c:1112: INFO: Timeout per run is 0h 05m 00s
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!
tgkill03.c:102: PASS: Defunct tgid failed as expected: ESRCH

Summary:
passed   1
failed   0
skipped  0
warnings 0
...
i = 1000
tst_test.c:1112: INFO: Timeout per run is 0h 05m 00s
tgkill03.c:102: PASS: Defunct tgid failed as expected: ESRCH

Summary:
passed   1
failed   0
skipped  0
warnings 0

-- 
Regards,
Li Wang

--000000000000c371da058b6bb527
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Jun 16, 2019 at 3:04 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; On Sun, Jun 16, 2019 at 7:08 AM Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; ----- Original Message -----<br>
&gt; &gt; &gt; +static void setup(void)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0sigset_t sigusr1;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pthread_t defunct_thread;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;sigusr1);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0sigaddset(&amp;sigusr1, SIGUSR1);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pthread_sigmask(SIG_BLOCK, &amp;sigusr1=
, NULL);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0parent_tgid =3D getpid();<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0parent_tid =3D sys_gettid();<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_CREATE(&amp;child_thread, =
NULL, child_thread_func, NULL);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAIT(0);<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m seeing reports of this test failing on s390x:<br>
&gt; &gt;<br>
&gt; &gt; st_test.c:1096: INFO: Timeout per run is 0h 05m 00s<br>
&gt; &gt; tgkill03.c:92: PASS: Invalid tgid failed as expected: EINVAL<br>
&gt; &gt; tgkill03.c:92: PASS: Invalid tid failed as expected: EINVAL<br>
&gt; &gt; tgkill03.c:92: PASS: Invalid signal failed as expected: EINVAL<br=
>
&gt; &gt; tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH: S=
UCCESS<br>
&gt; &gt; tgkill03.c:92: PASS: Defunct tgid failed as expected: ESRCH<br>
&gt; &gt; tgkill03.c:99: PASS: Valid tgkill call succeeded<br>
&gt; &gt;<br>
&gt; &gt; and I suspect this piece:<br>
&gt; &gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_CREATE(&amp;defunct_thread=
, NULL, defunct_thread_func,<br>
&gt; &gt; NULL);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_JOIN(defunct_thread, NULL)=
;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt;<br>
&gt; &gt; glibc pthread_join() waits for CLONE_CHILD_CLEARTID to clear tid,=
<br>
&gt; &gt; and then resumes. Which kernel does at:<br>
&gt; &gt;=C2=A0 =C2=A0do_exit<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0exit_mm<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mm_release<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_user(0, tsk-&gt;clear_child_=
tid);<br>
&gt; &gt;<br>
&gt; &gt; so there&#39;s still work to be done after that, and I suspect ti=
d is still<br>
&gt; &gt; valid<br>
&gt; &gt; while that happens.<br>
&gt; &gt;<br>
&gt; &gt; My first idea: wait until /proc/pid/task/&lt;tid&gt; disappears.<=
br>
&gt; &gt;<br>
&gt; <br>
&gt; The anaysis is probably right, but this idea doesn&#39;t work for me. =
Seems<br>
&gt; /proc/pid/task/&lt;tid&gt; is not the key point to confirm that tid ha=
s been<br>
&gt; clear.<br>
&gt; <br>
&gt; I just have a try as below:<br>
&gt; <br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; # for i in `seq 1000`; do echo &quot;i =3D $i&quot; &amp;&amp; ./tgkil=
l03 || break; done<br>
&gt; ...<br>
&gt; i =3D 96<br>
&gt; tst_test.c:1112: INFO: Timeout per run is 0h 05m 00s<br>
&gt; tgkill03.c:106: FAIL: Defunct tid should have failed with ESRCH: SUCCE=
SS<br>
&gt; <br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; --- a/testcases/kernel/syscalls/tgkill/tgkill03.c<br>
&gt; +++ b/testcases/kernel/syscalls/tgkill/tgkill03.c<br>
&gt; @@ -5,6 +5,7 @@<br>
&gt;=C2=A0 =C2=A0* Test simple tgkill() error cases.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; <br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt;=C2=A0 #include &lt;pthread.h&gt;<br>
&gt;=C2=A0 #include &lt;pwd.h&gt;<br>
&gt;=C2=A0 #include &lt;sys/types.h&gt;<br>
&gt; @@ -19,6 +20,7 @@ static pid_t parent_tgid;<br>
&gt;=C2=A0 static pid_t parent_tid;<br>
&gt;=C2=A0 static pid_t child_tid;<br>
&gt;=C2=A0 static pid_t defunct_tid;<br>
&gt; +char buf[1024];<br>
&gt; <br>
&gt;=C2=A0 static const int invalid_pid =3D -1;<br>
&gt; <br>
&gt; @@ -35,6 +37,8 @@ static void *defunct_thread_func(void *arg)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defunct_tid =3D sys_gettid();<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(buf, &quot;/proc/pid/task/%d&quot;=
, defunct_tid);<br>
<br>
How about?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buf, &quot;/proc/%d/task/%d&quot=
;, getpid(), defunct_tid);<br>
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Ah, I was stupid to lost the getpid :-).</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">This look prettry good. The test fall into whil=
e loop when defunct_tid is still exit, and get the expected result once /pr=
oc/pid/task/&lt;tid&gt; disappears.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"># for i in `seq 1000`; do echo &quot;i =3D $i&quot; &amp;&amp; .=
/tgkill03 || break; done<br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">...</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">i =3D 997<br>tst_test.c:1112: INFO: Timeout per run is 0h 05m 00s<br></d=
iv><span class=3D"gmail_default" style=3D"font-size:small"></span>tgkill03.=
c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO=
: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /=
proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/=
task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 =
still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exis=
t!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br>tgki=
ll03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95:=
 INFO: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Deb=
ug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/=
5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/=
5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still=
 exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br=
>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.=
c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO=
: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /=
proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/=
task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 =
still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exis=
t!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br>tgki=
ll03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95:=
 INFO: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Deb=
ug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/=
5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/=
5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still=
 exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br=
>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.=
c:95: INFO: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO=
: Debug: /proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /=
proc/5164/task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/=
task/5166 still exist!<br>tgkill03.c:95: INFO: Debug: /proc/5164/task/5166 =
still exist!<br>tgkill03.c:102: PASS: Defunct tgid failed as expected: ESRC=
H<br><br>Summary:<br>passed =C2=A0 1<br>failed =C2=A0 0<br>skipped =C2=A00<=
br>warnings 0</div><div class=3D"gmail_quote"><div class=3D"gmail_default" =
style=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"font-=
size:small">...</div><div class=3D"gmail_default" style=3D"font-size:small"=
>i =3D 1000</div>tst_test.c:1112: INFO: Timeout per run is 0h 05m 00s<br>tg=
kill03.c:102: PASS: Defunct tgid failed as expected: ESRCH<br><br>Summary:<=
br>passed =C2=A0 1<br>failed =C2=A0 0<br>skipped =C2=A00<br>warnings 0</div=
><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000c371da058b6bb527--

--===============1489524852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1489524852==--
