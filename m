Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCF483A0AF
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jan 2024 05:45:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA5453CC624
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jan 2024 05:45:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 48FBB3C5E8B
 for <ltp@lists.linux.it>; Wed, 24 Jan 2024 05:45:56 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwang@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 53F922064FE
 for <ltp@lists.linux.it>; Wed, 24 Jan 2024 05:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706071554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q0sgIq6/w56iYe+CWdjP/MGXIb4JEySZfxyd+T/YIwk=;
 b=hoKEi3gp1z2WdShmvoFN1B33M00M13cWesEXurSxK7QyEBbfiLVpgIL5Hcuby78YuRGUeL
 /NguW9vx7Fk4J0yGdvd4QL+LJCDg/LynmKBCxM+YSx1UG8Es30hhkGIu4h6+q6Hm32VIMf
 Bp3TK9Hodws0evdS9HCbyxcMOCNz1EE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-N8qoaLoTNu6CchsxLgsnUg-1; Tue, 23 Jan 2024 23:45:52 -0500
X-MC-Unique: N8qoaLoTNu6CchsxLgsnUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9621A80007C
 for <ltp@lists.linux.it>; Wed, 24 Jan 2024 04:45:52 +0000 (UTC)
Received: from liwang-workstation.lab.eng.nay.redhat.com (unknown
 [10.66.145.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC37B1121312
 for <ltp@lists.linux.it>; Wed, 24 Jan 2024 04:45:51 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 24 Jan 2024 12:45:42 +0800
Message-Id: <20240124044548.2652626-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH V4 0/6] improvement work on libswap library
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

V3-->V4
	* create a contiguous swapfile in swapoff01.c
	* fixing old-XFS requires initialize swapfile issue

Todo:
	* replace the tst_brk with tst_res+return in is_support_swap
	* customisze swapfile size if needed

Test env:
        Fedora38(x86_64, Btrfs), RHEL9(s390x, XFS), RHEL8(aarch64, XFS)

Li Wang (5):
  libswap: add known swap supported fs check
  swapon01: Improving test with memory limits and swap reporting
  libswap: add function to prealloc contiguous file
  libswap: Introduce file contiguity check
  swapoff01: make use of make_swapfile

Petr Vorel (1):
  swapon01: Test on all filesystems

 libs/libltpswap/libswap.c                     | 145 +++++++++++++++++-
 testcases/kernel/syscalls/swapoff/swapoff01.c |   5 +-
 testcases/kernel/syscalls/swapon/swapon01.c   |  16 +-
 3 files changed, 155 insertions(+), 11 deletions(-)

-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
