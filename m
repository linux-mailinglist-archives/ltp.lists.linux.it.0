Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B2E47BCE
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 10:06:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CFAB3EB05E
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 10:06:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6419C3EA3EA
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 10:06:04 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A9D952016AB
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 10:06:02 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id n2so5560983vso.6
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 01:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJj2jwfpL+EAMD+zG1rzrtZ2fx7XjBrXz0gUXxP15JY=;
 b=XaArcLi5UxJHOWRfm0R1d08y6R88ihybgcj96swgVigKEvpeIveBGRmtBpxakrafrA
 jVrlrh+ITTxJ66ari+rFXkh0mXba+KRFcZIXBjbGSoEgStCK3PVNVulSYmPJpl314qAY
 M8Ivn+gZrdLM7EWA5b7nS2HrVBEULYg/RD8/uGbJDxY/DstgWtPorf1MgpkcgmTttR/6
 a+CxjPyKnxm8Bqo8d6mPFBhrBTR6Mp0MpoJk1tX6qnCIhEFBo9k2p+1vcIrwD56e70cA
 u3kX9ieyr6q2eFXkiC53CWDTV0J0UjZtaxogNqclJXSMTi5MF8GRwpAguhRGU3kbomxJ
 I0dw==
X-Gm-Message-State: APjAAAVpEQEpK+xRfqA2mvClYKxdRfM+YbMWJ0hF7ONodzEqw+r9WsRm
 I3TUDMn6I6VQ9c9scc6kecJ9sl+O0gsihXFViRYEjT41/MkvhQ==
X-Google-Smtp-Source: APXvYqzkt8gulhaxJJTo4rTiq/iSuK8BGs9TPuyo3OgY9YM5PZJ/sg83Owohtvtzc+pYZVFGk24l3iGAIwFBjuGVJ0E=
X-Received: by 2002:a67:e8c8:: with SMTP id y8mr35086292vsn.124.1560758761188; 
 Mon, 17 Jun 2019 01:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <ae6204b13cf5d2a8e2ebefd4ff448c33deeb26fd.1560756614.git.jstancek@redhat.com>
In-Reply-To: <ae6204b13cf5d2a8e2ebefd4ff448c33deeb26fd.1560756614.git.jstancek@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Mon, 17 Jun 2019 16:05:50 +0800
Message-ID: <CAEemH2dRpyPDJ2m0soKLumhY50RFypRHnihfzqUyc-GA-pfBgg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2] syscalls/tgkill03: wait for defunct tid to get
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
Content-Type: multipart/mixed; boundary="===============1988811054=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1988811054==
Content-Type: multipart/alternative; boundary="0000000000008a8dba058b807702"

--0000000000008a8dba058b807702
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 17, 2019 at 3:34 PM Jan Stancek <jstancek@redhat.com> wrote:

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
> Changes in v2:
>   - use helper func suggested by Li (with higher timeout)
>   - not tested, trying to get s390x to confirm
>
> diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c
> b/testcases/kernel/syscalls/tgkill/tgkill03.c
> index f5bbdc5a8d4e..ce046f576b5f 100644
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
> @@ -55,8 +57,9 @@ static void setup(void)
>         TST_CHECKPOINT_WAIT(0);
>
>         SAFE_PTHREAD_CREATE(&defunct_thread, NULL, defunct_thread_func,
> NULL);
> -
>         SAFE_PTHREAD_JOIN(defunct_thread, NULL);
> +       sprintf(defunct_tid_path, "/proc/%d/task/%d", getpid(),
> defunct_tid);
> +       TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_path, R_OK), -1, 15);
>  }
>
>  static void cleanup(void)
> @@ -108,4 +111,5 @@ static struct tst_test test = {
>         .setup = setup,
>         .cleanup = cleanup,
>         .test = run,
> +       .timeout = 15,
>

I'd like to give a little bit more time here which larger than the
exponential backoff macro time.
Anyway, v2 looks good.

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000008a8dba058b807702
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 17, 2019 at 3:34 PM Jan Stancek &lt;<a =
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
Changes in v2:<br>
=C2=A0 - use helper func suggested by Li (with higher timeout)<br>
=C2=A0 - not tested, trying to get s390x to confirm<br>
<br>
diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c b/testcases/kernel=
/syscalls/tgkill/tgkill03.c<br>
index f5bbdc5a8d4e..ce046f576b5f 100644<br>
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
@@ -55,8 +57,9 @@ static void setup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_CHECKPOINT_WAIT(0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_PTHREAD_CREATE(&amp;defunct_thread, NULL, =
defunct_thread_func, NULL);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_PTHREAD_JOIN(defunct_thread, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(defunct_tid_path, &quot;/proc/%d/task/%=
d&quot;, getpid(), defunct_tid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_pat=
h, R_OK), -1, 15);<br>
=C2=A0}<br>
<br>
=C2=A0static void cleanup(void)<br>
@@ -108,4 +111,5 @@ static struct tst_test test =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cleanup =3D cleanup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .test =3D run,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.timeout =3D 15,<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;d like t=
o give a little bit more time here which larger than the exponential backof=
f macro time.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Anyway, v2 look=
s good.</div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwan=
g@redhat.com</a>&gt;</div></div></div><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Regards,=
<br>Li Wang<br></div></div></div></div></div>

--0000000000008a8dba058b807702--

--===============1988811054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1988811054==--
