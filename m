Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D53296A5
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 08:33:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CAC13C56C0
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 08:33:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 315A83C4D07
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 08:33:11 +0100 (CET)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C89941000A53
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 08:33:10 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id ba1so11531200plb.1
 for <ltp@lists.linux.it>; Mon, 01 Mar 2021 23:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=70XV8CEHSkMa1rt+fMT8WvCaK1EwHSR64yoUJlYJTYw=;
 b=NpPABXz0MRXQZJMRc74qNvTe0uzIihZWMvt0RonuHjiKUQRq42Aa3oOcflX+2lg+mj
 zfveE6vjiuBh34ZdwRaIhTExzU/BfiJmQhO+j73XgpsOJZfzJaKkqnLbVy83IzuW3fa4
 BP3QeyVIlvsnVsVzgf+kEB1pd5iV8OdqZCjcorKtnWPmgraH+He68pYEWRdKgxd5t3Ar
 TxC0IHv5oUQR6KeOtdQuodcuE5LAyJHFVJvGWFzLikPgPg3B49t+JQMqUmx9+WVDEoeV
 tHJ9l/Yhp+YG9WFWqccxmc5WJjpjFXVFPcG8Wp4PyyXFvJN3dswq8MYLcgbmCYp4W9+M
 expQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=70XV8CEHSkMa1rt+fMT8WvCaK1EwHSR64yoUJlYJTYw=;
 b=WLtxRzi98aKfBraN+3UBwd9m9S4nwH6igLewvWL5UiWsF9ScmMzj/6k7thNiirj/8Q
 PW7GlLMxXK07J49QaXsI7S7u4HnIDaj/VZF3tAvdKNvhBeU0OG4jZyyLICg5qIvKE45U
 ZvvLm5NNnwN+iDhPrjo7nstpxjLNheCoSajFoveARUbCBaidTYSBTMJkgpVglF8Z2uQ7
 0jnbrIUN2lZzbJjab26Z4OksYMVthsoav+2L7dHWoTRwCk2DSuUJmFwAlQXo8loUSkYr
 kgsSlKL7SOi2pSzRu0ydbqPUWip07k8Lr+tlwkOKRn/VOBVsVse3s1MTVslUBsKklTuN
 M4yw==
X-Gm-Message-State: AOAM5331lX8NH5oCcQsMAhWMkRwarqWuUrfl5HtvrH1ExKeLkg7xhEaV
 ZO+5IF4KmSq3Sm+o+EpWRVQEckXQ36Bo8Q==
X-Google-Smtp-Source: ABdhPJy5wQOTYOvmzvH5QIR14vSv6RuiqhJEt5CgMt4eSQtNOxdacQFPCIcJcqI7f2E/1DFhhNE9HQ==
X-Received: by 2002:a17:90b:515:: with SMTP id
 r21mr3018108pjz.42.1614670388931; 
 Mon, 01 Mar 2021 23:33:08 -0800 (PST)
Received: from localhost.localdomain ([171.61.91.28])
 by smtp.gmail.com with ESMTPSA id 68sm6648561pfd.75.2021.03.01.23.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 23:33:08 -0800 (PST)
From: Pankaj-Joshi <pankaj.joshi347@gmail.com>
To: ltp@lists.linux.it
Date: Tue,  2 Mar 2021 13:02:48 +0530
Message-Id: <20210302073248.10204-1-pankaj.joshi347@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] Updated README.kernel_config
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: pankajjoshi347 <pankaj.joshi347@gmail.com>

---
 README.kernel_config | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/README.kernel_config b/README.kernel_config
index 547dd4f33..eed19e557 100644
--- a/README.kernel_config
+++ b/README.kernel_config
@@ -18,8 +18,11 @@ CONFIG_IPC_NS=y
 CONFIG_USER_NS=y
 CONFIG_PID_NS=y
 CONFIG_NET_NS=y
+CONFIG_TIME_NS=y
 CONFIG_VETH=y
 CONFIG_MACVLAN=y
+CONFIG_TUN=y
+CONFIG_TAP=y
 
 The IPC namespaces do not automatically enable IPC, so you may
 also want to have:
@@ -128,6 +131,8 @@ CONFIG_CRASH_DUMP=y
 CONFIG_PM=y
 CONFIG_HIBERNATION=y
 CONFIG_KEXEC_JUMP=y
+CONFIG_SECCOMP=y
+CONFIG_NUMA=y
 ---------------------------------
 Enabling HOTPLUG for your Kernels
 ---------------------------------
@@ -281,10 +286,32 @@ end
 1) Add or modify testcases when relevant kernel functionality changes.
 ---------------------------------
 
+---------------------------------
+Enabling Kernel Configuration to test Memory management features
+---------------------------------
+CONFIG_KSM=y
+CONFIG_THP_SWAP=y
+CONFIG_MEMORY_FAILURE=y
+---------------------------------
+Enabling Kernel Configuration to test other filesystems
+---------------------------------
+CONFIG_PROC_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_SWAP=y
+CONFIG_FANOTIFY=y
+CONFIG_QFMT_V2=y
+CONFIG_XFS_QUOTA=y
+CONFIG_HUGETLBFS=y
+CONFIG_HUGETLB_PAGE=y
+---------------------------------
+Enabling Kernel Configuration to test CPU/Task time and stats accounting
+---------------------------------
+CONFIG_BSD_PROCESS_ACCT=y
 ---------------------------------
 Enabling Kernel Configuration to test ext4 new features
 ---------------------------------
 CONFIG_EXT4_FS=y
+CONFIG_EXT4_ENCRYPTION=y
 CONFIG_EXT4DEV_COMPAT=y
 CONFIG_EXT4_FS_XATTR=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
