Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 176464782B
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 04:23:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A056E3EA499
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 04:23:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 68E1E3EA3F7
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 04:23:13 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0F431600567
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 04:23:14 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id o2so2868573uae.10
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 19:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S1I+9A1AkI1921MLhZstFKQss87qDIwk45yB2h0yCms=;
 b=mhASi0rJ4YducnmXdAjtU5TnXKetPKM0m/mJ0r2toMbWKFN/1kNCwoeJEBDApGjLtV
 rNtPGoICXMicuZeXQ4mHk7wVn7m8pINqgzjWG7qX+6aHIX6efrxMXgfftzgqsEIFcUgC
 jK9kQgcPw/OvAT+a54pPzmiN8AxxSIhZTv/Ti4zWVTLDcYmRjA1VMX0t5xS4mQ+kfofa
 xWmZtYHtCWNKzdGdGFXa6nJDyC/sg+yHKnkqSATDvW4icC4Z7V7XN6gBkbAILENi5pAx
 P2BFdbhhJjIDyA1sdh1xSEejrAAqWyA7cNuNt9nrgqmL8rA1eARE0HfRGrKXHXt/RRcc
 0UBQ==
X-Gm-Message-State: APjAAAXYsomxVaX4Qlti8Bk8u5Vx8ig/GuOgBdnwyhktia7uPTBvirV/
 M7oKsJ/GOZl+62ykZw54STuZDvJ/ryk/SFJ6WTspqA==
X-Google-Smtp-Source: APXvYqzwSVTMAzHXLdUq+gEd9bRX9CpxDTG5TiKbm92UrMD0uKib9/yDmv+M3QcE71DHMcX8aUPN4/VB72TDvXvUTuk=
X-Received: by 2002:ab0:67d6:: with SMTP id w22mr11168830uar.68.1560738190326; 
 Sun, 16 Jun 2019 19:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <a15d4137b63e4202751bea4e726658aa14be7351.1560678643.git.jstancek@redhat.com>
In-Reply-To: <a15d4137b63e4202751bea4e726658aa14be7351.1560678643.git.jstancek@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Mon, 17 Jun 2019 10:22:59 +0800
Message-ID: <CAEemH2dAr_6q8cfkBhRamUJNcP5=W=PcOp1UTEttBsXkhgNABA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: fhrbata@redhat.com, LTP List <ltp@lists.linux.it>
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
Content-Type: multipart/mixed; boundary="===============0741615653=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0741615653==
Content-Type: multipart/alternative; boundary="0000000000006c21a1058b7bad90"

--0000000000006c21a1058b7bad90
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 16, 2019 at 5:52 PM Jan Stancek <jstancek@redhat.com> wrote:

> Case where defunct tid is used has been observed to sporadically fail:
>   tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH: SUCCESS
>
> glibc __pthread_timedjoin_ex() waits for CLONE_CHILD_CLEARTID to clear tid,
> and then resumes. Kernel clears it (glibc pd->tid) at:
>   do_exit
>     exit_mm
>       mm_release
>         put_user(0, tsk->clear_child_tid);
>
> but kernel tid is still valid, presumably until:
>   release_task
>     __exit_signal
>       __unhash_process
>         detach_pid
>
> To avoid race wait until /proc/<pid>/task/<tid> disappears.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/syscalls/tgkill/tgkill03.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c
> b/testcases/kernel/syscalls/tgkill/tgkill03.c
> index f5bbdc5a8d4e..5ac1d2651f7a 100644
> --- a/testcases/kernel/syscalls/tgkill/tgkill03.c
> +++ b/testcases/kernel/syscalls/tgkill/tgkill03.c
> @@ -7,6 +7,7 @@
>
>  #include <pthread.h>
>  #include <pwd.h>
> +#include <stdio.h>
>  #include <sys/types.h>
>
>  #include "tst_safe_pthread.h"
> @@ -42,6 +43,7 @@ static void setup(void)
>  {
>         sigset_t sigusr1;
>         pthread_t defunct_thread;
> +       char defunct_tid_path[PATH_MAX];
>
>         sigemptyset(&sigusr1);
>         sigaddset(&sigusr1, SIGUSR1);
> @@ -55,8 +57,10 @@ static void setup(void)
>         TST_CHECKPOINT_WAIT(0);
>
>         SAFE_PTHREAD_CREATE(&defunct_thread, NULL, defunct_thread_func,
> NULL);
> -
>         SAFE_PTHREAD_JOIN(defunct_thread, NULL);
> +       sprintf(defunct_tid_path, "/proc/%d/task/%d", getpid(),
> defunct_tid);
> +       while (access(defunct_tid_path, R_OK) == 0)
> +               usleep(10000);
>

To be on the safe side, I think maybe TST_RETRY_FUNC is a better choice
here.

    TST_RETRY_FUNC(access(defunct_tid_path, R_OK), -1);

 }
>
>  static void cleanup(void)
> --
> 1.8.3.1
>
>

-- 
Regards,
Li Wang

--0000000000006c21a1058b7bad90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Jun 16, 2019 at 5:52 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Case where defunct t=
id is used has been observed to sporadically fail:<br>
=C2=A0 tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH: SUCC=
ESS<br>
<br>
glibc __pthread_timedjoin_ex() waits for CLONE_CHILD_CLEARTID to clear tid,=
<br>
and then resumes. Kernel clears it (glibc pd-&gt;tid) at:<br>
=C2=A0 do_exit<br>
=C2=A0 =C2=A0 exit_mm<br>
=C2=A0 =C2=A0 =C2=A0 mm_release<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_user(0, tsk-&gt;clear_child_tid);<br>
<br>
but kernel tid is still valid, presumably until:<br>
=C2=A0 release_task<br>
=C2=A0 =C2=A0 __exit_signal<br>
=C2=A0 =C2=A0 =C2=A0 __unhash_process<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 detach_pid<br>
<br>
To avoid race wait until /proc/&lt;pid&gt;/task/&lt;tid&gt; disappears.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/tgkill/tgkill03.c | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c b/testcases/kernel=
/syscalls/tgkill/tgkill03.c<br>
index f5bbdc5a8d4e..5ac1d2651f7a 100644<br>
--- a/testcases/kernel/syscalls/tgkill/tgkill03.c<br>
+++ b/testcases/kernel/syscalls/tgkill/tgkill03.c<br>
@@ -7,6 +7,7 @@<br>
<br>
=C2=A0#include &lt;pthread.h&gt;<br>
=C2=A0#include &lt;pwd.h&gt;<br>
+#include &lt;stdio.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
<br>
=C2=A0#include &quot;tst_safe_pthread.h&quot;<br>
@@ -42,6 +43,7 @@ static void setup(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sigset_t sigusr1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_t defunct_thread;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char defunct_tid_path[PATH_MAX];<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;sigusr1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;sigusr1, SIGUSR1);<br>
@@ -55,8 +57,10 @@ static void setup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_CHECKPOINT_WAIT(0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_PTHREAD_CREATE(&amp;defunct_thread, NULL, =
defunct_thread_func, NULL);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_PTHREAD_JOIN(defunct_thread, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(defunct_tid_path, &quot;/proc/%d/task/%=
d&quot;, getpid(), defunct_tid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (access(defunct_tid_path, R_OK) =3D=3D 0)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep(10000);<br><=
/blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">To be on the safe side, I think maybe TST_RETRY_FUNC is a bette=
r choice here.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=
=A0 TST_RETRY_FUNC(access(defunct_tid_path, R_OK), -1);</div></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0static void cleanup(void)<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Regards,<=
br>Li Wang<br></div></div></div></div></div>

--0000000000006c21a1058b7bad90--

--===============0741615653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0741615653==--
