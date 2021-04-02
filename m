Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF4D354D71
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 09:11:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9E383C1E0A
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 09:11:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 331A03C0214
 for <ltp@lists.linux.it>; Fri,  2 Apr 2021 03:46:27 +0200 (CEST)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B4FE51001169
 for <ltp@lists.linux.it>; Fri,  2 Apr 2021 03:46:26 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id c3so4196888qkc.5
 for <ltp@lists.linux.it>; Thu, 01 Apr 2021 18:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vWC987i6cqx2cB4LwEcAbXdy1jp27GPHDkjQlfYuWks=;
 b=DWLPxyaCpft+xtL0dPNMzvjtgVtbX658eTl30fGjEb6MEDoIPGUixqxQynJ0vY03Vl
 eAHAazsZRi5uYBEduxhTg5qcpu0CDCvx/DRYeLHHohWx8CDzR5dDPminFQ/v23+CuDkZ
 1/XWjOloBiuWLvPuQYQPnDpURqtz3ZRSK4lR86Mzebz+lgXKO3+e6xk0ihwabzO6yYpC
 ITfypnQ/hQpNzqlYr0KA2eH/9rWdjPQ2T5AAnYgK3XJAEFAxaGMVRP/Ui7ArzAe36HP2
 6hc2jznFK4iokfldQw2RdFbRx4DzNsX3NiWMbvboeX6+6MdkrAaRxM1PvD/RcQsl8tAj
 s5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vWC987i6cqx2cB4LwEcAbXdy1jp27GPHDkjQlfYuWks=;
 b=CrR7JVzYtLT/tCsTxcRuLMLqvdVcnkCFFureIE4P73TXvqn6GS/ZVSnCV2RfZog1Mo
 hmtOERlObjgudyd0XRMrHINVPrYpyDXE/xcO1LtGFm9Pa0tD0oDUoLbD4RWMqdW8pKzV
 9xdul3GmyF56apBg1BQ57dP05PjJ/ZVwzFU8PHGe3E7quSsaDBMAtYKq3mNCUhOg5v3q
 yKvILQFsVV9iu1WyvA7IKtijPKVaHv+KEmYp1uU4LojR6BH+s1ujxTq7vUFhK0wtKAiV
 mkfpnsAuCuZXjG4dpenKhQNrb+EnuhwiQrLKtdy2z3F/pRZ/ULQfvrEwnmR3s0aG8VsU
 LopQ==
X-Gm-Message-State: AOAM533B/TMX3LG+p807Jq+aFy94ZtUg3fIaEt/xhFUD3kErGtATHcvh
 gCqCz413p9lnkV8EOyjhajoCrZlHAlw/RFj6WIR72Xb1E37ZqA==
X-Google-Smtp-Source: ABdhPJws/Fvn0f3suYhIFuFjt88/3vb2kVIj4MCgSoyxi8YkKVNM6WItmI+a/RZMP1Lrfqc65bLaenFhTaLCo/Au+3Y=
X-Received: by 2002:a37:2c41:: with SMTP id s62mr11149418qkh.205.1617327985273; 
 Thu, 01 Apr 2021 18:46:25 -0700 (PDT)
MIME-Version: 1.0
From: Vinay Kumar <vinay.m.engg@gmail.com>
Date: Fri, 2 Apr 2021 07:16:14 +0530
Message-ID: <CANUMPcWbZ6dHNvFS4z=TOPqYfi_qscw8V_Bvti_Aam7iVcDfPQ@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 06 Apr 2021 09:11:07 +0200
Subject: [LTP] "TBROK: Test killed by SIGSEGV" with adjtimex02.cv
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
Cc: umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: multipart/mixed; boundary="===============2070944689=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2070944689==
Content-Type: multipart/alternative; boundary="0000000000000c2eea05bef384fc"

--0000000000000c2eea05bef384fc
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Below list of tests are failing with error message "BROK: Test killed by
SIGSEGV"


   1. adjtimex02
   2. getitimer02
   3. getrusage02
   4. msgctl04
   5. setitimer02
   6. shmctl02


Further analysis found that the root cause of failures are due to
"Cannot access memory at address 0xffffffff".

$cat getitimer02.c
/* call with a bad address */
TEST(getitimer(ITIMER_REAL, (struct itimerval *)-1));

#Debugging on image gives

Breakpoint 2, __getitimer (which=ITIMER_REAL, curr_value=0xffffffff) at
../sysdeps/unix/sysv/linux/getitimer.c:33
33 ../sysdeps/unix/sysv/linux/getitimer.c: No such file or directory.
(gdb) n
50 in ../sysdeps/unix/sysv/linux/getitimer.c
(gdb) p curr_value
$3 = (struct itimerval *) 0xffffffff
(gdb) p *curr_value
Cannot access memory at address 0xffffffff

Please let us know whether we need to handle SIGSEGV in above listed
testcases or we need to work on glibc for the fix.

This behavior is observed with glibc-2.32 version and above.

Regards,
Vinay

--0000000000000c2eea05bef384fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,<br><br>Below list of tests are failing with error=
 message &quot;BROK: Test killed by SIGSEGV&quot;<br><br><ol><li>adjtimex02=
</li><li>getitimer02</li><li>getrusage02</li><li>msgctl04</li><li>setitimer=
02</li><li>shmctl02</li></ol><br>Further analysis found that the root cause=
 of failures are due to<br>&quot;Cannot access memory at address 0xffffffff=
&quot;.<br><br>$cat getitimer02.c =C2=A0<br>/* call with a bad address */<b=
r>TEST(getitimer(ITIMER_REAL, (struct itimerval *)-1));<br><br>#Debugging o=
n image gives<br><br>Breakpoint 2, __getitimer (which=3DITIMER_REAL, curr_v=
alue=3D0xffffffff) at ../sysdeps/unix/sysv/linux/getitimer.c:33<br>33 ../sy=
sdeps/unix/sysv/linux/getitimer.c: No such file or directory.<br>(gdb) n<br=
>50 in ../sysdeps/unix/sysv/linux/getitimer.c<br>(gdb) p curr_value<br>$3 =
=3D (struct itimerval *) 0xffffffff<br>(gdb) p *curr_value<br>Cannot access=
 memory at address 0xffffffff<br><br>Please let us know whether we need to =
handle SIGSEGV in above listed testcases or we need to work on glibc for th=
e fix.<br><br>This behavior is observed with glibc-2.32 version and above.<=
br><br>Regards,<br>Vinay </div>

--0000000000000c2eea05bef384fc--

--===============2070944689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2070944689==--
