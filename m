Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A5C2F4245
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 04:14:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B2BC3C54C4
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 04:14:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id F26193C26DD
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 04:14:12 +0100 (CET)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E7F221A00242
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 04:14:11 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id e7so892653ljg.10
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 19:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UNVPmvX++k3sT6IkBx6wwpMSharrZ+yUn9I9az97TXs=;
 b=BGieEyRqaEYHSH9mbA984qTTodZaWhzoZqlZu243gsMhYLHXX3iU1SxKAlrHugXA8n
 c5rFKIxAFuUkVvJsBNoGTmPmJ6spDYhpt2c95yPLoNzz5iw6aiYCSl3d4wM5aGsrgfhK
 fSlcw9YY5hv74Vbn7VfxXVXJPLC5YHTmFH0bnooXd/pjlSMIDXkRK7lRPwHFtETQnZhP
 Qq6/UgDdd4Dkb5fUWLTsL3hYwf3Q3J8QcYmE4m1/M242l1JE4sbfNtfJNt6sg/WvdHKs
 FjsiByROHjGx5gz5GFGCePuEAxsRdMcNV4W4Zp/LBQ9eRWwug90PIA3eBY6eFDBzVkiW
 cS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UNVPmvX++k3sT6IkBx6wwpMSharrZ+yUn9I9az97TXs=;
 b=BNjETY054/dYlT8LToJiYDK7ngy98uYR+UE7Z+6xj2vzVBHZwoH3R85pFKpSUwSGhM
 1bAOqBlnkhOECU/VpzRHvN79XRuISV/YZfOvBhN+8MXQ+oVrQ+8gtjYWpy+VGLJmS1Ou
 mtwejoII0PctQTd0gFzHgVqpOA93IVgHsStB8eo1OgBKpIJ3ugeuq3xa86lm/zNW/diY
 ealOBJosKuazCo+25Oia1F27D9dqg1YsVOZAvPMaMMSGUaCPqCyNmvtwS4JhdQGrvrRq
 C74THDoPCz7VjFScSM2Zqf0OoM7lCO8eGmmEzfjKmBx2gJQDFwTmtGM8jqTLn3xt7J3t
 qcjw==
X-Gm-Message-State: AOAM531se/MPRbK82RK8WoWimIYZoyOO9EP6e3oEfeEhwsi5ihY02FzW
 PVBts82GKtNt2w6TjlPT4ozeH4zvGqQwXtq5KiMH2mB968akL8TgeXb14A==
X-Google-Smtp-Source: ABdhPJyZ6zPzUrdIGPT/s1uqb38ko4tRZTmX6PK3lxQpKuJUswNWr0iJde+eneMqg+RZB4S5ZdAUlTyCPKs9G/UBE10=
X-Received: by 2002:a2e:b5dc:: with SMTP id g28mr1035934ljn.112.1610507651030; 
 Tue, 12 Jan 2021 19:14:11 -0800 (PST)
MIME-Version: 1.0
From: yu tian <tianyucode9603@gmail.com>
Date: Wed, 13 Jan 2021 11:13:56 +0800
Message-ID: <CADMex3NYVLxiFsRKOFSXw+yD77fPmtBs2jccRQ8LYuVvZpxnqA@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] PCI test of ltp: wrong device was scanned
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
Content-Type: multipart/mixed; boundary="===============2022497587=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2022497587==
Content-Type: multipart/alternative; boundary="00000000000072a44005b8bf8814"

--00000000000072a44005b8bf8814
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,all

I have some questions about PCI testing.
testcases/kernel/device-drivers/pci/tpci_user/tpci.c ->static void
test_run(void)   ,the code scan the devices on a bus one by one,then it
calls pci_scan_slot() in kernel.But A PCIe device has only 8 functions.
Isn=E2=80=99t it possible to scan the next device here?

For example, on the problematic machine:

1. When traversing to the 8.1 device, it will scan to 9.0 by mistake, and
then the kernel will turn 9.0 into a multi-function device (the 9.0 device
is a single-function device)

2. When traversing to the 8.2 device, call pci_rescan_bus in test-case 6 of
the ltp test program to scan all devices on bus 0. At this time, when the
9.0 device is accessed, it is judged to be a multi-function device, and the
subsequent functions are accessed. Before accessing the function, it will
first judge the vendor id. If it is 0xFFFF, it means that the function does
not exist. However, at this time, it is found that the vendor id of 9.1
exists and is the same as 9.0 (it should be 0xffff), so the kernel
recognizes 9.1. Next, I reconfigured 9.1 and assigned its next level of bus
to bus 4. In fact, bus 4 does not exist (the serial port log is as follows)

[ 4218.291890][ 0] ltp_tpci: found pci_dev '0000:00:08.2', bus 0, devfn 66
[ 4218.298560][ 0] ltp_tpci: Bus number: 0 [ 4218.302503][ 0] ltp_tpci:
test-case 1 [ 4218.306232][ 0] ltp_tpci: enable pci device [ 4218.310482][
0] ltp_tpci: enabled pci device [ 4218.314919][ 0] ltp_tpci: test-case 2 [
4218.318679][ 0] ltp_tpci: find bus [ 4218.322164][ 0] ltp_tpci: success
returned bus pointer [ 4218.327538][ 0] ltp_tpci: test-case 3 [
4218.331271][ 0] ltp_tpci: get pci device [ 4218.335266][ 0] ltp_tpci:
found pci device from device info [ 4218.340974][ 0] ltp_tpci: test-case 4
[ 4218.344709][ 0] ltp_tpci: find pci class [ 4218.348740][ 0] ltp_tpci:
found pci device from class number [ 4218.354664][ 0] ltp_tpci: test-case 5
[ 4218.358387][ 0] ltp_tpci: get pci subsys [ 4218.362383][ 0] ltp_tpci:
found pci device from subsys info [ 4218.368070][ 0] ltp_tpci: test-case 6
[ 4218.371802][ 0] ltp_tpci: scan pci bus [ 4218.375816][ 0] pci
0000:00:09.1: [Firmware Bug]: reg 0x10: invalid BAR (can't size) [
4218.384249][ 0] pci 0000:00:09.1: bridge configuration invalid ([bus
00-00]), reconfiguring [ 4218.393594][ 0] pci 0000:00:09.1: PCI bridge to
[bus 04] [ 4218.399043][ 0] pcieport 0000:00:09.1: Device 14:7a19, irq 96 [
4218.405064][ 0] pcieport 0000:00:09.1: Signaling PME with IRQ 133 [
4218.411336][ 1] ltp_tpci: success scan bus [ 4218.415692][ 1] ltp_tpci:
test-case 7 [ 4218.419500][ 1] ltp_tpci: scan pci slot

I think although there may be problems with PCI devices(vendor id of 9.1),
is the ltp test correct?

--00000000000072a44005b8bf8814
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p><span style=3D"color:rgb(36,41,46);font-family:-apple-s=
ystem,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&q=
uot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">Hi,a=
ll</span></p>
      <p><span style=3D"color:rgb(36,41,46);font-family:-apple-system,Blink=
MacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple C=
olor Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">I have some
          questions about PCI testing.</span><span style=3D"color:rgb(36,41=
,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helv=
etica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&q=
uot;;font-size:14px"></span><br>
      </p>
      <span style=3D"color:rgb(36,41,46)">testcases/kernel/device-drivers/p=
ci/tpci_user/tpci.c
          -&gt;static void test_run(void)=C2=A0=C2=A0 ,the
          code scan the devices on a bus one by one,</span><code style=3D"b=
ox-sizing:border-box;font-family:SFMono-Regular,Consolas,&quot;Liberation M=
ono&quot;,Menlo,monospace;font-size:12px;padding:0px;margin:0px;background:=
initial;border-radius:6px;word-break:normal;white-space:pre;border:0px;disp=
lay:inline;overflow:visible;line-height:inherit"><span style=3D"color:rgb(3=
6,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,=
Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emo=
ji&quot;;font-size:14px;white-space:normal">then it calls pci_scan_slot() i=
n kernel.</span></code><code style=3D"box-sizing:border-box;font-family:SFM=
ono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:=
12px;padding:0px;margin:0px;background:initial;border-radius:6px;word-break=
:normal;white-space:pre;border:0px;display:inline;overflow:visible;line-hei=
ght:inherit"><span style=3D"color:rgb(36,41,46);font-family:-apple-system,B=
linkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;App=
le Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;white-space:=
normal">But A PCIe device has only 8 functions. Isn=E2=80=99t it possible t=
o scan the next device here?</span></code>
      <p><code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Co=
nsolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;padding:0=
px;margin:0px;background:initial;border-radius:6px;word-break:normal;white-=
space:pre;border:0px;display:inline;overflow:visible;line-height:inherit"><=
span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemF=
ont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji=
&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;white-space:normal">For ex=
ample, on the problematic machine:=C2=A0</span></code></p><p><code style=3D=
"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&quot;Liberation=
 Mono&quot;,Menlo,monospace;font-size:12px;padding:0px;margin:0px;backgroun=
d:initial;border-radius:6px;word-break:normal;white-space:pre;border:0px;di=
splay:inline;overflow:visible;line-height:inherit"><span style=3D"color:rgb=
(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot=
;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI E=
moji&quot;;font-size:14px;white-space:normal">1. When traversing to the 8.1=
 device, it will scan to 9.0 by mistake, and then the kernel will turn 9.0 =
into a multi-function device (the 9.0 device is a single-function device)=
=C2=A0</span></code></p><p><code style=3D"box-sizing:border-box;font-family=
:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-s=
ize:12px;padding:0px;margin:0px;background:initial;border-radius:6px;word-b=
reak:normal;white-space:pre;border:0px;display:inline;overflow:visible;line=
-height:inherit"><span style=3D"color:rgb(36,41,46);font-family:-apple-syst=
em,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot=
;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;white-sp=
ace:normal">2. When traversing to the 8.2 device, call pci_rescan_bus in te=
st-case 6 of the ltp test program to scan all devices on bus 0. At this tim=
e, when the 9.0 device is accessed, it is judged to be a multi-function dev=
ice, and the subsequent functions are accessed. Before accessing the functi=
on, it will first judge the vendor id. If it is 0xFFFF, it means that the f=
unction does not exist. However, at this time, it is found that the vendor =
id of 9.1 exists and is the same as 9.0 (it should be 0xffff), so the kerne=
l recognizes 9.1. Next, I reconfigured 9.1 and assigned its next level of b=
us to bus 4. In fact, bus 4 does not exist (the serial port log is as follo=
ws)</span></code></p>
      <p><span style=3D"color:rgb(33,33,33);font-family:&quot;Roboto Mono&q=
uot;,&quot;SF Mono&quot;,&quot;Lucida Console&quot;,Monaco,monospace;font-s=
ize:13.006px;white-space:pre-wrap">[ 4218.291890][  0] ltp_tpci: found pci_=
dev &#39;0000:00:08.2&#39;, bus 0, devfn 66
[ 4218.298560][  0] ltp_tpci: Bus number: 0
[ 4218.302503][  0] ltp_tpci: test-case 1
[ 4218.306232][  0] ltp_tpci: enable pci device
[ 4218.310482][  0] ltp_tpci: enabled pci device
[ 4218.314919][  0] ltp_tpci: test-case 2
[ 4218.318679][  0] ltp_tpci: find bus
[ 4218.322164][  0] ltp_tpci: success returned bus pointer
[ 4218.327538][  0] ltp_tpci: test-case 3
[ 4218.331271][  0] ltp_tpci: get pci device
[ 4218.335266][  0] ltp_tpci: found pci device from device info
[ 4218.340974][  0] ltp_tpci: test-case 4
[ 4218.344709][  0] ltp_tpci: find pci class
[ 4218.348740][  0] ltp_tpci: found pci device from class number
[ 4218.354664][  0] ltp_tpci: test-case 5
[ 4218.358387][  0] ltp_tpci: get pci subsys
[ 4218.362383][  0] ltp_tpci: found pci device from subsys info
[ 4218.368070][  0] ltp_tpci: test-case 6
[ 4218.371802][  0] ltp_tpci: scan pci bus
[ 4218.375816][  0] pci 0000:00:09.1: [Firmware Bug]: reg 0x10: invalid BAR=
 (can&#39;t size)
[ 4218.384249][  0] pci 0000:00:09.1: bridge configuration invalid ([bus 00=
-00]), reconfiguring
[ 4218.393594][  0] pci 0000:00:09.1: PCI bridge to [bus 04]
[ 4218.399043][  0] pcieport 0000:00:09.1: Device 14:7a19, irq 96
[ 4218.405064][  0] pcieport 0000:00:09.1: Signaling PME with IRQ 133
[ 4218.411336][  1] ltp_tpci: success scan bus
[ 4218.415692][  1] ltp_tpci: test-case 7
[ 4218.419500][  1] ltp_tpci: scan pci slot</span><br>
        <code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Con=
solas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;padding:0p=
x;margin:0px;background:initial;border-radius:6px;word-break:normal;white-s=
pace:pre;border:0px;display:inline;overflow:visible;line-height:inherit"><s=
pan style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFo=
nt,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&=
quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;white-space:normal"></span>=
</code></p>
      <p><code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Co=
nsolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;padding:0=
px;margin:0px;background:initial;border-radius:6px;word-break:normal;white-=
space:pre;border:0px;display:inline;overflow:visible;line-height:inherit"><=
span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemF=
ont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji=
&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;white-space:normal">
</span></code></p>
      <p><code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Co=
nsolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;padding:0=
px;margin:0px;background:initial;border-radius:6px;word-break:normal;white-=
space:pre;border:0px;display:inline;overflow:visible;line-height:inherit"><=
span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemF=
ont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji=
&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;white-space:normal">I thin=
k although there may be problems with PCI devices(vendor id of 9.1), is the=
 ltp test correct?=C2=A0</span></code></p></div>

--00000000000072a44005b8bf8814--

--===============2022497587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2022497587==--
