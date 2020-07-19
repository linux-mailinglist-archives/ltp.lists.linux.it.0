Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDE0225079
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jul 2020 09:48:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 483B43C2870
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jul 2020 09:48:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4B0CA3C2467
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 09:48:37 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 378A5200746
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 09:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595144914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MnAp+R9lIr6Dq3VTCnnC4d7GFwLku1E0oj9tJcsKjRs=;
 b=AYLCB1ENV+vvHTx3F/sw1nFD/lkcTcGs9J7EDLwHyK2Lxk48gJEje77nipoZwg5V4KxNrQ
 9XDQRIjPxC7vg5/0hyTCJm4U45551kFJU5z0qNfINloOLsuDL4GuCr+Ymy7E49aL2kO+Lt
 S19MjNB9ey3e5/Dxrl9rRw7ATaK9E3U=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-CLHgcy54PUWjz0cuhfUBwg-1; Sun, 19 Jul 2020 03:48:32 -0400
X-MC-Unique: CLHgcy54PUWjz0cuhfUBwg-1
Received: by mail-lf1-f71.google.com with SMTP id x13so676271lfq.3
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 00:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MnAp+R9lIr6Dq3VTCnnC4d7GFwLku1E0oj9tJcsKjRs=;
 b=W2HOthRSrva/CW4B5dfR2U1IuaL+jytZ615dn/pOQIGzZLb2c84TFpGVAr/hmfU9yG
 E0NlewthV2EEM09FcS1almpu4pyi98VNy0JkqFPGYGpYU7c6djZMD4BtYrwtH7QNpqFy
 dg8Ndefp/gjfKwxSZzKjmGFLuIVyH615IzpaQDuI9d43nGDVOGz8yi7GhpVWhat9kGYx
 wOfpxMLu9nZh5NBCtGeMcuWX2LUmgQluWd9IX0casXLW7s5nXolN2SuPs/wOaqwgAaBc
 2tSMKBnOPT0RkX49qNyIfyv8+70iuypnbTVjtdW9ZprrX3D1cp9o6QVVt9qEBJs0hd9m
 M2pQ==
X-Gm-Message-State: AOAM530vAv3NKALJL26Ue9HVOZpYprLswyHITA1Kuq1wooaqz7AiX9mz
 ANLI3QofpLHVoVXwishRFZbX55V63bBclO/rVQIJhLS9PT1ctEfHMZlutU5i9DXu4CaTLLiTFqr
 j6zf60hkJErKJwr6PzQTztV/H10w=
X-Received: by 2002:ac2:4294:: with SMTP id m20mr4598226lfh.147.1595144909954; 
 Sun, 19 Jul 2020 00:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpmqaoxAL82gda1eLERk+uDxW/73NZT3hOn9YAL2j+BYwKdGqZVrhLLs051t9AyVREklAiytSwBjYuPy4dwDw=
X-Received: by 2002:ac2:4294:: with SMTP id m20mr4598214lfh.147.1595144909721; 
 Sun, 19 Jul 2020 00:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200717163453.9587-1-chrubis@suse.cz>
 <20200717163453.9587-4-chrubis@suse.cz>
In-Reply-To: <20200717163453.9587-4-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sun, 19 Jul 2020 15:48:17 +0800
Message-ID: <CAEemH2dHcasASDdXKypSwYkg7Yq1+ynO3-Z6QcxMwP6M=Qh3mQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/9] syscalls/ipc: shmctl04: Rewrite from scratch.
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
Content-Type: multipart/mixed; boundary="===============0678833069=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0678833069==
Content-Type: multipart/alternative; boundary="000000000000b5aa4405aac69d11"

--000000000000b5aa4405aac69d11
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 18, 2020 at 12:35 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> +       /*
> +        * Sum rss, swap and size for all elements listed, which should
> equal
> +        * the data returned in the shm_info structure.
> +        *
> +        * Note that the size has to be rounded up to nearest multiple of
> page
> +        * size.
> +        */
> +       while (fscanf(f, "%*i %i %*i %i %*i %*i %*i %*i %*i %*i %*i %*i
> %*i %*i %i %i",
> +                     &shmid, &size, &rss, &swap) > 0) {
> +               used_ids++;
> +               shm_rss += rss/page_size;
> +               shm_swp += swap/page_size;
> +               shm_tot += (size + page_size - 1) / page_size;
> +               if (shmid > shmid_max)
> +                       shmid_max = shmid;
> +       }
>
> ...
>
> -       tst_exit();
> +       if (max_id != shmid_max) {
> +               tst_res(TFAIL, "highest shmid = %i, expected %i",
> +                       max_id, shmid_max);
>

It failed many times on my personal laptop (5.4.19-100.fc30.x86_64).

$ cat /proc/sysvipc/shm
       key      shmid   perms        size      cpid    lpid    nattch   uid
  gid    cuid    cgid      atime         dtime              ctime
     rss        swap
         0          6         1600      524288   2778   5447      2     1000
 1000  1000  1000 1595120306 1595120306 1595119412      4096        0
         0          8         1600      524288   1903   2043      2     1000
 1000  1000  1000 1595119515     0                 1595119515     24576
   0

$ ./shmctl04
tst_test.c:1245: INFO: Timeout per run is 0h 05m 00s
shmctl04.c:119: PASS: SHM_INFO returned valid index 8
shmctl04.c:70: PASS: used_ids = 3
shmctl04.c:77: PASS: shm_rss = 7
shmctl04.c:84: PASS: shm_swp = 0
shmctl04.c:91: PASS: shm_tot = 257
shmctl04.c:95: FAIL: highest shmid = 8, expected 65537

Summary:
passed   5
failed   1
skipped  0
warnings 0

After printing the shm_proc during test running, I guess the 'shmid' is not
listing in number order sometimes which probably caused that failure.

       key      shmid perms                  size  cpid  lpid nattch   uid
  gid  cuid  cgid      atime      dtime      ctime                   rss
               swap
         0      98306   600                  2048 29586     0      0  1000
 1000  1000  1000          0          0 1595144682                     0
                  0
         0          6  1600                524288  2778 26559      2  1000
 1000  1000  1000 1595142041 1595142041 1595119412                  4096
                  0
         0          8  1600                524288  1903  2043      2  1000
 1000  1000  1000 1595119515          0 1595119515                 24576
                  0



> +       } else {
> +               tst_res(TPASS, "highest shmid = %i", max_id);
> +       }
>  }
>
> -/*
> - * setup() - performs all the ONE TIME setup for this test.
> - */
> -void setup(void)
> +static void verify_shminfo(void)
>  {
> +       struct shm_info info;
> +       struct shmid_ds ds;
>
> -       tst_sig(NOFORK, DEF_HANDLER, cleanup);
> +       TEST(shmctl(0, SHM_INFO, (struct shmid_ds *)&info));
>
> -       TEST_PAUSE;
> +       if (TST_RET == -1) {
> +               tst_res(TFAIL | TTERRNO, "shmctl(0, SHM_INFO, ...)");
> +               return;
> +       }
>
> -       /*
> -        * Create a temporary directory and cd into it.
> -        * This helps to ensure that a unique msgkey is created.
> -        * See libs/libltpipc/libipc.c for more information.
> -        */
> -       tst_tmpdir();
> +       TEST(shmctl(TST_RET, SHM_STAT_ANY, &ds));
>

'SHM_STAT_ANY' is introduced since Linux 4.17. We have to confirm the SUT
supporting before we running it.

Also, we'd better define it in "ipcshm.h" to avoid compiling errors with
the old distro.

shmctl04.c: In function 'verify_shminfo':
shmctl04.c:114: error: 'SHM_STAT_ANY' undeclared (first use in this
function)
shmctl04.c:114: error: (Each undeclared identifier is reported only once
shmctl04.c:114: error: for each function it appears in.)

-- 
Regards,
Li Wang

--000000000000b5aa4405aac69d11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 18, 2=
020 at 12:35 AM Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis=
@suse.cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</span><=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Sum rss, swap and size for all elements list=
ed, which should equal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the data returned in the shm_info structure.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Note that the size has to be rounded up to n=
earest multiple of page<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * size.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (fscanf(f, &quot;%*i %i %*i %i %*i %*i %*=
i %*i %*i %*i %*i %*i %*i %*i %i %i&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;shmid, &amp;size, &amp;rss, &amp;swap) &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used_ids++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shm_rss +=3D rss/pa=
ge_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shm_swp +=3D swap/p=
age_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shm_tot +=3D (size =
+ page_size - 1) / page_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (shmid &gt; shmi=
d_max)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0shmid_max =3D shmid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_exit();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (max_id !=3D shmid_max) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;highest shmid =3D %i, expected %i&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0max_id, shmid_max);<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">It failed many times on my pe=
rsonal laptop (5.4.19-100.fc30.x86_64).</div></div><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">$ cat /proc/sysvipc/shm=
=C2=A0</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0key =C2=A0 =C2=A0 =C2=A0shmid <span =
class=3D"gmail_default" style=3D"font-size:small">=C2=A0 </span>perms=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 size =C2=A0<span class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0 =C2=A0 </span>cpid =C2=A0<span class=3D"gmail_default"=
 style=3D"font-size:small">=C2=A0 </span>lpid <span class=3D"gmail_default"=
 style=3D"font-size:small">=C2=A0 =C2=A0</span>nattch =C2=A0 uid <span clas=
s=3D"gmail_default" style=3D"font-size:small">=C2=A0 </span>=C2=A0 gid <spa=
n class=3D"gmail_default" style=3D"font-size:small">=C2=A0 </span>=C2=A0cui=
d <span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 </span>=C2=
=A0cgid =C2=A0 =C2=A0 =C2=A0atime =C2=A0 =C2=A0<span class=3D"gmail_default=
" style=3D"font-size:small">=C2=A0 =C2=A0 </span> <span class=3D"gmail_defa=
ult" style=3D"font-size:small"> </span>=C2=A0dtime =C2=A0 =C2=A0 <span clas=
s=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>=C2=A0ctime=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rss=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 swap<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06 <span class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0</span>=C2=A01600=C2=A0 =C2=A0 =C2=
=A0 524288 =C2=A0<span class=3D"gmail_default" style=3D"font-size:small"> <=
/span>2778 =C2=A0<span class=3D"gmail_default" style=3D"font-size:small"> <=
/span>5447 =C2=A0 =C2=A0 =C2=A02 <span class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0 =C2=A0</span>=C2=A01000 =C2=A01000 =C2=A01000 =C2=A010=
00 1595120306 <span class=3D"gmail_default" style=3D"font-size:small"> </sp=
an>1595120306 <span class=3D"gmail_default" style=3D"font-size:small"> </sp=
an>1595119412=C2=A0 =C2=A0 =C2=A0 4096=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span cla=
ss=3D"gmail_default" style=3D"font-size:small"> </span>0<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08 <span class=3D"gm=
ail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0</span>=
=C2=A01600=C2=A0 =C2=A0 =C2=A0 524288 =C2=A0<span class=3D"gmail_default" s=
tyle=3D"font-size:small"> </span>1903 =C2=A0<span class=3D"gmail_default" s=
tyle=3D"font-size:small"> </span>2043 =C2=A0 =C2=A0 =C2=A02 =C2=A0<span cla=
ss=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0</span>1000 =C2=
=A01000 =C2=A01000 =C2=A01000 1595119515=C2=A0 <span class=3D"gmail_default=
" style=3D"font-size:small"> </span>=C2=A0 =C2=A00 <span class=3D"gmail_def=
ault" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>1595119515=C2=A0 =C2=A0 <span class=3D"gmail_default" =
style=3D"font-size:small"></span>=C2=A024576=C2=A0 =C2=A0 =C2=A0 =C2=A00<br=
><br></div><div>$ ./shmctl04 <br>tst_test.c:1245: INFO: Timeout per run is =
0h 05m 00s<br>shmctl04.c:119: PASS: SHM_INFO returned valid index 8<br>shmc=
tl04.c:70: PASS: used_ids =3D 3<br>shmctl04.c:77: PASS: shm_rss =3D 7<br>sh=
mctl04.c:84: PASS: shm_swp =3D 0<br>shmctl04.c:91: PASS: shm_tot =3D 257<br=
>shmctl04.c:95: FAIL: highest shmid =3D 8, expected 65537</div><div><br><di=
v class=3D"gmail_default" style=3D"font-size:small"></div><div class=3D"gma=
il_default" style=3D"font-size:small">Summary:</div>passed =C2=A0 5<br>fail=
ed =C2=A0 1<br>skipped =C2=A00<br>warnings 0</div><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">After printing the shm_pr=
oc during test running, I guess the &#39;shmid&#39; is not listing in numbe=
r order sometimes which probably caused that failure.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><span class=3D"gmail_defau=
lt" style=3D"font-size:small"></span>=C2=A0 =C2=A0 =C2=A0 =C2=A0key =C2=A0 =
=C2=A0 =C2=A0shmid perms =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0size =C2=A0cpid =C2=A0lpid nattch =C2=A0 uid =C2=A0 gid =C2=A0=
cuid =C2=A0cgid =C2=A0 =C2=A0 =C2=A0atime =C2=A0 =C2=A0 =C2=A0dtime =C2=A0 =
=C2=A0 =C2=A0ctime =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rss =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sw=
ap<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A098306 =C2=A0 =
600 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02048 2958=
6 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A00 =C2=A01000 =C2=A01000 =C2=A01000 =
=C2=A01000 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 1595144682 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A06 =C2=A01600 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0524288 =C2=A02778 26559 =C2=A0 =C2=A0 =C2=A02 =C2=A01000 =C2=A01000 =
=C2=A01000 =C2=A01000 1595142041 1595142041 1595119412 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04096 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08 =C2=A01600 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0524288 =C2=A01903 =C2=A02043 =C2=A0 =C2=
=A0 =C2=A02 =C2=A01000 =C2=A01000 =C2=A01000 =C2=A01000 1595119515 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00 1595119515 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 24576 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0<br><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;highest shmid =3D %i&quot;, max_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-/*<br>
- * setup() - performs all the ONE TIME setup for this test.<br>
- */<br>
-void setup(void)<br>
+static void verify_shminfo(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct shm_info info;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct shmid_ds ds;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_sig(NOFORK, DEF_HANDLER, cleanup);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(shmctl(0, SHM_INFO, (struct shmid_ds *)&am=
p;info));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST_PAUSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TTE=
RRNO, &quot;shmctl(0, SHM_INFO, ...)&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Create a temporary directory and cd into it.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This helps to ensure that a unique msgkey is=
 created.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * See libs/libltpipc/libipc.c for more informa=
tion.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_tmpdir();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(shmctl(TST_RET, <span class=3D"gmail_defau=
lt" style=3D"font-size:small"></span>SHM_STAT_ANY, &amp;ds));<br></blockquo=
te><div><br></div><span class=3D"gmail_default" style=3D"font-size:small"><=
/span><span class=3D"gmail_default">&#39;</span>SHM_STAT_ANY<span class=3D"=
gmail_default" style=3D"font-size:small">&#39;</span><span class=3D"gmail_d=
efault" style=3D"font-size:small"> is introduced </span><span class=3D"gmai=
l_default"></span>since Linux 4.17<span class=3D"gmail_default" style=3D"fo=
nt-size:small">. We have to confirm the SUT supporting before we running it=
.</span></div><div class=3D"gmail_quote"><div>=C2=A0</div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Also, we&#39;d better define i=
t in &quot;ipcshm.h&quot; to avoid compiling errors with the old distro.</d=
iv><br>shmctl04.c: In function &#39;verify_shminfo&#39;:<br>shmctl04.c:114:=
 error: &#39;SHM_STAT_ANY&#39; undeclared (first use in this function)<br>s=
hmctl04.c:114: error: (Each undeclared identifier is reported only once<br>=
shmctl04.c:114: error: for each function it appears in.)</div><div><br></di=
v><div>--=C2=A0<br></div></div><div dir=3D"ltr" class=3D"gmail_signature"><=
div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></=
div></div></div>

--000000000000b5aa4405aac69d11--


--===============0678833069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0678833069==--

