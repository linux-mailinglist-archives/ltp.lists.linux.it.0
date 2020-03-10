Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A50FD183097
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:45:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 451383C5E85
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:45:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9D1EB3C13DB
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 10:56:59 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 75752601E80
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 10:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583834217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ksTeinfRO7KN7TeEFLfgk/HatKhcMCARwVqxbnJKaX0=;
 b=do8EsbRnt7IxSCiFOFIMbIOjczWN0SphwOe2JSD8e2QS1kUMuWwixLoNGQLuF2YvzxpB62
 1/z6DjaRREiypOysjmYxf41orbYa8YG4viAgZMV7VtqRuW1aKkmotpF3EEzaGLsOEVVj61
 7gWWNWRj2Ly2tad5cPQwz3peW+tiktY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-dgqZ5iduPS6OhflcJLnrCA-1; Tue, 10 Mar 2020 05:56:52 -0400
X-MC-Unique: dgqZ5iduPS6OhflcJLnrCA-1
Received: by mail-ed1-f69.google.com with SMTP id d11so10405069eds.7
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 02:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ksTeinfRO7KN7TeEFLfgk/HatKhcMCARwVqxbnJKaX0=;
 b=QQr+xiYvVVHN8D5PMQBC+Gx8og8FXHPaimeGtmOIKnoJQCSqnHOEYIZUDyghESMCjQ
 GqeOz2Ol07xKTRH696Eo3/9frRjdVZhO2RH+6V37mMn2RZiyhEdzkNbKQRUl7eGdI1DP
 Ckll+6oeNT4abXVOgv043/zXfLP1sd9koX2CyCydUbqZRH5YDDCAgajVjB0WBGBQEDbz
 gaSPMqZIrRIeK5AKi2jQ2Sk1WbTOTVWx2mPQAhmwRCwHMplgQpRh5jouo1x4WtXm0QtX
 lfYETPwaYcVUJQ7Sk1vnLeoQ6yORmRUXpIJRQFgQZ9Nm64LgIElRGHcl1eKdHuNAITOV
 ndHA==
X-Gm-Message-State: ANhLgQ2TIgk5+QIwVJcCHlBVOsDSO7g49W8qY59Su4AN+QDF3DNRO2wg
 CC88a3unvqi5nToGbRFiOgAibtEskrDt+e8jkYS8J6eNnMs8TaaQXJL4RJusZ1XBC4rCxFzplrV
 K/+u/dHCbgIhY1GAF3hqPhg2ZRWs=
X-Received: by 2002:a50:ce12:: with SMTP id y18mr19838337edi.62.1583834210953; 
 Tue, 10 Mar 2020 02:56:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs/jAzEhsMOtpWGjVyjN8OOw/LdtASmSgtArS0wkhVHrqZtFTvKxsn8qj2yXdRIjWzzLa7Xh0ATT4NXLmkJKVM=
X-Received: by 2002:a50:ce12:: with SMTP id y18mr19838326edi.62.1583834210723; 
 Tue, 10 Mar 2020 02:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <cki.FE14F151C1.JS9OFUV72I@redhat.com>
In-Reply-To: <cki.FE14F151C1.JS9OFUV72I@redhat.com>
From: Ondrej Moris <omoris@redhat.com>
Date: Tue, 10 Mar 2020 10:56:39 +0100
Message-ID: <CAGf2o_cxdggGrbsT22wbyKXQ0QAQ0ffxNgM14S+5ycht3Oj_1w@mail.gmail.com>
To: CKI Project <cki-project@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 12 Mar 2020 13:45:38 +0100
Subject: Re: [LTP] 
	=?utf-8?q?=E2=9D=8C_PANICKED=3A_Test_report_for_kernel_5?=
	=?utf-8?q?=2E5=2E8-6afe1f4=2Ecki_=28stable-queue=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 Linux Stable maillist <stable@vger.kernel.org>,
 Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: multipart/mixed; boundary="===============0905894738=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0905894738==
Content-Type: multipart/alternative; boundary="000000000000839cb705a07d23d7"

--000000000000839cb705a07d23d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

audit-testsuite started failing recently (yesterday) because a lot of work
was merged upstream and some new tests are testing functionality not
available in RHEL yet. Please waive all audit-testsuite results and I will
correct our beaker wrapper in the meantime.

On Tue, Mar 10, 2020 at 10:45 AM CKI Project <cki-project@redhat.com> wrote=
:

>
> Hello,
>
> We ran automated tests on a recent commit from this kernel tree:
>
>        Kernel repo:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.gi=
t
>             Commit: 6afe1f4aeae9 - ASoC: topology: Fix memleak in
> soc_tplg_manifest_load()
>
> The results of these automated tests are provided below.
>
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: OK
>              Tests: PANICKED
>
> All kernel binaries, config files, and logs are available for download
> here:
>
>
> https://cki-artifacts.s3.us-east-2.amazonaws.com/index.html?prefix=3Ddata=
warehouse/2020/03/09/480618
>
> One or more kernel tests failed:
>
>     s390x:
>      =E2=9D=8C LTP
>
>     ppc64le:
>      =E2=9D=8C LTP
>      =E2=9D=8C audit: audit testsuite test
>
>     aarch64:
>      =E2=9D=8C audit: audit testsuite test
>
>     x86_64:
>      =E2=9D=8C audit: audit testsuite test
>
> We hope that these logs can help you find the problem quickly. For the fu=
ll
> detail on our testing procedures, please scroll to the bottom of this
> message.
>
> Please reply to this email if you have any questions about the tests that
> we
> ran or if you have any suggestions on how to make future tests more
> effective.
>
>         ,-.   ,-.
>        ( C ) ( K )  Continuous
>         `-',-.`-'   Kernel
>           ( I )     Integration
>            `-'
>
> _________________________________________________________________________=
_____
>
> Compile testing
> ---------------
>
> We compiled the kernel for 4 architectures:
>
>     aarch64:
>       make options: -j30 INSTALL_MOD_STRIP=3D1 targz-pkg
>
>     ppc64le:
>       make options: -j30 INSTALL_MOD_STRIP=3D1 targz-pkg
>
>     s390x:
>       make options: -j30 INSTALL_MOD_STRIP=3D1 targz-pkg
>
>     x86_64:
>       make options: -j30 INSTALL_MOD_STRIP=3D1 targz-pkg
>
>
> Hardware testing
> ----------------
> We booted each kernel and ran the following tests:
>
>   aarch64:
>     Host 1:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Podman system integration test - as root
>        =E2=9C=85 Podman system integration test - as user
>        =E2=9C=85 LTP
>        =E2=9C=85 Loopdev Sanity
>        =E2=9C=85 Memory function: memfd_create
>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>        =E2=9C=85 Networking bridge: sanity
>        =E2=9C=85 Ethernet drivers sanity
>        =E2=9C=85 Networking MACsec: sanity
>        =E2=9C=85 Networking socket: fuzz
>        =E2=9C=85 Networking sctp-auth: sockopts test
>        =E2=9C=85 Networking: igmp conformance test
>        =E2=9C=85 Networking route: pmtu
>        =E2=9C=85 Networking route_func - local
>        =E2=9C=85 Networking route_func - forward
>        =E2=9C=85 Networking TCP: keepalive test
>        =E2=9C=85 Networking UDP: socket
>        =E2=9C=85 Networking tunnel: geneve basic test
>        =E2=9C=85 Networking tunnel: gre basic
>        =E2=9C=85 L2TP basic test
>        =E2=9C=85 Networking tunnel: vxlan basic
>        =E2=9C=85 Networking ipsec: basic netns - transport
>        =E2=9C=85 Networking ipsec: basic netns - tunnel
>        =E2=9D=8C audit: audit testsuite test
>        =E2=9C=85 httpd: mod_ssl smoke sanity
>        =E2=9C=85 tuned: tune-processes-through-perf
>        =E2=9C=85 ALSA PCM loopback test
>        =E2=9C=85 ALSA Control (mixer) Userspace Element test
>        =E2=9C=85 storage: SCSI VPD
>        =E2=9C=85 trace: ftrace/tracer
>        =F0=9F=9A=A7 =E2=9C=85 CIFS Connectathon
>        =F0=9F=9A=A7 =E2=9C=85 POSIX pjd-fstest suites
>        =F0=9F=9A=A7 =E2=9C=85 jvm - DaCapo Benchmark Suite
>        =F0=9F=9A=A7 =E2=9C=85 jvm - jcstress tests
>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>        =F0=9F=9A=A7 =E2=9C=85 LTP: openposix test suite
>        =F0=9F=9A=A7 =E2=9C=85 Networking vnic: ipvlan/basic
>        =F0=9F=9A=A7 =E2=9C=85 iotop: sanity
>        =F0=9F=9A=A7 =E2=9C=85 Usex - version 1.9-29
>        =F0=9F=9A=A7 =E2=9C=85 storage: dm/common
>
>     Host 2:
>        =E2=9C=85 Boot test
>        =E2=9C=85 xfstests - ext4
>        =E2=9C=85 xfstests - xfs
>        =E2=9C=85 selinux-policy: serge-testsuite
>        =E2=9C=85 lvm thinp sanity
>        =E2=9C=85 storage: software RAID testing
>        =E2=9C=85 stress: stress-ng
>        =F0=9F=9A=A7 =E2=9C=85 IPMI driver test
>        =F0=9F=9A=A7 =E2=9C=85 IPMItool loop stress test
>        =F0=9F=9A=A7 =E2=9C=85 Storage blktests
>
>   ppc64le:
>     Host 1:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9C=85 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Podman system integration test - as ro=
ot
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Podman system integration test - as us=
er
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Loopdev Sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: memfd_create
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 AMTU (Abstract Machine Test Utility)
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking bridge: sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking MACsec: sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking socket: fuzz
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking sctp-auth: sockopts test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route: pmtu
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - local
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - forward
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking TCP: keepalive test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking UDP: socket
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: geneve basic test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: gre basic
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 L2TP basic test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: vxlan basic
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - tunnel
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 httpd: mod_ssl smoke sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 tuned: tune-processes-through-perf
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA PCM loopback test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA Control (mixer) Userspace Element=
 test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 trace: ftrace/tracer
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 CIFS Connectathon
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 POSIX pjd-fstest suites
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - DaCapo Benchmark Su=
ite
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: kaslr
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP: openposix test suite
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking vnic: ipvlan/b=
asic
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 iotop: sanity
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Usex - version 1.9-29
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: dm/common
>
>     Host 2:
>        =E2=9C=85 Boot test
>        =E2=9C=85 xfstests - ext4
>        =E2=9C=85 xfstests - xfs
>        =E2=9C=85 selinux-policy: serge-testsuite
>        =E2=9C=85 lvm thinp sanity
>        =E2=9C=85 storage: software RAID testing
>        =F0=9F=9A=A7 =E2=9C=85 IPMI driver test
>        =F0=9F=9A=A7 =E2=9C=85 IPMItool loop stress test
>        =F0=9F=9A=A7 =E2=9C=85 Storage blktests
>
>     Host 3:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Podman system integration test - as root
>        =E2=9C=85 Podman system integration test - as user
>        =E2=9D=8C LTP
>        =E2=9C=85 Loopdev Sanity
>        =E2=9C=85 Memory function: memfd_create
>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>        =E2=9C=85 Networking bridge: sanity
>        =E2=9C=85 Ethernet drivers sanity
>        =E2=9C=85 Networking MACsec: sanity
>        =E2=9C=85 Networking socket: fuzz
>        =E2=9C=85 Networking sctp-auth: sockopts test
>        =E2=9C=85 Networking route: pmtu
>        =E2=9C=85 Networking route_func - local
>        =E2=9C=85 Networking route_func - forward
>        =E2=9C=85 Networking TCP: keepalive test
>        =E2=9C=85 Networking UDP: socket
>        =E2=9C=85 Networking tunnel: geneve basic test
>        =E2=9C=85 Networking tunnel: gre basic
>        =E2=9C=85 L2TP basic test
>        =E2=9C=85 Networking tunnel: vxlan basic
>        =E2=9C=85 Networking ipsec: basic netns - tunnel
>        =E2=9D=8C audit: audit testsuite test
>        =E2=9C=85 httpd: mod_ssl smoke sanity
>        =E2=9C=85 tuned: tune-processes-through-perf
>        =E2=9C=85 ALSA PCM loopback test
>        =E2=9C=85 ALSA Control (mixer) Userspace Element test
>        =E2=9C=85 trace: ftrace/tracer
>        =F0=9F=9A=A7 =E2=9C=85 CIFS Connectathon
>        =F0=9F=9A=A7 =E2=9C=85 POSIX pjd-fstest suites
>        =F0=9F=9A=A7 =E2=9C=85 jvm - DaCapo Benchmark Suite
>        =F0=9F=9A=A7 =E2=9C=85 jvm - jcstress tests
>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>        =F0=9F=9A=A7 =E2=9C=85 LTP: openposix test suite
>        =F0=9F=9A=A7 =E2=9C=85 Networking vnic: ipvlan/basic
>        =F0=9F=9A=A7 =E2=9C=85 iotop: sanity
>        =F0=9F=9A=A7 =E2=9C=85 Usex - version 1.9-29
>        =F0=9F=9A=A7 =E2=9C=85 storage: dm/common
>
>   s390x:
>     Host 1:
>        =E2=9C=85 Boot test
>        =E2=9C=85 selinux-policy: serge-testsuite
>        =E2=9C=85 stress: stress-ng
>        =F0=9F=9A=A7 =E2=9C=85 Storage blktests
>
>     Host 2:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Podman system integration test - as root
>        =E2=9C=85 Podman system integration test - as user
>        =E2=9D=8C LTP
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Loopdev Sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: memfd_create
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking bridge: sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking MACsec: sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking sctp-auth: sockopts test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route: pmtu
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - local
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - forward
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking TCP: keepalive test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking UDP: socket
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: geneve basic test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: gre basic
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 L2TP basic test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: vxlan basic
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - transp=
ort
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - tunnel
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 httpd: mod_ssl smoke sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 tuned: tune-processes-through-perf
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 trace: ftrace/tracer
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 CIFS Connectathon
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 POSIX pjd-fstest suites
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - DaCapo Benchmark Su=
ite
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: kaslr
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP: openposix test suite
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking vnic: ipvlan/b=
asic
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 iotop: sanity
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Usex - version 1.9-29
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: dm/common
>
>   x86_64:
>     Host 1:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Storage SAN device stress - mpt3sas driver
>
>     Host 2:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Storage SAN device stress - megaraid_sas
>
>     Host 3:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 xfstests - ext4
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 xfstests - xfs
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 selinux-policy: serge-testsuite
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm thinp sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: software RAID testing
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 IOMMU boot test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 IPMI driver test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 IPMItool loop stress test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 power-management: cpupowe=
r/sanity test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests
>
>     Host 4:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Podman system integration test - as root
>        =E2=9C=85 Podman system integration test - as user
>        =E2=9C=85 LTP
>        =E2=9C=85 Loopdev Sanity
>        =E2=9C=85 Memory function: memfd_create
>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>        =E2=9C=85 Networking bridge: sanity
>        =E2=9C=85 Ethernet drivers sanity
>        =E2=9C=85 Networking MACsec: sanity
>        =E2=9C=85 Networking socket: fuzz
>        =E2=9C=85 Networking sctp-auth: sockopts test
>        =E2=9C=85 Networking: igmp conformance test
>        =E2=9C=85 Networking route: pmtu
>        =E2=9C=85 Networking route_func - local
>        =E2=9C=85 Networking route_func - forward
>        =E2=9C=85 Networking TCP: keepalive test
>        =E2=9C=85 Networking UDP: socket
>        =E2=9C=85 Networking tunnel: geneve basic test
>        =E2=9C=85 Networking tunnel: gre basic
>        =E2=9C=85 L2TP basic test
>        =E2=9C=85 Networking tunnel: vxlan basic
>        =E2=9C=85 Networking ipsec: basic netns - transport
>        =E2=9C=85 Networking ipsec: basic netns - tunnel
>        =E2=9D=8C audit: audit testsuite test
>        =E2=9C=85 httpd: mod_ssl smoke sanity
>        =E2=9C=85 tuned: tune-processes-through-perf
>        =E2=9C=85 pciutils: sanity smoke test
>        =E2=9C=85 ALSA PCM loopback test
>        =E2=9C=85 ALSA Control (mixer) Userspace Element test
>        =E2=9C=85 storage: SCSI VPD
>        =E2=9C=85 trace: ftrace/tracer
>        =F0=9F=9A=A7 =E2=9C=85 CIFS Connectathon
>        =F0=9F=9A=A7 =E2=9C=85 POSIX pjd-fstest suites
>        =F0=9F=9A=A7 =E2=9C=85 jvm - DaCapo Benchmark Suite
>        =F0=9F=9A=A7 =E2=9C=85 jvm - jcstress tests
>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>        =F0=9F=9A=A7 =E2=9C=85 LTP: openposix test suite
>        =F0=9F=9A=A7 =E2=9C=85 Networking vnic: ipvlan/basic
>        =F0=9F=9A=A7 =E2=9C=85 iotop: sanity
>        =F0=9F=9A=A7 =E2=9C=85 Usex - version 1.9-29
>        =F0=9F=9A=A7 =E2=9C=85 storage: dm/common
>
>     Host 5:
>        =E2=9C=85 Boot test
>        =E2=9C=85 xfstests - ext4
>        =E2=9C=85 xfstests - xfs
>        =E2=9C=85 selinux-policy: serge-testsuite
>        =E2=9C=85 lvm thinp sanity
>        =E2=9C=85 storage: software RAID testing
>        =E2=9C=85 stress: stress-ng
>        =F0=9F=9A=A7 =E2=9C=85 IOMMU boot test
>        =F0=9F=9A=A7 =E2=9C=85 Storage blktests
>
>   Test sources: https://github.com/CKI-project/tests-beaker
>     =F0=9F=92=9A Pull requests are welcome for new tests or improvements =
to existing
> tests!
>
> Aborted tests
> -------------
> Tests that didn't complete running successfully are marked with =E2=9A=A1=
=E2=9A=A1=E2=9A=A1.
> If this was caused by an infrastructure issue, we try to mark that
> explicitly in the report.
>
> Waived tests
> ------------
> If the test run included waived tests, they are marked with =F0=9F=9A=A7.=
 Such tests
> are
> executed but their results are not taken into account. Tests are waived
> when
> their results are not reliable enough, e.g. when they're just introduced
> or are
> being fixed.
>
> Testing timeout
> ---------------
> We aim to provide a report within reasonable timeframe. Tests that haven'=
t
> finished running yet are marked with =E2=8F=B1.
>
>

--000000000000839cb705a07d23d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+YXVkaXQtdGVzdHN1aXRlIHN0YXJ0ZWQgZmFpbGluZyByZWNlbnRseSAo
eWVzdGVyZGF5KSBiZWNhdXNlIGEgbG90IG9mIHdvcmsgd2FzIG1lcmdlZCB1cHN0cmVhbSBhbmQg
c29tZSBuZXcgdGVzdHMgYXJlIHRlc3RpbmcgZnVuY3Rpb25hbGl0eSBub3QgYXZhaWxhYmxlIGlu
IFJIRUwgeWV0LiBQbGVhc2Ugd2FpdmUgYWxsIGF1ZGl0LXRlc3RzdWl0ZSByZXN1bHRzIGFuZCBJ
IHdpbGwgY29ycmVjdCBvdXIgYmVha2VyIHdyYXBwZXIgaW4gdGhlIG1lYW50aW1lLjxicj48L2Rp
dj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFp
bF9hdHRyIj5PbiBUdWUsIE1hciAxMCwgMjAyMCBhdCAxMDo0NSBBTSBDS0kgUHJvamVjdCAmbHQ7
PGEgaHJlZj0ibWFpbHRvOmNraS1wcm9qZWN0QHJlZGhhdC5jb20iPmNraS1wcm9qZWN0QHJlZGhh
dC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xp
ZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxicj4NCkhlbGxvLDxicj4NCjxi
cj4NCldlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSByZWNlbnQgY29tbWl0IGZyb20gdGhpcyBr
ZXJuZWwgdHJlZTo8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoEtlcm5lbCByZXBvOiA8YSBocmVmPSJo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGlu
dXgtc3RhYmxlLXJjLmdpdCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0
YWJsZS1yYy5naXQ8L2E+PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgQ29tbWl0OiA2YWZlMWY0YWVh
ZTkgLSBBU29DOiB0b3BvbG9neTogRml4IG1lbWxlYWsgaW4gc29jX3RwbGdfbWFuaWZlc3RfbG9h
ZCgpPGJyPg0KPGJyPg0KVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBw
cm92aWRlZCBiZWxvdy48YnI+DQo8YnI+DQrCoCDCoCBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChz
ZWUgZGV0YWlscyBiZWxvdyk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoE1lcmdlOiBPSzxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgQ29tcGlsZTogT0s8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoFRl
c3RzOiBQQU5JQ0tFRDxicj4NCjxicj4NCkFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxl
cywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQgaGVyZTo8YnI+DQo8YnI+DQrC
oCA8YSBocmVmPSJodHRwczovL2NraS1hcnRpZmFjdHMuczMudXMtZWFzdC0yLmFtYXpvbmF3cy5j
b20vaW5kZXguaHRtbD9wcmVmaXg9ZGF0YXdhcmVob3VzZS8yMDIwLzAzLzA5LzQ4MDYxOCIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVz
LWVhc3QtMi5hbWF6b25hd3MuY29tL2luZGV4Lmh0bWw/cHJlZml4PWRhdGF3YXJlaG91c2UvMjAy
MC8wMy8wOS80ODA2MTg8L2E+PGJyPg0KPGJyPg0KT25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZh
aWxlZDo8YnI+DQo8YnI+DQrCoCDCoCBzMzkweDo8YnI+DQrCoCDCoCDCoOKdjCBMVFA8YnI+DQo8
YnI+DQrCoCDCoCBwcGM2NGxlOjxicj4NCsKgIMKgIMKg4p2MIExUUDxicj4NCsKgIMKgIMKg4p2M
IGF1ZGl0OiBhdWRpdCB0ZXN0c3VpdGUgdGVzdDxicj4NCjxicj4NCsKgIMKgIGFhcmNoNjQ6PGJy
Pg0KwqAgwqAgwqDinYwgYXVkaXQ6IGF1ZGl0IHRlc3RzdWl0ZSB0ZXN0PGJyPg0KPGJyPg0KwqAg
wqAgeDg2XzY0Ojxicj4NCsKgIMKgIMKg4p2MIGF1ZGl0OiBhdWRpdCB0ZXN0c3VpdGUgdGVzdDxi
cj4NCjxicj4NCldlIGhvcGUgdGhhdCB0aGVzZSBsb2dzIGNhbiBoZWxwIHlvdSBmaW5kIHRoZSBw
cm9ibGVtIHF1aWNrbHkuIEZvciB0aGUgZnVsbDxicj4NCmRldGFpbCBvbiBvdXIgdGVzdGluZyBw
cm9jZWR1cmVzLCBwbGVhc2Ugc2Nyb2xsIHRvIHRoZSBib3R0b20gb2YgdGhpcyBtZXNzYWdlLjxi
cj4NCjxicj4NClBsZWFzZSByZXBseSB0byB0aGlzIGVtYWlsIGlmIHlvdSBoYXZlIGFueSBxdWVz
dGlvbnMgYWJvdXQgdGhlIHRlc3RzIHRoYXQgd2U8YnI+DQpyYW4gb3IgaWYgeW91IGhhdmUgYW55
IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBtYWtlIGZ1dHVyZSB0ZXN0cyBtb3JlIGVmZmVjdGl2ZS48
YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCAsLS7CoCDCoCwtLjxicj4NCsKgIMKgIMKgIMKgKCBDICkg
KCBLICnCoCBDb250aW51b3VzPGJyPg0KwqAgwqAgwqAgwqAgYC0mIzM5OywtLmAtJiMzOTvCoCDC
oEtlcm5lbDxicj4NCsKgIMKgIMKgIMKgIMKgICggSSApwqAgwqAgwqBJbnRlZ3JhdGlvbjxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgYC0mIzM5Ozxicj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4N
Cjxicj4NCkNvbXBpbGUgdGVzdGluZzxicj4NCi0tLS0tLS0tLS0tLS0tLTxicj4NCjxicj4NCldl
IGNvbXBpbGVkIHRoZSBrZXJuZWwgZm9yIDQgYXJjaGl0ZWN0dXJlczo8YnI+DQo8YnI+DQrCoCDC
oCBhYXJjaDY0Ojxicj4NCsKgIMKgIMKgIG1ha2Ugb3B0aW9uczogLWozMCBJTlNUQUxMX01PRF9T
VFJJUD0xIHRhcmd6LXBrZzxicj4NCjxicj4NCsKgIMKgIHBwYzY0bGU6PGJyPg0KwqAgwqAgwqAg
bWFrZSBvcHRpb25zOiAtajMwIElOU1RBTExfTU9EX1NUUklQPTEgdGFyZ3otcGtnPGJyPg0KPGJy
Pg0KwqAgwqAgczM5MHg6PGJyPg0KwqAgwqAgwqAgbWFrZSBvcHRpb25zOiAtajMwIElOU1RBTExf
TU9EX1NUUklQPTEgdGFyZ3otcGtnPGJyPg0KPGJyPg0KwqAgwqAgeDg2XzY0Ojxicj4NCsKgIMKg
IMKgIG1ha2Ugb3B0aW9uczogLWozMCBJTlNUQUxMX01PRF9TVFJJUD0xIHRhcmd6LXBrZzxicj4N
Cjxicj4NCjxicj4NCkhhcmR3YXJlIHRlc3Rpbmc8YnI+DQotLS0tLS0tLS0tLS0tLS0tPGJyPg0K
V2UgYm9vdGVkIGVhY2gga2VybmVsIGFuZCByYW4gdGhlIGZvbGxvd2luZyB0ZXN0czo8YnI+DQo8
YnI+DQrCoCBhYXJjaDY0Ojxicj4NCsKgIMKgIEhvc3QgMTo8YnI+DQrCoCDCoCDCoCDCoOKchSBC
b290IHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKchSBQb2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRl
c3QgLSBhcyByb290PGJyPg0KwqAgwqAgwqAgwqDinIUgUG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlv
biB0ZXN0IC0gYXMgdXNlcjxicj4NCsKgIMKgIMKgIMKg4pyFIExUUDxicj4NCsKgIMKgIMKgIMKg
4pyFIExvb3BkZXYgU2FuaXR5PGJyPg0KwqAgwqAgwqAgwqDinIUgTWVtb3J5IGZ1bmN0aW9uOiBt
ZW1mZF9jcmVhdGU8YnI+DQrCoCDCoCDCoCDCoOKchSBBTVRVIChBYnN0cmFjdCBNYWNoaW5lIFRl
c3QgVXRpbGl0eSk8YnI+DQrCoCDCoCDCoCDCoOKchSBOZXR3b3JraW5nIGJyaWRnZTogc2FuaXR5
PGJyPg0KwqAgwqAgwqAgwqDinIUgRXRoZXJuZXQgZHJpdmVycyBzYW5pdHk8YnI+DQrCoCDCoCDC
oCDCoOKchSBOZXR3b3JraW5nIE1BQ3NlYzogc2FuaXR5PGJyPg0KwqAgwqAgwqAgwqDinIUgTmV0
d29ya2luZyBzb2NrZXQ6IGZ1eno8YnI+DQrCoCDCoCDCoCDCoOKchSBOZXR3b3JraW5nIHNjdHAt
YXV0aDogc29ja29wdHMgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pyFIE5ldHdvcmtpbmc6IGlnbXAg
Y29uZm9ybWFuY2UgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pyFIE5ldHdvcmtpbmcgcm91dGU6IHBt
dHU8YnI+DQrCoCDCoCDCoCDCoOKchSBOZXR3b3JraW5nIHJvdXRlX2Z1bmMgLSBsb2NhbDxicj4N
CsKgIMKgIMKgIMKg4pyFIE5ldHdvcmtpbmcgcm91dGVfZnVuYyAtIGZvcndhcmQ8YnI+DQrCoCDC
oCDCoCDCoOKchSBOZXR3b3JraW5nIFRDUDoga2VlcGFsaXZlIHRlc3Q8YnI+DQrCoCDCoCDCoCDC
oOKchSBOZXR3b3JraW5nIFVEUDogc29ja2V0PGJyPg0KwqAgwqAgwqAgwqDinIUgTmV0d29ya2lu
ZyB0dW5uZWw6IGdlbmV2ZSBiYXNpYyB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDinIUgTmV0d29ya2lu
ZyB0dW5uZWw6IGdyZSBiYXNpYzxicj4NCsKgIMKgIMKgIMKg4pyFIEwyVFAgYmFzaWMgdGVzdDxi
cj4NCsKgIMKgIMKgIMKg4pyFIE5ldHdvcmtpbmcgdHVubmVsOiB2eGxhbiBiYXNpYzxicj4NCsKg
IMKgIMKgIMKg4pyFIE5ldHdvcmtpbmcgaXBzZWM6IGJhc2ljIG5ldG5zIC0gdHJhbnNwb3J0PGJy
Pg0KwqAgwqAgwqAgwqDinIUgTmV0d29ya2luZyBpcHNlYzogYmFzaWMgbmV0bnMgLSB0dW5uZWw8
YnI+DQrCoCDCoCDCoCDCoOKdjCBhdWRpdDogYXVkaXQgdGVzdHN1aXRlIHRlc3Q8YnI+DQrCoCDC
oCDCoCDCoOKchSBodHRwZDogbW9kX3NzbCBzbW9rZSBzYW5pdHk8YnI+DQrCoCDCoCDCoCDCoOKc
hSB0dW5lZDogdHVuZS1wcm9jZXNzZXMtdGhyb3VnaC1wZXJmPGJyPg0KwqAgwqAgwqAgwqDinIUg
QUxTQSBQQ00gbG9vcGJhY2sgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pyFIEFMU0EgQ29udHJvbCAo
bWl4ZXIpIFVzZXJzcGFjZSBFbGVtZW50IHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKchSBzdG9yYWdl
OiBTQ1NJIFZQRDxicj4NCsKgIMKgIMKgIMKg4pyFIHRyYWNlOiBmdHJhY2UvdHJhY2VyPGJyPg0K
wqAgwqAgwqAgwqDwn5qnIOKchSBDSUZTIENvbm5lY3RhdGhvbjxicj4NCsKgIMKgIMKgIMKg8J+a
pyDinIUgUE9TSVggcGpkLWZzdGVzdCBzdWl0ZXM8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pyFIGp2
bSAtIERhQ2FwbyBCZW5jaG1hcmsgU3VpdGU8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pyFIGp2bSAt
IGpjc3RyZXNzIHRlc3RzPGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBNZW1vcnkgZnVuY3Rpb246
IGthc2xyPGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBMVFA6IG9wZW5wb3NpeCB0ZXN0IHN1aXRl
PGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBOZXR3b3JraW5nIHZuaWM6IGlwdmxhbi9iYXNpYzxi
cj4NCsKgIMKgIMKgIMKg8J+apyDinIUgaW90b3A6IHNhbml0eTxicj4NCsKgIMKgIMKgIMKg8J+a
pyDinIUgVXNleCAtIHZlcnNpb24gMS45LTI5PGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBzdG9y
YWdlOiBkbS9jb21tb248YnI+DQo8YnI+DQrCoCDCoCBIb3N0IDI6PGJyPg0KwqAgwqAgwqAgwqDi
nIUgQm9vdCB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDinIUgeGZzdGVzdHMgLSBleHQ0PGJyPg0KwqAg
wqAgwqAgwqDinIUgeGZzdGVzdHMgLSB4ZnM8YnI+DQrCoCDCoCDCoCDCoOKchSBzZWxpbnV4LXBv
bGljeTogc2VyZ2UtdGVzdHN1aXRlPGJyPg0KwqAgwqAgwqAgwqDinIUgbHZtIHRoaW5wIHNhbml0
eTxicj4NCsKgIMKgIMKgIMKg4pyFIHN0b3JhZ2U6IHNvZnR3YXJlIFJBSUQgdGVzdGluZzxicj4N
CsKgIMKgIMKgIMKg4pyFIHN0cmVzczogc3RyZXNzLW5nPGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKc
hSBJUE1JIGRyaXZlciB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBJUE1JdG9vbCBsb29w
IHN0cmVzcyB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBTdG9yYWdlIGJsa3Rlc3RzPGJy
Pg0KPGJyPg0KwqAgcHBjNjRsZTo8YnI+DQrCoCDCoCBIb3N0IDE6PGJyPg0KPGJyPg0KwqAgwqAg
wqAgwqDimqEgSW50ZXJuYWwgaW5mcmFzdHJ1Y3R1cmUgaXNzdWVzIHByZXZlbnRlZCBvbmUgb3Ig
bW9yZSB0ZXN0cyAobWFya2VkPGJyPg0KwqAgwqAgwqAgwqB3aXRoIOKaoeKaoeKaoSkgZnJvbSBy
dW5uaW5nIG9uIHRoaXMgYXJjaGl0ZWN0dXJlLjxicj4NCsKgIMKgIMKgIMKgVGhpcyBpcyBub3Qg
dGhlIGZhdWx0IG9mIHRoZSBrZXJuZWwgdGhhdCB3YXMgdGVzdGVkLjxicj4NCjxicj4NCsKgIMKg
IMKgIMKg4pyFIEJvb3QgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqhIFBvZG1hbiBzeXN0
ZW0gaW50ZWdyYXRpb24gdGVzdCAtIGFzIHJvb3Q8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBQ
b2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRlc3QgLSBhcyB1c2VyPGJyPg0KwqAgwqAgwqAgwqDi
mqHimqHimqEgTFRQPGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEgTG9vcGRldiBTYW5pdHk8YnI+
DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBNZW1vcnkgZnVuY3Rpb246IG1lbWZkX2NyZWF0ZTxicj4N
CsKgIMKgIMKgIMKg4pqh4pqh4pqhIEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVzdCBVdGlsaXR5
KTxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqhIE5ldHdvcmtpbmcgYnJpZGdlOiBzYW5pdHk8YnI+
DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBFdGhlcm5ldCBkcml2ZXJzIHNhbml0eTxicj4NCsKgIMKg
IMKgIMKg4pqh4pqh4pqhIE5ldHdvcmtpbmcgTUFDc2VjOiBzYW5pdHk8YnI+DQrCoCDCoCDCoCDC
oOKaoeKaoeKaoSBOZXR3b3JraW5nIHNvY2tldDogZnV6ejxicj4NCsKgIMKgIMKgIMKg4pqh4pqh
4pqhIE5ldHdvcmtpbmcgc2N0cC1hdXRoOiBzb2Nrb3B0cyB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDi
mqHimqHimqEgTmV0d29ya2luZyByb3V0ZTogcG10dTxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqh
IE5ldHdvcmtpbmcgcm91dGVfZnVuYyAtIGxvY2FsPGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEg
TmV0d29ya2luZyByb3V0ZV9mdW5jIC0gZm9yd2FyZDxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqh
IE5ldHdvcmtpbmcgVENQOiBrZWVwYWxpdmUgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqh
IE5ldHdvcmtpbmcgVURQOiBzb2NrZXQ8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBOZXR3b3Jr
aW5nIHR1bm5lbDogZ2VuZXZlIGJhc2ljIHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBO
ZXR3b3JraW5nIHR1bm5lbDogZ3JlIGJhc2ljPGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEgTDJU
UCBiYXNpYyB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEgTmV0d29ya2luZyB0dW5uZWw6
IHZ4bGFuIGJhc2ljPGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEgTmV0d29ya2luZyBpcHNlYzog
YmFzaWMgbmV0bnMgLSB0dW5uZWw8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBhdWRpdDogYXVk
aXQgdGVzdHN1aXRlIHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBodHRwZDogbW9kX3Nz
bCBzbW9rZSBzYW5pdHk8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSB0dW5lZDogdHVuZS1wcm9j
ZXNzZXMtdGhyb3VnaC1wZXJmPGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEgQUxTQSBQQ00gbG9v
cGJhY2sgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqhIEFMU0EgQ29udHJvbCAobWl4ZXIp
IFVzZXJzcGFjZSBFbGVtZW50IHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSB0cmFjZTog
ZnRyYWNlL3RyYWNlcjxicj4NCsKgIMKgIMKgIMKg8J+apyDimqHimqHimqEgQ0lGUyBDb25uZWN0
YXRob248YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pqh4pqh4pqhIFBPU0lYIHBqZC1mc3Rlc3Qgc3Vp
dGVzPGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKaoeKaoeKaoSBqdm0gLSBEYUNhcG8gQmVuY2htYXJr
IFN1aXRlPGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKaoeKaoeKaoSBqdm0gLSBqY3N0cmVzcyB0ZXN0
czxicj4NCsKgIMKgIMKgIMKg8J+apyDimqHimqHimqEgTWVtb3J5IGZ1bmN0aW9uOiBrYXNscjxi
cj4NCsKgIMKgIMKgIMKg8J+apyDimqHimqHimqEgTFRQOiBvcGVucG9zaXggdGVzdCBzdWl0ZTxi
cj4NCsKgIMKgIMKgIMKg8J+apyDimqHimqHimqEgTmV0d29ya2luZyB2bmljOiBpcHZsYW4vYmFz
aWM8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pqh4pqh4pqhIGlvdG9wOiBzYW5pdHk8YnI+DQrCoCDC
oCDCoCDCoPCfmqcg4pqh4pqh4pqhIFVzZXggLSB2ZXJzaW9uIDEuOS0yOTxicj4NCsKgIMKgIMKg
IMKg8J+apyDimqHimqHimqEgc3RvcmFnZTogZG0vY29tbW9uPGJyPg0KPGJyPg0KwqAgwqAgSG9z
dCAyOjxicj4NCsKgIMKgIMKgIMKg4pyFIEJvb3QgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pyFIHhm
c3Rlc3RzIC0gZXh0NDxicj4NCsKgIMKgIMKgIMKg4pyFIHhmc3Rlc3RzIC0geGZzPGJyPg0KwqAg
wqAgwqAgwqDinIUgc2VsaW51eC1wb2xpY3k6IHNlcmdlLXRlc3RzdWl0ZTxicj4NCsKgIMKgIMKg
IMKg4pyFIGx2bSB0aGlucCBzYW5pdHk8YnI+DQrCoCDCoCDCoCDCoOKchSBzdG9yYWdlOiBzb2Z0
d2FyZSBSQUlEIHRlc3Rpbmc8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pyFIElQTUkgZHJpdmVyIHRl
c3Q8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pyFIElQTUl0b29sIGxvb3Agc3RyZXNzIHRlc3Q8YnI+
DQrCoCDCoCDCoCDCoPCfmqcg4pyFIFN0b3JhZ2UgYmxrdGVzdHM8YnI+DQo8YnI+DQrCoCDCoCBI
b3N0IDM6PGJyPg0KwqAgwqAgwqAgwqDinIUgQm9vdCB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDinIUg
UG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0ZXN0IC0gYXMgcm9vdDxicj4NCsKgIMKgIMKgIMKg
4pyFIFBvZG1hbiBzeXN0ZW0gaW50ZWdyYXRpb24gdGVzdCAtIGFzIHVzZXI8YnI+DQrCoCDCoCDC
oCDCoOKdjCBMVFA8YnI+DQrCoCDCoCDCoCDCoOKchSBMb29wZGV2IFNhbml0eTxicj4NCsKgIMKg
IMKgIMKg4pyFIE1lbW9yeSBmdW5jdGlvbjogbWVtZmRfY3JlYXRlPGJyPg0KwqAgwqAgwqAgwqDi
nIUgQU1UVSAoQWJzdHJhY3QgTWFjaGluZSBUZXN0IFV0aWxpdHkpPGJyPg0KwqAgwqAgwqAgwqDi
nIUgTmV0d29ya2luZyBicmlkZ2U6IHNhbml0eTxicj4NCsKgIMKgIMKgIMKg4pyFIEV0aGVybmV0
IGRyaXZlcnMgc2FuaXR5PGJyPg0KwqAgwqAgwqAgwqDinIUgTmV0d29ya2luZyBNQUNzZWM6IHNh
bml0eTxicj4NCsKgIMKgIMKgIMKg4pyFIE5ldHdvcmtpbmcgc29ja2V0OiBmdXp6PGJyPg0KwqAg
wqAgwqAgwqDinIUgTmV0d29ya2luZyBzY3RwLWF1dGg6IHNvY2tvcHRzIHRlc3Q8YnI+DQrCoCDC
oCDCoCDCoOKchSBOZXR3b3JraW5nIHJvdXRlOiBwbXR1PGJyPg0KwqAgwqAgwqAgwqDinIUgTmV0
d29ya2luZyByb3V0ZV9mdW5jIC0gbG9jYWw8YnI+DQrCoCDCoCDCoCDCoOKchSBOZXR3b3JraW5n
IHJvdXRlX2Z1bmMgLSBmb3J3YXJkPGJyPg0KwqAgwqAgwqAgwqDinIUgTmV0d29ya2luZyBUQ1A6
IGtlZXBhbGl2ZSB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDinIUgTmV0d29ya2luZyBVRFA6IHNvY2tl
dDxicj4NCsKgIMKgIMKgIMKg4pyFIE5ldHdvcmtpbmcgdHVubmVsOiBnZW5ldmUgYmFzaWMgdGVz
dDxicj4NCsKgIMKgIMKgIMKg4pyFIE5ldHdvcmtpbmcgdHVubmVsOiBncmUgYmFzaWM8YnI+DQrC
oCDCoCDCoCDCoOKchSBMMlRQIGJhc2ljIHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKchSBOZXR3b3Jr
aW5nIHR1bm5lbDogdnhsYW4gYmFzaWM8YnI+DQrCoCDCoCDCoCDCoOKchSBOZXR3b3JraW5nIGlw
c2VjOiBiYXNpYyBuZXRucyAtIHR1bm5lbDxicj4NCsKgIMKgIMKgIMKg4p2MIGF1ZGl0OiBhdWRp
dCB0ZXN0c3VpdGUgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pyFIGh0dHBkOiBtb2Rfc3NsIHNtb2tl
IHNhbml0eTxicj4NCsKgIMKgIMKgIMKg4pyFIHR1bmVkOiB0dW5lLXByb2Nlc3Nlcy10aHJvdWdo
LXBlcmY8YnI+DQrCoCDCoCDCoCDCoOKchSBBTFNBIFBDTSBsb29wYmFjayB0ZXN0PGJyPg0KwqAg
wqAgwqAgwqDinIUgQUxTQSBDb250cm9sIChtaXhlcikgVXNlcnNwYWNlIEVsZW1lbnQgdGVzdDxi
cj4NCsKgIMKgIMKgIMKg4pyFIHRyYWNlOiBmdHJhY2UvdHJhY2VyPGJyPg0KwqAgwqAgwqAgwqDw
n5qnIOKchSBDSUZTIENvbm5lY3RhdGhvbjxicj4NCsKgIMKgIMKgIMKg8J+apyDinIUgUE9TSVgg
cGpkLWZzdGVzdCBzdWl0ZXM8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pyFIGp2bSAtIERhQ2FwbyBC
ZW5jaG1hcmsgU3VpdGU8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pyFIGp2bSAtIGpjc3RyZXNzIHRl
c3RzPGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBNZW1vcnkgZnVuY3Rpb246IGthc2xyPGJyPg0K
wqAgwqAgwqAgwqDwn5qnIOKchSBMVFA6IG9wZW5wb3NpeCB0ZXN0IHN1aXRlPGJyPg0KwqAgwqAg
wqAgwqDwn5qnIOKchSBOZXR3b3JraW5nIHZuaWM6IGlwdmxhbi9iYXNpYzxicj4NCsKgIMKgIMKg
IMKg8J+apyDinIUgaW90b3A6IHNhbml0eTxicj4NCsKgIMKgIMKgIMKg8J+apyDinIUgVXNleCAt
IHZlcnNpb24gMS45LTI5PGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBzdG9yYWdlOiBkbS9jb21t
b248YnI+DQo8YnI+DQrCoCBzMzkweDo8YnI+DQrCoCDCoCBIb3N0IDE6PGJyPg0KwqAgwqAgwqAg
wqDinIUgQm9vdCB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDinIUgc2VsaW51eC1wb2xpY3k6IHNlcmdl
LXRlc3RzdWl0ZTxicj4NCsKgIMKgIMKgIMKg4pyFIHN0cmVzczogc3RyZXNzLW5nPGJyPg0KwqAg
wqAgwqAgwqDwn5qnIOKchSBTdG9yYWdlIGJsa3Rlc3RzPGJyPg0KPGJyPg0KwqAgwqAgSG9zdCAy
Ojxicj4NCsKgIMKgIMKgIMKg4pyFIEJvb3QgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pyFIFBvZG1h
biBzeXN0ZW0gaW50ZWdyYXRpb24gdGVzdCAtIGFzIHJvb3Q8YnI+DQrCoCDCoCDCoCDCoOKchSBQ
b2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRlc3QgLSBhcyB1c2VyPGJyPg0KwqAgwqAgwqAgwqDi
nYwgTFRQPGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEgTG9vcGRldiBTYW5pdHk8YnI+DQrCoCDC
oCDCoCDCoOKaoeKaoeKaoSBNZW1vcnkgZnVuY3Rpb246IG1lbWZkX2NyZWF0ZTxicj4NCsKgIMKg
IMKgIMKg4pqh4pqh4pqhIE5ldHdvcmtpbmcgYnJpZGdlOiBzYW5pdHk8YnI+DQrCoCDCoCDCoCDC
oOKaoeKaoeKaoSBFdGhlcm5ldCBkcml2ZXJzIHNhbml0eTxicj4NCsKgIMKgIMKgIMKg4pqh4pqh
4pqhIE5ldHdvcmtpbmcgTUFDc2VjOiBzYW5pdHk8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBO
ZXR3b3JraW5nIHNjdHAtYXV0aDogc29ja29wdHMgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pqh4pqh
4pqhIE5ldHdvcmtpbmcgcm91dGU6IHBtdHU8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBOZXR3
b3JraW5nIHJvdXRlX2Z1bmMgLSBsb2NhbDxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqhIE5ldHdv
cmtpbmcgcm91dGVfZnVuYyAtIGZvcndhcmQ8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBOZXR3
b3JraW5nIFRDUDoga2VlcGFsaXZlIHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBOZXR3
b3JraW5nIFVEUDogc29ja2V0PGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEgTmV0d29ya2luZyB0
dW5uZWw6IGdlbmV2ZSBiYXNpYyB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEgTmV0d29y
a2luZyB0dW5uZWw6IGdyZSBiYXNpYzxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqhIEwyVFAgYmFz
aWMgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqhIE5ldHdvcmtpbmcgdHVubmVsOiB2eGxh
biBiYXNpYzxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqhIE5ldHdvcmtpbmcgaXBzZWM6IGJhc2lj
IG5ldG5zIC0gdHJhbnNwb3J0PGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEgTmV0d29ya2luZyBp
cHNlYzogYmFzaWMgbmV0bnMgLSB0dW5uZWw8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBhdWRp
dDogYXVkaXQgdGVzdHN1aXRlIHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBodHRwZDog
bW9kX3NzbCBzbW9rZSBzYW5pdHk8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSB0dW5lZDogdHVu
ZS1wcm9jZXNzZXMtdGhyb3VnaC1wZXJmPGJyPg0KwqAgwqAgwqAgwqDimqHimqHimqEgdHJhY2U6
IGZ0cmFjZS90cmFjZXI8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pqh4pqh4pqhIENJRlMgQ29ubmVj
dGF0aG9uPGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKaoeKaoeKaoSBQT1NJWCBwamQtZnN0ZXN0IHN1
aXRlczxicj4NCsKgIMKgIMKgIMKg8J+apyDimqHimqHimqEganZtIC0gRGFDYXBvIEJlbmNobWFy
ayBTdWl0ZTxicj4NCsKgIMKgIMKgIMKg8J+apyDimqHimqHimqEganZtIC0gamNzdHJlc3MgdGVz
dHM8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pqh4pqh4pqhIE1lbW9yeSBmdW5jdGlvbjoga2FzbHI8
YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pqh4pqh4pqhIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGU8
YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pqh4pqh4pqhIE5ldHdvcmtpbmcgdm5pYzogaXB2bGFuL2Jh
c2ljPGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKaoeKaoeKaoSBpb3RvcDogc2FuaXR5PGJyPg0KwqAg
wqAgwqAgwqDwn5qnIOKaoeKaoeKaoSBVc2V4IC0gdmVyc2lvbiAxLjktMjk8YnI+DQrCoCDCoCDC
oCDCoPCfmqcg4pqh4pqh4pqhIHN0b3JhZ2U6IGRtL2NvbW1vbjxicj4NCjxicj4NCsKgIHg4Nl82
NDo8YnI+DQrCoCDCoCBIb3N0IDE6PGJyPg0KwqAgwqAgwqAgwqDinIUgQm9vdCB0ZXN0PGJyPg0K
wqAgwqAgwqAgwqDinIUgU3RvcmFnZSBTQU4gZGV2aWNlIHN0cmVzcyAtIG1wdDNzYXMgZHJpdmVy
PGJyPg0KPGJyPg0KwqAgwqAgSG9zdCAyOjxicj4NCsKgIMKgIMKgIMKg4pyFIEJvb3QgdGVzdDxi
cj4NCsKgIMKgIMKgIMKg4pyFIFN0b3JhZ2UgU0FOIGRldmljZSBzdHJlc3MgLSBtZWdhcmFpZF9z
YXM8YnI+DQo8YnI+DQrCoCDCoCBIb3N0IDM6PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqDimqEgSW50
ZXJuYWwgaW5mcmFzdHJ1Y3R1cmUgaXNzdWVzIHByZXZlbnRlZCBvbmUgb3IgbW9yZSB0ZXN0cyAo
bWFya2VkPGJyPg0KwqAgwqAgwqAgwqB3aXRoIOKaoeKaoeKaoSkgZnJvbSBydW5uaW5nIG9uIHRo
aXMgYXJjaGl0ZWN0dXJlLjxicj4NCsKgIMKgIMKgIMKgVGhpcyBpcyBub3QgdGhlIGZhdWx0IG9m
IHRoZSBrZXJuZWwgdGhhdCB3YXMgdGVzdGVkLjxicj4NCjxicj4NCsKgIMKgIMKgIMKg4pqh4pqh
4pqhIEJvb3QgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqhIHhmc3Rlc3RzIC0gZXh0NDxi
cj4NCsKgIMKgIMKgIMKg4pqh4pqh4pqhIHhmc3Rlc3RzIC0geGZzPGJyPg0KwqAgwqAgwqAgwqDi
mqHimqHimqEgc2VsaW51eC1wb2xpY3k6IHNlcmdlLXRlc3RzdWl0ZTxicj4NCsKgIMKgIMKgIMKg
4pqh4pqh4pqhIGx2bSB0aGlucCBzYW5pdHk8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBzdG9y
YWdlOiBzb2Z0d2FyZSBSQUlEIHRlc3Rpbmc8YnI+DQrCoCDCoCDCoCDCoOKaoeKaoeKaoSBzdHJl
c3M6IHN0cmVzcy1uZzxicj4NCsKgIMKgIMKgIMKg8J+apyDimqHimqHimqEgSU9NTVUgYm9vdCB0
ZXN0PGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKaoeKaoeKaoSBJUE1JIGRyaXZlciB0ZXN0PGJyPg0K
wqAgwqAgwqAgwqDwn5qnIOKaoeKaoeKaoSBJUE1JdG9vbCBsb29wIHN0cmVzcyB0ZXN0PGJyPg0K
wqAgwqAgwqAgwqDwn5qnIOKaoeKaoeKaoSBwb3dlci1tYW5hZ2VtZW50OiBjcHVwb3dlci9zYW5p
dHkgdGVzdDxicj4NCsKgIMKgIMKgIMKg8J+apyDimqHimqHimqEgU3RvcmFnZSBibGt0ZXN0czxi
cj4NCjxicj4NCsKgIMKgIEhvc3QgNDo8YnI+DQrCoCDCoCDCoCDCoOKchSBCb290IHRlc3Q8YnI+
DQrCoCDCoCDCoCDCoOKchSBQb2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRlc3QgLSBhcyByb290
PGJyPg0KwqAgwqAgwqAgwqDinIUgUG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0ZXN0IC0gYXMg
dXNlcjxicj4NCsKgIMKgIMKgIMKg4pyFIExUUDxicj4NCsKgIMKgIMKgIMKg4pyFIExvb3BkZXYg
U2FuaXR5PGJyPg0KwqAgwqAgwqAgwqDinIUgTWVtb3J5IGZ1bmN0aW9uOiBtZW1mZF9jcmVhdGU8
YnI+DQrCoCDCoCDCoCDCoOKchSBBTVRVIChBYnN0cmFjdCBNYWNoaW5lIFRlc3QgVXRpbGl0eSk8
YnI+DQrCoCDCoCDCoCDCoOKchSBOZXR3b3JraW5nIGJyaWRnZTogc2FuaXR5PGJyPg0KwqAgwqAg
wqAgwqDinIUgRXRoZXJuZXQgZHJpdmVycyBzYW5pdHk8YnI+DQrCoCDCoCDCoCDCoOKchSBOZXR3
b3JraW5nIE1BQ3NlYzogc2FuaXR5PGJyPg0KwqAgwqAgwqAgwqDinIUgTmV0d29ya2luZyBzb2Nr
ZXQ6IGZ1eno8YnI+DQrCoCDCoCDCoCDCoOKchSBOZXR3b3JraW5nIHNjdHAtYXV0aDogc29ja29w
dHMgdGVzdDxicj4NCsKgIMKgIMKgIMKg4pyFIE5ldHdvcmtpbmc6IGlnbXAgY29uZm9ybWFuY2Ug
dGVzdDxicj4NCsKgIMKgIMKgIMKg4pyFIE5ldHdvcmtpbmcgcm91dGU6IHBtdHU8YnI+DQrCoCDC
oCDCoCDCoOKchSBOZXR3b3JraW5nIHJvdXRlX2Z1bmMgLSBsb2NhbDxicj4NCsKgIMKgIMKgIMKg
4pyFIE5ldHdvcmtpbmcgcm91dGVfZnVuYyAtIGZvcndhcmQ8YnI+DQrCoCDCoCDCoCDCoOKchSBO
ZXR3b3JraW5nIFRDUDoga2VlcGFsaXZlIHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKchSBOZXR3b3Jr
aW5nIFVEUDogc29ja2V0PGJyPg0KwqAgwqAgwqAgwqDinIUgTmV0d29ya2luZyB0dW5uZWw6IGdl
bmV2ZSBiYXNpYyB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDinIUgTmV0d29ya2luZyB0dW5uZWw6IGdy
ZSBiYXNpYzxicj4NCsKgIMKgIMKgIMKg4pyFIEwyVFAgYmFzaWMgdGVzdDxicj4NCsKgIMKgIMKg
IMKg4pyFIE5ldHdvcmtpbmcgdHVubmVsOiB2eGxhbiBiYXNpYzxicj4NCsKgIMKgIMKgIMKg4pyF
IE5ldHdvcmtpbmcgaXBzZWM6IGJhc2ljIG5ldG5zIC0gdHJhbnNwb3J0PGJyPg0KwqAgwqAgwqAg
wqDinIUgTmV0d29ya2luZyBpcHNlYzogYmFzaWMgbmV0bnMgLSB0dW5uZWw8YnI+DQrCoCDCoCDC
oCDCoOKdjCBhdWRpdDogYXVkaXQgdGVzdHN1aXRlIHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKchSBo
dHRwZDogbW9kX3NzbCBzbW9rZSBzYW5pdHk8YnI+DQrCoCDCoCDCoCDCoOKchSB0dW5lZDogdHVu
ZS1wcm9jZXNzZXMtdGhyb3VnaC1wZXJmPGJyPg0KwqAgwqAgwqAgwqDinIUgcGNpdXRpbHM6IHNh
bml0eSBzbW9rZSB0ZXN0PGJyPg0KwqAgwqAgwqAgwqDinIUgQUxTQSBQQ00gbG9vcGJhY2sgdGVz
dDxicj4NCsKgIMKgIMKgIMKg4pyFIEFMU0EgQ29udHJvbCAobWl4ZXIpIFVzZXJzcGFjZSBFbGVt
ZW50IHRlc3Q8YnI+DQrCoCDCoCDCoCDCoOKchSBzdG9yYWdlOiBTQ1NJIFZQRDxicj4NCsKgIMKg
IMKgIMKg4pyFIHRyYWNlOiBmdHJhY2UvdHJhY2VyPGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBD
SUZTIENvbm5lY3RhdGhvbjxicj4NCsKgIMKgIMKgIMKg8J+apyDinIUgUE9TSVggcGpkLWZzdGVz
dCBzdWl0ZXM8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pyFIGp2bSAtIERhQ2FwbyBCZW5jaG1hcmsg
U3VpdGU8YnI+DQrCoCDCoCDCoCDCoPCfmqcg4pyFIGp2bSAtIGpjc3RyZXNzIHRlc3RzPGJyPg0K
wqAgwqAgwqAgwqDwn5qnIOKchSBNZW1vcnkgZnVuY3Rpb246IGthc2xyPGJyPg0KwqAgwqAgwqAg
wqDwn5qnIOKchSBMVFA6IG9wZW5wb3NpeCB0ZXN0IHN1aXRlPGJyPg0KwqAgwqAgwqAgwqDwn5qn
IOKchSBOZXR3b3JraW5nIHZuaWM6IGlwdmxhbi9iYXNpYzxicj4NCsKgIMKgIMKgIMKg8J+apyDi
nIUgaW90b3A6IHNhbml0eTxicj4NCsKgIMKgIMKgIMKg8J+apyDinIUgVXNleCAtIHZlcnNpb24g
MS45LTI5PGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBzdG9yYWdlOiBkbS9jb21tb248YnI+DQo8
YnI+DQrCoCDCoCBIb3N0IDU6PGJyPg0KwqAgwqAgwqAgwqDinIUgQm9vdCB0ZXN0PGJyPg0KwqAg
wqAgwqAgwqDinIUgeGZzdGVzdHMgLSBleHQ0PGJyPg0KwqAgwqAgwqAgwqDinIUgeGZzdGVzdHMg
LSB4ZnM8YnI+DQrCoCDCoCDCoCDCoOKchSBzZWxpbnV4LXBvbGljeTogc2VyZ2UtdGVzdHN1aXRl
PGJyPg0KwqAgwqAgwqAgwqDinIUgbHZtIHRoaW5wIHNhbml0eTxicj4NCsKgIMKgIMKgIMKg4pyF
IHN0b3JhZ2U6IHNvZnR3YXJlIFJBSUQgdGVzdGluZzxicj4NCsKgIMKgIMKgIMKg4pyFIHN0cmVz
czogc3RyZXNzLW5nPGJyPg0KwqAgwqAgwqAgwqDwn5qnIOKchSBJT01NVSBib290IHRlc3Q8YnI+
DQrCoCDCoCDCoCDCoPCfmqcg4pyFIFN0b3JhZ2UgYmxrdGVzdHM8YnI+DQo8YnI+DQrCoCBUZXN0
IHNvdXJjZXM6IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9DS0ktcHJvamVjdC90ZXN0cy1i
ZWFrZXIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNv
bS9DS0ktcHJvamVjdC90ZXN0cy1iZWFrZXI8L2E+PGJyPg0KwqAgwqAg8J+SmiBQdWxsIHJlcXVl
c3RzIGFyZSB3ZWxjb21lIGZvciBuZXcgdGVzdHMgb3IgaW1wcm92ZW1lbnRzIHRvIGV4aXN0aW5n
IHRlc3RzITxicj4NCjxicj4NCkFib3J0ZWQgdGVzdHM8YnI+DQotLS0tLS0tLS0tLS0tPGJyPg0K
VGVzdHMgdGhhdCBkaWRuJiMzOTt0IGNvbXBsZXRlIHJ1bm5pbmcgc3VjY2Vzc2Z1bGx5IGFyZSBt
YXJrZWQgd2l0aCDimqHimqHimqEuPGJyPg0KSWYgdGhpcyB3YXMgY2F1c2VkIGJ5IGFuIGluZnJh
c3RydWN0dXJlIGlzc3VlLCB3ZSB0cnkgdG8gbWFyayB0aGF0PGJyPg0KZXhwbGljaXRseSBpbiB0
aGUgcmVwb3J0Ljxicj4NCjxicj4NCldhaXZlZCB0ZXN0czxicj4NCi0tLS0tLS0tLS0tLTxicj4N
CklmIHRoZSB0ZXN0IHJ1biBpbmNsdWRlZCB3YWl2ZWQgdGVzdHMsIHRoZXkgYXJlIG1hcmtlZCB3
aXRoIPCfmqcuIFN1Y2ggdGVzdHMgYXJlPGJyPg0KZXhlY3V0ZWQgYnV0IHRoZWlyIHJlc3VsdHMg
YXJlIG5vdCB0YWtlbiBpbnRvIGFjY291bnQuIFRlc3RzIGFyZSB3YWl2ZWQgd2hlbjxicj4NCnRo
ZWlyIHJlc3VsdHMgYXJlIG5vdCByZWxpYWJsZSBlbm91Z2gsIGUuZy4gd2hlbiB0aGV5JiMzOTty
ZSBqdXN0IGludHJvZHVjZWQgb3IgYXJlPGJyPg0KYmVpbmcgZml4ZWQuPGJyPg0KPGJyPg0KVGVz
dGluZyB0aW1lb3V0PGJyPg0KLS0tLS0tLS0tLS0tLS0tPGJyPg0KV2UgYWltIHRvIHByb3ZpZGUg
YSByZXBvcnQgd2l0aGluIHJlYXNvbmFibGUgdGltZWZyYW1lLiBUZXN0cyB0aGF0IGhhdmVuJiMz
OTt0PGJyPg0KZmluaXNoZWQgcnVubmluZyB5ZXQgYXJlIG1hcmtlZCB3aXRoIOKPsS48YnI+DQo8
YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+DQo=
--000000000000839cb705a07d23d7--


--===============0905894738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0905894738==--

