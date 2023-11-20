Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 695317F0D3B
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Nov 2023 09:12:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76D283CE1CC
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Nov 2023 09:12:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 957763C20C4
 for <ltp@lists.linux.it>; Mon, 20 Nov 2023 09:12:18 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8819B6003BB
 for <ltp@lists.linux.it>; Mon, 20 Nov 2023 09:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700467935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=lagdL2uvS1/bw5mjWHY4OFBk6B/x76rxBkJeb2OhiG4=;
 b=aGAf29em787YRFmdkvCuZ0siEGEasWW341D4a40iw27v1c3lvmFnVCe45LEo3I9xr4YN1H
 Iz3/X/OnRuoVWuIyN0pa0lyATCe2AlgsxG64Hg9qNIzxd2EJv83QCcak8tyz3RFhVuzk3k
 U1Znx4Snvt/RNdjr5+SmLJHR12/Zz38=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-XZEuPUysPnqAs97HshFOeg-1; Mon, 20 Nov 2023 03:12:13 -0500
X-MC-Unique: XZEuPUysPnqAs97HshFOeg-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-50aa9e4f845so1269806e87.1
 for <ltp@lists.linux.it>; Mon, 20 Nov 2023 00:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700467930; x=1701072730;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lagdL2uvS1/bw5mjWHY4OFBk6B/x76rxBkJeb2OhiG4=;
 b=VwW4qrI2IlXk2VzqPY1TfixCZh8s8ply37NuNNzTA1l5PibAd6Twb0PnEfgzMTlM0I
 2B+fyxrpGCuSn/v7znUCBOSXbVPGq8dE5EEpZqTjfIbubT/bHjGWBU1zKT2kwgtKHoJv
 HH9b1c2DGDz080FbA4ApuyLrC0dSIDhx96iaVS+4wxg/wbAN/0MMLAhdn9JXGQdY9eL5
 /n3XNZVxzpQ73+jdvAVVO+DNJJuSHFpxCdrsx8SkSJeqJPpftn1NkWPcWsURn0Q2cPd1
 XXJ8+NHL4FDI8LyTqlx0StcamsD3aIBcwFEWEychncCY3vKDhMuQHGaLBaGPOlVtIqTN
 sNhA==
X-Gm-Message-State: AOJu0YyexjvxNzeDdhv0F7PaTeMBQYg1MOE4m9RSHURV8HVkGtNBeVBY
 yOlb7AF3tzDNXuuBQLTBcIiF2UB8x/bR4mhg1bF4pmMcoGGSrmFJrgs0pHq/bmXaM/Gq6tV/Cmt
 ZPTeW1/nDlPPHJy5h8AQY2r8yNoCaSnWx4RXU4wb/zvI=
X-Received: by 2002:ac2:5a4e:0:b0:509:55df:61e0 with SMTP id
 r14-20020ac25a4e000000b0050955df61e0mr4774949lfn.18.1700467930456; 
 Mon, 20 Nov 2023 00:12:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4h1/jk4SxeejK6Eit53vcMTdhyfoidna8cVEqDFilpcoVs4lg2moBtfk6116+7AAnOUFwMQW5eltIPiSKitA=
X-Received: by 2002:ac2:5a4e:0:b0:509:55df:61e0 with SMTP id
 r14-20020ac25a4e000000b0050955df61e0mr4774935lfn.18.1700467929975; Mon, 20
 Nov 2023 00:12:09 -0800 (PST)
MIME-Version: 1.0
From: Li Wang <liwang@redhat.com>
Date: Mon, 20 Nov 2023 16:11:58 +0800
Message-ID: <CAEemH2dJyfhEg4opn3v1c_P1Ewao+s33_PzoVMyP0siEy+0cxA@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [LTP] Cleanup IA-64 related code?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

I noticed that the mainline kernel is declaring to dropp support for
Itanium IA-64, actually, the commit[1] has been merged in v6.7-rc2.

I am now thinking should we do the same action for LTP in the
main branch to keep consistent with the mainline kernel?

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cf8e8658100d4eae80ce9b21f7a81cb024dd5057

[liwang@liwang-workstation ltp]$$ git grep __ia64__
include/lapi/rt_sigaction.h:#if !defined(__ia64__) && !defined(__alpha__)
&& !defined(__hppa__) && !defined(__mips__)
lib/cloner.c:#if defined(__ia64__)
lib/cloner.c: *   2. __ia64__ takes bottom of stack and uses clone2
lib/cloner.c:#if defined(__ia64__)
lib/tst_arch.c:#elif defined(__ia64__)
testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c:#ifdef __ia64__
testcases/kernel/mem/hugetlb/hugemmap/hugemmap07.c:#elif defined(__ia64__)
testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c:#if defined(__powerpc__)
|| defined(__powerpc64__) || defined(__ia64__) || \
testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c:#if defined(__powerpc__)
|| defined(__powerpc64__) || defined(__ia64__) || \
testcases/kernel/mem/shmt/shmt09.c:#ifdef __ia64__
testcases/kernel/mem/shmt/shmt09.c:#if defined (__ia64__) ||
defined(__mips__) || defined(__hppa__) || defined(__arm__) ||
defined(__aarch64__)
testcases/kernel/sched/cfs-scheduler/hackbench.c:#ifndef __ia64__
testcases/kernel/syscalls/mmap/mmap03.c:#if defined(__ia64__) ||
defined(__hppa__) || defined(__mips__)
testcases/kernel/syscalls/mmap/mmap15.c:#ifdef __ia64__
testcases/kernel/syscalls/ptrace/ptrace.h:#ifdef __ia64__ /* what a pos */
testcases/misc/crash/crash02.c:#if defined(__ia64__)
testcases/misc/crash/crash02.c:#endif /* __ia64__ */


-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
