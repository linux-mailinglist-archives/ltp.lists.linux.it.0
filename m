Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D62E86D7
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Jan 2021 10:18:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBEA43C331B
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Jan 2021 10:18:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id DF84A3C2695
 for <ltp@lists.linux.it>; Sat,  2 Jan 2021 10:18:32 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 127252003A2
 for <ltp@lists.linux.it>; Sat,  2 Jan 2021 10:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609579108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qhMSq49ZgMj7t+mrW72zX656iRDZN/2TWUf+J1SSOto=;
 b=PZJNRiSZVa+XSPiREoENmDSJPyeeFM8cCSK92ED3wM6AdmQMpJ5hcnx8bSdshiUFX3ZDcw
 6CvDBoZl8N+7AkmIYoTIbDf32AgLs4JxahKFO8ELyuVrt1LsxnDqR1O0rf9TY2VJdJc/tp
 aC3l2jj5wenUPiDP0Bv/qwmW50DoO2w=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-kNBvDQQDMqOfLcdyAGaIpg-1; Sat, 02 Jan 2021 04:18:24 -0500
X-MC-Unique: kNBvDQQDMqOfLcdyAGaIpg-1
Received: by mail-yb1-f199.google.com with SMTP id l8so41038032ybj.16
 for <ltp@lists.linux.it>; Sat, 02 Jan 2021 01:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qhMSq49ZgMj7t+mrW72zX656iRDZN/2TWUf+J1SSOto=;
 b=oCkqjo5McEpnxjcTOFAx6Z2tiqx7SwhjznboFJ9ecoCMURLvse3s85pkc1Pnrll7Xm
 fvP+/F+f8G/5KVR0pkycW5smrrKBLFYn7dacqtIPAsqCC13LzMk+h9xwgK+CRDN/tMKr
 Zlq0SnGaKiubTquFLESQ+J/Ny49GxeVNovHUQyXh1l4cSHQAWm+fWS5UrkXHjq5l7rD4
 np4w1wraHJllxbUyzr5DJq+PnfY8qNmON5o+TJpVsEZK69gMJxtFGsx26nGuh2Ilall4
 jxvwBReGcrVSQzV65wRBL5YEiKw2l1IXPaEqVrvISZiId+81I04R2IxKLzYFw9nnD5Hc
 avtQ==
X-Gm-Message-State: AOAM532PRK2JAyXilefO9fQz+9RqZoLcqthvZ6J5PYYKienumJ1mFUUu
 uaEHopZibcoQqYOXvMFaev7slyzqZ22EvxXs3R0fRVSMcyWp43pc+8uD8bCDJA5Gp3D8uL74lZE
 BdAtaiLGJzrVNxDAwcDzejLF8TtA=
X-Received: by 2002:a25:23d7:: with SMTP id
 j206mr96318530ybj.243.1609579103764; 
 Sat, 02 Jan 2021 01:18:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNf3jcyETIJzfwcdnFSoKC4tQyw6YKWaRIWP4sGVOauWj894x7qg1W26RDYcZyhgJ/veAaqP0b8u7MHww+r6A=
X-Received: by 2002:a25:23d7:: with SMTP id
 j206mr96318511ybj.243.1609579103507; 
 Sat, 02 Jan 2021 01:18:23 -0800 (PST)
MIME-Version: 1.0
References: <20201216100121.16683-1-rpalethorpe@suse.com>
 <20201216100121.16683-3-rpalethorpe@suse.com>
In-Reply-To: <20201216100121.16683-3-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Sat, 2 Jan 2021 17:18:11 +0800
Message-ID: <CAEemH2ddomP4XO=61vNx5=3vQYNj4WOurUX2zcuC-46RxhMk0g@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/5] CGroup API rewrite
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
Content-Type: multipart/mixed; boundary="===============0956348384=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0956348384==
Content-Type: multipart/alternative; boundary="000000000000b3f57a05b7e756e2"

--000000000000b3f57a05b7e756e2
Content-Type: text/plain; charset="UTF-8"

Richard Palethorpe via ltp <ltp@lists.linux.it> wrote:


> So we have a choice of:
>
> A) Expect a particular configuration and refuse to run
>    otherwise
> B) Expect no CGroups and mount them
> C) Try to use what is available
> D) (C) and try to mount them if nothing is present
> E) (C), (D) and try to cleanup what we created
>
> (A) and (B) are more simple for the LTP library, but require our users
> to do more work, perhaps a lot more. Depending on the test
> environment; disabling or reconfiguring CGroups may be
> difficult. Because many tests require CGroups to expose a bug in other
> subsystems (e.g. the memory subsystem), I do not think (A) and (B) are
> viable options. They may be acceptable for testing core CGroup
> features where a pristine system is required (e.g. first mount), but
> that is not the current focus of these changes.
>
> (C) is probably the simplest viable option, but this tries to
> implement (E). Mounting the CGroups if none are available simplifies
> testing within environments like Rapido where testing is done in the
> recovery console and no CGroups are mounted by the system manager. On
> the other hand it is quite simple for the user to mount some CGroups.
>
> Mounting is relatively simple so does not add much complexity, however
> cleaning up the mounts is broken so possibly we should only
> attempt (C) or (D). It appears that the test process has some references to
> the mount struct and so it can not be removed by the test, but I am
>

Yes, and that's also the reason I like the drain_dir in this patch.


> partly guessing. Using MNT_DETACH at least allows the directory to be
> removed, but it's not clear if the root is eventually destroyed. It
> appears that a separate process (i.e. the umount command) can properly
> remove the mount and the CGroup is destroyed, but this is still not
> fully clear without more tracing.
>
> [...]


> +/* Determine if a mounted cgroup hierarchy (tree) is unique and record it
> if so.
> + *
> + * For CGroups V2 this is very simple as there is only one
> + * hierarchy. We just record which controllers are available and check
> + * if this matches what we read from any previous mounts to verify our
> + * own logic (and possibly detect races).
> + *
> + * For V1 the set of controllers S is partitioned into sets {P_1, P_2,
> + * ..., P_n} with one or more controllers in each partion. Each
> + * partition P_n can be mounted multiple times, but the same
> + * controller can not appear in more than one partition. Usually each
> + * partition contains a single controller, but, for example, cpu and
> + * cpuacct are often mounted together in the same partiion.
> + *
> + * Each controller partition has its own hierarchy/root/tree which we
> + * must track and update independently.
> + */
> +static void tst_cgroup_get_tree(const char *type, const char *path, char
> *opts)
> +{
> +       struct tst_cgroup_root *t = trees;
> +       struct tst_cgroup_ss *c;
>

why not naming *c to *ss? to make it tidier for readability just like what
you did in other functions.

static void tst_cgroup_get_tree(const char *type, const char *path, char
*opts)
 {
        struct tst_cgroup_root *t = trees;
-       struct tst_cgroup_ss *c;
+       struct tst_cgroup_ss *ss;
        uint32_t ss_field = 0;
        int no_prefix = 0;
        char buf[BUFSIZ];
@@ -290,9 +290,9 @@ backref:
        t->ss_field = ss_field;
        t->no_prefix = no_prefix;

-       tst_for_each_css(c) {
-               if (t->ss_field & (1 << c->indx))
-                       c->tree = t;
+       tst_for_each_css(ss) {
+               if (t->ss_field & (1 << ss->indx))
+                       ss->tree = t;
        }



> [...]
>
> +void tst_cgroup_require(enum tst_cgroup_ctrl type,
> +                       const struct tst_cgroup_opts *options)
>  {
> -       char *cgroup_new_dir;
> -       char knob_path[PATH_MAX];
> +       struct tst_cgroup_ss *ss = tst_cgroup_get_ss(type);
> +       struct tst_cgroup_root *t;
> +       char path[PATH_MAX];
>
> -       cgroup_new_dir = tst_cgroup_get_path(cgroup_dir);
> +       if (!options)
> +               options = &default_opts;
>
> -       if (tst_cg_ver & TST_CGROUP_V1) {
> -               sprintf(knob_path, "%s/%s",
> -                               cgroup_new_dir,
> "/memory.memsw.limit_in_bytes");
> +       if (ss->tree)
> +               goto ltpdir;
>
> -               if ((access(knob_path, F_OK) == -1)) {
> -                       if (errno == ENOENT)
> -                               tst_res(TCONF, "memcg swap accounting is
> disabled");
> -                       else
> -                               tst_brk(TBROK | TERRNO, "failed to access
> %s", knob_path);
> -               } else {
> -                       return 1;
> -               }
> +       tst_cgroup_scan();
> +
> +       if (ss->tree)
> +               goto ltpdir;
> +
> +       if (!tst_cgroup_v2_mounted() && !options->only_mount_v1)
> +               tst_cgroup_mount_v2();
> +
> +       if (ss->tree)
> +               goto ltpdir;
> +
> +       tst_cgroup_mount_v1(type);
> +
> +       if (!ss->tree) {
> +               tst_brk(TCONF,
> +                       "%s controller required, but not available",
> ss->name);
>         }
>
> -       if (tst_cg_ver & TST_CGROUP_V2) {
> -               sprintf(knob_path, "%s/%s",
> -                               cgroup_new_dir, "/memory.swap.max");
> +ltpdir:
> +       t = ss->tree;
>
> -               if ((access(knob_path, F_OK) == -1)) {
> -                       if (errno == ENOENT)
> -                               tst_res(TCONF, "memcg swap accounting is
> disabled");
> -                       else
> -                               tst_brk(TBROK | TERRNO, "failed to access
> %s", knob_path);
> -               } else {
> -                       return 1;
> -               }
> +       if (tst_cgroup_ss_on_v2(ss)) {
> +               tst_file_printfat(t->mnt_dir, "cgroup.subtree_control",
> +                                 "+%s", ss->name);
>         }
>
> -       return 0;
> +       sprintf(path, "%s/%s", t->path, ltp_cgroup_dir);
> +
> +       if (!mkdir(path, 0777)) {
> +               t->we_created_ltp_dir = 1;
> +               goto draindir;
> +       }
> +
> +       if (errno == EEXIST)
> +               goto draindir;
> +
> +       if (errno == EACCES) {
> +               tst_brk(TCONF | TERRNO,
> +                       "Lack permission to make %s; premake it or run as
> root",
> +                       path);
> +       }
> +
> +       tst_brk(TBROK | TERRNO, "mkdir(%s, 0777)", path);
> +
> +draindir:
> +       if (!t->ltp_dir)
> +               t->ltp_dir = SAFE_OPEN(path, O_PATH | O_DIRECTORY);
> +
> +       if (tst_cgroup_ss_on_v2(ss)) {
> +               SAFE_FILE_PRINTFAT(t->ltp_dir, "cgroup.subtree_control",
> +                                  "+%s", ss->name);
> +       } else {
> +               SAFE_FILE_PRINTFAT(t->ltp_dir, "cgroup.clone_children",
> +                                  "%d", 1);
> +
> +               if (type == TST_CGROUP_CPUSET)
> +                       tst_cgroup_copy_cpuset(t);
> +       }
> +
> +       sprintf(path, "%s/%s/%s",
> +               t->path, ltp_cgroup_dir, ltp_cgroup_drain_dir);
> +
> +       if (!mkdir(path, 0777) || errno == EEXIST)
> +               goto testdir;
> +
> +       if (errno == EACCES) {
> +               tst_brk(TCONF | TERRNO,
> +                       "Lack permission to make %s; grant access or run
> as root",
> +                       path);
> +       }
> +
> +       tst_brk(TBROK | TERRNO, "mkdir(%s, 0777)", path);
> +
> +testdir:
> +       if (!t->drain_dir)
> +               t->drain_dir = SAFE_OPEN(path, O_PATH | O_DIRECTORY);
> +
> +       if (!test_cgroup_dir[0])
> +               sprintf(test_cgroup_dir, "test-%d", getpid());
>

As I was mentioned in 0/5 that maybe we should create test_cgroup_dir
for different progress so that the test could use the same controller with
various configurations in parallel.

e.g. child_1 set SIZE to memory.limit_in_bytes
       child_2 set SIZE/2 to memory.limit_in_bytes

Any possibility to move this to tst_cgroup_move_current?

-- 
Regards,
Li Wang

--000000000000b3f57a05b7e756e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Richard Palethorpe via ltp &lt;<a href=3D"mailto:ltp@li=
sts.linux.it" target=3D"_blank">ltp@lists.linux.it</a>&gt; wrote:<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
So we have a choice of:<br>
<br>
A) Expect a particular configuration and refuse to run<br>
=C2=A0 =C2=A0otherwise<br>
B) Expect no CGroups and mount them<br>
C) Try to use what is available<br>
D) (C) and try to mount them if nothing is present<br>
E) (C), (D) and try to cleanup what we created<br>
<br>
(A) and (B) are more simple for the LTP library, but require our users<br>
to do more work, perhaps a lot more. Depending on the test<br>
environment; disabling or reconfiguring CGroups may be<br>
difficult. Because many tests require CGroups to expose a bug in other<br>
subsystems (e.g. the memory subsystem), I do not think (A) and (B) are<br>
viable options. They may be acceptable for testing core CGroup<br>
features where a pristine system is required (e.g. first mount), but<br>
that is not the current focus of these changes.<br>
<br>
(C) is probably the simplest viable option, but this tries to<br>
implement (E). Mounting the CGroups if none are available simplifies<br>
testing within environments like Rapido where testing is done in the<br>
recovery console and no CGroups are mounted by the system manager. On<br>
the other hand it is quite simple for the user to mount some CGroups.<br>
<br>
Mounting is relatively simple so does not add much complexity, however<br>
cleaning up the mounts is broken so possibly we should only<br>
attempt (C) or (D). It appears that the test process has some references to=
<br>
the mount struct and so it can not be removed by the test, but I am<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Yes, and that&#39;s also the reason I like the drain_dir in this p=
atch.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
partly guessing. Using MNT_DETACH at least allows the directory to be<br>
removed, but it&#39;s not clear if the root is eventually destroyed. It<br>
appears that a separate process (i.e. the umount command) can properly<br>
remove the mount and the CGroup is destroyed, but this is still not<br>
fully clear without more tracing.<br><br>
<span class=3D"gmail_default" style=3D"font-size:small">[...</span><span cl=
ass=3D"gmail_default" style=3D"font-size:small">]</span></blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><br>
+/* Determine if a mounted cgroup hierarchy (tree) is unique and record it =
if so.<br>
+ *<br>
+ * For CGroups V2 this is very simple as there is only one<br>
+ * hierarchy. We just record which controllers are available and check<br>
+ * if this matches what we read from any previous mounts to verify our<br>
+ * own logic (and possibly detect races).<br>
+ *<br>
+ * For V1 the set of controllers S is partitioned into sets {P_1, P_2,<br>
+ * ..., P_n} with one or more controllers in each partion. Each<br>
+ * partition P_n can be mounted multiple times, but the same<br>
+ * controller can not appear in more than one partition. Usually each<br>
+ * partition contains a single controller, but, for example, cpu and<br>
+ * cpuacct are often mounted together in the same partiion.<br>
+ *<br>
+ * Each controller partition has its own hierarchy/root/tree which we<br>
+ * must track and update independently.<br>
+ */<br>
+static void tst_cgroup_get_tree(const char *type, const char *path, char *=
opts)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tst_cgroup_root *t =3D trees;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tst_cgroup_ss *c;<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">why no=
t naming *c to *ss? to make it tidier for readability just like what you di=
d in other functions.</div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small"> static void tst_cgroup_get_tree(const char *type, co=
nst char *path, char *opts)</div>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=
uct tst_cgroup_root *t =3D trees;<br>- =C2=A0 =C2=A0 =C2=A0 struct tst_cgro=
up_ss *c;<br>+ =C2=A0 =C2=A0 =C2=A0 struct tst_cgroup_ss *ss;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint32_t ss_field =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nt no_prefix =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 char buf[BUFSIZ];<br>@@ =
-290,9 +290,9 @@ backref:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;ss_field =3D=
 ss_field;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;no_prefix =3D no_prefix;<br=
>=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 tst_for_each_css(c) {<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (t-&gt;ss_field &amp; (1 &lt;&lt; c-&=
gt;indx))<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 c-&gt;tree =3D t;<br>+ =C2=A0 =C2=A0 =C2=A0 tst_for_each_=
css(ss) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (t-&gt;s=
s_field &amp; (1 &lt;&lt; ss-&gt;indx))<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ss-&gt;tree =3D t;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<span class=3D"gmail_default" style=3D"font-size:small">[...]</span><br><br=
>
+void tst_cgroup_require(enum tst_cgroup_ctrl type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const struct tst_cgroup_opts *options)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *cgroup_new_dir;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char knob_path[PATH_MAX];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tst_cgroup_ss *ss =3D tst_cgroup_get_ss(=
type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tst_cgroup_root *t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char path[PATH_MAX];<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cgroup_new_dir =3D tst_cgroup_get_path(cgroup_d=
ir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!options)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D &amp;de=
fault_opts;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cg_ver &amp; TST_CGROUP_V1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(knob_path, =
&quot;%s/%s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgroup_new_dir, &quot;/memory.memsw.l=
imit_in_bytes&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ss-&gt;tree)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto ltpdir;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((access(knob_pa=
th, F_OK) =3D=3D -1)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (errno =3D=3D ENOENT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TCONF, &quot;memcg swap accou=
nting is disabled&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TERRNO, &quot;failed =
to access %s&quot;, knob_path);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_scan();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ss-&gt;tree)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto ltpdir;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tst_cgroup_v2_mounted() &amp;&amp; !option=
s-&gt;only_mount_v1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mount_v2=
();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ss-&gt;tree)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto ltpdir;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mount_v1(type);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ss-&gt;tree) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;%s controller required, but not available&quot;, ss-&gt;nam=
e);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cg_ver &amp; TST_CGROUP_V2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(knob_path, =
&quot;%s/%s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgroup_new_dir, &quot;/memory.swap.ma=
x&quot;);<br>
+ltpdir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D ss-&gt;tree;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((access(knob_pa=
th, F_OK) =3D=3D -1)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (errno =3D=3D ENOENT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TCONF, &quot;memcg swap accou=
nting is disabled&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TERRNO, &quot;failed =
to access %s&quot;, knob_path);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cgroup_ss_on_v2(ss)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_file_printfat(t=
-&gt;mnt_dir, &quot;cgroup.subtree_control&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;+%s&quot;, ss-&gt;name);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(path, &quot;%s/%s&quot;, t-&gt;path, lt=
p_cgroup_dir);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mkdir(path, 0777)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t-&gt;we_created_lt=
p_dir =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto draindir;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D EEXIST)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto draindir;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D EACCES) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF | TER=
RNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Lack permission to make %s; premake it or run as root&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TERRNO, &quot;mkdir(%s, 0777)&q=
uot;, path);<br>
+<br>
+draindir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!t-&gt;ltp_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t-&gt;ltp_dir =3D S=
AFE_OPEN(path, O_PATH | O_DIRECTORY);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cgroup_ss_on_v2(ss)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTFAT(=
t-&gt;ltp_dir, &quot;cgroup.subtree_control&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;+%s&quot;, ss-&gt;name)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTFAT(=
t-&gt;ltp_dir, &quot;cgroup.clone_children&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%d&quot;, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D TST=
_CGROUP_CPUSET)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_cgroup_copy_cpuset(t);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(path, &quot;%s/%s/%s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t-&gt;path, ltp_cgr=
oup_dir, ltp_cgroup_drain_dir);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mkdir(path, 0777) || errno =3D=3D EEXIST)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto testdir;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D EACCES) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF | TER=
RNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Lack permission to make %s; grant access or run as root&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TERRNO, &quot;mkdir(%s, 0777)&q=
uot;, path);<br>
+<br>
+testdir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!t-&gt;drain_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t-&gt;drain_dir =3D=
 SAFE_OPEN(path, O_PATH | O_DIRECTORY);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!test_cgroup_dir[0])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(test_cgroup=
_dir, &quot;test-%d&quot;, getpid());<br></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">As I was mentioned=C2=
=A0in 0/5 that maybe we should create test_cgroup_dir</div><div class=3D"gm=
ail_default" style=3D"font-size:small">for different progress so that the t=
est could use the same controller with</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">various configurations in parallel<span class=3D"gm=
ail_default">.</span></div></div><div><br>e.g. child_1 set SIZE to memory.l=
imit_in_bytes<br><span class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0</span>child_2 set SIZE/2 to memory.limit_in_byt=
es</div><div><br><span class=3D"gmail_default" style=3D"font-size:small">An=
y possibility=C2=A0</span><span class=3D"gmail_default" style=3D"font-size:=
small">to </span><span class=3D"gmail_default" style=3D"font-size:small">mo=
ve</span>=C2=A0this to tst_cgroup_move_current?<br></div><div><br></div></d=
iv>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000b3f57a05b7e756e2--


--===============0956348384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0956348384==--

