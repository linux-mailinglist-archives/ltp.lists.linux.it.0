Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82B324EDA
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 12:12:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD39D3C53C5
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 12:12:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B8FA43C07B4
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 12:12:00 +0100 (CET)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6AB6B100042B
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 12:12:00 +0100 (CET)
Received: by mail-pg1-x52d.google.com with SMTP id t25so3573485pga.2
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=70XV8CEHSkMa1rt+fMT8WvCaK1EwHSR64yoUJlYJTYw=;
 b=TyIcjd/DpyEnE+2IWaC+U82XYREOfoTJB08yeLV0Nx2UVU4LQxjBXUYrAJB6QyTOhg
 Q1VZOhAPCQsH1ER8thPfhT18gMHKNCSNeJSCYAyfGKEVZrULdBbS3LkSk2dQoxixqO+R
 6BOjrvxPnG93VvL5w3GAVlMsdUeomqEQCeYdmk6k9LaG0W3L+fKATLXOTHD3rFSiMMhk
 wrWhsSf4MSDTHVleFf/hzuwfP2E04VYm6wYbZHM4FGMQ9klt19ztQLixpqjDqcU54yD4
 cJ6fObGxIEkMFxtpib9cBDj96jlPHsvBqoxP0yqDCZa40i7I2YCJUTBwMsV8MSjq9/9m
 fUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=70XV8CEHSkMa1rt+fMT8WvCaK1EwHSR64yoUJlYJTYw=;
 b=MvFQGcGAj0Xn2Td9kEUVjL1n+RXMgCzaFlqBfa+cYJYWW4QcYOTKvsA8uwfBSWyfKv
 aglcUBWzRVB0ctjcqdKtjYpjLOluG/GuQrzX9SH7rjvI3CYqZVqC01LDxWp0zQ4shbUR
 Tl29e55hgCO5/3aHaH638Mmx/mySDrvJS2JKhXMyRegy9Qt5K/Cht5H4t+6CzjTRm+Q1
 ii8qfVXB8km0AljDO5Xr50rOUEgiqwUqmXpVxGPdoOG57G/DF4Nds8QJHVTE6WbUy0jV
 /5fsMdj284hvr/RdFUqvCTQyFibZYFPNvxEbExlxkGanAQN5OIJh2Jbgn+0Gzv6ntX1O
 KdHQ==
X-Gm-Message-State: AOAM533OX/8nqFb6lkJLSjSzM/4ixBJxVMdE2pNXwx9HskSunSNd9Ds0
 jY76LVKTWOxgWkhT4odt7wtHJfnFFmh5LA==
X-Google-Smtp-Source: ABdhPJzWCCpHTnRH+bfJxldYYjPe3M3TZlDYAOgW6qfbVf7jsTT/Z4ou+0vxihyZVoyFl1y0GAKkXw==
X-Received: by 2002:a62:1650:0:b029:1ee:26a:4958 with SMTP id
 77-20020a6216500000b02901ee026a4958mr2740630pfw.49.1614251518613; 
 Thu, 25 Feb 2021 03:11:58 -0800 (PST)
Received: from localhost.localdomain ([2409:4071:e0b:a4e5:c4eb:2ad5:463:383e])
 by smtp.gmail.com with ESMTPSA id
 k8sm1966073pjj.31.2021.02.25.03.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 03:11:58 -0800 (PST)
From: Pankaj-Joshi <pankaj.joshi347@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 25 Feb 2021 16:41:43 +0530
Message-Id: <20210225111143.26068-1-pankaj.joshi347@gmail.com>
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
