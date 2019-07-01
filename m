Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3E5B60D
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 09:51:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04EC93C1DC3
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 09:51:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 506F33C1C72
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 09:51:05 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 021EC600733
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 09:51:06 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id h28so8249526vsl.12
 for <ltp@lists.linux.it>; Mon, 01 Jul 2019 00:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=GpwAxY639DtQWT56/cqw0V1d1KRsNCstuL7yMs1SMLE=;
 b=D/or1lxid/icl9V7IXT0/POQeLI1q2I9irf77X91xqeIEsMI25UkaK0ZG5b7/RDMTI
 g5MbSowKxNP1ChDGPUWos5anGuwDNGfa3+JdneqKQl2JBy6x51weN3Fn5sspYxZjjnrC
 THRiMlvYNa4IW6zrCH8E1PPTTeS+j/S+AQ0EAr0jZgWi5z8Boqrl46yHxj0dmGdUVtsw
 hKRxiqGvkE5rj4XcLhmc0FJhNtSVOtIJhClKV8yY94J3ZWnSDjFfggotZpeymnMWIKSd
 25kwaqfGOplKHhLf6drbw21u0AlGfO1+I6ZrbivXtqibaDmxG6eM1GoAOEEjZRV56ENg
 zFfQ==
X-Gm-Message-State: APjAAAW46LN0H7Ea24if4aPdQ41QyU1uS93fDoNmy79CMsVvVUyIKtmu
 Kx5Y5rFWlPzCt9aH69Nx2fAwhAVNUsP+d5rJfhJIRztS9vY=
X-Google-Smtp-Source: APXvYqzIGiy03icpM4fxGeEGJNcgIhCUud9IwzVdbgFLXOjTv+iwtKllqr9NqqiJXuEGAhZvmANUmjgGjFgirrxyv/s=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr14210873vsq.179.1561967463266; 
 Mon, 01 Jul 2019 00:51:03 -0700 (PDT)
MIME-Version: 1.0
From: Li Wang <liwang@redhat.com>
Date: Mon, 1 Jul 2019 15:50:52 +0800
Message-ID: <CAEemH2cg01cdz=amrCWU00Xof9+cxmfR_DqCBaQe36QoGsakmA@mail.gmail.com>
To: ricardo.neri-calderon@linux.intel.com, pbonzini@redhat.com, 
 tglx@linutronix.de, kernellwp@gmail.com, ricardo.neri@intel.com, 
 pengfei.xu@intel.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [Kernel BUG?] SMSW operation get success on UMIP KVM guest
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>,
 Ping Fang <pifang@redhat.com>
Content-Type: multipart/mixed; boundary="===============0627566899=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0627566899==
Content-Type: multipart/alternative; boundary="000000000000cc9bcf058c99e38d"

--000000000000cc9bcf058c99e38d
Content-Type: text/plain; charset="UTF-8"

Hello there,

LTP/umip_basic_test get failed on KVM UMIP system(kernel-v5.2-rc4.x86_64).
The test is only trying to do
     asm volatile("smsw %0\n" : "=m" (val));
and expect to get SIGSEGV in this SMSW operation, but it exits with 0
unexpectedly.

====================
# grep CONFIG_X86_INTEL_UMIP /boot/config-5.2.0-0.rc4.x86_64
CONFIG_X86_INTEL_UMIP=y

# lscpu |grep umip
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp
lm constant_tsc rep_good nopl xtopology cpuid tsc_known_freq pni pclmulqdq
ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer
aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch cpuid_fault
invpcid_single pti ssbd ibrs ibpb stibp fsgsbase tsc_adjust bmi1 hle avx2
smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt
clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves arat umip
pku ospke md_clear

# ./umip_basic_test
...
umip_basic_test.c:68: INFO: TEST smsw, smsw result save at [0x7ffda00dca70]
umip_basic_test.c:118: FAIL: Didn't receive SIGSEGV, child exited with
exited with 0

You also could try this simplify reproducer:
----------------
#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>

int main (void)
{
        int status;
        pid_t pid;

        pid = fork();
        if (pid == 0) {
                unsigned long val;
                printf("TEST smsw, smsw result save at [%p]\n", &val);
                asm volatile("smsw %0\n" : "=m" (val));
                exit(0);
        }

        waitpid(pid, &status, 0);

        if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
                printf("PASS: Got SIGSEGV\n");
                return 0;
        }

        printf("FAIL: Didn't receive SIGSEGV, child exited with %d\n",
WEXITSTATUS(status));
        return -1;
}

-- 
Regards,
Li Wang

--000000000000cc9bcf058c99e38d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hel=
lo there,</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">LTP/umip_basic_=
test get failed on KVM UMIP system(kernel-v5.2-rc4.x86_64). The test is onl=
y trying to do</div><div class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 =C2=A0 =C2=A0asm volatile(&quot;smsw %0\n&quot; : &quot;=3Dm&quot; (=
val));</div><div class=3D"gmail_default" style=3D"font-size:small">and expe=
ct to get SIGSEGV in this SMSW operation, but it exits with 0 unexpectedly.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"># grep CONFIG_X86_INTEL_UMIP /boot/config-5.2.0-0.rc4=
.x86_64 <br>CONFIG_X86_INTEL_UMIP=3Dy<br></div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small"># lscpu |grep umip<br>Flags: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge m=
ca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm=
 constant_tsc rep_good nopl xtopology cpuid tsc_known_freq pni pclmulqdq ss=
se3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes =
xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch cpuid_fault invp=
cid_single pti ssbd ibrs ibpb stibp fsgsbase tsc_adjust bmi1 hle avx2 smep =
bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb =
avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves arat umip pku osp=
ke md_clear<br></div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small"># ./umip_=
basic_test=C2=A0</div><span class=3D"gmail_default" style=3D"font-size:smal=
l">...</span><br>umip_basic_test.c:68: INFO: TEST smsw, smsw result save at=
 [0x7ffda00dca70]<br>umip_basic_test.c:118: FAIL: Didn&#39;t receive SIGSEG=
V, child exited with exited with 0<br><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">You also could try this simplify repr=
oducer:</div><div class=3D"gmail_default" style=3D"font-size:small">-------=
---------</div>#define _GNU_SOURCE<br>#include &lt;unistd.h&gt;<br>#include=
 &lt;stdio.h&gt;<br>#include &lt;stdlib.h&gt;<br>#include &lt;sys/wait.h&gt=
;<br><br>int main (void)<br>{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 int status;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid_t pid;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
pid =3D fork();<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pid =3D=3D 0) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long val;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;TEST s=
msw, smsw result save at [%p]\n&quot;, &amp;val);<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asm volatile(&quot;smsw %0\n&quot; : &qu=
ot;=3Dm&quot; (val));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 exit(0);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 waitpid(pid, &amp;status, 0);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if (WIFSIGNALED(status) &amp;&amp; WTERMSIG(status) =3D=3D SIGSEGV) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;PASS: =
Got SIGSEGV\n&quot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 printf(&quot;FAIL: Didn&#39;t receive SIGSEGV, child exited with=
 %d\n&quot;, WEXITSTATUS(status));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1=
;<br>}<br><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br></div></div></div></div>

--000000000000cc9bcf058c99e38d--

--===============0627566899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0627566899==--
