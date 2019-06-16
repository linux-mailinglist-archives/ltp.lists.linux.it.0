Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F233472CF
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 06:22:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B3773EA595
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 06:22:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 30E213EA4CD
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 06:22:54 +0200 (CEST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CB6E060344B
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 06:22:54 +0200 (CEST)
Received: by mail-vs1-f42.google.com with SMTP id m8so4200015vsj.0
 for <ltp@lists.linux.it>; Sat, 15 Jun 2019 21:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1l6yyfu8frGU7eze1Rt2RrOQS62mHQE5zheuUyDesHY=;
 b=NjFRttbppmSvgJHn7HrcJo1i8yC/weWIJXpafNWqPFpUSGzbB+0BRIk/lS0hjhc4UK
 BILYymMG1ymvNBUM1s3EUY9rsU3HqqMWG/bwQCTI0IcW4hWQWKt91ckusDTjsEZLV1Yv
 9dbMc/tgy9ojwG1FbnVodACYpUQEn5FRIn0VPYglsI0xPhiwMoCKHgpKmcpgNdyjD9jJ
 gmfZ3+pU7WDTcvWNMghm8qMQNvgW81LKTfUsex3YWFkskw+CsY3K07f/WyJY/zG5tiO+
 LHPT3ZtKTWcErJbHhzql2RmvDj2thZ3sEC0bwIKce4TVM4d+W7aNUeRoS4cOJ9+5Tjz5
 lH7A==
X-Gm-Message-State: APjAAAX+ECC7+s2l6i9XyOZAuUb1+svylIiomUT2ivOh238qARZ89Wxx
 apR5TzWvbcLlNYT6TxWEHiA7d0Ig7WaFwzeVXl3X0g==
X-Google-Smtp-Source: APXvYqwXi/suxuzpzdgI3p6sYazlvJkMYsnTX2EKupoArN3Xf9iPifVJob08H07+vmqFBcqTBWBs0wVnrNsTx27SEus=
X-Received: by 2002:a67:ed83:: with SMTP id d3mr27354934vsp.58.1560658970923; 
 Sat, 15 Jun 2019 21:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <1552978181-27748-1-git-send-email-sumit.garg@linaro.org>
 <1552978181-27748-4-git-send-email-sumit.garg@linaro.org>
 <1142529550.28348566.1560640103965.JavaMail.zimbra@redhat.com>
In-Reply-To: <1142529550.28348566.1560640103965.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Sun, 16 Jun 2019 12:22:39 +0800
Message-ID: <CAEemH2cCvaPKa480Y3L5+V8ihRtwcTYZPo5ebU7Ss8tfRDXkuQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1701857183=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1701857183==
Content-Type: multipart/alternative; boundary="00000000000093f962058b693b52"

--00000000000093f962058b693b52
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 16, 2019 at 7:08 AM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> > +static void setup(void)
> > +{
> > +     sigset_t sigusr1;
> > +     pthread_t defunct_thread;
> > +
> > +     sigemptyset(&sigusr1);
> > +     sigaddset(&sigusr1, SIGUSR1);
> > +     pthread_sigmask(SIG_BLOCK, &sigusr1, NULL);
> > +
> > +     parent_tgid = getpid();
> > +     parent_tid = sys_gettid();
> > +
> > +     SAFE_PTHREAD_CREATE(&child_thread, NULL, child_thread_func, NULL);
> > +
> > +     TST_CHECKPOINT_WAIT(0);
>
> I'm seeing reports of this test failing on s390x:
>
> st_test.c:1096: INFO: Timeout per run is 0h 05m 00s
> tgkill03.c:92: PASS: Invalid tgid failed as expected: EINVAL
> tgkill03.c:92: PASS: Invalid tid failed as expected: EINVAL
> tgkill03.c:92: PASS: Invalid signal failed as expected: EINVAL
> tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH: SUCCESS
> tgkill03.c:92: PASS: Defunct tgid failed as expected: ESRCH
> tgkill03.c:99: PASS: Valid tgkill call succeeded
>
> and I suspect this piece:
>
> > +
> > +     SAFE_PTHREAD_CREATE(&defunct_thread, NULL, defunct_thread_func,
> NULL);
> > +
> > +     SAFE_PTHREAD_JOIN(defunct_thread, NULL);
> > +}
>
> glibc pthread_join() waits for CLONE_CHILD_CLEARTID to clear tid,
> and then resumes. Which kernel does at:
>   do_exit
>     exit_mm
>       mm_release
>         put_user(0, tsk->clear_child_tid);
>
> so there's still work to be done after that, and I suspect tid is still
> valid
> while that happens.
>
> My first idea: wait until /proc/pid/task/<tid> disappears.
>

The anaysis is probably right, but this idea doesn't work for me. Seems
/proc/pid/task/<tid> is not the key point to confirm that tid has been
clear.

I just have a try as below:

===========
# for i in `seq 1000`; do echo "i = $i" && ./tgkill03 || break; done
...
i = 96
tst_test.c:1112: INFO: Timeout per run is 0h 05m 00s
tgkill03.c:106: FAIL: Defunct tid should have failed with ESRCH: SUCCESS

===========
--- a/testcases/kernel/syscalls/tgkill/tgkill03.c
+++ b/testcases/kernel/syscalls/tgkill/tgkill03.c
@@ -5,6 +5,7 @@
  * Test simple tgkill() error cases.
  */

+#include <stdio.h>
 #include <pthread.h>
 #include <pwd.h>
 #include <sys/types.h>
@@ -19,6 +20,7 @@ static pid_t parent_tgid;
 static pid_t parent_tid;
 static pid_t child_tid;
 static pid_t defunct_tid;
+char buf[1024];

 static const int invalid_pid = -1;

@@ -35,6 +37,8 @@ static void *defunct_thread_func(void *arg)
 {
        defunct_tid = sys_gettid();

+       sprintf(buf, "/proc/pid/task/%d", defunct_tid);
+
        return arg;
 }

@@ -73,18 +77,23 @@ static const struct testcase {
        const int sig;
        const int err;
 } testcases[] = {
-       { "Invalid tgid", &invalid_pid, &parent_tid, SIGUSR1, EINVAL },
-       { "Invalid tid", &parent_tgid, &invalid_pid, SIGUSR1, EINVAL },
-       { "Invalid signal", &parent_tgid, &parent_tid, -1, EINVAL },
+//     { "Invalid tgid", &invalid_pid, &parent_tid, SIGUSR1, EINVAL },
+//     { "Invalid tid", &parent_tgid, &invalid_pid, SIGUSR1, EINVAL },
+//     { "Invalid signal", &parent_tgid, &parent_tid, -1, EINVAL },
        { "Defunct tid", &parent_tgid, &defunct_tid, SIGUSR1, ESRCH },
-       { "Defunct tgid", &defunct_tid, &child_tid, SIGUSR1, ESRCH },
-       { "Valid tgkill call", &parent_tgid, &child_tid, SIGUSR1, 0 },
+//     { "Defunct tgid", &defunct_tid, &child_tid, SIGUSR1, ESRCH },
+//     { "Valid tgkill call", &parent_tgid, &child_tid, SIGUSR1, 0 },
 };

 static void run(unsigned int i)
 {
        const struct testcase *tc = &testcases[i];

+       // debug code //
+       while (access(buf, F_OK) == 0) {
+               tst_res(TINFO, "Debug: %s still exist!", buf);
+       }
+
        TEST(sys_tgkill(*tc->tgid, *tc->tid, tc->sig));
        if (tc->err) {
                if (TST_RET < 0 && TST_ERR == tc->err)


-- 
Regards,
Li Wang

--00000000000093f962058b693b52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Jun 16, 2019 at 7:08 AM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
----- Original Message -----<br>
&gt; +static void setup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sigset_t sigusr1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pthread_t defunct_thread;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;sigusr1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sigaddset(&amp;sigusr1, SIGUSR1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pthread_sigmask(SIG_BLOCK, &amp;sigusr1, NULL);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0parent_tgid =3D getpid();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0parent_tid =3D sys_gettid();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_CREATE(&amp;child_thread, NULL, chil=
d_thread_func, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAIT(0);<br>
<br>
I&#39;m seeing reports of this test failing on s390x:<br>
<br>
st_test.c:1096: INFO: Timeout per run is 0h 05m 00s<br>
tgkill03.c:92: PASS: Invalid tgid failed as expected: EINVAL<br>
tgkill03.c:92: PASS: Invalid tid failed as expected: EINVAL<br>
tgkill03.c:92: PASS: Invalid signal failed as expected: EINVAL<br>
tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH: SUCCESS<br>
tgkill03.c:92: PASS: Defunct tgid failed as expected: ESRCH<br>
tgkill03.c:99: PASS: Valid tgkill call succeeded<br>
<br>
and I suspect this piece:<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_CREATE(&amp;defunct_thread, NULL, de=
funct_thread_func, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_JOIN(defunct_thread, NULL);<br>
&gt; +}<br>
<br>
glibc pthread_join() waits for CLONE_CHILD_CLEARTID to clear tid,<br>
and then resumes. Which kernel does at:<br>
=C2=A0 do_exit<br>
=C2=A0 =C2=A0 exit_mm<br>
=C2=A0 =C2=A0 =C2=A0 mm_release<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_user(0, tsk-&gt;clear_child_tid);<br>
<br>
so there&#39;s still work to be done after that, and I suspect tid is still=
 valid<br>
while that happens.<br>
<br>
My first idea: wait until /proc/pid/task/&lt;tid&gt; disappears.<br></block=
quote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>The anaysis is probably right, but this idea doesn&#39;t work for me. Seem=
s /proc/pid/task/&lt;tid&gt; is not the key point to confirm that tid has b=
een clear.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">I just have a =
try as below:</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small"><div class=
=3D"gmail_default">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br class=3D"gmail-Appl=
e-interchange-newline"># for i in `seq 1000`; do echo &quot;i =3D $i&quot; =
&amp;&amp; ./tgkill03 || break; done<br></div><div class=3D"gmail_default">=
...</div>i =3D 96<br>tst_test.c:1112: INFO: Timeout per run is 0h 05m 00s<b=
r>tgkill03.c:106: FAIL: Defunct tid should have failed with ESRCH: SUCCESS<=
br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D</div><div class=3D"gmail_default" style=3D"font-size:small">--=
- a/testcases/kernel/syscalls/tgkill/tgkill03.c<br>+++ b/testcases/kernel/s=
yscalls/tgkill/tgkill03.c<br>@@ -5,6 +5,7 @@<br>=C2=A0 * Test simple tgkill=
() error cases.<br>=C2=A0 */<br>=C2=A0<br>+#include &lt;stdio.h&gt;<br>=C2=
=A0#include &lt;pthread.h&gt;<br>=C2=A0#include &lt;pwd.h&gt;<br>=C2=A0#inc=
lude &lt;sys/types.h&gt;<br>@@ -19,6 +20,7 @@ static pid_t parent_tgid;<br>=
=C2=A0static pid_t parent_tid;<br>=C2=A0static pid_t child_tid;<br>=C2=A0st=
atic pid_t defunct_tid;<br>+char buf[1024];<br>=C2=A0<br>=C2=A0static const=
 int invalid_pid =3D -1;<br>=C2=A0<br>@@ -35,6 +37,8 @@ static void *defunc=
t_thread_func(void *arg)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 defunct_=
tid =3D sys_gettid();<br>=C2=A0<br>+ =C2=A0 =C2=A0 =C2=A0 sprintf(buf, &quo=
t;/proc/pid/task/%d&quot;, defunct_tid);<br>+<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return arg;<br>=C2=A0}<br>=C2=A0<br>@@ -73,18 +77,23 @@ static const st=
ruct testcase {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 const int sig;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const int err;<br>=C2=A0} testcases[] =3D {<br>- =C2=A0 =
=C2=A0 =C2=A0 { &quot;Invalid tgid&quot;, &amp;invalid_pid, &amp;parent_tid=
, SIGUSR1, EINVAL },<br>- =C2=A0 =C2=A0 =C2=A0 { &quot;Invalid tid&quot;, &=
amp;parent_tgid, &amp;invalid_pid, SIGUSR1, EINVAL },<br>- =C2=A0 =C2=A0 =
=C2=A0 { &quot;Invalid signal&quot;, &amp;parent_tgid, &amp;parent_tid, -1,=
 EINVAL },<br>+// =C2=A0 =C2=A0 { &quot;Invalid tgid&quot;, &amp;invalid_pi=
d, &amp;parent_tid, SIGUSR1, EINVAL },<br>+// =C2=A0 =C2=A0 { &quot;Invalid=
 tid&quot;, &amp;parent_tgid, &amp;invalid_pid, SIGUSR1, EINVAL },<br>+// =
=C2=A0 =C2=A0 { &quot;Invalid signal&quot;, &amp;parent_tgid, &amp;parent_t=
id, -1, EINVAL },<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;Defunct tid&quot;,=
 &amp;parent_tgid, &amp;defunct_tid, SIGUSR1, ESRCH },<br>- =C2=A0 =C2=A0 =
=C2=A0 { &quot;Defunct tgid&quot;, &amp;defunct_tid, &amp;child_tid, SIGUSR=
1, ESRCH },<br>- =C2=A0 =C2=A0 =C2=A0 { &quot;Valid tgkill call&quot;, &amp=
;parent_tgid, &amp;child_tid, SIGUSR1, 0 },<br>+// =C2=A0 =C2=A0 { &quot;De=
funct tgid&quot;, &amp;defunct_tid, &amp;child_tid, SIGUSR1, ESRCH },<br>+/=
/ =C2=A0 =C2=A0 { &quot;Valid tgkill call&quot;, &amp;parent_tgid, &amp;chi=
ld_tid, SIGUSR1, 0 },<br>=C2=A0};<br>=C2=A0<br>=C2=A0static void run(unsign=
ed int i)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct testcase *=
tc =3D &amp;testcases[i];<br>=C2=A0<br>+ =C2=A0 =C2=A0 =C2=A0 // debug code=
 //<br>+ =C2=A0 =C2=A0 =C2=A0 while (access(buf, F_OK) =3D=3D 0) {<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;Debug: %=
s still exist!&quot;, buf);<br>+ =C2=A0 =C2=A0 =C2=A0 }<br>+<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TEST(sys_tgkill(*tc-&gt;tgid, *tc-&gt;tid, tc-&gt;sig));<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tc-&gt;err) {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TST_RET &lt; 0 &amp;&amp; TST_ERR =
=3D=3D tc-&gt;err)<br></div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div=
></div></div></div>

--00000000000093f962058b693b52--

--===============1701857183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1701857183==--
