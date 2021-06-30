Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB103B7EB2
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 10:08:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E1AD3C6C51
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 10:08:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B053C3C00A6
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 10:08:52 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ED0A76011F7
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 10:08:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625040530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=cTO2AdcZV+1VmxuYh3V/KqRumhPEjR23RcfXsLMz+2M=;
 b=dmn4pyjOGPbP+0N98yGt0a8e0bspQBgwqVKJfy8t53XYWKk8kL4NnSkj+xpZqkGV25Oboj
 jXtZ5g5yTKmtaaHjv3zjur6BjgcHGRRV8NUIXgAwrCoabjWcmvpqTDUAbYGcuWmrWli4kD
 utG11D8q3YyQMlpkhztaAZcvFCa478k=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-_A43hkJ8M7-Kk0KMmXpPTA-1; Wed, 30 Jun 2021 04:08:48 -0400
X-MC-Unique: _A43hkJ8M7-Kk0KMmXpPTA-1
Received: by mail-yb1-f198.google.com with SMTP id
 h7-20020a5b0a870000b029054c59edf217so2833501ybq.3
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 01:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cTO2AdcZV+1VmxuYh3V/KqRumhPEjR23RcfXsLMz+2M=;
 b=XNDJMkFoftdquh3LxMU8UwsY5aXZ+XOOupTVHNCOnJYHf2oHRfOJiFHkwFhXS+vSe4
 RP2bhKxha/AUwRqVp19gmw40wYJ7zMQ5My348AycO24ClTCq4pBa3Tk7WGM527mTd74p
 8/u1ApVzdNwM+uuWD6xm54yHhJWcvvZVA+lU0YBAxRO6zWwqeEHaan6qyq9J1ulYdvBl
 t3hvzD83dkEa4WzFd62/YShApQo58NY0dN0+kehHuVnSoby56wKOX7VB6c+7LDs5K3yL
 xJAUq5N19B7AyOsxCAyoTsci0ajfxKMo2FkGSi06pIyI9i1iqQtkf9Wozh5MVvnMwRdX
 9V3Q==
X-Gm-Message-State: AOAM532wDSt2qohmrtJQqoGUMUTmUDV2KEpfg1Q9c+bwg3pgnMKkhvoN
 r27gsuEgSnxFx9ejk7iVEQTkkfvfj0HwBrp09A0BQyEeoY/tgo+s8VTJFZlh9C0UY2+dSD8+0D4
 oAP6/EwtQG3u+hOt0PnFOvo9aVSA=
X-Received: by 2002:a25:3882:: with SMTP id
 f124mr42118637yba.110.1625040527539; 
 Wed, 30 Jun 2021 01:08:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/1HqzKVdaxq+OQL+2j8Kf0mElfJVLAWrFW+ZPIIS77OH2NT5N97PcEpjgYZHcWjQhEM6dRqZJDdr6nYsDHIM=
X-Received: by 2002:a25:3882:: with SMTP id
 f124mr42118607yba.110.1625040527225; 
 Wed, 30 Jun 2021 01:08:47 -0700 (PDT)
MIME-Version: 1.0
From: Li Wang <liwang@redhat.com>
Date: Wed, 30 Jun 2021 16:08:35 +0800
Message-ID: <CAEemH2da0dOeKpnZZ6+A696gFL+nDAiP7UL9tqm68JH8KO-Qkw@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
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
Subject: [LTP] [RFC] Limit the tmpfs size on mounting
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
Content-Type: multipart/mixed; boundary="===============2096711469=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2096711469==
Content-Type: multipart/alternative; boundary="0000000000005f0b6a05c5f73b4b"

--0000000000005f0b6a05c5f73b4b
Content-Type: text/plain; charset="UTF-8"

Hi all,

LTP mount and make use of the whole tmpfs of the test system,
generally, it's fine. But if a test (e.g fallocate06) try to fill full in
the
filesystem, it takes too long to complete testing on a large memory
system.

I'm thinking whether we should limit the mount tmpfs size for the
LTP test, maybe only give 512MB?  but the tricky part for me is to
add options like "-o size=512M" to prepare_device(), or do some
additional work for tmpfs mounting.

and any else way can speed up is also welcome. I'd like to hear
more advice. Thanks!


   120 tst_test.c:1379: TINFO: Testing on tmpfs
   121 tst_test.c:889: TINFO: Skipping mkfs for TMPFS filesystem
   122 tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
   123 fallocate06.c:126: TINFO: Copy-on-write is not supported
   124 fallocate06.c:177: TINFO: Case 1. Fill FS: no; Use copy on write: no
   125 fallocate06.c:166: TPASS: write() successful
   126 fallocate06.c:210: TPASS: Misaligned allocation works as expected
   127 fallocate06.c:166: TPASS: fallocate(FALLOC_FL_PUNCH_HOLE |
FALLOC_FL_KEEP_SIZE) successful
   128 fallocate06.c:246: TPASS: fallocate(FALLOC_FL_PUNCH_HOLE |
FALLOC_FL_KEEP_SIZE) cleared the correct file range
   129 fallocate06.c:177: TINFO: Case 2. Fill FS: yes; Use copy on write: no
   130 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file0 size 21710183
   131 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file1 size 8070086
   132 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file2 size 3971177
   133 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file3 size 36915315
   134 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file4 size 70310993
   135 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file5 size 4807935
   136 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file6 size 90739786
   137 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file7 size 76896492
   ...
  2382 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file2252 size
57793556
  2383 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file2253 size
44128200
  2384 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file2254 size
31600129
  2385 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file2255 size 1865251
 <------- create too many files
  2386 tst_fill_fs.c:59: TINFO: write(): ENOSPC (28)
  2387 fallocate06.c:166: TPASS: write() successful
  2388 fallocate06.c:210: TPASS: Misaligned allocation works as expected
  2389 fallocate06.c:166: TPASS: fallocate(FALLOC_FL_PUNCH_HOLE |
FALLOC_FL_KEEP_SIZE) successful
  2390 fallocate06.c:246: TPASS: fallocate(FALLOC_FL_PUNCH_HOLE |
FALLOC_FL_KEEP_SIZE) cleared the correct file range
  2391 Test timeouted, sending SIGKILL!    <------- looks like takes too
much time on purge dirs


# df -Th | grep tmpfs
Filesystem                             Type      Size  Used Avail Use%
Mounted on
devtmpfs                               devtmpfs  126G     0  126G   0% /dev
tmpfs                                  tmpfs     126G  4.0K  126G   1%
/dev/shm
tmpfs                                  tmpfs     126G   18M  126G   1% /run
tmpfs                                  tmpfs     126G     0  126G   0%
/sys/fs/cgroup
/dev/loop0                             tmpfs     126G   23G  104G  18%
/tmp/falywSTkc/mntpoint

-- 
Regards,
Li Wang

--0000000000005f0b6a05c5f73b4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi =
all,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">LTP mount and make u=
se of the whole tmpfs of the test system,</div><div class=3D"gmail_default"=
 style=3D"font-size:small">generally, it&#39;s fine. But if a test (e.g fal=
locate06) try to fill full in the</div><div class=3D"gmail_default" style=
=3D"font-size:small">filesystem, it takes too long to complete testing on a=
 large memory</div><div class=3D"gmail_default" style=3D"font-size:small">s=
ystem.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m thinking w=
hether we should limit the mount tmpfs size for the</div><div class=3D"gmai=
l_default" style=3D"font-size:small">LTP test, maybe only give 512MB?=C2=A0=
 but the tricky part for me is to</div><div class=3D"gmail_default" style=
=3D"font-size:small">add options like &quot;-o size=3D512M&quot; to prepare=
_device(), or do some</div><div class=3D"gmail_default" style=3D"font-size:=
small">additional work for tmpfs mounting.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">and=C2=A0any else way can speed up is also welcome. I&#39=
;d like to hear</div><div class=3D"gmail_default" style=3D"font-size:small"=
>more advice. Thanks!</div><div><br></div><br>=C2=A0 =C2=A0120 tst_test.c:1=
379: TINFO: Testing on tmpfs<br>=C2=A0 =C2=A0121 tst_test.c:889: TINFO: Ski=
pping mkfs for TMPFS filesystem<br>=C2=A0 =C2=A0122 tst_test.c:1313: TINFO:=
 Timeout per run is 0h 05m 00s<br>=C2=A0 =C2=A0123 fallocate06.c:126: TINFO=
: Copy-on-write is not supported<br>=C2=A0 =C2=A0124 fallocate06.c:177: TIN=
FO: Case 1. Fill FS: no; Use copy on write: no<br>=C2=A0 =C2=A0125 fallocat=
e06.c:166: TPASS: write() successful<br>=C2=A0 =C2=A0126 fallocate06.c:210:=
 TPASS: Misaligned allocation works as expected<br>=C2=A0 =C2=A0127 falloca=
te06.c:166: TPASS: fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE) su=
ccessful<br>=C2=A0 =C2=A0128 fallocate06.c:246: TPASS: fallocate(FALLOC_FL_=
PUNCH_HOLE | FALLOC_FL_KEEP_SIZE) cleared the correct file range<br>=C2=A0 =
=C2=A0129 fallocate06.c:177: TINFO: Case 2. Fill FS: yes; Use copy on write=
: no<br>=C2=A0 =C2=A0130 tst_fill_fs.c:32: TINFO: Creating file mntpoint/fi=
le0 size 21710183<br>=C2=A0 =C2=A0131 tst_fill_fs.c:32: TINFO: Creating fil=
e mntpoint/file1 size 8070086<br>=C2=A0 =C2=A0132 tst_fill_fs.c:32: TINFO: =
Creating file mntpoint/file2 size 3971177<br>=C2=A0 =C2=A0133 tst_fill_fs.c=
:32: TINFO: Creating file mntpoint/file3 size 36915315<br>=C2=A0 =C2=A0134 =
tst_fill_fs.c:32: TINFO: Creating file mntpoint/file4 size 70310993<br>=C2=
=A0 =C2=A0135 tst_fill_fs.c:32: TINFO: Creating file mntpoint/file5 size 48=
07935<br>=C2=A0 =C2=A0136 tst_fill_fs.c:32: TINFO: Creating file mntpoint/f=
ile6 size 90739786<br>=C2=A0 =C2=A0137 tst_fill_fs.c:32: TINFO: Creating fi=
le mntpoint/file7 size 76896492<br>=C2=A0 =C2=A0...<br>=C2=A0<span class=3D=
"gmail_default" style=3D"font-size:small"> </span> 2382 tst_fill_fs.c:32: T=
INFO: Creating file mntpoint/file2252 size 57793556<br><span class=3D"gmail=
_default" style=3D"font-size:small"> </span>=C2=A0 2383 tst_fill_fs.c:32: T=
INFO: Creating file mntpoint/file2253 size 44128200<br>=C2=A0<span class=3D=
"gmail_default" style=3D"font-size:small"> </span> 2384 tst_fill_fs.c:32: T=
INFO: Creating file mntpoint/file2254 size 31600129<br>=C2=A0 <span class=
=3D"gmail_default" style=3D"font-size:small"> </span>2385 tst_fill_fs.c:32:=
 TINFO: Creating file mntpoint/file2255 size 1865251<span class=3D"gmail_de=
fault" style=3D"font-size:small">=C2=A0 =C2=A0&lt;------- create too many f=
iles </span><br>=C2=A0 <span class=3D"gmail_default" style=3D"font-size:sma=
ll"> </span>2386 tst_fill_fs.c:59: TINFO: write(): ENOSPC (28)<br>=C2=A0 <s=
pan class=3D"gmail_default" style=3D"font-size:small"> </span>2387 fallocat=
e06.c:166: TPASS: write() successful<br>=C2=A0 <span class=3D"gmail_default=
" style=3D"font-size:small"> </span>2388 fallocate06.c:210: TPASS: Misalign=
ed allocation works as expected<br>=C2=A0 <span class=3D"gmail_default" sty=
le=3D"font-size:small"> </span>2389 fallocate06.c:166: TPASS: fallocate(FAL=
LOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE) successful<br>=C2=A0 <span class=
=3D"gmail_default" style=3D"font-size:small"> </span>2390 fallocate06.c:246=
: TPASS: fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE) cleared the =
correct file range<br>=C2=A0 <span class=3D"gmail_default" style=3D"font-si=
ze:small"> </span>2391 Test timeouted, sending SIGKILL!<span class=3D"gmail=
_default" style=3D"font-size:small">=C2=A0 =C2=A0 &lt;------- looks like ta=
kes too much time on purge dirs</span><br><div><br></div><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small"># df -Th | grep tm=
pfs</div>Filesystem =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Type =C2=A0 =C2=A0 =C2=A0Size =
=C2=A0Used Avail Use% Mounted on<br>devtmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 devtmpfs =C2=A0126G =C2=A0 =C2=A0 0 =C2=A0126G =C2=A0 0% /dev<br>tmpfs =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =C2=A0 =C2=A0 126G =C2=
=A04.0K =C2=A0126G =C2=A0 1% /dev/shm<br>tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tmpfs =C2=A0 =C2=A0 126G =C2=A0 18M =C2=A0126G =C2=A0 1% /=
run<br>tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =C2=A0 =C2=A0=
 126G =C2=A0 =C2=A0 0 =C2=A0126G =C2=A0 0% /sys/fs/cgroup<br>/dev/loop0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tmpfs =C2=A0 =C2=A0 126G =C2=A0 23G =C2=A0104G =C2=A01=
8% /tmp/falywSTkc/mntpoint<br><div class=3D"gmail_default" style=3D"font-si=
ze:small"></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Regard=
s,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000005f0b6a05c5f73b4b--


--===============2096711469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2096711469==--

