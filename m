Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6222100FAF
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 01:07:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24C373C2351
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 01:07:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 454C03C0E97
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 01:07:48 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id F3519200DF3
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 01:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574122065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+QI8fX0oc31kWcdqVsle0xG0wF1ZSDFqQZProsHj6Y0=;
 b=DxlmCTS4VI+Vcd6hs/WSPVGoIEiU6I0JB/163eJGKP3bNDhqAwkbHZhFGxvlh1Bpgqmm/0
 62DBkAOie9M+Sw9kzozHHGLo9NP4yso4aRnKNfNpRdJNDI/ALIbnCwmqUIS+n+2glctXEV
 QfN80q/HaFADl9Y3k7P+QPpWbAw2SHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-yHa-qeFsP2iPfIA07pm4kg-1; Mon, 18 Nov 2019 19:07:41 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62E508018A1;
 Tue, 19 Nov 2019 00:07:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-154.rdu2.redhat.com
 [10.10.122.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3F281B079;
 Tue, 19 Nov 2019 00:07:30 +0000 (UTC)
To: CKI Project <cki-project@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>
References: <cki.042792963E.5VOWULC1Q9@redhat.com>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <8e0fa6de-b6b1-23ac-9e77-d425c8d1ba22@redhat.com>
Date: Mon, 18 Nov 2019 19:07:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cki.042792963E.5VOWULC1Q9@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: yHa-qeFsP2iPfIA07pm4kg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] =?utf-8?b?4p2MIEZBSUw6IFN0YWJsZSBxdWV1ZTogcXVldWUtNS4z?=
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1245621055=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============1245621055==
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="------------FEF48003BBDD06877D5311AB"

This is a multi-part message in MIME format.
--------------FEF48003BBDD06877D5311AB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 11/18/19 10:00 AM, CKI Project wrote:
> Hello,
>
> We ran automated tests on a patchset that was proposed for merging into t=
his
> kernel tree. The patches were applied to:
>
>         Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/stab=
le/linux.git
>              Commit: 116a395b7061 - Linux 5.3.11
>
> The results of these automated tests are provided below.
>
>      Overall result: FAILED (see details below)
>               Merge: OK
>             Compile: OK
>               Tests: FAILED
>
> All kernel binaries, config files, and logs are available for download he=
re:
>
>    https://artifacts.cki-project.org/pipelines/293063
>
> One or more kernel tests failed:
>
>      aarch64:
>       =E2=9D=8C LTP lite

I see a panic when installing the LTP dependencies

[  690.625060] Call trace:
[  690.627495]  bfq_find_set_group+0x8c/0xf0
[  690.631491]  bfq_bic_update_cgroup+0xbc/0x218
[  690.635834]  bfq_init_rq+0xac/0x808
[  690.639309]  bfq_insert_request.isra.0+0xe0/0x200
[  690.643999]  bfq_insert_requests+0x68/0x88
[  690.648085]  blk_mq_sched_insert_requests+0x84/0x140
[  690.653036]  blk_mq_flush_plug_list+0x170/0x2b0
[  690.657555]  blk_flush_plug_list+0xec/0x100
[  690.661725]  blk_mq_make_request+0x200/0x5e8
[  690.665982]  generic_make_request+0x94/0x270
[  690.670239]  submit_bio+0x34/0x168
[  690.673712]  xfs_submit_ioend.isra.0+0x9c/0x180 [xfs]
[  690.678798]  xfs_do_writepage+0x234/0x458 [xfs]
[  690.683318]  write_cache_pages+0x1a4/0x3f8
[  690.687442]  xfs_vm_writepages+0x84/0xb8 [xfs]
[  690.691874]  do_writepages+0x3c/0xe0
[  690.695438]  __writeback_single_inode+0x48/0x440
[  690.700042]  writeback_sb_inodes+0x1ec/0x4b0
[  690.704298]  __writeback_inodes_wb+0x50/0xe8
[  690.708555]  wb_writeback+0x264/0x388
[  690.712204]  wb_do_writeback+0x300/0x358
[  690.716113]  wb_workfn+0x80/0x1e0
[  690.719418]  process_one_work+0x1bc/0x3e8
[  690.723414]  worker_thread+0x54/0x440
[  690.727064]  kthread+0x104/0x130
[  690.730281]  ret_from_fork+0x10/0x18
[  690.733847] Code: eb00007f 54000220 b4000040 f8568022 (f9401c42)
[  690.739928] ---[ end trace d3fd392f569e86d3 ]---

https://artifacts.cki-project.org/pipelines/293063/logs/aarch64_host_2_cons=
ole.log

>
> We hope that these logs can help you find the problem quickly. For the fu=
ll
> detail on our testing procedures, please scroll to the bottom of this mes=
sage.
>
> Please reply to this email if you have any questions about the tests that=
 we
> ran or if you have any suggestions on how to make future tests more effec=
tive.
>
>          ,-.   ,-.
>         ( C ) ( K )  Continuous
>          `-',-.`-'   Kernel
>            ( I )     Integration
>             `-'
> _________________________________________________________________________=
_____
>
> Merge testing
> -------------
>
> We cloned this repository and checked out the following commit:
>
>    Repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>    Commit: 116a395b7061 - Linux 5.3.11
>
>
> We grabbed the c4a7b00e0626 commit of the stable queue repository.
>
> We then merged the patchset with `git am`:
>
>    scsi-core-handle-drivers-which-set-sg_tablesize-to-zero.patch
>    ax88172a-fix-information-leak-on-short-answers.patch
>    devlink-disallow-reload-operation-during-device-cleanup.patch
>    ipmr-fix-skb-headroom-in-ipmr_get_route.patch
>    mlxsw-core-enable-devlink-reload-only-on-probe.patch
>    net-gemini-add-missed-free_netdev.patch
>    net-smc-fix-fastopen-for-non-blocking-connect.patch
>    net-usb-qmi_wwan-add-support-for-foxconn-t77w968-lte-modules.patch
>    slip-fix-memory-leak-in-slip_open-error-path.patch
>    tcp-remove-redundant-new-line-from-tcp_event_sk_skb.patch
>    dpaa2-eth-free-already-allocated-channels-on-probe-defer.patch
>    devlink-add-method-for-time-stamp-on-reporter-s-dump.patch
>    net-smc-fix-refcount-non-blocking-connect-part-2.patch
>
> Compile testing
> ---------------
>
> We compiled the kernel for 3 architectures:
>
>      aarch64:
>        make options: -j30 INSTALL_MOD_STRIP=3D1 targz-pkg
>
>      ppc64le:
>        make options: -j30 INSTALL_MOD_STRIP=3D1 targz-pkg
>
>      x86_64:
>        make options: -j30 INSTALL_MOD_STRIP=3D1 targz-pkg
>
>
> Hardware testing
> ----------------
> We booted each kernel and ran the following tests:
>
>    aarch64:
>      Host 1:
>         =E2=9C=85 Boot test
>         =F0=9F=9A=A7 =E2=9C=85 selinux-policy: serge-testsuite
>
>      Host 2:
>         =E2=9C=85 Boot test
>         =E2=9C=85 Podman system integration test (as root)
>         =E2=9C=85 Podman system integration test (as user)
>         =E2=9D=8C LTP lite
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm test suite
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 AMTU (Abstract Machine Test Utility)
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP: openposix test suite
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking socket: fuzz
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite test
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 httpd: mod_ssl smoke sanity
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 iotop: sanity
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 tuned: tune-processes-through-perf
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: SCSI VPD
>         =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng
>
>    ppc64le:
>
>      =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
>      with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
>      This is not the fault of the kernel that was tested.
>
>    x86_64:
>      Host 1:
>         =E2=9C=85 Boot test
>         =F0=9F=9A=A7 =E2=9C=85 selinux-policy: serge-testsuite
>
>      Host 2:
>         =E2=9C=85 Boot test
>         =E2=9C=85 Podman system integration test (as root)
>         =E2=9C=85 Podman system integration test (as user)
>         =E2=9C=85 LTP lite
>         =E2=9C=85 jvm test suite
>         =E2=9C=85 AMTU (Abstract Machine Test Utility)
>         =E2=9C=85 LTP: openposix test suite
>         =E2=9C=85 Ethernet drivers sanity
>         =E2=9C=85 Networking socket: fuzz
>         =E2=9C=85 audit: audit testsuite test
>         =E2=9C=85 httpd: mod_ssl smoke sanity
>         =E2=9C=85 iotop: sanity
>         =E2=9C=85 tuned: tune-processes-through-perf
>         =E2=9C=85 pciutils: sanity smoke test
>         =E2=9C=85 storage: SCSI VPD
>         =E2=9C=85 stress: stress-ng
>
>    Test sources: https://github.com/CKI-project/tests-beaker
>      =F0=9F=92=9A Pull requests are welcome for new tests or improvements=
 to existing tests!
>
> Waived tests
> ------------
> If the test run included waived tests, they are marked with =F0=9F=9A=A7.=
 Such tests are
> executed but their results are not taken into account. Tests are waived w=
hen
> their results are not reliable enough, e.g. when they're just introduced =
or are
> being fixed.
>
> Testing timeout
> ---------------
> We aim to provide a report within reasonable timeframe. Tests that haven'=
t
> finished running are marked with =E2=8F=B1. Reports for non-upstream kern=
els have
> a Beaker recipe linked to next to each host.
>

--------------FEF48003BBDD06877D5311AB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/18/19 10:00 AM, CKI Project
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:cki.042792963E.5VOWULC1Q9@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Hello,

We ran automated tests on a patchset that was proposed for merging into thi=
s
kernel tree. The patches were applied to:

       Kernel repo: <a class=3D"moz-txt-link-freetext" href=3D"https://git.=
kernel.org/pub/scm/linux/kernel/git/stable/linux.git">https://git.kernel.or=
g/pub/scm/linux/kernel/git/stable/linux.git</a>
            Commit: 116a395b7061 - Linux 5.3.11

The results of these automated tests are provided below.

    Overall result: FAILED (see details below)
             Merge: OK
           Compile: OK
             Tests: FAILED

All kernel binaries, config files, and logs are available for download here=
:

  <a class=3D"moz-txt-link-freetext" href=3D"https://artifacts.cki-project.=
org/pipelines/293063">https://artifacts.cki-project.org/pipelines/293063</a=
>

One or more kernel tests failed:

    aarch64:
     =E2=9D=8C LTP lite</pre>
    </blockquote>
    <p>I see a panic when installing the LTP dependencies</p>
    <pre>[  690.625060] Call trace:=20
[  690.627495]  bfq_find_set_group+0x8c/0xf0=20
[  690.631491]  bfq_bic_update_cgroup+0xbc/0x218=20
[  690.635834]  bfq_init_rq+0xac/0x808=20
[  690.639309]  bfq_insert_request.isra.0+0xe0/0x200=20
[  690.643999]  bfq_insert_requests+0x68/0x88=20
[  690.648085]  blk_mq_sched_insert_requests+0x84/0x140=20
[  690.653036]  blk_mq_flush_plug_list+0x170/0x2b0=20
[  690.657555]  blk_flush_plug_list+0xec/0x100=20
[  690.661725]  blk_mq_make_request+0x200/0x5e8=20
[  690.665982]  generic_make_request+0x94/0x270=20
[  690.670239]  submit_bio+0x34/0x168=20
[  690.673712]  xfs_submit_ioend.isra.0+0x9c/0x180 [xfs]=20
[  690.678798]  xfs_do_writepage+0x234/0x458 [xfs]=20
[  690.683318]  write_cache_pages+0x1a4/0x3f8=20
[  690.687442]  xfs_vm_writepages+0x84/0xb8 [xfs]=20
[  690.691874]  do_writepages+0x3c/0xe0=20
[  690.695438]  __writeback_single_inode+0x48/0x440=20
[  690.700042]  writeback_sb_inodes+0x1ec/0x4b0=20
[  690.704298]  __writeback_inodes_wb+0x50/0xe8=20
[  690.708555]  wb_writeback+0x264/0x388=20
[  690.712204]  wb_do_writeback+0x300/0x358=20
[  690.716113]  wb_workfn+0x80/0x1e0=20
[  690.719418]  process_one_work+0x1bc/0x3e8=20
[  690.723414]  worker_thread+0x54/0x440=20
[  690.727064]  kthread+0x104/0x130=20
[  690.730281]  ret_from_fork+0x10/0x18=20
[  690.733847] Code: eb00007f 54000220 b4000040 f8568022 (f9401c42) =20
[  690.739928] ---[ end trace d3fd392f569e86d3 ]--- </pre>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://artifacts.cki-pro=
ject.org/pipelines/293063/logs/aarch64_host_2_console.log">https://artifact=
s.cki-project.org/pipelines/293063/logs/aarch64_host_2_console.log</a></p>
    <blockquote type=3D"cite"
      cite=3D"mid:cki.042792963E.5VOWULC1Q9@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

We hope that these logs can help you find the problem quickly. For the full
detail on our testing procedures, please scroll to the bottom of this messa=
ge.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

Merge testing
-------------

We cloned this repository and checked out the following commit:

  Repo: <a class=3D"moz-txt-link-freetext" href=3D"https://git.kernel.org/p=
ub/scm/linux/kernel/git/stable/linux.git">https://git.kernel.org/pub/scm/li=
nux/kernel/git/stable/linux.git</a>
  Commit: 116a395b7061 - Linux 5.3.11


We grabbed the c4a7b00e0626 commit of the stable queue repository.

We then merged the patchset with `git am`:

  scsi-core-handle-drivers-which-set-sg_tablesize-to-zero.patch
  ax88172a-fix-information-leak-on-short-answers.patch
  devlink-disallow-reload-operation-during-device-cleanup.patch
  ipmr-fix-skb-headroom-in-ipmr_get_route.patch
  mlxsw-core-enable-devlink-reload-only-on-probe.patch
  net-gemini-add-missed-free_netdev.patch
  net-smc-fix-fastopen-for-non-blocking-connect.patch
  net-usb-qmi_wwan-add-support-for-foxconn-t77w968-lte-modules.patch
  slip-fix-memory-leak-in-slip_open-error-path.patch
  tcp-remove-redundant-new-line-from-tcp_event_sk_skb.patch
  dpaa2-eth-free-already-allocated-channels-on-probe-defer.patch
  devlink-add-method-for-time-stamp-on-reporter-s-dump.patch
  net-smc-fix-refcount-non-blocking-connect-part-2.patch

Compile testing
---------------

We compiled the kernel for 3 architectures:

    aarch64:
      make options: -j30 INSTALL_MOD_STRIP=3D1 targz-pkg

    ppc64le:
      make options: -j30 INSTALL_MOD_STRIP=3D1 targz-pkg

    x86_64:
      make options: -j30 INSTALL_MOD_STRIP=3D1 targz-pkg


Hardware testing
----------------
We booted each kernel and ran the following tests:

  aarch64:
    Host 1:
       =E2=9C=85 Boot test
       =F0=9F=9A=A7 =E2=9C=85 selinux-policy: serge-testsuite

    Host 2:
       =E2=9C=85 Boot test
       =E2=9C=85 Podman system integration test (as root)
       =E2=9C=85 Podman system integration test (as user)
       =E2=9D=8C LTP lite
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm test suite
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 AMTU (Abstract Machine Test Utility)
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP: openposix test suite
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking socket: fuzz
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 httpd: mod_ssl smoke sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 iotop: sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 tuned: tune-processes-through-perf
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: SCSI VPD
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng

  ppc64le:

    =E2=9A=A1 Internal infrastructure issues prevented one or more tests (m=
arked
    with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
    This is not the fault of the kernel that was tested.

  x86_64:
    Host 1:
       =E2=9C=85 Boot test
       =F0=9F=9A=A7 =E2=9C=85 selinux-policy: serge-testsuite

    Host 2:
       =E2=9C=85 Boot test
       =E2=9C=85 Podman system integration test (as root)
       =E2=9C=85 Podman system integration test (as user)
       =E2=9C=85 LTP lite
       =E2=9C=85 jvm test suite
       =E2=9C=85 AMTU (Abstract Machine Test Utility)
       =E2=9C=85 LTP: openposix test suite
       =E2=9C=85 Ethernet drivers sanity
       =E2=9C=85 Networking socket: fuzz
       =E2=9C=85 audit: audit testsuite test
       =E2=9C=85 httpd: mod_ssl smoke sanity
       =E2=9C=85 iotop: sanity
       =E2=9C=85 tuned: tune-processes-through-perf
       =E2=9C=85 pciutils: sanity smoke test
       =E2=9C=85 storage: SCSI VPD
       =E2=9C=85 stress: stress-ng

  Test sources: <a class=3D"moz-txt-link-freetext" href=3D"https://github.c=
om/CKI-project/tests-beaker">https://github.com/CKI-project/tests-beaker</a=
>
    =F0=9F=92=9A Pull requests are welcome for new tests or improvements to=
 existing tests!

Waived tests
------------
If the test run included waived tests, they are marked with =F0=9F=9A=A7. S=
uch tests are
executed but their results are not taken into account. Tests are waived whe=
n
their results are not reliable enough, e.g. when they're just introduced or=
 are
being fixed.

Testing timeout
---------------
We aim to provide a report within reasonable timeframe. Tests that haven't
finished running are marked with =E2=8F=B1. Reports for non-upstream kernel=
s have
a Beaker recipe linked to next to each host.

</pre>
    </blockquote>
  </body>
</html>

--------------FEF48003BBDD06877D5311AB--


--===============1245621055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1245621055==--

