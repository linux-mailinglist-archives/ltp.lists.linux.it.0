Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A25958A5EB
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Aug 2022 08:34:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E22F3C94F3
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Aug 2022 08:34:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB90D3C1BDC
 for <ltp@lists.linux.it>; Fri,  5 Aug 2022 08:34:13 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 36FCC14011BF
 for <ltp@lists.linux.it>; Fri,  5 Aug 2022 08:34:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659681249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MhIU9pFT48tltdAH50fvXyGjoLLSdHwTapo2GGAIP8w=;
 b=GoNqIpHiKUFMSPl9nYHz082+RF2X7veYNCsX2xrLgy7pgLCcT+UZOCpz2MiwVTrwqctGDh
 Hd9ytrpAcK2COJft7/GGrw0nEy5yBSvv6Z8+sE/5+mqK+1Kkgt7W2ykTp/xaZEACUoXVf8
 HpzfnsKxhheKCQSkERqt1++3RYYGL5U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-TEzXBSE_NK63t3b7GkMUhw-1; Fri, 05 Aug 2022 02:34:05 -0400
X-MC-Unique: TEzXBSE_NK63t3b7GkMUhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D93E01C05154;
 Fri,  5 Aug 2022 06:34:04 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD5C140EBE3;
 Fri,  5 Aug 2022 06:34:03 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  5 Aug 2022 14:33:59 +0800
Message-Id: <20220805063401.1647479-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] fix compiling errors on fedora-rawhide
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

CI job: https://github.com/wangli5665/ltp/runs/7686209513

Li Wang (2):
  lapi/pidfd: adding pidfd header file
  lapi/fsmount: resolve conflict in different header files

 configure.ac                                              | 2 ++
 include/lapi/fs.h                                         | 6 ++++--
 include/lapi/fsmount.h                                    | 6 ++++--
 include/lapi/pidfd.h                                      | 3 +++
 testcases/kernel/syscalls/fsconfig/fsconfig01.c           | 1 +
 testcases/kernel/syscalls/fsconfig/fsconfig02.c           | 1 +
 testcases/kernel/syscalls/fsmount/fsmount01.c             | 1 +
 testcases/kernel/syscalls/fsmount/fsmount02.c             | 1 +
 testcases/kernel/syscalls/fsopen/fsopen01.c               | 1 +
 testcases/kernel/syscalls/fsopen/fsopen02.c               | 1 +
 testcases/kernel/syscalls/fspick/fspick01.c               | 1 +
 testcases/kernel/syscalls/fspick/fspick02.c               | 1 +
 testcases/kernel/syscalls/mount_setattr/mount_setattr01.c | 1 +
 testcases/kernel/syscalls/move_mount/move_mount01.c       | 1 +
 testcases/kernel/syscalls/move_mount/move_mount02.c       | 1 +
 testcases/kernel/syscalls/open_tree/open_tree01.c         | 1 +
 testcases/kernel/syscalls/open_tree/open_tree02.c         | 1 +
 17 files changed, 26 insertions(+), 4 deletions(-)

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
