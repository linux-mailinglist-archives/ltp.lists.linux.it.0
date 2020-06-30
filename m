Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3695920F33C
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 12:57:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4577E3C56EE
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 12:57:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D16853C2AAD
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 12:57:16 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id EDEEF1000D8A
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 12:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593514634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+pP851bw+JblIskriLVIhC1uohKhdemum8FZw4Dmbg=;
 b=OBQ7DDoG7E/xNAoiXamBtkHhvHFSP5uMtMCh85SL7oOqtGmQ0HSpjDvZthqNHSFJ0huY/S
 h7B1SVTZnLuaQc/3ct6jASUiSWFopuVqRYLsOzunBcDVbTagLI/W1SEuYDdQeixtSXOz3L
 l2MV7xPUawkC+OYJCsD806jW+29noB8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-uGy4pJoBOCGA-jIMWOT_8w-1; Tue, 30 Jun 2020 06:57:11 -0400
X-MC-Unique: uGy4pJoBOCGA-jIMWOT_8w-1
Received: by mail-lf1-f71.google.com with SMTP id y21so11554105lfg.12
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 03:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c+pP851bw+JblIskriLVIhC1uohKhdemum8FZw4Dmbg=;
 b=cSyq05B30jCkvvTYLZ3W5qkxQdCDot5M9SuUd+XpxA+ZLeHtQOoXwYnO6fm2Bfx9Jy
 6S+aD1hJeeVI4ZUiGvJ/ITy1k/ou6QMIAZig5YibtF2FhF2IoPChXrtIKf92ZblL175I
 C2f5GcIIRWRPyblqNE9O5jAt3ygmQiaLnMnSouz63An9lfCDQ2Wd31Vz1vUkEMy9gdbt
 PIbQ9TY0t15blUnSchnkhjikLTtiONdfctDOBnv2kAIuTS7GjXScPy2b3fVOmcOvTKDY
 1FRwn4w9hGmdGUFaKgIz41Jkx+/ktrSucDNrw8w3keV3qdkBye4cp9+tJ+f0mT47wJlB
 R7KA==
X-Gm-Message-State: AOAM533CsbH/ouLLnFxMCwYj8hx+tpRIbFRcJutcO7aLyrzfbaGLgcNg
 tnKibSYIiz0qUqKywgCMm4cFXtJBuyvCWkZC9wFPLXdPp/cFbZuXGTQ/iPDXAnE4aiFOmMr7Oj/
 hlmzfCeOBIxCzzgCtYigfQzgfR4w=
X-Received: by 2002:a2e:5d8:: with SMTP id 207mr9697126ljf.257.1593514629636; 
 Tue, 30 Jun 2020 03:57:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOK9+sTj3j9AeO04pztcWA1U3jRxEjgklNaz/KC7yyOMFJVlziiaUmst0wRSuytiKFwNER29GaiPwNtbEc1Sg=
X-Received: by 2002:a2e:5d8:: with SMTP id 207mr9697118ljf.257.1593514629398; 
 Tue, 30 Jun 2020 03:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200630054405.6115-1-pravinraghul@zilogic.com>
In-Reply-To: <20200630054405.6115-1-pravinraghul@zilogic.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 30 Jun 2020 18:56:57 +0800
Message-ID: <CAEemH2egVWiSB+uzMMFb4oBFxRoP9bVLXa2B0Y39BBpZEH4yLg@mail.gmail.com>
To: pravin <pravinraghul@zilogic.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Add a test case for mmap() MAP_GROWSDOWN flag
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
Cc: LTP List <ltp@lists.linux.it>, vijaykumar@zilogic.com
Content-Type: multipart/mixed; boundary="===============1568864291=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1568864291==
Content-Type: multipart/alternative; boundary="0000000000006e209005a94b09d6"

--0000000000006e209005a94b09d6
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 30, 2020 at 1:45 PM pravin <pravinraghul@zilogic.com> wrote:

>
> We assign the memory region allocated using MAP_GROWSDOWN to a thread,
> as a stack, to test the effect of MAP_GROWSDOWN. This is because the
> kernel only grows the memory region when the stack pointer, is within
> guard page, when the guard page is touched.
>
>   1. Map an anyonymous memory region of size X, and unmap it.
>   2. Split the unmapped memory region into two.
>   3. The lower memory region is left unmapped.
>   4. The higher memory region is mapped for use as stack, using MAP_FIXED
> | MAP_GROWSDOWN.
>   5. The higher memory region is provided as stack to a thread, where
>      a recursive function is invoked.
>   6. The stack grows beyond the allocated region, into the lower memory
> area.
>   7. If this results in the memory region being extended, into the
>      unmapped region, the test is considered to have passed.
>
> ...
> +
> +void split_unmapped_plus_stack(void *start, size_t size, void **stack)
> +{
> +       /*
> +         * +---------------------+----------------------+
> +         * + unmapped            | stack                |
> +         * +---------------------+----------------------+
> +         */
> +       *stack = SAFE_MMAP(start, size, PROT_READ | PROT_WRITE,
>

This does not match what you describe in the code comments, here we still
map the total size of the memory area, and stack can not grow into an
unmapped region.

Looking at the address which printed from your code, the mem == stack and
&limit grows down in mapped address.

# ./mmap18
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
mmap18.c:132: INFO: mem = 0x7ffff7fa5000, stack = 0x7ffff7fa5000
mmap18.c:96: INFO: &limit = 0x7ffff7fa8fe8, limit = 0x7ffff7fa9000
mmap18.c:141: PASS: stack grows in unmapped region


Maybe this below could achieve your method, or you can take the way which
Cyril suggests using multiple page_size.

--- a/testcases/kernel/syscalls/mmap/mmap18.c
+++ b/testcases/kernel/syscalls/mmap/mmap18.c
@@ -84,15 +84,17 @@ void split_unmapped_plus_stack(void *start, size_t
size, void **stack)
          * + unmapped            | stack                |
          * +---------------------+----------------------+
          */
-       *stack = SAFE_MMAP(start, size, PROT_READ | PROT_WRITE,
+       *stack = SAFE_MMAP(start + size/2, size/2, PROT_READ | PROT_WRITE,
                           MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS |
MAP_GROWSDOWN,
                           -1, 0);
 }

 static void *check_depth_recursive(void *limit)
 {
-       if ((off_t) &limit < (off_t) limit)
+       if ((off_t) &limit < (off_t) limit) {
+               tst_res(TINFO, "&limit = %p, limit = %p", &limit, limit);
                return NULL;
+       }

        return check_depth_recursive(limit);
 }
@@ -125,10 +127,11 @@ static void run_test(void)

        mem = find_free_range(UNITS(16));
        split_unmapped_plus_stack(mem, UNITS(16), &stack);
+       tst_res(TINFO, "mem = %p, stack = %p", mem, stack);

        child_pid = SAFE_FORK();
        if (child_pid == 0) {
-               grow_stack(stack, UNITS(8), mem + UNITS(1));
+               grow_stack(stack, UNITS(8), stack - UNITS(1));
        } else {
                SAFE_WAIT(&wstatus);
                if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) == 0)

-- 
Regards,
Li Wang

--0000000000006e209005a94b09d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 30, 2020 at 1:45 PM pravin &lt;<a href=
=3D"mailto:pravinraghul@zilogic.com" target=3D"_blank">pravinraghul@zilogic=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
We assign the memory region allocated using MAP_GROWSDOWN to a thread,<br>
as a stack, to test the effect of MAP_GROWSDOWN. This is because the<br>
kernel only grows the memory region when the stack pointer, is within<br>
guard page, when the guard page is touched.<br>
<br>
=C2=A0 1. Map an anyonymous memory region of size X, and unmap it.<br>
=C2=A0 2. Split the unmapped memory region into two.<br>
=C2=A0 3. The lower memory region is left unmapped.<br>
=C2=A0 4. The higher memory region is mapped for use as stack, using MAP_FI=
XED | MAP_GROWSDOWN.<br>
=C2=A0 5. The higher memory region is provided as stack to a thread, where<=
br>
=C2=A0 =C2=A0 =C2=A0a recursive function is invoked.<br>
=C2=A0 6. The stack grows beyond the allocated region, into the lower memor=
y area.<br>
=C2=A0 7. If this results in the memory region being extended, into the<br>
=C2=A0 =C2=A0 =C2=A0unmapped region, the test is considered to have passed.=
<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+<br>
+void split_unmapped_plus_stack(void *start, size_t size, void **stack)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* +---------------------+---------------=
-------+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* + unmapped=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | stack=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* +---------------------+---------------=
-------+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*stack =3D SAFE_MMAP(start, size, PROT_READ | P=
ROT_WRITE,<br></blockquote><div><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">This does not match what you describe in the code com=
ments, here we still map the total size of the memory area, and=C2=A0stack=
=C2=A0can not grow=C2=A0into an unmapped region.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Looking at the address which printed from your code=
, the mem =3D=3D stack and &amp;limit grows down in mapped address.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small"># ./mmap18<br>tst_test.c:1247:=
 INFO: Timeout per run is 0h 05m 00s<br>mmap18.c:132: INFO: mem =3D 0x7ffff=
7fa5000, stack =3D 0x7ffff7fa5000<br>mmap18.c:96: INFO: &amp;limit =3D 0x7f=
fff7fa8fe8, limit =3D 0x7ffff7fa9000<br>mmap18.c:141: PASS: stack grows in =
unmapped region<br></div><div><br></div><div><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Maybe this below could achieve your meth=
od, or you can take the way which Cyril suggests using multiple page_size.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>--- a=
/testcases/kernel/syscalls/mmap/mmap18.c<br>+++ b/testcases/kernel/syscalls=
/mmap/mmap18.c<br>@@ -84,15 +84,17 @@ void split_unmapped_plus_stack(void *=
start, size_t size, void **stack)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * +=
 unmapped =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| stack =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * +---------------------+----------------------+<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 */<br>- =C2=A0 =C2=A0 =C2=A0 *stack =3D SAFE_MMAP(star=
t, size, PROT_READ | PROT_WRITE,<br>+ =C2=A0 =C2=A0 =C2=A0 *stack =3D SAFE_=
MMAP(start + size/2, size/2, PROT_READ | PROT_WRITE,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS | MAP_GROWSDOWN,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-1, 0);<br>=C2=A0}<br>=C2=A0<br>=C2=A0static void *check_d=
epth_recursive(void *limit)<br>=C2=A0{<br>- =C2=A0 =C2=A0 =C2=A0 if ((off_t=
) &amp;limit &lt; (off_t) limit)<br>+ =C2=A0 =C2=A0 =C2=A0 if ((off_t) &amp=
;limit &lt; (off_t) limit) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tst_res(TINFO, &quot;&amp;limit =3D %p, limit =3D %p&quot;, &amp;li=
mit, limit);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn NULL;<br>+ =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return check_depth_recursive(limit);<br>=C2=A0}<br>@@ -125,10 +127,11 @=
@ static void run_test(void)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem =
=3D find_free_range(UNITS(16));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 split_unmapp=
ed_plus_stack(mem, UNITS(16), &amp;stack);<br>+ =C2=A0 =C2=A0 =C2=A0 tst_re=
s(TINFO, &quot;mem =3D %p, stack =3D %p&quot;, mem, stack);<br>=C2=A0<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 child_pid =3D SAFE_FORK();<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (child_pid =3D=3D 0) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 grow_stack(stack, UNITS(8), mem + UNITS(1));<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grow_stack(stack, UNITS(8), stack=
 - UNITS(1));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_WAIT(&amp;wstatus);<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (WIFEXITED(wstatus) &am=
p;&amp; WEXITSTATUS(wstatus) =3D=3D 0)<br><div class=3D"gmail_default" styl=
e=3D"font-size:small"></div><div><br></div></div>-- <br><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></d=
iv>

--0000000000006e209005a94b09d6--


--===============1568864291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1568864291==--

