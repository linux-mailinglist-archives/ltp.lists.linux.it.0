Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A64647A9B
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 09:18:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CD423EB0D1
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 09:18:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 86C6A3EA3F9
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 09:18:16 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 243B92010F5
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 09:18:15 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id l125so5447766vsl.13
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 00:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IOcP31xwKOVHh0+fx5W67PLhrbNsTnj9f37A4jUNhZg=;
 b=Lh21FB/QGyI+9uOZzIDWgMIRSq4Q1EgfnCRwe92IVvrD7rgcncFTFjE2g8WtqzEjPd
 swzbbhAoLSAz7wijLpRgW0qklGPYfnPtPnPsqg5L8uzcbrwSrPkvJJ33NFfUfASG9uqc
 fs3AxLUm5kEHCKcx18Qnie1oV9U6kLnHPB10wOicCVr6ULCRfeF060Pp9uF7S/vgyhyF
 2gl3xTkIYT0RgAXsi84hhxoJd6U146eYvV6Dl7odbm2an4sOvqZpSi/WgV3A2n7x0elO
 XMcYE9gZmXf25duzk51XldOgUm4H4gw6oU3PvamMkzfviVzEPDbl+IFV/F8s11bWcS4M
 c/aw==
X-Gm-Message-State: APjAAAXxRaqtXjrvFPQNThuVUsPaXlOITfcB30Qr0z65VcmU5d7vSMxl
 IExwVdwl2Qg+nHv4vgrlOCVYUcAqFufXg4LU3JXzaA==
X-Google-Smtp-Source: APXvYqxqPoPh/CUaO0T79rNWHTXPq35fYkQsD2jX0S1l4Pwdkh8S+5AEYUsR02zLdW5fff7Mz//unpv5dv0uduK+NSE=
X-Received: by 2002:a67:6d45:: with SMTP id i66mr32422013vsc.130.1560755893948; 
 Mon, 17 Jun 2019 00:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <a15d4137b63e4202751bea4e726658aa14be7351.1560678643.git.jstancek@redhat.com>
 <CAEemH2dAr_6q8cfkBhRamUJNcP5=W=PcOp1UTEttBsXkhgNABA@mail.gmail.com>
 <807012526.28418206.1560755030501.JavaMail.zimbra@redhat.com>
In-Reply-To: <807012526.28418206.1560755030501.JavaMail.zimbra@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Mon, 17 Jun 2019 15:18:03 +0800
Message-ID: <CAEemH2fzRXDZh5P7yOxG1_+prO6iuFc+OJ2qyOmATxsG7KkKWQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: Frantisek Hrbata <fhrbata@redhat.com>, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/tgkill03: wait for defunct tid to get
	detached
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
Content-Type: multipart/mixed; boundary="===============1371439656=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1371439656==
Content-Type: multipart/alternative; boundary="000000000000a3f3ed058b7fccf9"

--000000000000a3f3ed058b7fccf9
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 17, 2019 at 3:03 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > On Sun, Jun 16, 2019 at 5:52 PM Jan Stancek <jstancek@redhat.com> wrote:
> >
> > > Case where defunct tid is used has been observed to sporadically fail:
> > >   tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH:
> SUCCESS
> > >
> > > glibc __pthread_timedjoin_ex() waits for CLONE_CHILD_CLEARTID to clear
> tid,
> > > and then resumes. Kernel clears it (glibc pd->tid) at:
> > >   do_exit
> > >     exit_mm
> > >       mm_release
> > >         put_user(0, tsk->clear_child_tid);
> > >
> > > but kernel tid is still valid, presumably until:
> > >   release_task
> > >     __exit_signal
> > >       __unhash_process
> > >         detach_pid
> > >
> > > To avoid race wait until /proc/<pid>/task/<tid> disappears.
> > >
> > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > ---
> > >  testcases/kernel/syscalls/tgkill/tgkill03.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c
> > > b/testcases/kernel/syscalls/tgkill/tgkill03.c
> > > index f5bbdc5a8d4e..5ac1d2651f7a 100644
> > > --- a/testcases/kernel/syscalls/tgkill/tgkill03.c
> > > +++ b/testcases/kernel/syscalls/tgkill/tgkill03.c
> > > @@ -7,6 +7,7 @@
> > >
> > >  #include <pthread.h>
> > >  #include <pwd.h>
> > > +#include <stdio.h>
> > >  #include <sys/types.h>
> > >
> > >  #include "tst_safe_pthread.h"
> > > @@ -42,6 +43,7 @@ static void setup(void)
> > >  {
> > >         sigset_t sigusr1;
> > >         pthread_t defunct_thread;
> > > +       char defunct_tid_path[PATH_MAX];
> > >
> > >         sigemptyset(&sigusr1);
> > >         sigaddset(&sigusr1, SIGUSR1);
> > > @@ -55,8 +57,10 @@ static void setup(void)
> > >         TST_CHECKPOINT_WAIT(0);
> > >
> > >         SAFE_PTHREAD_CREATE(&defunct_thread, NULL, defunct_thread_func,
> > > NULL);
> > > -
> > >         SAFE_PTHREAD_JOIN(defunct_thread, NULL);
> > > +       sprintf(defunct_tid_path, "/proc/%d/task/%d", getpid(),
> > > defunct_tid);
> > > +       while (access(defunct_tid_path, R_OK) == 0)
> > > +               usleep(10000);
> > >
> >
> > To be on the safe side, I think maybe TST_RETRY_FUNC is a better choice
> > here.
>
> Given high steal time on s390, I rather not put 1s cap on sleep here.
> This is newlib test, so there's already a timeout, I'd prefer to lower
> tst_test.timeout, say 30 seconds?
>

Sure, I think it's long enough for the tgkill03 test.

# uname -rm
4.18.0-94.el8.s390x s390x

# time ./tgkill03
tst_test.c:1112: INFO: Timeout per run is 0h 05m 00s
tgkill03.c:97: PASS: Invalid tgid failed as expected: EINVAL
tgkill03.c:97: PASS: Invalid tid failed as expected: EINVAL
tgkill03.c:97: PASS: Invalid signal failed as expected: EINVAL
tgkill03.c:97: PASS: Defunct tid failed as expected: ESRCH
tgkill03.c:97: PASS: Defunct tgid failed as expected: ESRCH
tgkill03.c:104: PASS: Valid tgkill call succeeded

Summary:
passed   6
failed   0
skipped  0
warnings 0

real 0m0.081s
user 0m0.001s
sys 0m0.002s

-- 
Regards,
Li Wang

--000000000000a3f3ed058b7fccf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 17, 2019 at 3:03 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; On Sun, Jun 16, 2019 at 5:52 PM Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Case where defunct tid is used has been observed to sporadically =
fail:<br>
&gt; &gt;=C2=A0 =C2=A0tgkill03.c:96: FAIL: Defunct tid should have failed w=
ith ESRCH: SUCCESS<br>
&gt; &gt;<br>
&gt; &gt; glibc __pthread_timedjoin_ex() waits for CLONE_CHILD_CLEARTID to =
clear tid,<br>
&gt; &gt; and then resumes. Kernel clears it (glibc pd-&gt;tid) at:<br>
&gt; &gt;=C2=A0 =C2=A0do_exit<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0exit_mm<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mm_release<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_user(0, tsk-&gt;clear_child_=
tid);<br>
&gt; &gt;<br>
&gt; &gt; but kernel tid is still valid, presumably until:<br>
&gt; &gt;=C2=A0 =C2=A0release_task<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0__exit_signal<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__unhash_process<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0detach_pid<br>
&gt; &gt;<br>
&gt; &gt; To avoid race wait until /proc/&lt;pid&gt;/task/&lt;tid&gt; disap=
pears.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.=
com" target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 testcases/kernel/syscalls/tgkill/tgkill03.c | 6 +++++-<br>
&gt; &gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c<br>
&gt; &gt; b/testcases/kernel/syscalls/tgkill/tgkill03.c<br>
&gt; &gt; index f5bbdc5a8d4e..5ac1d2651f7a 100644<br>
&gt; &gt; --- a/testcases/kernel/syscalls/tgkill/tgkill03.c<br>
&gt; &gt; +++ b/testcases/kernel/syscalls/tgkill/tgkill03.c<br>
&gt; &gt; @@ -7,6 +7,7 @@<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #include &lt;pthread.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;pwd.h&gt;<br>
&gt; &gt; +#include &lt;stdio.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;sys/types.h&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #include &quot;tst_safe_pthread.h&quot;<br>
&gt; &gt; @@ -42,6 +43,7 @@ static void setup(void)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sigset_t sigusr1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_t defunct_thread;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char defunct_tid_path[PATH_MAX];<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;sigusr1);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sigaddset(&amp;sigusr1, SIGUSR1)=
;<br>
&gt; &gt; @@ -55,8 +57,10 @@ static void setup(void)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAIT(0);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_CREATE(&amp;defunct=
_thread, NULL, defunct_thread_func,<br>
&gt; &gt; NULL);<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_JOIN(defunct_thread=
, NULL);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(defunct_tid_path, &quot;/proc=
/%d/task/%d&quot;, getpid(),<br>
&gt; &gt; defunct_tid);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0while (access(defunct_tid_path, R_OK)=
 =3D=3D 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep(10=
000);<br>
&gt; &gt;<br>
&gt; <br>
&gt; To be on the safe side, I think maybe TST_RETRY_FUNC is a better choic=
e<br>
&gt; here.<br>
<br>
Given high steal time on s390, I rather not put 1s cap on sleep here.<br>
This is newlib test, so there&#39;s already a timeout, I&#39;d prefer to lo=
wer<br>
tst_test.timeout, say 30 seconds?<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Sure, I think it&#39;s lo=
ng enough for the tgkill03 test.</div></div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small"># uname -rm</div><div class=3D=
"gmail_default" style=3D"font-size:small">4.18.0-94.el8.s390x s390x</div><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small"># time ./tgk=
ill03<br>tst_test.c:1112: INFO: Timeout per run is 0h 05m 00s<br>tgkill03.c=
:97: PASS: Invalid tgid failed as expected: EINVAL<br>tgkill03.c:97: PASS: =
Invalid tid failed as expected: EINVAL<br>tgkill03.c:97: PASS: Invalid sign=
al failed as expected: EINVAL<br>tgkill03.c:97: PASS: Defunct tid failed as=
 expected: ESRCH<br>tgkill03.c:97: PASS: Defunct tgid failed as expected: E=
SRCH<br>tgkill03.c:104: PASS: Valid tgkill call succeeded<br><br>Summary:<b=
r>passed =C2=A0 6<br>failed =C2=A0 0<br>skipped =C2=A00<br>warnings 0<br><b=
r>real	0m0.081s<br>user	0m0.001s<br>sys	0m0.002s<br></div></div><div><br></=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div=
><div dir=3D"ltr">Regards,<br>Li Wang<br></div></div></div></div></div>

--000000000000a3f3ed058b7fccf9--

--===============1371439656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1371439656==--
