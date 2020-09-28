Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7327A5C9
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 05:36:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 440583C2A29
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 05:36:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0DAA13C04C3
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 05:36:46 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 45C521400743
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 05:36:44 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601264203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ot2ATyu1qNX/7eps0pA616hN9dZvuZFRT0F3oHraoRs=;
 b=CZ5Y6ZvOHIUZib9kuWvvTKk7V8EQfEAJNcyN0zTPpja+a5oBbYVHRpgA9dpZOUUyk+n0R5
 Nl+nhehC6VY2kQiztwfLrS3EAPNWEY5iaQ2cuwEX4+CTsW1vIYHq0MwgPFZ7oMnXF9CiIw
 dQV0n/SwO13xPVtpOQOfagnPNWKeCmg=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-fYCc8umEPTKabBvwBs3cJw-1; Sun, 27 Sep 2020 23:36:40 -0400
X-MC-Unique: fYCc8umEPTKabBvwBs3cJw-1
Received: by mail-yb1-f200.google.com with SMTP id u35so9778369ybd.13
 for <ltp@lists.linux.it>; Sun, 27 Sep 2020 20:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ot2ATyu1qNX/7eps0pA616hN9dZvuZFRT0F3oHraoRs=;
 b=iqdy6xgpPQcSUcZSDYpUmp4B091Fjbgy7rFAzOXyF5uQDnLdaCV48uMfORMvPQ9qIU
 NLiCRq+vvUZ7usEV+iYP6F2bE+m09VY1h4aMGqljy3rBnFuX6KQEsRJdRmUt9DQKAvI8
 839eRtTYmEP7tkM/5TJ+SMj+L/b9MdxZ/hWXCg+yDtAppZG/rgSbshd8VtX3Z2Kvbb6b
 mr46zF7p5dKXL0OYwghpi8wl1CLReFrM7xGk6Q+7SWsC7FHOTskisfA0u8/v7RreotVH
 paVNw1ldJmrwOvLJRllAbJYv9wbQTN4Xoyf/OfggSSoP4N/Fr+61VOh1vqXxXPuDBqBD
 5taw==
X-Gm-Message-State: AOAM532+kisWYMwF8WlDxj5sJ3tL8GnJTLXVWu7hhoGMHQ2ga5LD19o5
 0dUDJofnvi4tg16DamAShRklAYV909afzOAZ5cHOTldsUDkkGOuOkCweSRayVzGH2UL6tXHo0g2
 gEePztOalVVEWv35/OyrrWtVMW0I=
X-Received: by 2002:a25:69cb:: with SMTP id
 e194mr13161756ybc.243.1601264200104; 
 Sun, 27 Sep 2020 20:36:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCKZ85H9TmCE00aqYYEeDJn03wv6maWgTO5opP/UjSKzZ49qnBZF9uwmeAWYv1SaANlBq8fMHCzb1wOTigIKQ=
X-Received: by 2002:a25:69cb:: with SMTP id
 e194mr13161742ybc.243.1601264199789; 
 Sun, 27 Sep 2020 20:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200925121941.10475-1-rpalethorpe@suse.com>
In-Reply-To: <20200925121941.10475-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 28 Sep 2020 11:36:28 +0800
Message-ID: <CAEemH2eo6qVt0D36QVDFeW_2csWFEDnnghxRjd3_Ysu=CD-8Hw@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC][PATCH] tst_cgroup: Attempt to use CGroups V2 then
 V1 instead of guessing
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
Content-Type: multipart/mixed; boundary="===============0778239543=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0778239543==
Content-Type: multipart/alternative; boundary="000000000000d213ab05b0575f66"

--000000000000d213ab05b0575f66
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On Fri, Sep 25, 2020 at 8:20 PM Richard Palethorpe <rpalethorpe@suse.com>
wrote:

> The best way to find out if we can do something is to try it, we don't
> check if the system has enough RAM and PIDs available before calling
> fork() in safe_fork(). Currently we try to guess what cgroups are
> currently in use then try to use the same version. We guess by
> grepping the mounts and filesystem files, these files need to be
> parsed in a structured way and even then, it is not the job of all
> tests which *use* cgroups to test that if cgroup(2) is present in
> mounts or filesystem that it can then be used.
>
> The cpuset group is only available on V1 and we can mount and use V1
> even if V2 is active. Just because the system has V2 active does not
> mean we cannot execute tests which require V1. This is one example
> where trying to figure out ahead of time what can or can't be used
> results in less testing.
>

Good point.

My previous thought on the Cgroup test-lib design was only to respect one
version,
because the upstream developer hopes to use V2 replaces the V1 step by step.
So the key point of work mainly focused on the supported&mounted version,
which sounds like Cgroup itself is the leading actor, and to easily extend
Cgroup
itself testing according to different versions.

But I didn't realize that there will be a mixed using situation we have to
take care of.
At that moment, the Cgroup test-lib actor as an assistant in the general
test case.

Anyway, this patch looks practicable and fitted for the period of
transition of Cgroup.


>
> Furthermore removing these checks results in a ~50% reduction in code
> and this is without correct parsing and checking of mounts and
> filesystems. We also have to consider that just because one V1
> controller is mounted, this does not prevent all V2 controllers from
> being used. So someone may mount V1 cpuset for legacy reasons, while
> using V2 for other controllers. To account for this we would need to
> check each controller individually.
>
> Note that the above may be a valid thing to do in a test checking
> specific cgroup behavior, but this library code is meant for use by
> all tests which need cgroups for some reason.
> ---
>  include/tst_cgroup.h |   2 -
>  lib/tst_cgroup.c     | 118 ++++++++++++++-----------------------------
>  2 files changed, 39 insertions(+), 81 deletions(-)
>
> diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
> index 77780e0d6..62d381ce9 100644
> --- a/include/tst_cgroup.h
> +++ b/include/tst_cgroup.h
> @@ -21,8 +21,6 @@ enum tst_cgroup_ctrl {
>         /* add cgroup controller */
>  };
>
> -enum tst_cgroup_ver tst_cgroup_version(void);
> -
>  /* To mount/umount specified cgroup controller on 'cgroup_dir' path */
>  void tst_cgroup_mount(enum tst_cgroup_ctrl ctrl, const char *cgroup_dir);
>  void tst_cgroup_umount(const char *cgroup_dir);
> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index ba413d874..887423bc6 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -21,47 +21,6 @@
>  static enum tst_cgroup_ver tst_cg_ver;
>  static int clone_children;
>
> -static int tst_cgroup_check(const char *cgroup)
> -{
> -       char line[PATH_MAX];
> -       FILE *file;
> -       int cg_check = 0;
> -
> -       file = SAFE_FOPEN("/proc/filesystems", "r");
> -       while (fgets(line, sizeof(line), file)) {
> -               if (strstr(line, cgroup) != NULL) {
> -                       cg_check = 1;
> -                       break;
> -               }
> -       }
> -       SAFE_FCLOSE(file);
> -
> -       return cg_check;
> -}
> -
> -enum tst_cgroup_ver tst_cgroup_version(void)
> -{
> -        enum tst_cgroup_ver cg_ver;
> -
> -        if (tst_cgroup_check("cgroup2")) {
> -                if (!tst_is_mounted("cgroup2") &&
> tst_is_mounted("cgroup"))
> -                        cg_ver = TST_CGROUP_V1;
> -                else
> -                        cg_ver = TST_CGROUP_V2;
> -
> -                goto out;
> -        }
> -
> -        if (tst_cgroup_check("cgroup"))
> -                cg_ver = TST_CGROUP_V1;
> -
> -        if (!cg_ver)
> -                tst_brk(TCONF, "Cgroup is not configured");
> -
> -out:
> -        return cg_ver;
> -}
> -
>  static void tst_cgroup1_mount(const char *name, const char *option,
>                         const char *mnt_path, const char *new_path)
>  {
> @@ -100,26 +59,18 @@ out:
>         tst_res(TINFO, "Cgroup(%s) v1 mount at %s success", option,
> mnt_path);
>  }
>
> -static void tst_cgroup2_mount(const char *mnt_path, const char *new_path)
> +static int cgroup2_mount(const char *mnt_path, const char *new_path)
>

We'd like to make the series function name starts with tst_*.


>  {
> -       if (tst_is_mounted(mnt_path))
> -               goto out;
> +       if (!tst_is_mounted(mnt_path)) {
> +               SAFE_MKDIR(mnt_path, 0777);
>
> -       SAFE_MKDIR(mnt_path, 0777);
> -       if (mount("cgroup2", mnt_path, "cgroup2", 0, NULL) == -1) {
> -               if (errno == ENODEV) {
> -                       if (rmdir(mnt_path) == -1)
> -                               tst_res(TWARN | TERRNO, "rmdir %s failed",
> mnt_path);
> -                       tst_brk(TCONF,
> -                                "Cgroup v2 is not configured in kernel");
> -               }
> -               tst_brk(TBROK | TERRNO, "mount %s", mnt_path);
> +               if (mount("cgroup2", mnt_path, "cgroup2", 0, NULL) == -1)
>

Here we have to remove mnt_path if the mount fails since it also tries to
create
the same path in V1 then.

+                       if (rmdir(mnt_path) == -1)
+                               tst_res(TWARN | TERRNO, "rmdir %s",
mnt_path);


> +                       return -1;
>         }
>
> -out:
>         SAFE_MKDIR(new_path, 0777);
>
> -       tst_res(TINFO, "Cgroup v2 mount at %s success", mnt_path);
> +       return 0;
>  }
>
>  static void tst_cgroupN_umount(const char *mnt_path, const char *new_path)
> @@ -274,39 +225,48 @@ void tst_cgroup_mount(enum tst_cgroup_ctrl ctrl,
> const char *cgroup_dir)
>         char *cgroup_new_dir;
>         char knob_path[PATH_MAX];
>
> -       tst_cg_ver = tst_cgroup_version();
> -
>         tst_cgroup_set_path(cgroup_dir);
>         cgroup_new_dir = tst_cgroup_get_path(cgroup_dir);
>
> -       if (tst_cg_ver & TST_CGROUP_V1) {
> -               switch(ctrl) {
> -               case TST_CGROUP_MEMCG:
> -                       tst_cgroup1_mount("memcg", "memory", cgroup_dir,
> cgroup_new_dir);
> -               break;
> -               case TST_CGROUP_CPUSET:
> -                       tst_cgroup1_mount("cpusetcg", "cpuset",
> cgroup_dir, cgroup_new_dir);
> -               break;
> -               default:
> -                       tst_brk(TBROK, "Invalid cgroup controller: %d",
> ctrl);
> -               }
> +       if (ctrl == TST_CGROUP_CPUSET) {
> +               tst_res(TINFO, "CGroup V2 lacks cpuset subsystem, trying
> V1");
> +               goto cgroup_v1;
>         }
>
> -       if (tst_cg_ver & TST_CGROUP_V2) {
> -               tst_cgroup2_mount(cgroup_dir, cgroup_new_dir);
> +       if (cgroup2_mount(cgroup_dir, cgroup_new_dir)) {
> +               tst_res(TINFO | TERRNO, "Mounting CGroup V2 failed, trying
> V1");
>

Can we add the diagnostic check when mounting Cgroup V2 failed?
(i.e reserve the tst_cgroup_check() function and used in
tst_cgroup2_mount())

    if (tst_cgroup_check("cgroup2"))
       warning for mounting failed, else ignore this failure

+               goto cgroup_v1;
> +       }
> +
> +       tst_res(TINFO, "Mounted CGroup V2");
> +
> +       switch(ctrl) {
> +       case TST_CGROUP_MEMCG:
> +               sprintf(knob_path, "%s/cgroup.subtree_control",
> cgroup_dir);
> +               if (FILE_PRINTF(knob_path, "%s", "+memory")) {
> +                       tst_res(TINFO,
> +                               "Can't add V2 memory controller, this
> might be because it is mounted as V1");
>

Seems we have to umount Cgroup_V2 and do the cleanup for the shift to
Cgroup_V1.

if (rmdir(cgroup_new_dir) == -1)
    tst_res(TWARN | TERRNO, "rmdir %s", cgroup_new_dir);
if (umount(cgroup_dir) == -1)
    tst_res(TWARN | TERRNO, "umount %s", cgroup_dir);
if (rmdir(cgroup_dir) == -1)
    tst_res(TWARN | TERRNO, "rmdir %s", cgroup_dir);


> +                       break;
> +               }
> +               tst_cg_ver = TST_CGROUP_V2;
> +               return;
> +       default:
> +               tst_brk(TBROK, "Invalid cgroup controller: %d", ctrl);
> +       }
>
> -               switch(ctrl) {
> -               case TST_CGROUP_MEMCG:
> -                       sprintf(knob_path, "%s/cgroup.subtree_control",
> cgroup_dir);
> -                       SAFE_FILE_PRINTF(knob_path, "%s", "+memory");
> +cgroup_v1:
> +       switch(ctrl) {
> +       case TST_CGROUP_MEMCG:
> +               tst_cgroup1_mount("memcg", "memory", cgroup_dir,
> cgroup_new_dir);
>                 break;
> -               case TST_CGROUP_CPUSET:
> -                       tst_brk(TCONF, "Cgroup v2 hasn't achieve cpuset
> subsystem");
> +       case TST_CGROUP_CPUSET:
> +               tst_cgroup1_mount("cpusetcg", "cpuset", cgroup_dir,
> cgroup_new_dir);
>                 break;
> -               default:
> -                       tst_brk(TBROK, "Invalid cgroup controller: %d",
> ctrl);
> -               }
> +       default:
> +               tst_brk(TBROK, "Invalid cgroup controller: %d", ctrl);
>         }
> +
> +       tst_cg_ver = TST_CGROUP_V1;
>  }
>
>  void tst_cgroup_umount(const char *cgroup_dir)
> --
> 2.28.0
>
>

-- 
Regards,
Li Wang

--000000000000d213ab05b0575f66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Sep 25, 2020 at 8:20 PM Richard Pale=
thorpe &lt;<a href=3D"mailto:rpalethorpe@suse.com" target=3D"_blank">rpalet=
horpe@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">The best way to find out if we can do something is to try it,=
 we don&#39;t<br>
check if the system has enough RAM and PIDs available before calling<br>
fork() in safe_fork(). Currently we try to guess what cgroups are<br>
currently in use then try to use the same version. We guess by<br>
grepping the mounts and filesystem files, these files need to be<br>
parsed in a structured way and even then, it is not the job of all<br>
tests which *use* cgroups to test that if cgroup(2) is present in<br>
mounts or filesystem that it can then be used.<br>
<br>
The cpuset group is only available on V1 and we can mount and use V1<br>
even if V2 is active. Just because the system has V2 active does not<br>
mean we cannot execute tests which require V1. This is one example<br>
where trying to figure out ahead of time what can or can&#39;t be used<br>
results in less testing.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">Good point.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">My previous=C2=A0thought on the Cgroup test-lib=
 design was only to respect one version,</div><div class=3D"gmail_default" =
style=3D"font-size:small">because the upstream developer hopes to use V2 re=
places the V1 step by step.</div><div class=3D"gmail_default" style=3D"font=
-size:small">So the key point of work mainly focused on the supported&amp;m=
ounted version,=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:=
small">which sounds like Cgroup itself is the=C2=A0leading actor, and to ea=
sily extend Cgroup</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">itself testing according to different versions.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
>But I didn&#39;t realize that there will be a mixed using situation we hav=
e to take care of.</div><div class=3D"gmail_default">At that moment, the Cg=
roup test-lib actor as an assistant in the general test case.</div><div cla=
ss=3D"gmail_default"><br></div><div class=3D"gmail_default">Anyway, this pa=
tch looks practicable and fitted for the=C2=A0period of transition of Cgrou=
p.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Furthermore removing these checks results in a ~50% reduction in code<br>
and this is without correct parsing and checking of mounts and<br>
filesystems. We also have to consider that just because one V1<br>
controller is mounted, this does not prevent all V2 controllers from<br>
being used. So someone may mount V1 cpuset for legacy reasons, while<br>
using V2 for other controllers. To account for this we would need to<br>
check each controller individually.<br>
<br>
Note that the above may be a valid thing to do in a test checking<br>
specific cgroup behavior, but this library code is meant for use by<br>
all tests which need cgroups for some reason.<br>
---<br>
=C2=A0include/tst_cgroup.h |=C2=A0 =C2=A02 -<br>
=C2=A0lib/tst_cgroup.c=C2=A0 =C2=A0 =C2=A0| 118 ++++++++++++++-------------=
----------------<br>
=C2=A02 files changed, 39 insertions(+), 81 deletions(-)<br>
<br>
diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h<br>
index 77780e0d6..62d381ce9 100644<br>
--- a/include/tst_cgroup.h<br>
+++ b/include/tst_cgroup.h<br>
@@ -21,8 +21,6 @@ enum tst_cgroup_ctrl {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* add cgroup controller */<br>
=C2=A0};<br>
<br>
-enum tst_cgroup_ver tst_cgroup_version(void);<br>
-<br>
=C2=A0/* To mount/umount specified cgroup controller on &#39;cgroup_dir&#39=
; path */<br>
=C2=A0void tst_cgroup_mount(enum tst_cgroup_ctrl ctrl, const char *cgroup_d=
ir);<br>
=C2=A0void tst_cgroup_umount(const char *cgroup_dir);<br>
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c<br>
index ba413d874..887423bc6 100644<br>
--- a/lib/tst_cgroup.c<br>
+++ b/lib/tst_cgroup.c<br>
@@ -21,47 +21,6 @@<br>
=C2=A0static enum tst_cgroup_ver tst_cg_ver;<br>
=C2=A0static int clone_children;<br>
<br>
-static int tst_cgroup_check(const char *cgroup)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char line[PATH_MAX];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0FILE *file;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int cg_check =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file =3D SAFE_FOPEN(&quot;/proc/filesystems&quo=
t;, &quot;r&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (fgets(line, sizeof(line), file)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strstr(line, cg=
roup) !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cg_check =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FCLOSE(file);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return cg_check;<br>
-}<br>
-<br>
-enum tst_cgroup_ver tst_cgroup_version(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum tst_cgroup_ver cg_ver;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_cgroup_check(&quot;cgroup2&quot;)) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tst_is_mounte=
d(&quot;cgroup2&quot;) &amp;&amp; tst_is_mounted(&quot;cgroup&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cg_ver =3D TST_CGROUP_V1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cg_ver =3D TST_CGROUP_V2;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_cgroup_check(&quot;cgroup&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cg_ver =3D TST_CGR=
OUP_V1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cg_ver)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, &qu=
ot;Cgroup is not configured&quot;);<br>
-<br>
-out:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cg_ver;<br>
-}<br>
-<br>
=C2=A0static void tst_cgroup1_mount(const char *name, const char *option,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *mnt_path, const char *new_path)<br>
=C2=A0{<br>
@@ -100,26 +59,18 @@ out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;Cgroup(%s) v1 mount at %s =
success&quot;, option, mnt_path);<br>
=C2=A0}<br>
<br>
-static void tst_cgroup2_mount(const char *mnt_path, const char *new_path)<=
br>
+static int cgroup2_mount(const char *mnt_path, const char *new_path)<br></=
blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">We&#39;d like to make the series function name starts with tst_*=
.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_is_mounted(mnt_path))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tst_is_mounted(mnt_path)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_MKDIR(mnt_path=
, 0777);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_MKDIR(mnt_path, 0777);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mount(&quot;cgroup2&quot;, mnt_path, &quot;=
cgroup2&quot;, 0, NULL) =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D EN=
ODEV) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (rmdir(mnt_path) =3D=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TWARN | TERRNO, &quot;rmdir %=
s failed&quot;, mnt_path);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TCONF,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Cgroup v2 is not configured in=
 kernel&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;mount %s&quot;, mnt_path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mount(&quot;cgr=
oup2&quot;, mnt_path, &quot;cgroup2&quot;, 0, NULL) =3D=3D -1)<br></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Here we have to remove mnt_path if the mount fails since it also tries=
=C2=A0to create</div><div class=3D"gmail_default" style=3D"font-size:small"=
>the same path in V1 then.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rmdir(mnt_path) =3D=3D -1)<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tst_res(TWARN | TERRNO, &quot;rmdir %s&quot;, mnt_path=
);<br><div class=3D"gmail_default" style=3D"font-size:small"></div></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_MKDIR(new_path, 0777);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Cgroup v2 mount at %s succ=
ess&quot;, mnt_path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static void tst_cgroupN_umount(const char *mnt_path, const char *new_=
path)<br>
@@ -274,39 +225,48 @@ void tst_cgroup_mount(enum tst_cgroup_ctrl ctrl, cons=
t char *cgroup_dir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *cgroup_new_dir;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char knob_path[PATH_MAX];<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cg_ver =3D tst_cgroup_version();<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup_set_path(cgroup_dir);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cgroup_new_dir =3D tst_cgroup_get_path(cgroup_d=
ir);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cg_ver &amp; TST_CGROUP_V1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch(ctrl) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_CGROUP_MEM=
CG:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_cgroup1_mount(&quot;memcg&quot;, &quot;memory&quot;, cgroup_d=
ir, cgroup_new_dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_CGROUP_CPU=
SET:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_cgroup1_mount(&quot;cpusetcg&quot;, &quot;cpuset&quot;, cgrou=
p_dir, cgroup_new_dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK, &quot;Invalid cgroup controller: %d&quot;, ctrl);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctrl =3D=3D TST_CGROUP_CPUSET) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quo=
t;CGroup V2 lacks cpuset subsystem, trying V1&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cgroup_v1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cg_ver &amp; TST_CGROUP_V2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup2_mount(c=
group_dir, cgroup_new_dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cgroup2_mount(cgroup_dir, cgroup_new_dir)) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO | TER=
RNO, &quot;Mounting CGroup V2 failed, trying V1&quot;);<br></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Can=
 we add the diagnostic check when mounting Cgroup V2 failed?</div></div><di=
v class=3D"gmail_default" style=3D"font-size:small">(i.e reserve the tst_cg=
roup_check() function and used in tst_cgroup2_mount())</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><span class=3D"gmail_defa=
ult" style=3D"font-size:small">=C2=A0 =C2=A0 </span>if (tst_cgroup_check(&q=
uot;cgroup2&quot;))</div><div class=3D"gmail_quote">=C2=A0 =C2=A0<span clas=
s=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0=C2=A0</span>war=
ning for mount<span class=3D"gmail_default" style=3D"font-size:small">ing</=
span> failed, else ignore th<span class=3D"gmail_default" style=3D"font-siz=
e:small">is failure</span></div><div class=3D"gmail_quote"><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cgroup_v1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Mounted CGroup V2&quot;);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch(ctrl) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_CGROUP_MEMCG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(knob_path, =
&quot;%s/cgroup.subtree_control&quot;, cgroup_dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (FILE_PRINTF(kno=
b_path, &quot;%s&quot;, &quot;+memory&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TINFO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Can&#39;t add V2 memory control=
ler, this might be because it is mounted as V1&quot;);<br></blockquote><div=
>=C2=A0</div><div><span class=3D"gmail_default" style=3D"font-size:small">S=
eems we have to </span>umount <span class=3D"gmail_default" style=3D"font-s=
ize:small">Cgroup_V</span>2 and <span class=3D"gmail_default" style=3D"font=
-size:small">do the=C2=A0</span>cleanup<span class=3D"gmail_default" style=
=3D"font-size:small"> for the shift to Cgroup_V1.</span></div><div><br></di=
v>if (rmdir(cgroup_new_dir) =3D=3D -1)<br><span class=3D"gmail_default" sty=
le=3D"font-size:small">=C2=A0 =C2=A0=C2=A0</span>tst_res(TWARN | TERRNO, &q=
uot;rmdir %s&quot;, cgroup_new_dir);<br>if (umount(cgroup_dir) =3D=3D -1)<b=
r><span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0=C2=
=A0</span>tst_res(TWARN | TERRNO, &quot;umount %s&quot;, cgroup_dir);<br>if=
 (rmdir(cgroup_dir) =3D=3D -1)<br><span class=3D"gmail_default" style=3D"fo=
nt-size:small">=C2=A0 =C2=A0=C2=A0</span>tst_res(TWARN | TERRNO, &quot;rmdi=
r %s&quot;, cgroup_dir);<br><div><span class=3D"gmail_default"></span>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cg_ver =3D TST_=
CGROUP_V2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quo=
t;Invalid cgroup controller: %d&quot;, ctrl);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch(ctrl) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_CGROUP_MEM=
CG:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sprintf(knob_path, &quot;%s/cgroup.subtree_control&quot;, cgroup_=
dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SAFE_FILE_PRINTF(knob_path, &quot;%s&quot;, &quot;+memory&quot;);=
<br>
+cgroup_v1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch(ctrl) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_CGROUP_MEMCG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup1_mount(&=
quot;memcg&quot;, &quot;memory&quot;, cgroup_dir, cgroup_new_dir);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_CGROUP_CPU=
SET:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TCONF, &quot;Cgroup v2 hasn&#39;t achieve cpuset subsyste=
m&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_CGROUP_CPUSET:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup1_mount(&=
quot;cpusetcg&quot;, &quot;cpuset&quot;, cgroup_dir, cgroup_new_dir);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK, &quot;Invalid cgroup controller: %d&quot;, ctrl);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quo=
t;Invalid cgroup controller: %d&quot;, ctrl);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cg_ver =3D TST_CGROUP_V1;<br>
=C2=A0}<br>
<br>
=C2=A0void tst_cgroup_umount(const char *cgroup_dir)<br>
-- <br>
2.28.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000d213ab05b0575f66--


--===============0778239543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0778239543==--

