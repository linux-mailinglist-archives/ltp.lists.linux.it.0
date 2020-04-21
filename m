Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C61B1F33
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:50:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBB1A3C29CD
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:50:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 80BBB3C2994
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:50:11 +0200 (CEST)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 05F871A013D9
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:50:11 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id s10so5980423wrr.0
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lZMKg5Uzlvv5p+sXP3+/3qw97pzZ4gCAn8M2ieVEHIo=;
 b=UYlT8EjsJdnNIIhMq+llaRGAaxqXNf1kK5idF886vggknTC57B5ZNuKXMh96cWZW/g
 yWpTpzpbCx0F+g6+PesHBiZybKtcG9oV6dr+bKjfNwYv6MVkpnArbysLXUn/3f7ijTeh
 qIRB6cYrpRWoclTTX0MDtNot3jbF+zqHZm1xI5VTIXaugBeL+rfRLNnz5moO62ZU/he8
 mjUV3mLOMvbIGxRrD8Ux/eUVBgqYMPXSEcqmTAoqHn+pYIfdFvC3qrEpi8SOGErChmS/
 7hGlfdytupuQIk/DXgAn9ZUGW4pOeCGCdOJVMAF6JDwznRBJZmhz9iCj1NdRloDJdSeH
 i8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lZMKg5Uzlvv5p+sXP3+/3qw97pzZ4gCAn8M2ieVEHIo=;
 b=MZOn/78z07XZLMv+Gq+urg1zkFh6uTUaFhd3B+YCZm43lv7FY7iQ+SJjqwRVkAZ/so
 8q6SKsNEH+ZOk74FiW4aKsS1meqMeem/IMpnvL+ByG6uZ3UlDoXasN3O9J58XinbTxGu
 WC6SqcQmf+S+nU+1WLPyq3IUlpF4oYN64pXYtoNsnU0cgpmqRfhSQSi+5MLKuBOYmUY7
 a4mOLlUDCt1OjmWZvMz+r6+TqkyEhrUibTXL7JL1++W88gtLV82pCirCoyn6w23TJh23
 Kk7AuIQCou48ea59ETnNnHCBrhlRswmsjCfUSnQU4jmvg+Pmgip4rhetLON/3ZggQXw5
 u9IQ==
X-Gm-Message-State: AGi0Pub3KJ8xeVV8k+iVuMiSyXGDd4cQOguBNu6I69PSRldfWgISdI43
 1TaSji8eoTFLf92+L2XGXzs=
X-Google-Smtp-Source: APiQypLmMXP451Zcnpdb6KPfKjzJvnUuVue8dzlbBP+4s4X/Fj5M0fw2JCLeRb2uhmQs/Nd8i+pmGQ==
X-Received: by 2002:a5d:4292:: with SMTP id k18mr21656120wrq.137.1587451810384; 
 Mon, 20 Apr 2020 23:50:10 -0700 (PDT)
Received: from localhost.localdomain ([141.226.12.123])
 by smtp.gmail.com with ESMTPSA id h16sm2698093wrw.36.2020.04.20.23.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 23:50:09 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 21 Apr 2020 09:49:58 +0300
Message-Id: <20200421065002.12417-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] fanotify ltp tests for v5.7-rc1
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

Following patches test kernel code merged to v5.7-rc1.

Patch 1,3 test fanotify minor bug fixes, which could be backported
to stable kernels.

Patch 2 makes test fanotify15 more robust, by making less assumptions,
in preparation for adding a test case.

Patch 4 adds a new test for the new event type FAN_MODIFY_DIR, which
carries a new event format (parent fid + name).

Thanks,
Amir.

Amir Goldstein (4):
  syscalls/fanotify09: Check merging of events on directories
  syscalls/fanotify15: Minor corrections
  syscalls/fanotify15: Add a test case for inode marks
  syscalls/fanotify: New test for FAN_MODIFY_DIR

 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/fanotify/.gitignore |   1 +
 testcases/kernel/syscalls/fanotify/fanotify.h |  15 +-
 .../kernel/syscalls/fanotify/fanotify09.c     |  46 +-
 .../kernel/syscalls/fanotify/fanotify15.c     | 128 ++++-
 .../kernel/syscalls/fanotify/fanotify16.c     | 441 ++++++++++++++++++
 6 files changed, 595 insertions(+), 37 deletions(-)
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify16.c

-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
