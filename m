Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE6357DEB
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 10:18:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2D063C1DCE
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 10:18:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0CD543C1DA7
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 10:18:31 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 2C92E601D0F
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 10:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617869908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zFLxzHnF1K7GefWCxr9WnIuo7v7cgKRHuOwRXkqjnIo=;
 b=dlT96ztBDoa8WuMjUZUPZ+jQAw2kolQ4F7iz4mCRw/Dzw3yNxULb1Jz6eoVHzbBFhu6ROX
 ZE7KkHjlNNsJ+mzuWZmMO9Ds4OKXm3t6EjlGFaeIyLHkYoECyQDFUCSuE+8vaPMHDT0GeB
 ebULCu+jZBh0KORPtlUJWYPzHf0Ifi8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-wg3VV50XMGGh5Iez3KCfKw-1; Thu, 08 Apr 2021 04:18:26 -0400
X-MC-Unique: wg3VV50XMGGh5Iez3KCfKw-1
Received: by mail-yb1-f200.google.com with SMTP id v6so1432736ybk.9
 for <ltp@lists.linux.it>; Thu, 08 Apr 2021 01:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zFLxzHnF1K7GefWCxr9WnIuo7v7cgKRHuOwRXkqjnIo=;
 b=SaeB1vPGvFjXBSkU1KApdtSfWevHZLB/9w1E/x7S/K8siXd2igC4GSrfSQuSW5A6xW
 zshe3ci2RVVFUVfmd7UtLN4+XIy7Z4DFpgT7oayfw1gUqFLbr7cEai05hwxnWtMWDNRv
 bdDNx8eMqyd8tzZ22WkzsM0jx6cNnolEAgdtHXC2YV75iU0F2UJFzrB45F3yaRFRI4vi
 K9XQoGhVgqGFYaMOjx2ipQnxSy72lH9sHBoqEdJTIZHOH02rCJIxVCu+vkTYkxA4vNPN
 B/NFh87+oD/cHIfX/Lyb6nrDPzo/eGYTccePa0bDDxGIMhoneF/BkBqUcDP/UMzfcsyU
 7/ZA==
X-Gm-Message-State: AOAM532V3aaeewStnLiZPFI74YSKiy5ngsMclzV5rOi8BeBNAyJhq5Y8
 dCi/2FrIMUJy5VCfEg8Am4YMMIJL/hjPLoJpN5LIyIlR5+mTkKVh6qSvjney0rYDs8aK0bh7Ey0
 OLd4Oz9RCse3c0czI+2zNANRft8o=
X-Received: by 2002:a25:d194:: with SMTP id
 i142mr10491957ybg.110.1617869906158; 
 Thu, 08 Apr 2021 01:18:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMVlW85Ow9Brz5vFDP/4VMYVVHr0pC+1ZOF1UZONu5+cMxOrQcGEcP5H6o8pdR+LadP+Aqu9r5zdjDQjE567U=
X-Received: by 2002:a25:d194:: with SMTP id
 i142mr10491929ybg.110.1617869905859; 
 Thu, 08 Apr 2021 01:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210317105318.32017-1-chrubis@suse.cz>
 <20210317105318.32017-2-chrubis@suse.cz>
In-Reply-To: <20210317105318.32017-2-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 8 Apr 2021 16:18:14 +0800
Message-ID: <CAEemH2frh1iyW9SrVJkwXT9nrHt1C+WUmQUcNb=mCota9_xKAA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/4] lib: Add proper filesystem skiplist
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
Content-Type: multipart/mixed; boundary="===============0317844934=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0317844934==
Content-Type: multipart/alternative; boundary="000000000000082ee105bf71b176"

--000000000000082ee105bf71b176
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 6:51 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> The approach with flags we added for FUSE does not scale at all, we need
> a proper skiplist so that we can skip individual filesystems.
>
> The motivation here is the addition of tmpfs to the supported
> filesystems check. One of the problems there is that sync() is no-op on
> tmpfs and hence the syncfs test fails. After this patchset we can simply
> skip syncfs test on tmpfs by setting the right skiplist.
>
> As a bonus point the list of unsupported filesystem gets nicely
> propagated to the metadata as well.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  include/tst_fs.h                              | 25 +++++--
>  include/tst_test.h                            |  9 ++-
>  lib/tst_supported_fs_types.c                  | 66 +++++++++++++++----
>  lib/tst_test.c                                |  2 +-
>  .../kernel/syscalls/fsconfig/fsconfig01.c     |  2 +-
>  testcases/kernel/syscalls/fsmount/fsmount01.c |  2 +-
>  testcases/kernel/syscalls/fsmount/fsmount02.c |  2 +-
>  testcases/kernel/syscalls/fsopen/fsopen01.c   |  2 +-
>  testcases/kernel/syscalls/fspick/fspick01.c   |  2 +-
>  testcases/kernel/syscalls/fspick/fspick02.c   |  2 +-
>  .../kernel/syscalls/move_mount/move_mount01.c |  2 +-
>  .../kernel/syscalls/move_mount/move_mount02.c |  2 +-
>  .../kernel/syscalls/open_tree/open_tree01.c   |  2 +-
>  .../kernel/syscalls/open_tree/open_tree02.c   |  2 +-
>  .../sync_file_range/sync_file_range02.c       |  2 +-
>  testcases/lib/tst_supported_fs.c              |  4 +-
>  16 files changed, 93 insertions(+), 35 deletions(-)
>
> diff --git a/include/tst_fs.h b/include/tst_fs.h
> index cc5cc2c0c..6b1d800a1 100644
> --- a/include/tst_fs.h
> +++ b/include/tst_fs.h
> @@ -167,18 +167,33 @@ int tst_fill_file(const char *path, char pattern,
> size_t bs, size_t bcount);
>   */
>  int tst_prealloc_file(const char *path, size_t bs, size_t bcount);
>
> -#define TST_FS_SKIP_FUSE 0x01
> +enum tst_fs_type {
> +       TST_FS_UNSUPPORTED = 0,
> +       TST_FS_KERNEL = 1,
> +       TST_FS_FUSE = 2,
> +};
>

Do you think it necessary to rename 'enum tst_fs_type' to distinguish with
'fs_type'?

As it is quite similar to the 'fs_type*' series function and structure,
that might mess up
the code (we even have the same name function: tst_fs_type). So, I'd like
to suggest
use 'enum tst_fs_status' or 'enum tst_fs_item', or anything else.

Anyway, the remaining part of the patchset looks good.

-- 
Regards,
Li Wang

--000000000000082ee105bf71b176
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 17, 2021 at 6:51 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">The approach with flags we =
added for FUSE does not scale at all, we need<br>
a proper skiplist so that we can skip individual filesystems.<br>
<br>
The motivation here is the addition of tmpfs to the supported<br>
filesystems check. One of the problems there is that sync() is no-op on<br>
tmpfs and hence the syncfs test fails. After this patchset we can simply<br=
>
skip syncfs test on tmpfs by setting the right skiplist.<br>
<br>
As a bonus point the list of unsupported filesystem gets nicely<br>
propagated to the metadata as well.<br>
<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
Signed-off-by: Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=
=3D"_blank">mdoucha@suse.cz</a>&gt;<br>
---<br>
=C2=A0include/tst_fs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 25 +++++--<br>
=C2=A0include/tst_test.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++-<br>
=C2=A0lib/tst_supported_fs_types.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 66 +++++++++++++++----<br>
=C2=A0lib/tst_test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../kernel/syscalls/fsconfig/fsconfig01.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
=C2=A0testcases/kernel/syscalls/fsmount/fsmount01.c |=C2=A0 2 +-<br>
=C2=A0testcases/kernel/syscalls/fsmount/fsmount02.c |=C2=A0 2 +-<br>
=C2=A0testcases/kernel/syscalls/fsopen/fsopen01.c=C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0testcases/kernel/syscalls/fspick/fspick01.c=C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0testcases/kernel/syscalls/fspick/fspick02.c=C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0.../kernel/syscalls/move_mount/move_mount01.c |=C2=A0 2 +-<br>
=C2=A0.../kernel/syscalls/move_mount/move_mount02.c |=C2=A0 2 +-<br>
=C2=A0.../kernel/syscalls/open_tree/open_tree01.c=C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0.../kernel/syscalls/open_tree/open_tree02.c=C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0.../sync_file_range/sync_file_range02.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0testcases/lib/tst_supported_fs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A016 files changed, 93 insertions(+), 35 deletions(-)<br>
<br>
diff --git a/include/tst_fs.h b/include/tst_fs.h<br>
index cc5cc2c0c..6b1d800a1 100644<br>
--- a/include/tst_fs.h<br>
+++ b/include/tst_fs.h<br>
@@ -167,18 +167,33 @@ int tst_fill_file(const char *path, char pattern, siz=
e_t bs, size_t bcount);<br>
=C2=A0 */<br>
=C2=A0int tst_prealloc_file(const char *path, size_t bs, size_t bcount);<br=
>
<br>
-#define TST_FS_SKIP_FUSE 0x01<br>
+enum tst_fs_type {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_FS_UNSUPPORTED =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_FS_KERNEL =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_FS_FUSE =3D 2,<br>
+};<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Do you think it necessary to rename &#39;enum tst_fs_t=
ype&#39; to distinguish with &#39;fs_type&#39;?</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">As it is quite similar to the &#39;fs_type*&#39; ser=
ies function and structure, that might mess up</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">the code (we even have the same name functi=
on: tst_fs_type). So, I&#39;d like to suggest=C2=A0</div><div class=3D"gmai=
l_default" style=3D"font-size:small">use &#39;enum tst_fs_status&#39; or &#=
39;enum tst_fs_item&#39;, or anything else.</div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Anyway, the remaining part of =
the patchset looks good.</div></div></div><div><br></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><di=
v>Li Wang<br></div></div></div></div>

--000000000000082ee105bf71b176--


--===============0317844934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0317844934==--

