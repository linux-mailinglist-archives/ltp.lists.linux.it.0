Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9358D2A5E19
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 07:23:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B59A3C2FF8
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 07:23:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3D3163C2462
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 07:23:07 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id B8BA3600E35
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 07:23:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604470984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbjVUnmVmvmrFODtCbKqSyQmEpf5/j8xrNp1jgbyYrU=;
 b=F2kflK2+a+2ET9daDrPgnxgEkdtNpyaqzJbqgIJdFnqbGJd5kGIlCWbRZ16FzWX76DnJav
 GDbBi8gswX2P10akYeZj1I0k0umYb7GjMoX/JMkUiyxQ2Srb0moep+SJ1ijLDXbyIM5lsY
 fpuysJVvZC0PDarGJqJOfNXsvfuQh0s=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-KqxVJgs6Nt2LfQm2oj19Sg-1; Wed, 04 Nov 2020 01:23:01 -0500
X-MC-Unique: KqxVJgs6Nt2LfQm2oj19Sg-1
Received: by mail-yb1-f198.google.com with SMTP id w4so20586223ybq.21
 for <ltp@lists.linux.it>; Tue, 03 Nov 2020 22:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dbjVUnmVmvmrFODtCbKqSyQmEpf5/j8xrNp1jgbyYrU=;
 b=m5LhOTy4x9Zk878LD/IXViw43JaamDGc0o87594mwB8U/wgyhSIScOZ8DpmSlY2K9m
 AixQscm01XArdQ3zUkHShFFYl7ZdOhTd5+LxdzO5q8TSCguazU8QkehZkM6QWcsO2GHq
 f3XkNjvpSSyz9vqbIIiWxS3PP/yTgDkxdoaKrzl6WVzIVVDa6vnAPYL6j+bLYIPs+CKr
 u0LyqxkKFYSnladwJ5uIi7zctGnMj8RAyNjoXBZd6SugVQUhG9AAO2ClVU7VKWSr/CPD
 LTzyBE8Dp8LMOHZBIeFLob7JXXShSCjUTqYklVkdbiu//rc9e4ER62lux0Mj0snRzZQl
 dNVg==
X-Gm-Message-State: AOAM53370TiW9tn7YNKolB/AHiatAg4Z0aD85rXd0QQixf/LI+tIfv3c
 HhguZ7JQ6HFjyK0puxQDx12XlhbU9Wbz3qEdCs0Nw4ur3YXpO3hlAPCdk/PfqpN01QeviP/MnhY
 vn24OhMq8AP/cmQM7fgMPR7PaMsA=
X-Received: by 2002:a25:408f:: with SMTP id n137mr7369772yba.97.1604470980978; 
 Tue, 03 Nov 2020 22:23:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6uhx8zDpl15YGsHnhL4LZ2KlzV7S+9/AE4QfVB5DQEGpUhcZZY7epVi2IAtvWX46ScHBM7CkcyuHPy57RTxw=
X-Received: by 2002:a25:408f:: with SMTP id n137mr7369756yba.97.1604470980777; 
 Tue, 03 Nov 2020 22:23:00 -0800 (PST)
MIME-Version: 1.0
References: <5d6e978c803e4e6449cabd89596729bfad996a17.1604408825.git.jstancek@redhat.com>
In-Reply-To: <5d6e978c803e4e6449cabd89596729bfad996a17.1604408825.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 4 Nov 2020 14:22:49 +0800
Message-ID: <CAEemH2dHXYbmkbzccWNurYURZQJJ4GENRBr=6KfQaL5HJaBO2g@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_cgroup: fix short reads of mems/cpus
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
Content-Type: multipart/mixed; boundary="===============0472716453=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0472716453==
Content-Type: multipart/alternative; boundary="000000000000dcb0b105b34202a6"

--000000000000dcb0b105b34202a6
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2020 at 9:10 PM Jan Stancek <jstancek@redhat.com> wrote:

> tst_cgroup_cpuset_read_files() is wrongly using sizeof on pointer
> type to figure out length of buffer. On some systems there's
> more content in cgroup mems/cpus, which leads to partial read
> and subsequent EINVAL on write.
>
> Also the retval buffer should be zero terminated, since buffer
> can be passed uninitialized, subsequently leading to writing garbage
> to cgroup and again hitting EINVAL.
>
> Before:
>   tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
>   tst_device.c:423: TINFO: No device is mounted at cgroup2
>   tst_device.c:423: TINFO: No device is mounted at /tmp/cgroup_cst
>   tst_cgroup.c:100: TINFO: Cgroup(cpuset) v1 mount at /tmp/cgroup_cst
> success
>   safe_macros.c:458: TBROK: tst_cgroup.c:449:
> write(6,0x7fffc0425410,18446744073709551615) failed: EINVAL (22)
>   tst_cgroup.c:173: TWARN: umount /tmp/cgroup_cst: EBUSY (16)
>   tst_cgroup.c:175: TWARN: rmdir /tmp/cgroup_cst: EBUSY (16)
>   tst_cgroup.c:178: TINFO: Cgroup v1 unmount success
>
> After:
>   tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
>   tst_device.c:423: TINFO: No device is mounted at cgroup2
>   tst_device.c:423: TINFO: No device is mounted at /tmp/cgroup_cst
>   tst_cgroup.c:100: TINFO: Cgroup(cpuset) v1 mount at /tmp/cgroup_cst
> success
>   cpuset01.c:83: TPASS: cpuset test pass
>   tst_cgroup.c:178: TINFO: Cgroup v1 unmount success
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  include/tst_cgroup.h                   | 6 ++++--
>  lib/tst_cgroup.c                       | 6 ++++--
>  testcases/kernel/mem/cpuset/cpuset01.c | 4 ++--
>  3 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
> index 77780e0d64c9..bfd8482608c4 100644
> --- a/include/tst_cgroup.h
> +++ b/include/tst_cgroup.h
> @@ -39,7 +39,9 @@ int  tst_cgroup_mem_swapacct_enabled(const char
> *cgroup_dir);
>  void tst_cgroup_mem_set_maxswap(const char *cgroup_dir, long memsz);
>
>  /* Set of functions to read/write cpuset controller files content */
> -void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char
> *filename, char *retbuf);
> -void tst_cgroup_cpuset_write_files(const char *cgroup_dir, const char
> *filename, const char *buf);
> +void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char
> *filename,
> +       char *retbuf, size_t retbuf_sz);
> +void tst_cgroup_cpuset_write_files(const char *cgroup_dir, const char
> *filename,
> +       const char *buf);
>
>  #endif /* TST_CGROUP_H */
> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index ba413d874f69..96c9524d2b3a 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -393,7 +393,8 @@ void tst_cgroup_mem_set_maxswap(const char
> *cgroup_dir, long memsz)
>                 tst_cgroup_set_knob(cgroup_dir, "memory.swap.max", memsz);
>  }
>
> -void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char
> *filename, char *retbuf)
> +void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char
> *filename,
> +       char *retbuf, size_t retbuf_sz)
>  {
>         int fd;
>         char *cgroup_new_dir;
> @@ -417,7 +418,8 @@ void tst_cgroup_cpuset_read_files(const char
> *cgroup_dir, const char *filename,
>                         tst_brk(TBROK | TERRNO, "open %s", knob_path);
>         }
>
> -       if (read(fd, retbuf, sizeof(retbuf)) < 0)
> +       memset(retbuf, 0, retbuf_sz);
> +       if (read(fd, retbuf, retbuf_sz) < 0)
>                 tst_brk(TBROK | TERRNO, "read %s", knob_path);
>
>         close(fd);
> diff --git a/testcases/kernel/mem/cpuset/cpuset01.c
> b/testcases/kernel/mem/cpuset/cpuset01.c
> index f70ae0e486c2..fcd22040f7dd 100644
> --- a/testcases/kernel/mem/cpuset/cpuset01.c
> +++ b/testcases/kernel/mem/cpuset/cpuset01.c
> @@ -51,9 +51,9 @@ static void test_cpuset(void)
>         unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
>         char mems[BUFSIZ], buf[BUFSIZ];
>
> -       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf);
> +       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf,
> sizeof(buf));
>         tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "cpus", buf);
> -       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems);
> +       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems,
> sizeof(buf));
>

sizeof() is generally used to calculate the size (in bytes) of a data type,
e.g sizeof(char *).
I think here to pass 'BUFSIZ' directly is better than sizeof(buf).

Otherwise, looks good to me.


>         tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "mems", mems);
>         tst_cgroup_move_current(PATH_TMP_CG_CST);
>
> --
> 2.18.1
>
>

-- 
Regards,
Li Wang

--000000000000dcb0b105b34202a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 3, 2020 at 9:10 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">tst_cgroup_cpuset_rea=
d_files() is wrongly using sizeof on pointer<br>
type to figure out length of buffer. On some systems there&#39;s<br>
more content in cgroup mems/cpus, which leads to partial read<br>
and subsequent EINVAL on write.<br>
<br>
Also the retval buffer should be zero terminated, since buffer<br>
can be passed uninitialized, subsequently leading to writing garbage<br>
to cgroup and again hitting EINVAL.<br>
<br>
Before:<br>
=C2=A0 tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s<br>
=C2=A0 tst_device.c:423: TINFO: No device is mounted at cgroup2<br>
=C2=A0 tst_device.c:423: TINFO: No device is mounted at /tmp/cgroup_cst<br>
=C2=A0 tst_cgroup.c:100: TINFO: Cgroup(cpuset) v1 mount at /tmp/cgroup_cst =
success<br>
=C2=A0 safe_macros.c:458: TBROK: tst_cgroup.c:449: write(6,0x7fffc0425410,1=
8446744073709551615) failed: EINVAL (22)<br>
=C2=A0 tst_cgroup.c:173: TWARN: umount /tmp/cgroup_cst: EBUSY (16)<br>
=C2=A0 tst_cgroup.c:175: TWARN: rmdir /tmp/cgroup_cst: EBUSY (16)<br>
=C2=A0 tst_cgroup.c:178: TINFO: Cgroup v1 unmount success<br>
<br>
After:<br>
=C2=A0 tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s<br>
=C2=A0 tst_device.c:423: TINFO: No device is mounted at cgroup2<br>
=C2=A0 tst_device.c:423: TINFO: No device is mounted at /tmp/cgroup_cst<br>
=C2=A0 tst_cgroup.c:100: TINFO: Cgroup(cpuset) v1 mount at /tmp/cgroup_cst =
success<br>
=C2=A0 cpuset01.c:83: TPASS: cpuset test pass<br>
=C2=A0 tst_cgroup.c:178: TINFO: Cgroup v1 unmount success<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/tst_cgroup.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 6 ++++--<br>
=C2=A0lib/tst_cgroup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++++--<br>
=C2=A0testcases/kernel/mem/cpuset/cpuset01.c | 4 ++--<br>
=C2=A03 files changed, 10 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h<br>
index 77780e0d64c9..bfd8482608c4 100644<br>
--- a/include/tst_cgroup.h<br>
+++ b/include/tst_cgroup.h<br>
@@ -39,7 +39,9 @@ int=C2=A0 tst_cgroup_mem_swapacct_enabled(const char *cgr=
oup_dir);<br>
=C2=A0void tst_cgroup_mem_set_maxswap(const char *cgroup_dir, long memsz);<=
br>
<br>
=C2=A0/* Set of functions to read/write cpuset controller files content */<=
br>
-void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char *file=
name, char *retbuf);<br>
-void tst_cgroup_cpuset_write_files(const char *cgroup_dir, const char *fil=
ename, const char *buf);<br>
+void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char *file=
name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *retbuf, size_t retbuf_sz);<br>
+void tst_cgroup_cpuset_write_files(const char *cgroup_dir, const char *fil=
ename,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf);<br>
<br>
=C2=A0#endif /* TST_CGROUP_H */<br>
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c<br>
index ba413d874f69..96c9524d2b3a 100644<br>
--- a/lib/tst_cgroup.c<br>
+++ b/lib/tst_cgroup.c<br>
@@ -393,7 +393,8 @@ void tst_cgroup_mem_set_maxswap(const char *cgroup_dir,=
 long memsz)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup_set_knob=
(cgroup_dir, &quot;memory.swap.max&quot;, memsz);<br>
=C2=A0}<br>
<br>
-void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char *file=
name, char *retbuf)<br>
+void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char *file=
name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *retbuf, size_t retbuf_sz)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *cgroup_new_dir;<br>
@@ -417,7 +418,8 @@ void tst_cgroup_cpuset_read_files(const char *cgroup_di=
r, const char *filename,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_brk(TBROK | TERRNO, &quot;open %s&quot;, knob_path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (read(fd, retbuf, sizeof(retbuf)) &lt; 0)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(retbuf, 0, retbuf_sz);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (read(fd, retbuf, retbuf_sz) &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK | TER=
RNO, &quot;read %s&quot;, knob_path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
diff --git a/testcases/kernel/mem/cpuset/cpuset01.c b/testcases/kernel/mem/=
cpuset/cpuset01.c<br>
index f70ae0e486c2..fcd22040f7dd 100644<br>
--- a/testcases/kernel/mem/cpuset/cpuset01.c<br>
+++ b/testcases/kernel/mem/cpuset/cpuset01.c<br>
@@ -51,9 +51,9 @@ static void test_cpuset(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long nmask[MAXNODES / BITS_PER_LONG] =
=3D { 0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char mems[BUFSIZ], buf[BUFSIZ];<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, &=
quot;cpus&quot;, buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, &=
quot;cpus&quot;, buf, sizeof(buf));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, =
&quot;cpus&quot;, buf);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, &=
quot;mems&quot;, mems);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, &=
quot;mems&quot;, mems, sizeof(buf));<br></blockquote><div><br></div>sizeof(=
) is <span class=3D"gmail_default" style=3D"font-size:small">generally </sp=
an>used to calculate the size (in bytes) of a data type<span class=3D"gmail=
_default" style=3D"font-size:small">, e.g sizeof(char *).</span></div><div =
class=3D"gmail_quote"><span class=3D"gmail_default" style=3D"font-size:smal=
l">I think here to pass &#39;BUFSIZ&#39; directly is better than sizeof(buf=
).<br></span></div><div class=3D"gmail_quote"><span class=3D"gmail_default"=
 style=3D"font-size:small"><br></span></div><div class=3D"gmail_quote"><spa=
n class=3D"gmail_default" style=3D"font-size:small">Otherwise, looks good t=
o me.</span></div><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, =
&quot;mems&quot;, mems);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup_move_current(PATH_TMP_CG_CST);<br>
<br>
-- <br>
2.18.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000dcb0b105b34202a6--


--===============0472716453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0472716453==--

