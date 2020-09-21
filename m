Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9042719BE
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 06:09:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D90F23C4E30
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 06:09:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DBD7A3C08AB
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 06:09:00 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C6D401A006A2
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 06:08:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600661338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V23mTasq31qGK9iONvhf3wW0DsmZg0b26JNYpjqsGSc=;
 b=dL0/D7hEwZN8oGowQCayy778U29OHTDuLCLKSV+DoRV7gOUi7eUeunFfzbl+0T4RKlLzPb
 1xcIEYgOXghWf5hVHteWI3jfaN3mbNDMMODfpj4GNFCLcgjbfatsVviPCnYlpKtSgqxoDO
 iU6TkSKjuZe03SJKWMB+meDtS93HorA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-USP4LXrpOPKoQF40kIOGzg-1; Mon, 21 Sep 2020 00:08:54 -0400
X-MC-Unique: USP4LXrpOPKoQF40kIOGzg-1
Received: by mail-yb1-f198.google.com with SMTP id d143so853673ybh.11
 for <ltp@lists.linux.it>; Sun, 20 Sep 2020 21:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V23mTasq31qGK9iONvhf3wW0DsmZg0b26JNYpjqsGSc=;
 b=HPJR6m4HuerE4+CA2DR6DfDkO1uxUww2JILOfCT9v/3FUXQnhq+rnCUMdhPNwiZoX1
 p1ONq8WKbCRZd4PejfTlycSv+INR5l640SpROP/8GKtspvj0IcV6isqRgAQ6QsM+XwZq
 DWVjJC6Uu+Oh0gBH/M70YCeD4rIGiQ5py4r7hSiJuxkjL/AEwhlAlUJwNZZZKvgtxPgF
 Acj2qRFhCtRE+aOkjcYUwjpNqj+1+Zmiv1QmO7OP2d1wFMPurtqavg4tI4y/r9IbXmo0
 9dOOaqjZjMZAQSS2WMNZuwCXuBSktqjwwdfQX1jatiPNU+VA2UPXfHs06zK+32nw0t30
 fgvg==
X-Gm-Message-State: AOAM530k8iQhkZm/szM1HIDwq7C2tmOKQkv3ISt2pBIAMW1GPiOHRa0g
 SRLBZm5sjupLuqw7cYMQrR9YtcEbbqSLkenjNOui9OhgKY8dWnch+irX8Jb9kVLqOT9e3myut35
 jzp4ntl97LpQkj8nwYlF6ZYbx3Aw=
X-Received: by 2002:a25:606:: with SMTP id 6mr13027656ybg.86.1600661334043;
 Sun, 20 Sep 2020 21:08:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOfXMIpVr7n0PP6FLpvx5OnsBjPfqjcM+mXVP5UHW6r1m7KHjyQrmp4i4TlrUJKT8xONNlXYjzyI9FBpeuIPw=
X-Received: by 2002:a25:606:: with SMTP id 6mr13027633ybg.86.1600661333687;
 Sun, 20 Sep 2020 21:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200918171710.19227-1-chrubis@suse.cz>
In-Reply-To: <20200918171710.19227-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 21 Sep 2020 12:08:41 +0800
Message-ID: <CAEemH2d_m16MhGrjxWHCeQ0BU9Fa562TVjaa+C_ecnPYhCfthw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: pravin <pravinraghul@zilogic.com>, LTP List <ltp@lists.linux.it>,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: multipart/mixed; boundary="===============1998970221=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1998970221==
Content-Type: multipart/alternative; boundary="000000000000335b1005afcb02da"

--000000000000335b1005afcb02da
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 19, 2020 at 1:16 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> +/*
> + * Test mmap() MAP_GROWSDOWN flag
> + *
> + * # Test1:
> + *
> + *   We assign the memory region partially allocated with MAP_GROWSDOWN
> flag to
> + *   a thread as a stack and expect the mapping to grow when we touch the
> + *   guard page by calling a recusive function in the thread that uses the
> + *   growable mapping as a stack.
> + *
> + *   The kernel only grows the memory region when the stack pointer is
> within
> + *   guard page when the guard page is touched so simply faulting the
> guard
> + *   page will not cause the mapping to grow.
> + *
> + *   Newer kernels does not allow a MAP_GROWSDOWN mapping to grow closer
> than
> + *   'stack_guard_gap' pages to an existing mapping. So when we map the
> stack we
> + *   make sure there is enough of free address space before the lowest
> stack
> + *   address.
> + *
> + *   Kernel default 'stack_guard_gap' size is '256 * getpagesize()'.
> + *
> + *   The stack memory map would look like:
> + *
> + *   |  -  -  -   reserved  size   -  -  -  |
> + *
> + *   +-- - - - --+------------+-------------+
> + *   | 256 pages |  unmapped  |   mapped    |
> + *   +-- - - - --+------------+-------------+
> + *                            | mapped size |
> + *   ^           |  -  -  stack size  -  -  |
> + *   start
> + *               ^                          ^
> + *               stack bottom       stack top
> + *
> + * # Test2:
> + *
> + *   We allocate stack as we do in the first test but we mmap a page in
> the
> + *   space the stack is supposed to grow into and we expect the thread to
> + *   segfault when the guard page is faulted.
> + */
> +
> +#include <unistd.h>
> +#include <pthread.h>
> +#include <sys/mman.h>
> +#include <sys/wait.h>
> +#include <sys/types.h>
> +#include <stdlib.h>
> +#include <stdbool.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_pthread.h"
> +
> +static long page_size;
> +
> +static bool __attribute__((noinline)) check_stackgrow_up(void)
> +{
> +       char local_var;
> +       static char *addr;
> +
> +       if (!addr) {
> +               addr = &local_var;
> +               return check_stackgrow_up();
> +       }
> +
> +       return (addr < &local_var);
> +}
> +
> +static void setup(void)
> +{
> +       if (check_stackgrow_up())
> +               tst_brk(TCONF, "Test can't be performed with stack grows
> up architecture");
> +
> +       page_size = getpagesize();
> +}
> +
> +/*
> + * Returns stack lowest address. Note that the address is not mapped and
> will
> + * be mapped on page fault when we grow the stack to the lowest address
> possible.
> + */
> +static void *allocate_stack(size_t stack_size, size_t mapped_size)
> +{
> +       void *start, *stack_top, *stack_bottom;
> +
> +       long reserved_size = 256 * page_size + stack_size;
> +
> +       start = SAFE_MMAP(NULL, reserved_size, PROT_READ | PROT_WRITE,
> +                         MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +       SAFE_MUNMAP(start, reserved_size);
> +
> +       SAFE_MMAP((start + reserved_size - mapped_size), mapped_size,
> PROT_READ | PROT_WRITE,
> +                 MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS | MAP_GROWSDOWN,
> +                 -1, 0);
> +
> +       stack_top = start + reserved_size;
> +       stack_bottom = start + reserved_size - stack_size;
>

As the stack grows down, shouldn't grow from stack_bottom to stack_top?
which
means stack_bottom = start + reserved_size.

 *   |  -  -  -   reserved  size   -  -  -  |
 *
 *   +-- - - - --+------------+-------------+
 *   | 256 pages |  unmapped  |   mapped    |
 *   +-- - - - --+------------+-------------+
 *                            | mapped size |
 *   ^           |  -  -  stack size  -  -  |
 *   start
 *               ^                          ^
 *               stack top       stack bottom



> +
> +       tst_res(TINFO, "start = %p, stack_top = %p, stack bottom = %p",
>

a typo here: stack_bottom ^



> +               start, stack_top, stack_bottom);
> +       tst_res(TINFO, "mapped pages %zu, stack pages %zu",
> +               mapped_size/page_size, stack_size/page_size);
> +
> +       return stack_bottom;
>

return stack_top here?

-- 
Regards,
Li Wang

--000000000000335b1005afcb02da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Sep 19, 2020 at 1:16 AM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cla=
ss=3D"gmail_default" style=3D"font-size:small">...</span><br>
+/*<br>
+ * Test mmap() MAP_GROWSDOWN flag<br>
+ *<br>
+ * # Test1:<br>
+ *<br>
+ *=C2=A0 =C2=A0We assign the memory region partially allocated with MAP_GR=
OWSDOWN flag to<br>
+ *=C2=A0 =C2=A0a thread as a stack and expect the mapping to grow when we =
touch the<br>
+ *=C2=A0 =C2=A0guard page by calling a recusive function in the thread tha=
t uses the<br>
+ *=C2=A0 =C2=A0growable mapping as a stack.<br>
+ *<br>
+ *=C2=A0 =C2=A0The kernel only grows the memory region when the stack poin=
ter is within<br>
+ *=C2=A0 =C2=A0guard page when the guard page is touched so simply faultin=
g the guard<br>
+ *=C2=A0 =C2=A0page will not cause the mapping to grow.<br>
+ *<br>
+ *=C2=A0 =C2=A0Newer kernels does not allow a MAP_GROWSDOWN mapping to gro=
w closer than<br>
+ *=C2=A0 =C2=A0&#39;stack_guard_gap&#39; pages to an existing mapping. So =
when we map the stack we<br>
+ *=C2=A0 =C2=A0make sure there is enough of free address space before the =
lowest stack<br>
+ *=C2=A0 =C2=A0address.<br>
+ *<br>
+ *=C2=A0 =C2=A0Kernel default &#39;stack_guard_gap&#39; size is &#39;256 *=
 getpagesize()&#39;.<br>
+ *<br>
+ *=C2=A0 =C2=A0The stack memory map would look like:<br>
+ *<br>
+ *=C2=A0 =C2=A0|=C2=A0 -=C2=A0 -=C2=A0 -=C2=A0 =C2=A0reserved=C2=A0 size=
=C2=A0 =C2=A0-=C2=A0 -=C2=A0 -=C2=A0 |<br>
+ *<br>
+ *=C2=A0 =C2=A0+-- - - - --+------------+-------------+<br>
+ *=C2=A0 =C2=A0| 256 pages |=C2=A0 unmapped=C2=A0 |=C2=A0 =C2=A0mapped=C2=
=A0 =C2=A0 |<br>
+ *=C2=A0 =C2=A0+-- - - - --+------------+-------------+<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | mapped size |<br>
+ *=C2=A0 =C2=A0^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 -=C2=A0 -=
=C2=A0 stack size=C2=A0 -=C2=A0 -=C2=A0 |<br>
+ *=C2=A0 =C2=A0start<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stack bottom=C2=
=A0 =C2=A0 =C2=A0 =C2=A0stack top<br>
+ *<br>
+ * # Test2:<br>
+ *<br>
+ *=C2=A0 =C2=A0We allocate stack as we do in the first test but we mmap a =
page in the<br>
+ *=C2=A0 =C2=A0space the stack is supposed to grow into and we expect the =
thread to<br>
+ *=C2=A0 =C2=A0segfault when the guard page is faulted.<br>
+ */<br>
+<br>
+#include &lt;unistd.h&gt;<br>
+#include &lt;pthread.h&gt;<br>
+#include &lt;sys/mman.h&gt;<br>
+#include &lt;sys/wait.h&gt;<br>
+#include &lt;sys/types.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &lt;stdbool.h&gt;<br>
+<br>
+#include &quot;tst_test.h&quot;<br>
+#include &quot;tst_safe_pthread.h&quot;<br>
+<br>
+static long page_size;<br>
+<br>
+static bool __attribute__((noinline)) check_stackgrow_up(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char local_var;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0static char *addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!addr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D &amp;local=
_var;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return check_stackg=
row_up();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return (addr &lt; &amp;local_var);<br>
+}<br>
+<br>
+static void setup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (check_stackgrow_up())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quo=
t;Test can&#39;t be performed with stack grows up architecture&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0page_size =3D getpagesize();<br>
+}<br>
+<br>
+/*<br>
+ * Returns stack lowest address. Note that the address is not mapped and w=
ill<br>
+ * be mapped on page fault when we grow the stack to the lowest address po=
ssible.<br>
+ */<br>
+static void *allocate_stack(size_t stack_size, size_t mapped_size)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *start, *stack_top, *stack_bottom;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long reserved_size =3D 256 * page_size + stack_=
size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start =3D SAFE_MMAP(NULL, reserved_size, PROT_R=
EAD | PROT_WRITE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_MUNMAP(start, reserved_size);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_MMAP((start + reserved_size - mapped_size)=
, mapped_size, PROT_READ | PROT_WRITE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_FIXED | =
MAP_PRIVATE | MAP_ANONYMOUS | MAP_GROWSDOWN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-1, 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stack_top =3D start + reserved_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stack_bottom =3D start + reserved_size - stack_=
size;<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">As the stack grows down, shouldn&#39;t grow from stac=
k_bottom to stack_top? which</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">means stack_bottom =3D start + reserved_size.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">=C2=A0* =C2=A0 | =C2=A0- =C2=A0- =C2=A0-=
 =C2=A0 reserved =C2=A0size =C2=A0 - =C2=A0- =C2=A0- =C2=A0|<br>=C2=A0*<br>=
=C2=A0* =C2=A0 +-- - - - --+------------+-------------+<br>=C2=A0* =C2=A0 |=
 256 pages | =C2=A0unmapped =C2=A0| =C2=A0 mapped =C2=A0 =C2=A0|<br>=C2=A0*=
 =C2=A0 +-- - - - --+------------+-------------+<br>=C2=A0* =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| mapped size |<br>=C2=A0* =C2=A0 ^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0- =C2=A0- =C2=A0stack size =C2=A0- =C2=A0- =C2=A0|<br>=C2=A0=
* =C2=A0 start<br>=C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^<br>=C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 stack top =C2=A0 =C2=A0 =C2=A0 stack bottom<br></div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;start =3D %p, stack_top =
=3D %p, stack bottom =3D %p&quot;,<br></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">a typo here: stack_botto=
m ^ </div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start, stack_top, s=
tack_bottom);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;mapped pages %zu, stack pa=
ges %zu&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapped_size/page_si=
ze, stack_size/page_size);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return stack_bottom;<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">return sta=
ck_top here?</div></div></div><div><br></div>-- <br><div dir=3D"ltr"><div d=
ir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000335b1005afcb02da--


--===============1998970221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1998970221==--

